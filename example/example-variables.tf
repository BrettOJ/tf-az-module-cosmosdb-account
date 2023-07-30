# Terraform Varialbes for CosmosDB

variable "resource_group_name" {
    type = string
    description = "required name of resource group"
}

variable "location" {
    type = string
    description = "required location of cosmosdb account"
}

variable "offer_type" {
    type = string
    description = "required offer type of cosmosdb account"
}

variable "tags" {
    type = string
    description = "(optional) describe your variable"
}

variable "create_mode" {
    type = string
    description = "The creation mode for the CosmosDB Account, create_mode only works when backup.type is Continuous"
}

variable "default_identity_type" {
    type = string
    description = "The default identity for accessing Key Vault"
}

variable "kind" {
    type = string
    description = "Specifies the Kind of CosmosDB to create"
}

variable "consistency_policy" {
    type = string
    description = "Specifies a consistency_policy resource, used to define the consistency policy for this CosmosDB account"
}

variable "geo_location" {
    type = string
    description = "Specifies a geo_location resource, used to define where data should be replicated with the failover_priority 0 specifying the primary location"
}

variable "ip_range_filter" {
    type = string
    description = "CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IPs for a given database account. IP addresses/ranges must be comma separated and must not contain any spaces"
}

variable "enable_free_tier" {
    type = string
    description = "Enable the Free Tier pricing option for this Cosmos DB account"
}

variable "analytical_storage_enabled" {
    type = string
    description = "Enable Analytical Storage option for this Cosmos DB account"
}

variable "enable_automatic_failover" {
    type = string
    description = "Enable automatic failover for this Cosmos DB account"
}

variable "public_network_access_enabled" {
    type = string
    description = "Whether or not public network access is allowed for this CosmosDB account"
}

variable "is_virtual_network_filter_enabled" {
    type = string
    description = "Enables virtual network filtering for this Cosmos DB account"
}

variable "key_vault_key_id" {
    type = string
    description = "A versionless Key Vault Key ID for CMK encryption"
}

variable "virtual_network_rule" {
    type = string
    description = "Specifies a virtual_network_rules resource, used to define which subnets are allowed to access this CosmosDB account"
}

variable "enable_multiple_write_locations" {
    type = string
    description = "Enable multiple write locations for this Cosmos DB account"
}

variable "access_key_metadata_writes_enabled" {
    type = string
    description = "Is write operations on metadata resources (databases, containers, throughput) via account keys enabled"
}

variable "mongo_server_version" {
    type = string
    description = "The Server Version of a MongoDB account"
}

variable "network_acl_bypass_for_azure_services" {
    type = string
    description = "If Azure services can bypass ACLs"
}

variable "network_acl_bypass_ids" {
    type = string
    description = "The list of resource Ids for Network Acl Bypass for this Cosmos DB account"
}

variable "local_authentication_disabled" {
    type = string
    description = "Disable local authentication and ensure only MSI and AAD can be used exclusively for authentication"
}

variable "consistency_level" {
    type = string
    description = "The Consistency Level to use for this CosmosDB Account"
}

variable "max_interval_in_seconds" {
    type = string
    description = "When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated"
}

variable "max_staleness_prefix" {
    type = string
    description = "When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated"
}

variable "geo_location" {
    type = object({
      location = string
        failover_priority = number
        zone_redundant = bool
    })
    description = "Specifies a geo_location resource, used to define where data should be replicated with the failover_priority 0 specifying the primary location"
}

variable "capabilities" {
    type = list(object({
        name = string
    }))
    description = "Specifies a capabilities resource, used to define the capabilities for this CosmosDB account"
}

variable "virtual_network_rule" {
    type = list(object({
        id = string
        ignore_missing_vnet_service_endpoint = bool
    }))
    description = "Specifies a virtual_network_rules resource, used to define which subnets are allowed to access this CosmosDB account"
}

variable "analytical_storage" {
    type = object({
        schema_type = string
    })
    description = "Specifies a analytical_storage resource, used to define the analytical storage for this CosmosDB account"
}

variable "capacity" {
    type = object({
        total_throughput_limit = number
    })
    description = "Specifies a capacity resource, used to define the capacity for this CosmosDB account"
}

variable "backup" {
    type = object({
        type = string
        interval_in_minutes = number
        retention_in_hours = number
        storage_redundancy = string
    })
    description = "Specifies a backup resource, used to define the backup for this CosmosDB account"
}

variable "cors_rule" {
    type = list(object({
        allowed_headers = list(string)
        allowed_methods = list(string)
        allowed_origins = list(string)
        exposed_headers = list(string)
        max_age_in_seconds = number
    }))
    description = "Specifies a cors_rule resource, used to define the cors_rule for this CosmosDB account"
}

variable "identity" {
    type = object({
        type = string
        identity_ids = list(string)
    })
    description = "Specifies a identity resource, used to define the identity for this CosmosDB account"
}

variable "restore" {
    type = object({
        source_cosmosdb_account_id = string
        restore_timestamp_in_utc = string
        database = list(object({
            name = string
            collection_names = list(string)
        }))
    })
    description = "Specifies a restore resource, used to define the restore for this CosmosDB account"
}
