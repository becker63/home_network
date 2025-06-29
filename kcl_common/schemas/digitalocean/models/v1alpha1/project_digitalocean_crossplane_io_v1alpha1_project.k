"""
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""
import k8s.apimachinery.pkg.apis.meta.v1


schema Project:
    r"""
    Project is the Schema for the Projects API.

    Attributes
    ----------
    apiVersion : str, default is "project.digitalocean.crossplane.io/v1alpha1", required
        APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    kind : str, default is "Project", required
        Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata : v1.ObjectMeta, default is Undefined, optional
        metadata
    spec : ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpec, default is Undefined, required
        spec
    status : ProjectDigitaloceanCrossplaneIoV1alpha1ProjectStatus, default is Undefined, optional
        status
    """


    apiVersion: "project.digitalocean.crossplane.io/v1alpha1" = "project.digitalocean.crossplane.io/v1alpha1"

    kind: "Project" = "Project"

    metadata?: v1.ObjectMeta

    spec: ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpec

    status?: ProjectDigitaloceanCrossplaneIoV1alpha1ProjectStatus


schema ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpec:
    r"""
    ProjectSpec defines the desired state of Project

    Attributes
    ----------
    deletionPolicy : str, default is "Delete", optional
        DeletionPolicy specifies what will happen to the underlying external
        when this managed resource is deleted - either "Delete" or "Orphan" the
        external resource.
        This field is planned to be deprecated in favor of the ManagementPolicies
        field in a future release. Currently, both could be set independently and
        non-default values would be honored if the feature flag is enabled.
        See the design doc for more information: https://github.com/crossplane/crossplane/blob/499895a25d1a1a0ba1604944ef98ac7a1a71f197/design/design-doc-observe-only-resources.md?plain=1#L223
    forProvider : ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecForProvider, default is Undefined, required
        for provider
    initProvider : ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecInitProvider, default is Undefined, optional
        init provider
    managementPolicies : [str], default is ["*"], optional
        THIS IS A BETA FIELD. It is on by default but can be opted out
        through a Crossplane feature flag.
        ManagementPolicies specify the array of actions Crossplane is allowed to
        take on the managed and external resources.
        This field is planned to replace the DeletionPolicy field in a future
        release. Currently, both could be set independently and non-default
        values would be honored if the feature flag is enabled. If both are
        custom, the DeletionPolicy field will be ignored.
        See the design doc for more information: https://github.com/crossplane/crossplane/blob/499895a25d1a1a0ba1604944ef98ac7a1a71f197/design/design-doc-observe-only-resources.md?plain=1#L223
        and this one: https://github.com/crossplane/crossplane/blob/444267e84783136daa93568b364a5f01228cacbe/design/one-pager-ignore-changes.md
    providerConfigRef : ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecProviderConfigRef, default is Undefined, optional
        provider config ref
    publishConnectionDetailsTo : ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecPublishConnectionDetailsTo, default is Undefined, optional
        publish connection details to
    writeConnectionSecretToRef : ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecWriteConnectionSecretToRef, default is Undefined, optional
        write connection secret to ref
    """


    deletionPolicy?: "Orphan" | "Delete" = "Delete"

    forProvider: ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecForProvider

    initProvider?: ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecInitProvider

    managementPolicies?: [str] = ["*"]

    providerConfigRef?: ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecProviderConfigRef

    publishConnectionDetailsTo?: ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecPublishConnectionDetailsTo

    writeConnectionSecretToRef?: ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecWriteConnectionSecretToRef


schema ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecForProvider:
    r"""
    project digitalocean crossplane io v1alpha1 project spec for provider

    Attributes
    ----------
    description : str, default is Undefined, optional
        the description of the project
        the description of the project
    environment : str, default is Undefined, optional
        the environment of the project's resources. The possible values are: Development, Staging, Production)
        the environment of the project's resources
    isDefault : bool, default is Undefined, optional
        a boolean indicating whether or not the project is the default project. (Default: "false")
        determine if the project is the default or not.
    name : str, default is Undefined, optional
        The name of the Project
        the human-readable name for the project
    purpose : str, default is Undefined, optional
        the purpose of the project, (Default: "Web Application")
        the purpose of the project
    resources : [str], default is Undefined, optional
        a list of uniform resource names (URNs) for the resources associated with the project
        the resources associated with the project
    """


    description?: str

    environment?: str

    isDefault?: bool

    name?: str

    purpose?: str

    resources?: [str]


schema ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecInitProvider:
    r"""
    THIS IS A BETA FIELD. It will be honored
    unless the Management Policies feature flag is disabled.
    InitProvider holds the same fields as ForProvider, with the exception
    of Identifier and other resource reference fields. The fields that are
    in InitProvider are merged into ForProvider when the resource is created.
    The same fields are also added to the terraform ignore_changes hook, to
    avoid updating them after creation. This is useful for fields that are
    required on creation, but we do not desire to update them after creation,
    for example because of an external controller is managing them, like an
    autoscaler.

    Attributes
    ----------
    description : str, default is Undefined, optional
        the description of the project
        the description of the project
    environment : str, default is Undefined, optional
        the environment of the project's resources. The possible values are: Development, Staging, Production)
        the environment of the project's resources
    isDefault : bool, default is Undefined, optional
        a boolean indicating whether or not the project is the default project. (Default: "false")
        determine if the project is the default or not.
    name : str, default is Undefined, optional
        The name of the Project
        the human-readable name for the project
    purpose : str, default is Undefined, optional
        the purpose of the project, (Default: "Web Application")
        the purpose of the project
    resources : [str], default is Undefined, optional
        a list of uniform resource names (URNs) for the resources associated with the project
        the resources associated with the project
    """


    description?: str

    environment?: str

    isDefault?: bool

    name?: str

    purpose?: str

    resources?: [str]


schema ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecProviderConfigRef:
    r"""
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecProviderConfigRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecProviderConfigRefPolicy


