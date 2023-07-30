resource "azurerm_cosmosdb_account" "cosmosdb-account" {
    name = module.cdb_name.naming_convention_output[var.naming_convention_info.name].names.0
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
    consistency_level = var.consistency_level
    max_interval_in_seconds = var.max_interval_in_seconds
    max_staleness_prefix = var.max_staleness_prefix
    create_mode = var.create_mode
    default_identity_type = var.default_identity_type
    kind = var.kind

    tags = module.cdb_name.naming_convention_output[var.naming_convention_info.name].tags.0

    consistency_policy  {
        consistency_level = var.consistency_policy.consistency_level
        max_interval_in_seconds = var.consistency_policy.max_interval_in_seconds
        max_staleness_prefix = var.consistency_policy.max_staleness_prefix
    }

    geo_location  {
        location = var.geo_location.location
        failover_priority = var.geo_location.failover_priority
        zone_redundant = var.geo_location.zone_redundant
    }

    dynamic "capabilities" {
        for_each = var.capabilities != null ? var.capabilities : []
        content {
            name = capabilities.value.name
    }
    }
   dynamic "cores_rule" {
    for_each = var.cors_rule != null ? var.cors_rule : []
    content {
        allowed_headers = cors_rule.value.allowed_headers
        allowed_methods = cors_rule.value.allowed_methods
        allowed_origins = cors_rule.value.allowed_origins
        exposed_headers = cors_rule.value.exposed_headers
        max_age_in_seconds = cors_rule.value.max_age_in_seconds
    }
   } 

    dynamic "identity" {
        for_each = var.identity != null ? var.identity : []
        content {
            type = identity.value.type
            identity_ids = identity.value.identity_ids
        }
    }

    dynamic "restore" {
        for_each = var.restore != null ? var.restore : []
        content {
            source_cosmosdb_account_id = restore.value.source_cosmosdb_account_id
            restore_timestamp_in_utc = restore.value.restore_timestamp_in_utc
            dynamic "database" {
                for_each = restore.value.database != null ? restore.value.database : []
                content {
                    name = database.value.name
                    collection_names = database.value.collection_names
                }
            }
        }
    }

    dynamic "capacity" {
        for_each = var.capacity != null ? var.capacity : []
        content {
            total_throughput_limit = capacity.value.total_throughput_limit
        }
    }

    dynamic "backup" {
        for_each = var.backup != null ? var.backup : []
        content {
            type = backup.value.type
            interval_in_minutes = backup.value.interval_in_minutes
            retention_in_hours = backup.value.retention_in_hours
            storage_redundancy = backup.value.storage_redundancy
        }
    }

    dynamic "analytical_storage" {
        for_each = var.analytical_storage != null ? var.analytical_storage : []
        content {
            schema_type = analytical_storage.value.schema_type
        }
    }

    dynamic "virtual_network_rule" {
        for_each = var.virtual_network_rule != null ? var.virtual_network_rule : []
        content {
            id = virtual_network_rule.value.id
            ignore_missing_vnet_service_endpoint = virtual_network_rule.value.ignore_missing_vnet_service_endpoint
        }
    }

}

