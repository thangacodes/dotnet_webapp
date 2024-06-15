## Variables declaration:

variable "region" {
  description = "The region where the services will be getting provisioned"
}
variable "vpc_cidr"{
  description = "VPC CIDR range"
}
variable "instance_type" {
  description = "VM specification"
}
variable "tagging" {
  description = "VM tagging section"
}
variable "key_name" {
  description = "Custom SSH keypair creation"
}
