"""
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""
import regex
import k8s.apimachinery.pkg.apis.meta.v1
_regex_match = regex.match


schema InfisicalSecret:
    r"""
    InfisicalSecret is the Schema for the infisicalsecrets API

    Attributes
    ----------
    apiVersion : str, default is "secrets.infisical.com/v1alpha1", required
        APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    kind : str, default is "InfisicalSecret", required
        Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata : v1.ObjectMeta, default is Undefined, optional
        metadata
    spec : SecretsInfisicalComV1alpha1InfisicalSecretSpec, default is Undefined, optional
        spec
    status : SecretsInfisicalComV1alpha1InfisicalSecretStatus, default is Undefined, optional
        status
    """


    apiVersion: "secrets.infisical.com/v1alpha1" = "secrets.infisical.com/v1alpha1"

    kind: "InfisicalSecret" = "InfisicalSecret"

    metadata?: v1.ObjectMeta

    spec?: SecretsInfisicalComV1alpha1InfisicalSecretSpec

    status?: SecretsInfisicalComV1alpha1InfisicalSecretStatus


schema SecretsInfisicalComV1alpha1InfisicalSecretSpec:
    r"""
    InfisicalSecretSpec defines the desired state of InfisicalSecret

    Attributes
    ----------
    authentication : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthentication, default is Undefined, optional
        authentication
    hostAPI : str, default is Undefined, optional
        Infisical host to pull secrets from
    managedKubeConfigMapReferences : [SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedKubeConfigMapReferencesItems0], default is Undefined, optional
        managed kube config map references
    managedKubeSecretReferences : [SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedKubeSecretReferencesItems0], default is Undefined, optional
        managed kube secret references
    managedSecretReference : SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedSecretReference, default is Undefined, optional
        managed secret reference
    resyncInterval : int, default is 60, required
        resync interval
    tls : SecretsInfisicalComV1alpha1InfisicalSecretSpecTLS, default is Undefined, optional
        tls
    tokenSecretReference : SecretsInfisicalComV1alpha1InfisicalSecretSpecTokenSecretReference, default is Undefined, optional
        token secret reference
    """


    authentication?: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthentication

    hostAPI?: str

    managedKubeConfigMapReferences?: [SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedKubeConfigMapReferencesItems0]

    managedKubeSecretReferences?: [SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedKubeSecretReferencesItems0]

    managedSecretReference?: SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedSecretReference

    resyncInterval: int = 60

    tls?: SecretsInfisicalComV1alpha1InfisicalSecretSpecTLS

    tokenSecretReference?: SecretsInfisicalComV1alpha1InfisicalSecretSpecTokenSecretReference


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthentication:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication

    Attributes
    ----------
    awsIamAuth : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationAwsIamAuth, default is Undefined, optional
        aws iam auth
    azureAuth : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationAzureAuth, default is Undefined, optional
        azure auth
    gcpIamAuth : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationGcpIamAuth, default is Undefined, optional
        gcp iam auth
    gcpIdTokenAuth : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationGcpIDTokenAuth, default is Undefined, optional
        gcp Id token auth
    kubernetesAuth : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationKubernetesAuth, default is Undefined, optional
        kubernetes auth
    serviceAccount : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceAccount, default is Undefined, optional
        service account
    serviceToken : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceToken, default is Undefined, optional
        service token
    universalAuth : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationUniversalAuth, default is Undefined, optional
        universal auth
    """


    awsIamAuth?: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationAwsIamAuth

    azureAuth?: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationAzureAuth

    gcpIamAuth?: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationGcpIamAuth

    gcpIdTokenAuth?: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationGcpIDTokenAuth

    kubernetesAuth?: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationKubernetesAuth

    serviceAccount?: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceAccount

    serviceToken?: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceToken

    universalAuth?: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationUniversalAuth


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationAwsIamAuth:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication aws iam auth

    Attributes
    ----------
    identityId : str, default is Undefined, required
        identity Id
    secretsScope : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationAwsIamAuthSecretsScope, default is Undefined, required
        secrets scope
    """


    identityId: str

    secretsScope: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationAwsIamAuthSecretsScope


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationAwsIamAuthSecretsScope:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication aws iam auth secrets scope

    Attributes
    ----------
    envSlug : str, default is Undefined, required
        env slug
    projectSlug : str, default is Undefined, required
        project slug
    recursive : bool, default is Undefined, optional
        recursive
    secretsPath : str, default is Undefined, required
        secrets path
    """


    envSlug: str

    projectSlug: str

    recursive?: bool

    secretsPath: str


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationAzureAuth:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication azure auth

    Attributes
    ----------
    identityId : str, default is Undefined, required
        identity Id
    resource : str, default is Undefined, optional
        resource
    secretsScope : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationAzureAuthSecretsScope, default is Undefined, required
        secrets scope
    """


    identityId: str

    resource?: str

    secretsScope: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationAzureAuthSecretsScope


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationAzureAuthSecretsScope:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication azure auth secrets scope

    Attributes
    ----------
    envSlug : str, default is Undefined, required
        env slug
    projectSlug : str, default is Undefined, required
        project slug
    recursive : bool, default is Undefined, optional
        recursive
    secretsPath : str, default is Undefined, required
        secrets path
    """


    envSlug: str

    projectSlug: str

    recursive?: bool

    secretsPath: str


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationGcpIDTokenAuth:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication gcp ID token auth

    Attributes
    ----------
    identityId : str, default is Undefined, required
        identity Id
    secretsScope : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationGcpIDTokenAuthSecretsScope, default is Undefined, required
        secrets scope
    """


    identityId: str

    secretsScope: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationGcpIDTokenAuthSecretsScope


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationGcpIDTokenAuthSecretsScope:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication gcp ID token auth secrets scope

    Attributes
    ----------
    envSlug : str, default is Undefined, required
        env slug
    projectSlug : str, default is Undefined, required
        project slug
    recursive : bool, default is Undefined, optional
        recursive
    secretsPath : str, default is Undefined, required
        secrets path
    """


    envSlug: str

    projectSlug: str

    recursive?: bool

    secretsPath: str


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationGcpIamAuth:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication gcp iam auth

    Attributes
    ----------
    identityId : str, default is Undefined, required
        identity Id
    secretsScope : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationGcpIamAuthSecretsScope, default is Undefined, required
        secrets scope
    serviceAccountKeyFilePath : str, default is Undefined, required
        service account key file path
    """


    identityId: str

    secretsScope: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationGcpIamAuthSecretsScope

    serviceAccountKeyFilePath: str


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationGcpIamAuthSecretsScope:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication gcp iam auth secrets scope

    Attributes
    ----------
    envSlug : str, default is Undefined, required
        env slug
    projectSlug : str, default is Undefined, required
        project slug
    recursive : bool, default is Undefined, optional
        recursive
    secretsPath : str, default is Undefined, required
        secrets path
    """


    envSlug: str

    projectSlug: str

    recursive?: bool

    secretsPath: str


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationKubernetesAuth:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication kubernetes auth

    Attributes
    ----------
    autoCreateServiceAccountToken : bool, default is Undefined, optional
        Optionally automatically create a service account token for the configured service account. If this is set to `true`, the operator will automatically create a service account token for the configured service account.
    identityId : str, default is Undefined, required
        identity Id
    secretsScope : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationKubernetesAuthSecretsScope, default is Undefined, required
        secrets scope
    serviceAccountRef : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationKubernetesAuthServiceAccountRef, default is Undefined, required
        service account ref
    serviceAccountTokenAudiences : [str], default is Undefined, optional
        The audiences to use for the service account token. This is only relevant if `autoCreateServiceAccountToken` is true.
    """


    autoCreateServiceAccountToken?: bool

    identityId: str

    secretsScope: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationKubernetesAuthSecretsScope

    serviceAccountRef: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationKubernetesAuthServiceAccountRef

    serviceAccountTokenAudiences?: [str]


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationKubernetesAuthSecretsScope:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication kubernetes auth secrets scope

    Attributes
    ----------
    envSlug : str, default is Undefined, required
        env slug
    projectSlug : str, default is Undefined, required
        project slug
    recursive : bool, default is Undefined, optional
        recursive
    secretsPath : str, default is Undefined, required
        secrets path
    """


    envSlug: str

    projectSlug: str

    recursive?: bool

    secretsPath: str


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationKubernetesAuthServiceAccountRef:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication kubernetes auth service account ref

    Attributes
    ----------
    name : str, default is Undefined, required
        name
    namespace : str, default is Undefined, required
        namespace
    """


    name: str

    namespace: str


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceAccount:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication service account

    Attributes
    ----------
    environmentName : str, default is Undefined, required
        environment name
    projectId : str, default is Undefined, required
        project Id
    serviceAccountSecretReference : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceAccountServiceAccountSecretReference, default is Undefined, required
        service account secret reference
    """


    environmentName: str

    projectId: str

    serviceAccountSecretReference: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceAccountServiceAccountSecretReference


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceAccountServiceAccountSecretReference:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication service account service account secret reference

    Attributes
    ----------
    secretName : str, default is Undefined, required
        The name of the Kubernetes Secret
    secretNamespace : str, default is Undefined, required
        The name space where the Kubernetes Secret is located
    """


    secretName: str

    secretNamespace: str


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceToken:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication service token

    Attributes
    ----------
    secretsScope : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceTokenSecretsScope, default is Undefined, required
        secrets scope
    serviceTokenSecretReference : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceTokenServiceTokenSecretReference, default is Undefined, required
        service token secret reference
    """


    secretsScope: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceTokenSecretsScope

    serviceTokenSecretReference: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceTokenServiceTokenSecretReference


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceTokenSecretsScope:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication service token secrets scope

    Attributes
    ----------
    envSlug : str, default is Undefined, required
        env slug
    recursive : bool, default is Undefined, optional
        recursive
    secretsPath : str, default is Undefined, required
        secrets path
    """


    envSlug: str

    recursive?: bool

    secretsPath: str


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationServiceTokenServiceTokenSecretReference:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication service token service token secret reference

    Attributes
    ----------
    secretName : str, default is Undefined, required
        The name of the Kubernetes Secret
    secretNamespace : str, default is Undefined, required
        The name space where the Kubernetes Secret is located
    """


    secretName: str

    secretNamespace: str


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationUniversalAuth:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication universal auth

    Attributes
    ----------
    credentialsRef : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationUniversalAuthCredentialsRef, default is Undefined, required
        credentials ref
    secretsScope : SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationUniversalAuthSecretsScope, default is Undefined, required
        secrets scope
    """


    credentialsRef: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationUniversalAuthCredentialsRef

    secretsScope: SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationUniversalAuthSecretsScope


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationUniversalAuthCredentialsRef:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication universal auth credentials ref

    Attributes
    ----------
    secretName : str, default is Undefined, required
        The name of the Kubernetes Secret
    secretNamespace : str, default is Undefined, required
        The name space where the Kubernetes Secret is located
    """


    secretName: str

    secretNamespace: str


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecAuthenticationUniversalAuthSecretsScope:
    r"""
    secrets infisical com v1alpha1 infisical secret spec authentication universal auth secrets scope

    Attributes
    ----------
    envSlug : str, default is Undefined, required
        env slug
    projectSlug : str, default is Undefined, required
        project slug
    recursive : bool, default is Undefined, optional
        recursive
    secretsPath : str, default is Undefined, required
        secrets path
    """


    envSlug: str

    projectSlug: str

    recursive?: bool

    secretsPath: str


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedKubeConfigMapReferencesItems0:
    r"""
    secrets infisical com v1alpha1 infisical secret spec managed kube config map references items0

    Attributes
    ----------
    configMapName : str, default is Undefined, required
        The name of the Kubernetes ConfigMap
    configMapNamespace : str, default is Undefined, required
        The namespace where the Kubernetes ConfigMap is located
    creationPolicy : str, default is "Orphan", optional
        The Kubernetes ConfigMap creation policy. Enum with values: 'Owner', 'Orphan'. Owner creates the config map and sets .metadata.ownerReferences of the InfisicalSecret CRD that created it. Orphan will not set the config map owner. This will result in the config map being orphaned and not deleted when the resource is deleted.
    template : SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedKubeConfigMapReferencesItems0Template, default is Undefined, optional
        template
    """


    configMapName: str

    configMapNamespace: str

    creationPolicy?: str = "Orphan"

    template?: SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedKubeConfigMapReferencesItems0Template


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedKubeConfigMapReferencesItems0Template:
    r"""
    The template to transform the secret data

    Attributes
    ----------
    data : {str:str}, default is Undefined, optional
        The template key values
    includeAllSecrets : bool, default is Undefined, optional
        This injects all retrieved secrets into the top level of your template. Secrets defined in the template will take precedence over the injected ones.
    """


    data?: {str:str}

    includeAllSecrets?: bool


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedKubeSecretReferencesItems0:
    r"""
    secrets infisical com v1alpha1 infisical secret spec managed kube secret references items0

    Attributes
    ----------
    creationPolicy : str, default is "Orphan", optional
        The Kubernetes Secret creation policy. Enum with values: 'Owner', 'Orphan'. Owner creates the secret and sets .metadata.ownerReferences of the InfisicalSecret CRD that created it. Orphan will not set the secret owner. This will result in the secret being orphaned and not deleted when the resource is deleted.
    secretName : str, default is Undefined, required
        The name of the Kubernetes Secret
    secretNamespace : str, default is Undefined, required
        The name space where the Kubernetes Secret is located
    secretType : str, default is "Opaque", optional
        The Kubernetes Secret type (experimental feature). More info: https://kubernetes.io/docs/concepts/configuration/secret/#secret-types
    template : SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedKubeSecretReferencesItems0Template, default is Undefined, optional
        template
    """


    creationPolicy?: str = "Orphan"

    secretName: str

    secretNamespace: str

    secretType?: str = "Opaque"

    template?: SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedKubeSecretReferencesItems0Template


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedKubeSecretReferencesItems0Template:
    r"""
    The template to transform the secret data

    Attributes
    ----------
    data : {str:str}, default is Undefined, optional
        The template key values
    includeAllSecrets : bool, default is Undefined, optional
        This injects all retrieved secrets into the top level of your template. Secrets defined in the template will take precedence over the injected ones.
    """


    data?: {str:str}

    includeAllSecrets?: bool


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedSecretReference:
    r"""
    secrets infisical com v1alpha1 infisical secret spec managed secret reference

    Attributes
    ----------
    creationPolicy : str, default is "Orphan", optional
        The Kubernetes Secret creation policy. Enum with values: 'Owner', 'Orphan'. Owner creates the secret and sets .metadata.ownerReferences of the InfisicalSecret CRD that created it. Orphan will not set the secret owner. This will result in the secret being orphaned and not deleted when the resource is deleted.
    secretName : str, default is Undefined, required
        The name of the Kubernetes Secret
    secretNamespace : str, default is Undefined, required
        The name space where the Kubernetes Secret is located
    secretType : str, default is "Opaque", optional
        The Kubernetes Secret type (experimental feature). More info: https://kubernetes.io/docs/concepts/configuration/secret/#secret-types
    template : SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedSecretReferenceTemplate, default is Undefined, optional
        template
    """


    creationPolicy?: str = "Orphan"

    secretName: str

    secretNamespace: str

    secretType?: str = "Opaque"

    template?: SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedSecretReferenceTemplate


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecManagedSecretReferenceTemplate:
    r"""
    The template to transform the secret data

    Attributes
    ----------
    data : {str:str}, default is Undefined, optional
        The template key values
    includeAllSecrets : bool, default is Undefined, optional
        This injects all retrieved secrets into the top level of your template. Secrets defined in the template will take precedence over the injected ones.
    """


    data?: {str:str}

    includeAllSecrets?: bool


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecTLS:
    r"""
    secrets infisical com v1alpha1 infisical secret spec TLS

    Attributes
    ----------
    caRef : SecretsInfisicalComV1alpha1InfisicalSecretSpecTLSCaRef, default is Undefined, optional
        ca ref
    """


    caRef?: SecretsInfisicalComV1alpha1InfisicalSecretSpecTLSCaRef


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecTLSCaRef:
    r"""
    Reference to secret containing CA cert

    Attributes
    ----------
    key : str, default is Undefined, required
        The name of the secret property with the CA certificate value
    secretName : str, default is Undefined, required
        The name of the Kubernetes Secret
    secretNamespace : str, default is Undefined, required
        The namespace where the Kubernetes Secret is located
    """


    key: str

    secretName: str

    secretNamespace: str


