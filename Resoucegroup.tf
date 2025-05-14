resource "azurerm_resource_group" "DevRG" {
  name     = "US-BLEND-DEV-RG"
    location = var.location
    tags = {
      environment = "test"
      costcenter  = "DevOps"
      owner       = "blend"
      project     = "DevOps-blend"
    }
}