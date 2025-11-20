{
  description = "Nim + Kubernetes + uv2nix Python + Go dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    uv2nix.url = "github:pyproject-nix/uv2nix";
    pyproject-nix.url = "github:pyproject-nix/pyproject.nix";
    pyproject-build-systems.url = "github:pyproject-nix/build-system-pkgs";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";

    dagger.url = "github:dagger/nix";
    dagger.inputs.nixpkgs.follows = "nixpkgs";

    # Input linking
    uv2nix.inputs.nixpkgs.follows = "nixpkgs";
    uv2nix.inputs.pyproject-nix.follows = "pyproject-nix";
    pyproject-nix.inputs.nixpkgs.follows = "nixpkgs";
    pyproject-build-systems.inputs.nixpkgs.follows = "nixpkgs";
    pyproject-build-systems.inputs.pyproject-nix.follows = "pyproject-nix";
    pyproject-build-systems.inputs.uv2nix.follows = "uv2nix";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-parts,
      uv2nix,
      pyproject-nix,
      pyproject-build-systems,
      pre-commit-hooks,
      dagger,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
        "aarch64-linux"
      ];

      perSystem =
        { pkgs, system, ... }:
        let
          lib = pkgs.lib;
          kindShellScript = import ./flake-modules/kind-init.nix { inherit pkgs; };

          uv2nixLib = uv2nix.lib;
          pythonEnv = import ./flake-modules/python.nix {
            inherit
              pkgs
              system
              uv2nixLib
              pyproject-nix
              pyproject-build-systems
              ;
            workspaceRoot = ./scripts;
          };

          makePythonCli = import ./flake-modules/make-python-cli.nix;

          pyCliTools = [
            (makePythonCli {
              inherit pkgs;
              name = "fetch_crds";
              scriptPath = ./scripts/src/cli/artifacts/fetch_crds.py;
              python = pythonEnv.virtualenv;
            })
          ];

          gitHooks = import ./flake-modules/git-hooks.nix { inherit lib; };

          pre-commit = pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = gitHooks.pre-commit.hooks;
          };

          nixTools = with pkgs; [
            nixfmt-rfc-style
            nil
            nixd
          ];

          shellTools = with pkgs; [
            just
            git
            uv
          ];

          kubeTools = with pkgs; [
            talosctl
            kind
            kubectl
            kuttl
            kubernetes-helm
            kcl
            go
            crossplane-cli
            kyverno-chainsaw
          ];

          daggerTools = [ dagger.packages.${system}.dagger ];

          uptestPkg = import ./flake-modules/uptest.nix { inherit pkgs; };

        in
        {
          checks.pre-commit-check = pre-commit;

          devShells.default = pkgs.mkShell {
            packages =
              nixTools
              ++ shellTools
              ++ [ pythonEnv.virtualenv ]
              ++ kubeTools
              ++ daggerTools
              ++ pyCliTools
              ++ pre-commit.enabledPackages
              ++ [ uptestPkg.uptest ];

            env = {
              UV_PYTHON = "${pythonEnv.virtualenv}/bin/python";
              UV_PYTHON_DOWNLOADS = "never";
            };

            shellHook = ''
              ${pre-commit.shellHook}

              unset PYTHONPATH
              export REPO_ROOT=$(git rev-parse --show-toplevel)
              export PYTHONPATH=$PWD/scripts/src:$PYTHONPATH
              export CHAINSAW=$(which chainsaw)
              export KUBECTL=$(which kubectl)

              ${kindShellScript}/bin/kind-shell-hook

              echo "🐍 Python dev shell (uv2nix) ready 🐥"

              cd $REPO_ROOT/kcl_common/schemas/custom/go || true
              go mod tidy || true
              cd - || true
            '';
          };
        };
    };
}
