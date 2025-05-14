variable "environment" {
  default = "dev"
}
variable "subscription_id" {
  default = ""
}
variable "tenant_id" {
  default = ""
}
variable "client_id" {
}
variable "client_secret" {
}
variable "location" {
  default = "uksouth"
}
variable "rg_name" {
  description = "The name of the resource group in which to create the Azure resources."
  type        = string
}
variable "tags" {
  type = map(string)
}