# Configure the Azure provider & Terraform Cloud
terraform {
  # Cloud block
  cloud {
    organization = "AntonioBerbece"

    workspaces {
      name = "terraform-azure-infrastructure"
    }
  }

  # Providers to use in generating infrastructure
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 1.1.0" # force minimum vers 1.1.0 on the Terraform version
}

# Pass Azure configs (secret keys, tokens, etc.) to Azure provider
provider "azurerm" {
  features {}

  subscription_id = var.ARM_SUBSCRIPTION_ID
  tenant_id       = var.ARM_TENANT_ID
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
}

# CREATE RESOURCES #
resource "azurerm_resource_group" "rg" {
  name     = "terraform-azure-infrastructure-rg"
  location = "centralus"
}

resource "azurerm_resource_group" "rg2" {
  name     = "terraform-azure-infrastructure-rg-2"
  location = "centralus"
}
