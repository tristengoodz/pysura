from pydantic import BaseModel
from typing import List


class DictModel(BaseModel):

    def __getitem__(self, item):
        return self.__getattribute__(item)

    def __setitem__(self, key, value):
        self.__setattr__(key, value)


class GoogleOrganization(DictModel):
    display_name: str | None = None
    organization_id: str | None = None
    directory_customer_id: str | None = None


class GoogleProject(DictModel):
    project_id: str | None = None
    name: str | None = None
    project_number: str | None = None


class GoogleBillingAccount(DictModel):
    billing_account_id: str | None = None
    name: str | None = None
    open: str | None = None
    master_account_id: str | None = None


class GoogleNetwork(DictModel):
    network_id: str | None = None
    subnet_mode: str | None = None
    bgp_routing_mode: str | None = None
    ipv4_range: str | None = None
    gateway_ipv4: str | None = None


class GoogleAddress(DictModel):
    address_id: str | None = None
    address: str | None = None
    address_type: str | None = None
    purpose: str | None = None
    network: str | None = None
    region: str | None = None
    subnet: str | None = None
    status: str | None = None


class GooglePeering(DictModel):
    network: str | None = None
    peering: str | None = None
    reserved_peering_ranges: List[str] = []
    service: str | None = None


class GoogleDatabase(DictModel):
    database_id: str | None = None
    version: str | None = None
    zone: str | None = None
    tier: str | None = None
    primary_address: str | None = None
    private_address: str | None = None
    status: str | None = None


class DatabaseCredential(DictModel):
    database_id: str | None = None
    password: str | None = None
    connect_url: str | None = None


class GoogleConnector(DictModel):
    connector_id: str | None = None
    region: str | None = None
    network: str | None = None
    ip_cidr_range: str | None = None
    subnet: str | None = None
    subnet_project: str | None = None
    machine_type: str | None = None
    min_instances: str | None = None
    max_instances: str | None = None
    min_throughput: str | None = None
    max_throughput: str | None = None
    state: str | None = None


class Hasura(DictModel):
    HASURA_GRAPHQL_CORS_DOMAIN: str = "*"
    HASURA_GRAPHQL_ENABLED_CORS: str = "true"
    HASURA_GRAPHQL_ENABLE_CONSOLE: str = "true"
    HASURA_GRAPHQL_ADMIN_SECRET: str | None = None
    HASURA_GRAPHQL_DATABASE_URL: str | None = None
    HASURA_GRAPHQL_METADATA_DATABASE_URL: str | None = None
    vpc_connector: str | None = None
    timeout: str | None = None
    project_id: str | None = None
    cpu: str | None = None
    memory: str | None = None
    min_instances: str | None = None
    max_instances: str | None = None


class GooglePysuraEnv(DictModel):
    gcloud_cli_installed: bool = False
    gcloud_alpha_cli_installed: bool = False
    gcloud_beta_cli_installed: bool = False
    gcloud_logged_in: bool = False
    docker_running: bool = False
    firebase_cli_installed: bool = False
    organization: GoogleOrganization | None = None
    organizations: List[GoogleOrganization] = []
    project: GoogleProject | None = None
    projects: List[GoogleDatabase] = []
    billing_account: GoogleBillingAccount | None = None
    billing_accounts: List[GoogleBillingAccount] = []
    network: GoogleNetwork | None = None
    networks: List[GoogleNetwork] = []
    address: GoogleAddress | None = None
    addresses: List[GoogleAddress] = []
    peering: GooglePeering | None = None
    peerings: List[GooglePeering] = []
    database: GoogleDatabase | None = None
    databases: List[GoogleDatabase] = []
    database_credential: DatabaseCredential | None = None
    database_credentials: List[DatabaseCredential] = []
    connector: GoogleConnector | None = None
    connectors: List[GoogleConnector] = []
    hasura: Hasura | None = None
