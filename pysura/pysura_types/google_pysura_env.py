from pydantic import BaseModel
from typing import List, Dict, Any


class DictModel(BaseModel):

    def __getitem__(self, item):
        return self.__getattribute__(item)

    def __setitem__(self, key, value):
        self.__setattr__(key, value)


class GoogleOrganizationOwner(DictModel):
    directoryCustomerId: str | None = None


class GoogleOrganization(DictModel):
    creationTime: str | None = None
    displayName: str | None = None
    lifecycleState: str | None = None
    name: str | None = None
    owner: GoogleOrganizationOwner | None = None


class GoogleBillingAccount(DictModel):
    displayName: str | None = None
    masterBillingAccount: str | None = None
    name: str | None = None
    open: bool | None = None


class GoogleProject(DictModel):
    createTime: str | None = None
    labels: Dict[str, Any] | None = None
    lifecycleState: str | None = None
    name: str | None = None
    projectId: str | None = None
    projectNumber: str | None = None


class GoogleRoutingConfig(DictModel):
    routingMode: str | None = None


class GooglePeering(DictModel):
    autoCreateRoutes: bool | None = None
    exchangeSubnetRoutes: bool | None = None
    exportCustomRoutes: bool | None = None
    exportSubnetRoutesWithPublicIp: bool | None = None
    importCustomRoutes: bool | None = None
    importSubnetRoutesWithPublicIp: bool | None = None
    name: str | None = None
    network: str | None = None
    stackType: str | None = None
    state: str | None = None
    stateDetails: str | None = None


class GoogleNetwork(DictModel):
    autoCreateSubnetworks: bool | None = None
    creationTimestamp: str | None = None
    description: str | None = None
    id: str | None = None
    kind: str | None = None
    name: str | None = None
    networkFirewallPolicyEnforcementOrder: str | None = None
    peerings: List[GooglePeering] | None = None
    routingConfig: GoogleRoutingConfig | None = None
    selfLink: str | None = None
    selfLinkWithId: str | None = None
    subnetworks: List[str] | None = None
    x_gcloud_bgp_routing_mode: str | None = None
    x_gcloud_subnet_mode: str | None = None


class GoogleAddress(DictModel):
    address: str | None = None
    addressType: str | None = None
    creationTimestamp: str | None = None
    description: str | None = None
    id: str | None = None
    kind: str | None = None
    name: str | None = None
    network: str | None = None
    networkTier: str | None = None
    prefixLength: int | None = None
    purpose: str | None = None
    selfLink: str | None = None
    status: str | None = None


class GoogleVpcPeering(DictModel):
    network: str | None = None
    peering: str | None = None
    reservedPeeringRanges: List[str] | None = None
    service: str | None = None


class GoogleDatabaseIpConfiguration(DictModel):
    enablePrivatePathForGoogleCloudServices: bool | None = None
    ipv4Enabled: bool | None = None
    privateNetwork: str | None = None


class GoogleDatabaseLocationPreference(DictModel):
    kind: str | None = None
    zone: str | None = None


class GoogleBackupRetentionSettings(DictModel):
    retainedBackups: int | None = None
    retentionUnit: str | None = None


class GoogleDatabaseIpAddress(DictModel):
    ipAddress: str | None = None
    type: str | None = None


class GoogleDatabaseBackupConfiguration(DictModel):
    backupRetentionSettings: GoogleBackupRetentionSettings | None = None
    enabled: bool | None = None
    kind: str | None = None
    startTime: str | None = None
    transactionLogRetentionDays: int | None = None


class GoogleDatabaseServerCaCert(DictModel):
    cert: str | None = None
    certSerialNumber: str | None = None
    commonName: str | None = None
    createTime: str | None = None
    expirationTime: str | None = None
    instance: str | None = None
    kind: str | None = None
    sha1Fingerprint: str | None = None


class GoogleDatabaseSettings(DictModel):
    activationPolicy: str | None = None
    availabilityType: str | None = None
    backupConfiguration: GoogleDatabaseBackupConfiguration | None = None
    connectorEnforcement: str | None = None
    dataDiskSizeGb: str | None = None
    dataDiskType: str | None = None
    deletionProtectionEnabled: bool | None = None
    ipConfiguration: GoogleDatabaseIpConfiguration | None = None
    kind: str | None = None
    locationPreference: GoogleDatabaseLocationPreference | None = None
    pricingPlan: str | None = None
    replicationType: str | None = None
    settingsVersion: str | None = None
    storageAutoResize: bool | None = None
    storageAutoResizeLimit: str | None = None
    tier: str | None = None