schema SecretsInfisicalComV1alpha1InfisicalSecretSpecTokenSecretReference:
    r"""
    secrets infisical com v1alpha1 infisical secret spec token secret reference

    Attributes
    ----------
    secretName : str, default is Undefined, required
        The name of the Kubernetes Secret
    secretNamespace : str, default is Undefined, required
        The name space where the Kubernetes Secret is located
    """


    secretName: str

    secretNamespace: str


schema SecretsInfisicalComV1alpha1InfisicalSecretStatus:
    r"""
    InfisicalSecretStatus defines the observed state of InfisicalSecret

    Attributes
    ----------
    conditions : [SecretsInfisicalComV1alpha1InfisicalSecretStatusConditionsItems0], default is Undefined, required
        conditions
    """


    conditions: [SecretsInfisicalComV1alpha1InfisicalSecretStatusConditionsItems0]


schema SecretsInfisicalComV1alpha1InfisicalSecretStatusConditionsItems0:
    r"""
    Condition contains details for one aspect of the current state of this API Resource. --- This struct is intended for direct use as an array at the field path .status.conditions.  For example, 
     type FooStatus struct{ // Represents the observations of a foo's current state. // Known .status.conditions.type are: "Available", "Progressing", and "Degraded" // +patchMergeKey=type // +patchStrategy=merge // +listType=map // +listMapKey=type Conditions []metav1.Condition `json:"conditions,omitempty" patchStrategy:"merge" patchMergeKey:"type" protobuf:"bytes,1,rep,name=conditions"` 
     // other fields }

    Attributes
    ----------
    lastTransitionTime : str, default is Undefined, required
        lastTransitionTime is the last time the condition transitioned from one status to another. This should be when the underlying condition changed.  If that is not known, then using the time when the API field changed is acceptable.
    message : str, default is Undefined, required
        message is a human readable message indicating details about the transition. This may be an empty string.
    observedGeneration : int, default is Undefined, optional
        observedGeneration represents the .metadata.generation that the condition was set based upon. For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date with respect to the current state of the instance.
    reason : str, default is Undefined, required
        reason contains a programmatic identifier indicating the reason for the condition's last transition. Producers of specific condition types may define expected values and meanings for this field, and whether the values are considered a guaranteed API. The value should be a CamelCase string. This field may not be empty.
    status : str, default is Undefined, required
        status of the condition, one of True, False, Unknown.
    $type : str, default is Undefined, required
        type of condition in CamelCase or in foo.example.com/CamelCase. --- Many .condition.type values are consistent across resources like Available, but because arbitrary conditions can be useful (see .node.status.conditions), the ability to deconflict is important. The regex it matches is (dns1123SubdomainFmt/)?(qualifiedNameFmt)
    """


    lastTransitionTime: str

    message: str

    observedGeneration?: int

    reason: str

    status: "True" | "False" | "Unknown"

    $type: str


    check:
        len(message) <= 32768
        observedGeneration >= 0 if observedGeneration not in [None, Undefined]
        len(reason) <= 1024
        len(reason) >= 1
        _regex_match(str(reason), r"^[A-Za-z]([A-Za-z0-9_,:]*[A-Za-z0-9_])?$")
        len($type) <= 316
        _regex_match(str($type), r"^([a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*/)?(([A-Za-z0-9][-A-Za-z0-9_.]*)?[A-Za-z0-9])$")


