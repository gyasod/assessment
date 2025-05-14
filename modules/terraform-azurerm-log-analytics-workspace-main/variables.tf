variable "tags" {
  description = "Please reference the current tagging policy for required tags and allowed values.  See README for link to policy."
  type        = map(string)
}

variable "location" {
  description = "The location where the Azure resources should be created. For a list of all Azure locations, please consult the 'Azure Regions' link in the README or run 'az account list-locations --output table'."
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group in which to create the Azure resources."
  type        = string
}

variable "log_analytics_workspace" {
  description = "See object specific arguments in the README."

  type = object({
    name                                    = string
    allow_resource_only_permissions         = optional(bool)
    local_authentication_disabled           = optional(bool)
    sku                                     = optional(string)
    retention_in_days                       = optional(number)
    daily_quota_gb                          = optional(number)
    cmk_for_query_forced                    = optional(bool)
    internet_ingestion_enabled              = optional(bool)
    internet_query_enabled                  = optional(bool)
    reservation_capacity_in_gb_per_day      = optional(number)
    data_collection_rule_id                 = optional(string)
    immediate_data_purge_on_30_days_enabled = optional(bool)
  })

  default = null
}

variable "identity" {
  description = "See object specific arguments in the README."

  type = object({
    type         = string
    identity_ids = optional(list(string))
  })

  default = null
}

locals {
  tags = merge(
    var.tags,
    {
      cloud_module = "azurerm_log_analytics_workspace_1-0-0"
    }
  )
}
