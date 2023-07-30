locals {

  naming_convention_info = {
    name         = "001"
    project_code = "ml"
    env          = "de"
    zone         = "in"
    agency_code  = "mrl"
    tier         = "pp"
  }

  tags = {
    createdBy = "Terraform"
    project   = "bojtest"
    Owner     = "boj"
  }
}

module "cosmosdb-account" {
    source = "../" #git::https://github.com/BrettOJ/tf-az-module-cosmosdb-account?ref=main"
    resource_group_name = var.resource_group_name
    location = var.location
    offer_type = var.offer_type
    ip_range_filter = var.ip_range_filter
    enable_free_tier = var.enable_free_tier
    analytical_storage_enabled = var.analytical_storage_enabled
    enable_automatic_failover = var.enable_automatic_failover
    public_network_access_enabled = var.public_network_access_enabled
    is_virtual_network_filter_enabled = var.is_virtual_network_filter_enabled
    key_vault_key_id = var.key_vault_key_id
    enable_multiple_write_locations = var.enable_multiple_write_locations
    access_key_metadata_writes_enabled = var.access_key_metadata_writes_enabled
    mongo_server_version = var.mongo_server_version
    network_acl_bypass_for_azure_services = var.network_acl_bypass_for_azure_services
    network_acl_bypass_ids = var.network_acl_bypass_ids
    local_authentication_disabled = var.local_authentication_disabled
    create_mode = var.create_mode
    default_identity_type = var.default_identity_type
    kind = var.kind
    tags = local.tags
    naming_convention_info = local.naming_convention_info

    consistency_policy = {
        consistency_level = "Session"
        max_interval_in_seconds = 5
        max_staleness_prefix = 100
    }
    geo_location = {
        location = "eastus"
        failover_priority = 0
        zone_redundant = false
    }

    capabilities = [{
        name = "EnableAggregationPipeline"
    }]


    cors_rule = [{
        allowed_headers = ["*"]
        allowed_methods = ["GET"]
        allowed_origins = ["*"]
        exposed_headers = ["*"]
        max_age_in_seconds = 3600
    }]
    identity = {
        type = "SystemAssigned"
        identity_ids = []
    }
    restore = {
        source_cosmosdb_account_id = ""
        restore_timestamp_in_utc = ""
        database = [{
            name = ""
            collection_names = []
        }]
    }

    capacity = {
        total_throughput_limit = 400
    }

    backup = {
        type = "Periodic"
        interval_in_minutes = 240
        retention_in_hours = 8
        storage_redundancy = "Local"
    }

    analytical_storage = {
        schema_type = "FullFidelity"
    }

    virtual_network_rule = [{
        id = ""
        ignore_missing_vnet_service_endpoint = false
    }]

}