class GoogleDatabase(DictModel):
    backendType: str | None = None
    connectionName: str | None = None
    createTime: str | None = None
    databaseInstalledVersion: str | None = None
    databaseVersion: str | None = None
    etag: str | None = None
    gceZone: str | None = None
    instanceType: str | None = None
    ipAddresses: List[GoogleDatabaseIpAddress] | None = None
    kind: str | None = None
    maintenanceVersion: str | None = None
    name: str | None = None
    project: str | None = None
    region: str | None = None
    selfLink: str | None = None
    serverCaCert: GoogleDatabaseServerCaCert | None = None
    serviceAccountEmailAddress: str | None = None
    settings: GoogleDatabaseSettings | None = None
    state: str | None = None


class DatabaseCredential(DictModel):
    database_id: str | None = None
    password: str | None = None
    connect_url: str | None = None


class GoogleConnector(DictModel):
    connectedProjects: List[str] | None = None
    ipCidrRange: str | None = None
    machineType: str | None = None
    maxInstances: int | None = None
    maxThroughput: int | None = None
    minInstances: int | None = None
    minThroughput: int | None = None
    name: str | None = None
    network: str | None = None
    state: str | None = None


class GoogleLogConfig(DictModel):
    enable: bool | None = None


class GoogleAllowedItem(DictModel):
    IPProtocol: str
    ports: List[str] | None = None


class GoogleFirewall(DictModel):
    allowed: List[GoogleAllowedItem] | None = None
    creationTimestamp: str | None = None
    description: str | None = None
    direction: str | None = None
    disabled: bool | None = None
    id: str | None = None
    kind: str | None = None
    logConfig: GoogleLogConfig | None = None
    name: str | None = None
    network: str | None = None
    priority: int | None = None
    selfLink: str | None = None
    sourceRanges: List[str] | None = None


class Hasura(DictModel):
    HASURA_GRAPHQL_CORS_DOMAIN: str | None = "*"
    HASURA_GRAPHQL_ENABLED_CORS: str | None = "true"
    HASURA_GRAPHQL_ENABLE_CONSOLE: str | None = "true"
    HASURA_GRAPHQL_ADMIN_SECRET: str | None = None
    HASURA_GRAPHQL_DATABASE_URL: str | None = None
    HASURA_GRAPHQL_METADATA_DATABASE_URL: str | None = None
    HASURA_GRAPHQL_JWT_SECRET: str | None = None
    HASURA_GRAPHQL_URL_ROOT: str | None = None
    vpc_connector: str | None = None
    timeout: str | None = None
    project_id: str | None = None
    cpu: str | None = None
    memory: str | None = None
    min_instances: str | None = None
    max_instances: str | None = None


class GoogleApiServicesDocumentation(DictModel):
    summary: str | None = None


class GoogleApiServicesLabel(DictModel):
    description: str | None = None
    key: str | None = None


class GoogleApiServicesMonitoredResource(DictModel):
    description: str | None = None
    displayName: str | None = None
    labels: List[GoogleApiServicesLabel] | None = None
    launchStage: str | None = None
    type: str | None = None


class GoogleApiServicesConsumerDestination(DictModel):
    metrics: List[str] | None = None
    monitoredResource: str | None = None


class GoogleApiServicesMonitoring(DictModel):
    consumerDestinations: List[GoogleApiServicesConsumerDestination] | None = None


class GoogleServicesUsage(DictModel):
    requirements: List[str] | None = None


class GoogleApiServicesConfig(DictModel):
    authentication: Dict[str, Any] | None = None
    documentation: GoogleApiServicesDocumentation | None = None
    monitoredResources: List[GoogleApiServicesMonitoredResource] | None = None
    monitoring: GoogleApiServicesMonitoring | None = None
    name: str | None = None
    quota: Dict[str, Any] | None = None
    title: str | None = None
    usage: GoogleServicesUsage | None = None


class GoogleApiServices(DictModel):
    config: GoogleApiServicesConfig | None = None
    name: str | None = None
    parent: str | None = None
    state: str | None = None


class GoogleServiceTrafficItem(DictModel):
    latestRevision: bool | None = None
    percent: int | None = None
    revisionName: str | None = None


class GoogleServiceMetadata(DictModel):
    annotations: Dict[str, Any] | None = None
    creationTimestamp: str | None = None
    generation: int | None = None
    labels: Dict[str, Any] = None
    name: str | None = None
    namespace: str | None = None
    resourceVersion: str | None = None
    selfLink: str | None = None
    uid: str | None = None


class GoogleServiceEnvItem(DictModel):
    name: str | None = None
    value: str | None = None


class GoogleServicePort(DictModel):
    containerPort: int | None = None
    name: str | None = None


class GoogleServiceLimits(DictModel):
    cpu: str | None = None
    memory: str | None = None


class GoogleServiceResources(DictModel):
    limits: GoogleServiceLimits | None = None


class GoogleServiceContainer(DictModel):
    args: List[str] | None = None
    command: List[str] | None = None
    env: List[GoogleServiceEnvItem] | None = None
    image: str | None = None
    ports: List[GoogleServicePort] | None = None
    resources: GoogleServiceResources | None = None


