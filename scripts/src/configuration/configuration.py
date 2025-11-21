# configuration/load_config.py

from lib.test_ext.find_proj_root import find_project_root


# --- Paths ---
PROJECT_ROOT = find_project_root()
KCL_ROOT = (PROJECT_ROOT / "").resolve()
CRD_ROOT = KCL_ROOT / "crds"
SCHEMA_ROOT = PROJECT_ROOT / "kcl_common" / "schemas"
