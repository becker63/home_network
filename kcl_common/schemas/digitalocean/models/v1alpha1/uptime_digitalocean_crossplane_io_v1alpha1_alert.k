"""
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""
import k8s.apimachinery.pkg.apis.meta.v1


schema Alert:
    r"""
    Alert is the Schema for the Alerts API.

    Attributes
    ----------
    apiVersion : str, default is "uptime.digitalocean.crossplane.io/v1alpha1", required
        APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    kind : str, default is "Alert", required
        Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata : v1.ObjectMeta, default is Undefined, optional
        metadata
    spec : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpec, default is Undefined, required
        spec
    status : UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatus, default is Undefined, optional
        status
    """


    apiVersion: "uptime.digitalocean.crossplane.io/v1alpha1" = "uptime.digitalocean.crossplane.io/v1alpha1"

    kind: "Alert" = "Alert"

    metadata?: v1.ObjectMeta

    spec: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpec

    status?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatus


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpec:
    r"""
    AlertSpec defines the desired state of Alert

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
    forProvider : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProvider, default is Undefined, required
        for provider
    initProvider : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProvider, default is Undefined, optional
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
    providerConfigRef : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecProviderConfigRef, default is Undefined, optional
        provider config ref
    publishConnectionDetailsTo : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecPublishConnectionDetailsTo, default is Undefined, optional
        publish connection details to
    writeConnectionSecretToRef : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecWriteConnectionSecretToRef, default is Undefined, optional
        write connection secret to ref
    """


    deletionPolicy?: "Orphan" | "Delete" = "Delete"

    forProvider: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProvider

    initProvider?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProvider

    managementPolicies?: [str] = ["*"]

    providerConfigRef?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecProviderConfigRef

    publishConnectionDetailsTo?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecPublishConnectionDetailsTo

    writeConnectionSecretToRef?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecWriteConnectionSecretToRef


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProvider:
    r"""
    uptime digitalocean crossplane io v1alpha1 alert spec for provider

    Attributes
    ----------
    checkId : str, default is Undefined, optional
        A unique identifier for a check
        A unique identifier for a check.
    checkIdRef : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderCheckIDRef, default is Undefined, optional
        check Id ref
    checkIdSelector : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderCheckIDSelector, default is Undefined, optional
        check Id selector
    comparison : str, default is Undefined, optional
        The comparison operator used against the alert's threshold. Must be one of greater_than or less_than.
        The comparison operator used against the alert's threshold. Enum: 'greater_than' 'less_than
    name : str, default is Undefined, optional
        A human-friendly display name.
        A human-friendly display name for the alert.
    notifications : [UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderNotificationsItems0], default is Undefined, optional
        The notification settings for a trigger alert.
        The notification settings for a trigger alert.
    period : str, default is Undefined, optional
        Period of time the threshold must be exceeded to trigger the alert. Must be one of 2m, 3m, 5m, 10m, 15m, 30m or 1h.
        Period of time the threshold must be exceeded to trigger the alert. Enum '2m' '3m' '5m' '10m' '15m' '30m' '1h'
    threshold : float, default is Undefined, optional
        The threshold at which the alert will enter a trigger state. The specific threshold is dependent on the alert type.
        The threshold at which the alert will enter a trigger state. The specific threshold is dependent on the alert type.
    $type : str, default is Undefined, optional
        The type of health check to perform. Must be one of latency, down, down_global or ssl_expiry.
        The type of health check to perform. Enum: 'latency' 'down' 'down_global' 'ssl_expiry'
    """


    checkId?: str

    checkIdRef?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderCheckIDRef

    checkIdSelector?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderCheckIDSelector

    comparison?: str

    name?: str

    notifications?: [UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderNotificationsItems0]

    period?: str

    threshold?: float

    $type?: str


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderCheckIDRef:
    r"""
    Reference to a Check in uptime to populate checkId.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderCheckIDRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderCheckIDRefPolicy


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderCheckIDRefPolicy:
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


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderCheckIDSelector:
    r"""
    Selector for a Check in uptime to populate checkId.

    Attributes
    ----------
    matchControllerRef : bool, default is Undefined, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, default is Undefined, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderCheckIDSelectorPolicy, default is Undefined, optional
        policy
    """


    matchControllerRef?: bool

    matchLabels?: {str:str}

    policy?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderCheckIDSelectorPolicy


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderCheckIDSelectorPolicy:
    r"""
    Policies for selection.

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


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderNotificationsItems0:
    r"""
    uptime digitalocean crossplane io v1alpha1 alert spec for provider notifications items0

    Attributes
    ----------
    email : [str], default is Undefined, optional
        List of email addresses to sent notifications to.
        List of email addresses to sent notifications to
    slack : [UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderNotificationsItems0SlackItems0], default is Undefined, optional
        slack
    """


    email?: [str]

    slack?: [UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderNotificationsItems0SlackItems0]


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecForProviderNotificationsItems0SlackItems0:
    r"""
    uptime digitalocean crossplane io v1alpha1 alert spec for provider notifications items0 slack items0

    Attributes
    ----------
    channel : str, default is Undefined, optional
        The Slack channel to send alerts to.
        The Slack channel to send alerts to
    url : str, default is Undefined, optional
        The webhook URL for Slack.
        The webhook URL for Slack
    """


    channel?: str

    url?: str


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProvider:
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
    checkId : str, default is Undefined, optional
        A unique identifier for a check
        A unique identifier for a check.
    checkIdRef : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderCheckIDRef, default is Undefined, optional
        check Id ref
    checkIdSelector : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderCheckIDSelector, default is Undefined, optional
        check Id selector
    comparison : str, default is Undefined, optional
        The comparison operator used against the alert's threshold. Must be one of greater_than or less_than.
        The comparison operator used against the alert's threshold. Enum: 'greater_than' 'less_than
    name : str, default is Undefined, optional
        A human-friendly display name.
        A human-friendly display name for the alert.
    notifications : [UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderNotificationsItems0], default is Undefined, optional
        The notification settings for a trigger alert.
        The notification settings for a trigger alert.
    period : str, default is Undefined, optional
        Period of time the threshold must be exceeded to trigger the alert. Must be one of 2m, 3m, 5m, 10m, 15m, 30m or 1h.
        Period of time the threshold must be exceeded to trigger the alert. Enum '2m' '3m' '5m' '10m' '15m' '30m' '1h'
    threshold : float, default is Undefined, optional
        The threshold at which the alert will enter a trigger state. The specific threshold is dependent on the alert type.
        The threshold at which the alert will enter a trigger state. The specific threshold is dependent on the alert type.
    $type : str, default is Undefined, optional
        The type of health check to perform. Must be one of latency, down, down_global or ssl_expiry.
        The type of health check to perform. Enum: 'latency' 'down' 'down_global' 'ssl_expiry'
    """


    checkId?: str

    checkIdRef?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderCheckIDRef

    checkIdSelector?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderCheckIDSelector

    comparison?: str

    name?: str

    notifications?: [UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderNotificationsItems0]

    period?: str

    threshold?: float

    $type?: str


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderCheckIDRef:
    r"""
    Reference to a Check in uptime to populate checkId.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderCheckIDRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderCheckIDRefPolicy


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderCheckIDRefPolicy:
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


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderCheckIDSelector:
    r"""
    Selector for a Check in uptime to populate checkId.

    Attributes
    ----------
    matchControllerRef : bool, default is Undefined, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, default is Undefined, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderCheckIDSelectorPolicy, default is Undefined, optional
        policy
    """


    matchControllerRef?: bool

    matchLabels?: {str:str}

    policy?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderCheckIDSelectorPolicy


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderCheckIDSelectorPolicy:
    r"""
    Policies for selection.

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


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderNotificationsItems0:
    r"""
    uptime digitalocean crossplane io v1alpha1 alert spec init provider notifications items0

    Attributes
    ----------
    email : [str], default is Undefined, optional
        List of email addresses to sent notifications to.
        List of email addresses to sent notifications to
    slack : [UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderNotificationsItems0SlackItems0], default is Undefined, optional
        slack
    """


    email?: [str]

    slack?: [UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderNotificationsItems0SlackItems0]


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecInitProviderNotificationsItems0SlackItems0:
    r"""
    uptime digitalocean crossplane io v1alpha1 alert spec init provider notifications items0 slack items0

    Attributes
    ----------
    channel : str, default is Undefined, optional
        The Slack channel to send alerts to.
        The Slack channel to send alerts to
    url : str, default is Undefined, optional
        The webhook URL for Slack.
        The webhook URL for Slack
    """


    channel?: str

    url?: str


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecProviderConfigRef:
    r"""
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecProviderConfigRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecProviderConfigRefPolicy


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecProviderConfigRefPolicy:
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


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecPublishConnectionDetailsTo:
    r"""
    PublishConnectionDetailsTo specifies the connection secret config which
    contains a name, metadata and a reference to secret store config to
    which any connection details for this managed resource should be written.
    Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.

    Attributes
    ----------
    configRef : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecPublishConnectionDetailsToConfigRef, default is Undefined, optional
        config ref
    metadata : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecPublishConnectionDetailsToMetadata, default is Undefined, optional
        metadata
    name : str, default is Undefined, required
        Name is the name of the connection secret.
    """


    configRef?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecPublishConnectionDetailsToConfigRef

    metadata?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecPublishConnectionDetailsToMetadata

    name: str


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecPublishConnectionDetailsToConfigRef:
    r"""
    SecretStoreConfigRef specifies which secret store config should be used
    for this ConnectionSecret.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecPublishConnectionDetailsToConfigRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecPublishConnectionDetailsToConfigRefPolicy


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecPublishConnectionDetailsToConfigRefPolicy:
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


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecPublishConnectionDetailsToMetadata:
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


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertSpecWriteConnectionSecretToRef:
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


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatus:
    r"""
    AlertStatus defines the observed state of Alert.

    Attributes
    ----------
    atProvider : UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatusAtProvider, default is Undefined, optional
        at provider
    conditions : [UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatusConditionsItems0], default is Undefined, optional
        Conditions of the resource.
    observedGeneration : int, default is Undefined, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """


    atProvider?: UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatusAtProvider

    conditions?: [UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatusConditionsItems0]

    observedGeneration?: int


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatusAtProvider:
    r"""
    uptime digitalocean crossplane io v1alpha1 alert status at provider

    Attributes
    ----------
    checkId : str, default is Undefined, optional
        A unique identifier for a check
        A unique identifier for a check.
    comparison : str, default is Undefined, optional
        The comparison operator used against the alert's threshold. Must be one of greater_than or less_than.
        The comparison operator used against the alert's threshold. Enum: 'greater_than' 'less_than
    id : str, default is Undefined, optional
        The id of the alert.
    name : str, default is Undefined, optional
        A human-friendly display name.
        A human-friendly display name for the alert.
    notifications : [UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatusAtProviderNotificationsItems0], default is Undefined, optional
        The notification settings for a trigger alert.
        The notification settings for a trigger alert.
    period : str, default is Undefined, optional
        Period of time the threshold must be exceeded to trigger the alert. Must be one of 2m, 3m, 5m, 10m, 15m, 30m or 1h.
        Period of time the threshold must be exceeded to trigger the alert. Enum '2m' '3m' '5m' '10m' '15m' '30m' '1h'
    threshold : float, default is Undefined, optional
        The threshold at which the alert will enter a trigger state. The specific threshold is dependent on the alert type.
        The threshold at which the alert will enter a trigger state. The specific threshold is dependent on the alert type.
    $type : str, default is Undefined, optional
        The type of health check to perform. Must be one of latency, down, down_global or ssl_expiry.
        The type of health check to perform. Enum: 'latency' 'down' 'down_global' 'ssl_expiry'
    """


    checkId?: str

    comparison?: str

    id?: str

    name?: str

    notifications?: [UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatusAtProviderNotificationsItems0]

    period?: str

    threshold?: float

    $type?: str


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatusAtProviderNotificationsItems0:
    r"""
    uptime digitalocean crossplane io v1alpha1 alert status at provider notifications items0

    Attributes
    ----------
    email : [str], default is Undefined, optional
        List of email addresses to sent notifications to.
        List of email addresses to sent notifications to
    slack : [UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatusAtProviderNotificationsItems0SlackItems0], default is Undefined, optional
        slack
    """


    email?: [str]

    slack?: [UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatusAtProviderNotificationsItems0SlackItems0]


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatusAtProviderNotificationsItems0SlackItems0:
    r"""
    uptime digitalocean crossplane io v1alpha1 alert status at provider notifications items0 slack items0

    Attributes
    ----------
    channel : str, default is Undefined, optional
        The Slack channel to send alerts to.
        The Slack channel to send alerts to
    url : str, default is Undefined, optional
        The webhook URL for Slack.
        The webhook URL for Slack
    """


    channel?: str

    url?: str


schema UptimeDigitaloceanCrossplaneIoV1alpha1AlertStatusConditionsItems0:
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