class GoogleServiceTemplateSpec(DictModel):
    containerConcurrency: int | None = None
    containers: List[GoogleServiceContainer] | None = None
    serviceAccountName: str | None = None
    timeoutSeconds: int | None = None


class GoogleServiceTemplate(DictModel):
    metadata: GoogleServiceMetadata | None = None
    spec: GoogleServiceTemplateSpec | None = None


class GoogleServiceSpec(DictModel):
    template: GoogleServiceTemplate | None = None
    traffic: List[GoogleServiceTrafficItem] | None = None


class GoogleServiceAddress(DictModel):
    url: str | None = None


class GoogleServiceCondition(DictModel):
    lastTransitionTime: str | None = None
    status: str | None = None
    type: str | None = None


class GoogleServiceStatus(DictModel):
    address: GoogleServiceAddress | None = None
    conditions: List[GoogleServiceCondition] | None = None
    latestCreatedRevisionName: str | None = None
    latestReadyRevisionName: str | None = None
    observedGeneration: int | None = None
    traffic: List[GoogleServiceTrafficItem] | None = None
    url: str | None = None


class GoogleService(DictModel):
    apiVersion: str | None = None
    kind: str | None = None
    metadata: GoogleServiceMetadata | None = None
    spec: GoogleServiceSpec | None = None
    status: GoogleServiceStatus | None = None


class GoogleSecretReplication(DictModel):
    automatic: Dict[str, Any]


class GoogleSecret(DictModel):
    createTime: str | None = None
    etag: str | None = None
    name: str | None = None
    replication: GoogleSecretReplication | None = None


class GoogleServiceAccount(DictModel):
    disabled: bool | None = None
    displayName: str | None = None
    email: str | None = None
    etag: str | None = None
    name: str | None = None
    oauth2ClientId: str | None = None
    projectId: str | None = None
    uniqueId: str | None = None
    key_file: Any | None = None


class GoogleCloudFunctionHttpsTrigger(BaseModel):
    securityLevel: str | None = None
    url: str | None = None


class AndroidSigningReport(DictModel):
    variant: str | None = None
    config: str | None = None
    md5: str | None = None
    sha1: str | None = None
    sha256: str | None = None
    valid_until: str | None = None


class IosCFBundleURLTypes(DictModel):
    CFBundleTypeRole: str | None = "Editor"
    CFBundleURLSchemes: List[str] | None = None


class GoogleCloudFunction(DictModel):
    availableMemoryMb: int | None = None
    buildId: str | None = None
    buildName: str | None = None
    dockerRegistry: str | None = None
    entryPoint: str | None = None
    httpsTrigger: GoogleCloudFunctionHttpsTrigger | None = None
    ingressSettings: str | None = None
    labels: Dict[str, Any] | None = None
    minInstances: int | None = None
    name: str | None = None
    runtime: str | None = None
    serviceAccountEmail: str | None = None
    sourceUploadUrl: str | None = None
    status: str | None = None
    timeout: str | None = None
    updateTime: str | None = None
    versionId: str | None = None


class GooglePysuraEnv(DictModel):
    gcloud_cli_installed: bool = False
    gcloud_alpha_cli_installed: bool = False
    gcloud_beta_cli_installed: bool = False
    gcloud_logged_in: bool = False
    docker_running: bool = False
    firebase_cli_installed: bool = False
    organization: GoogleOrganization | None = None
    organizations: List[GoogleOrganization] | None = None
    project: GoogleProject | None = None
    projects: List[GoogleProject] | None = None
    billing_account: GoogleBillingAccount | None = None
    billing_accounts: List[GoogleBillingAccount] | None = None
    network: GoogleNetwork | None = None
    networks: List[GoogleNetwork] | None = None
    address: GoogleAddress | None = None
    addresses: List[GoogleAddress] | None = None
    peering: GoogleVpcPeering | None = None
    peerings: List[GoogleVpcPeering] | None = None
    database: GoogleDatabase | None = None
    databases: List[GoogleDatabase] | None = None
    database_credential: DatabaseCredential | None = None
    database_credentials: List[DatabaseCredential] | None = None
    firewalls: List[GoogleFirewall] | None = None
    connector: GoogleConnector | None = None
    connectors: List[GoogleConnector] | None = None
    api_services: List[GoogleApiServices] | None = None
    services: List[GoogleService] | None = None
    secrets: List[GoogleSecret] | None = None
    service_accounts: List[GoogleServiceAccount] | None = None
    hasura: Hasura | None = None
    hasura_admin_secret: str | None = None
    hasura_backend_event_secret: str | None = None
    hasura_service: GoogleService | None = None
    hasura_service_url: str | None = None
    hasura_service_account: GoogleServiceAccount | None = None
    auth_service_account: GoogleServiceAccount | None = None
    functions: List[GoogleCloudFunction] | None = None
    ios_cf_bundle_url_types: IosCFBundleURLTypes | None = None
    android_signing_reports: List[AndroidSigningReport] | None = None
    android_debug_signing_report: AndroidSigningReport | None = None
