# terraform-azurerm-log-analytics-workspace

## Example Usage

```hcl
module "log_analytics_workspace" {
  ## If using from locally
  source = "/terraform-azurerm-log-analytics-workspace-main"

  ## If using Terraform Enterprise
  source  = "tfe.cloudeng.com/blend/log-analytics-workspace/azurerm"
  version = "<current version>"

  tags = {
    "Tag_1" = "Value_1"
    "Tag_2" = "Value_2"
    "Tag_3" = "Value_3"
  }

  location = "eastus2"
  rg_name  = "Example_BLEND_DEV_RG"

  log_analytics_workspace = {
    name                                    = "example-la-workspace"
    allow_resource_only_permissions         = false
    local_authentication_disabled           = false
    sku                                     = "PerGB2018"
    retention_in_days                       = 30
    daily_quota_gb                          = -1
    cmk_for_query_forced                    = false
    internet_ingestion_enabled              = false
    internet_query_enabled                  = false
    reservation_capacity_in_gb_per_day      = 100
    data_collection_rule_id                 = azurerm_monitor_data_collection_rule.example.id
    immediate_data_purge_on_30_days_enabled = false
  }

  identity = {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.workspace.id]
  }
}
```

where `<current version>` is the most recent release.


### log_analytics_workspace

| Name | Description |
|------|-------------|
| `log_analytics_workspace.name` | Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created. |
| `log_analytics_workspace.allow_resource_only_permissions` | Specifies if the log Analytics Workspace allow users accessing to data associated with resources they have permission to view, without permission to workspace. Defaults to true. |
| `log_analytics_workspace.local_authentication_disabled` | Specifies if the log Analytics workspace should enforce authentication using Azure AD. Defaults to false. |
| `log_analytics_workspace.sku` | Specifies the SKU of the Log Analytics Workspace. Possible values are PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, PerGB2018, and LACluster. Defaults to PerGB2018. |
| `log_analytics_workspace.retention_in_days` | The workspace data retention in days. Possible values are between 30 and 730. |
| `log_analytics_workspace.daily_quota_gb` | The workspace daily quota for ingestion in GB. Defaults to -1 (unlimited) if omitted. |
| `log_analytics_workspace.cmk_for_query_forced` | Is Customer Managed Storage mandatory for query management? |
| `log_analytics_workspace.internet_ingestion_enabled` | Should the Log Analytics Workspace support ingestion over the Public Internet? Defaults to true. |
| `log_analytics_workspace.internet_query_enabled` | Should the Log Analytics Workspace support querying over the Public Internet? Defaults to true. |
| `log_analytics_workspace.reservation_capacity_in_gb_per_day` | The capacity reservation level in GB for this workspace. Possible values are 100, 200, 300, 400, 500, 1000, 2000 and 5000. |
| `log_analytics_workspace.data_collection_rule_id` | The ID of the Data Collection Rule to use for this workspace. |
| `log_analytics_workspace.immediate_data_purge_on_30_days_enabled` | Whether to remove the data in the Log Analytics Workspace immediately after 30 days. |

### identity

| Name | Description |
|------|-------------|
| `identity.type` | Specifies the identity type of the Log Analytics Workspace. Possible values are SystemAssigned (where Azure will generate a Service Principal for you) and UserAssigned where you can specify the Service Principal IDs in the identity_ids field. |
| `identity.identity_ids` | Specifies a list of user managed identity ids to be assigned. Required if type is UserAssigned. |

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4.20.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_workspace.workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
