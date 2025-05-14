module "log_analytics_workspace" {
  ## If using from Github directly


  ## If using Terraform Enterprise
  source  = "./modules/terraform-azurerm-log-analytics-workspace-main"

  tags = {
    environment = var.environment
    costcenter  = "DevOps"
    owner       = "blend"
    project     = "DevOps-blend"
  }

  location = var.location
  rg_name  = azurerm_resource_group.DevRG.name

  log_analytics_workspace = {
    name                                    = "blend-la-workspace"
    allow_resource_only_permissions         = false
    local_authentication_disabled           = false
    sku                                     = "PerGB2018"
    retention_in_days                       = 30
    daily_quota_gb                          = -1
    cmk_for_query_forced                    = false
    internet_ingestion_enabled              = false
    internet_query_enabled                  = false
    reservation_capacity_in_gb_per_day      = 100
    immediate_data_purge_on_30_days_enabled = false
  }
}