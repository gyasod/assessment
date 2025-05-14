resource "azurerm_container_app_environment" "dev-app-env" {
  name                       = "dev-app-environment"
  location                   = var.location
  resource_group_name        = azurerm_resource_group.DevRG.name
  log_analytics_workspace_id = module.log_analytics_workspace.log_analytics_workspace_id
}

resource "azurerm_container_app" "dev-app" {
  name                         = "dev-nginx-app"
  container_app_environment_id = azurerm_container_app_environment.dev-app-env.id
  resource_group_name          = azurerm_resource_group.DevRG.name
  revision_mode                = "Single"

  template {
    container {
      name   = "nginx-container"
      image  = "nginx:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }

  ingress {
      external_enabled = true  # This enables public access
      target_port      = 80     # The port the container listens to
      transport        = "http"  # Use "http" or "tcp"

      traffic_weight {
        percentage      = 100
        latest_revision = true
      }
    }
}

output "container_app_url" {
  value       = azurerm_container_app.dev-app.default_domain
  description = "The public URL of the Nginx Container App"
}