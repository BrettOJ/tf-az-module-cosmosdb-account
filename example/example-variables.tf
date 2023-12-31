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
    type = list(string)
    description = "The list of resource Ids for Network Acl Bypass for this Cosmos DB account"
}

variable "local_authentication_disabled" {
    type = string
    description = "Disable local authentication and ensure only MSI and AAD can be used exclusively for authentication"
}