schema ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecProviderConfigRefPolicy:
    r"""
    Policies for referencing.

    Attributes
    ----------
    resolution : str, default is "Required", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : str, default is Undefined, optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """


    resolution?: "Required" | "Optional" = "Required"

    resolve?: "Always" | "IfNotPresent"


schema ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecPublishConnectionDetailsTo:
    r"""
    PublishConnectionDetailsTo specifies the connection secret config which
    contains a name, metadata and a reference to secret store config to
    which any connection details for this managed resource should be written.
    Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.

    Attributes
    ----------
    configRef : ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecPublishConnectionDetailsToConfigRef, default is Undefined, optional
        config ref
    metadata : ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecPublishConnectionDetailsToMetadata, default is Undefined, optional
        metadata
    name : str, default is Undefined, required
        Name is the name of the connection secret.
    """


    configRef?: ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecPublishConnectionDetailsToConfigRef

    metadata?: ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecPublishConnectionDetailsToMetadata

    name: str


schema ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecPublishConnectionDetailsToConfigRef:
    r"""
    SecretStoreConfigRef specifies which secret store config should be used
    for this ConnectionSecret.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecPublishConnectionDetailsToConfigRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecPublishConnectionDetailsToConfigRefPolicy


schema ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecPublishConnectionDetailsToConfigRefPolicy:
    r"""
    Policies for referencing.

    Attributes
    ----------
    resolution : str, default is "Required", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : str, default is Undefined, optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """


    resolution?: "Required" | "Optional" = "Required"

    resolve?: "Always" | "IfNotPresent"


schema ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecPublishConnectionDetailsToMetadata:
    r"""
    Metadata is the metadata for connection secret.

    Attributes
    ----------
    annotations : {str:str}, default is Undefined, optional
        Annotations are the annotations to be added to connection secret.
        - For Kubernetes secrets, this will be used as "metadata.annotations".
        - It is up to Secret Store implementation for others store types.
    labels : {str:str}, default is Undefined, optional
        Labels are the labels/tags to be added to connection secret.
        - For Kubernetes secrets, this will be used as "metadata.labels".
        - It is up to Secret Store implementation for others store types.
    $type : str, default is Undefined, optional
        Type is the SecretType for the connection secret.
        - Only valid for Kubernetes Secret Stores.
    """


    annotations?: {str:str}

    labels?: {str:str}

    $type?: str


schema ProjectDigitaloceanCrossplaneIoV1alpha1ProjectSpecWriteConnectionSecretToRef:
    r"""
    WriteConnectionSecretToReference specifies the namespace and name of a
    Secret to which any connection details for this managed resource should
    be written. Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.
    This field is planned to be replaced in a future release in favor of
    PublishConnectionDetailsTo. Currently, both could be set independently
    and connection details would be published to both without affecting
    each other.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the secret.
    namespace : str, default is Undefined, required
        Namespace of the secret.
    """


    name: str

    namespace: str


schema ProjectDigitaloceanCrossplaneIoV1alpha1ProjectStatus:
    r"""
    ProjectStatus defines the observed state of Project.

    Attributes
    ----------
    atProvider : ProjectDigitaloceanCrossplaneIoV1alpha1ProjectStatusAtProvider, default is Undefined, optional
        at provider
    conditions : [ProjectDigitaloceanCrossplaneIoV1alpha1ProjectStatusConditionsItems0], default is Undefined, optional
        Conditions of the resource.
    observedGeneration : int, default is Undefined, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """


    atProvider?: ProjectDigitaloceanCrossplaneIoV1alpha1ProjectStatusAtProvider

    conditions?: [ProjectDigitaloceanCrossplaneIoV1alpha1ProjectStatusConditionsItems0]

    observedGeneration?: int


schema ProjectDigitaloceanCrossplaneIoV1alpha1ProjectStatusAtProvider:
    r"""
    project digitalocean crossplane io v1alpha1 project status at provider

    Attributes
    ----------
    createdAt : str, default is Undefined, optional
        the date and time when the project was created, (ISO8601)
        the date and time when the project was created, (ISO8601)
    description : str, default is Undefined, optional
        the description of the project
        the description of the project
    environment : str, default is Undefined, optional
        the environment of the project's resources. The possible values are: Development, Staging, Production)
        the environment of the project's resources
    id : str, default is Undefined, optional
        The id of the project
    isDefault : bool, default is Undefined, optional
        a boolean indicating whether or not the project is the default project. (Default: "false")
        determine if the project is the default or not.
    name : str, default is Undefined, optional
        The name of the Project
        the human-readable name for the project
    ownerId : float, default is Undefined, optional
        the id of the project owner.
        the id of the project owner.
    ownerUuid : str, default is Undefined, optional
        the unique universal identifier of the project owner.
        the unique universal identifier of the project owner.
    purpose : str, default is Undefined, optional
        the purpose of the project, (Default: "Web Application")
        the purpose of the project
    resources : [str], default is Undefined, optional
        a list of uniform resource names (URNs) for the resources associated with the project
        the resources associated with the project
    updatedAt : str, default is Undefined, optional
        the date and time when the project was last updated, (ISO8601)
        the date and time when the project was last updated, (ISO8601)
    """


    createdAt?: str

    description?: str

    environment?: str

    id?: str

    isDefault?: bool

    name?: str

    ownerId?: float

    ownerUuid?: str

    purpose?: str

    resources?: [str]

    updatedAt?: str


schema ProjectDigitaloceanCrossplaneIoV1alpha1ProjectStatusConditionsItems0:
    r"""
    A Condition that may apply to a resource.

    Attributes
    ----------
    lastTransitionTime : str, default is Undefined, required
        LastTransitionTime is the last time this condition transitioned from one
        status to another.
    message : str, default is Undefined, optional
        A Message containing details about this condition's last transition from
        one status to another, if any.
    observedGeneration : int, default is Undefined, optional
        ObservedGeneration represents the .metadata.generation that the condition was set based upon.
        For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date
        with respect to the current state of the instance.
    reason : str, default is Undefined, required
        A Reason for this condition's last transition from one status to another.
    status : str, default is Undefined, required
        Status of this condition; is it currently True, False, or Unknown?
    $type : str, default is Undefined, required
        Type of this condition. At most one of each condition type may apply to
        a resource at any point in time.
    """


    lastTransitionTime: str

    message?: str

    observedGeneration?: int

    reason: str

    status: str

    $type: str


