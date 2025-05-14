provider "azurerm" {
    #version = "1.44"
    subscription_id = var.subscription_id
    tenant_id = var.tenant_id
    client_id = var.client_id
    client_secret = var.client_secret
  
    features {}
}

terraform  {
  required_version = ">= 0.14"  
  backend "remote" {
    hostname = "tfe.cloudeng.com"
    organization = "blend"

    workspaces {
      prefix = "Devops-blend-"
    }
  }


  #backend "local" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "> 2.2.0"
    }
  }
}
