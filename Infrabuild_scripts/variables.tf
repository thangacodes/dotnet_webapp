## Variables declaration:

variable "region" {
  description = "The region where the services will be getting provisioned"
}
variable "vpc_cidr" {
  description = "VPC CIDR range"
}
variable "private_subnet1" {
  description = "Private_subnet1_cidr"
}
variable "private_subnet2" {
  description = "Private_subnet2_cidr"
}
variable "private_subnet3" {
  description = "Private_subnet3_cidr"
}
variable "public_subnet1" {
  description = "Public_subnet1_cidr"
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
