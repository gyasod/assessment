resource "azurerm_log_analytics_workspace" "workspace" {
  count = var.log_analytics_workspace != null ? 1 : 0

  resource_group_name = var.rg_name
  location            = var.location

  name                                    = var.log_analytics_workspace.name
  allow_resource_only_permissions         = var.log_analytics_workspace.allow_resource_only_permissions
  local_authentication_disabled           = var.log_analytics_workspace.local_authentication_disabled
  sku                                     = var.log_analytics_workspace.sku
  retention_in_days                       = var.log_analytics_workspace.retention_in_days
  daily_quota_gb                          = var.log_analytics_workspace.daily_quota_gb
  cmk_for_query_forced                    = var.log_analytics_workspace.cmk_for_query_forced
  internet_ingestion_enabled              = var.log_analytics_workspace.internet_ingestion_enabled
  internet_query_enabled                  = var.log_analytics_workspace.internet_query_enabled
  reservation_capacity_in_gb_per_day      = var.log_analytics_workspace.sku == "CapacityReservation" ? var.log_analytics_workspace.reservation_capacity_in_gb_per_day : null
  data_collection_rule_id                 = var.log_analytics_workspace.data_collection_rule_id
  immediate_data_purge_on_30_days_enabled = var.log_analytics_workspace.immediate_data_purge_on_30_days_enabled

  dynamic "identity" {
    for_each = var.identity != null ? [1] : []

    content {
      type         = var.identity.type
      identity_ids = var.identity.identity_ids != null ? var.identity.identity_ids : []
    }
  }

  tags = local.tags
}
