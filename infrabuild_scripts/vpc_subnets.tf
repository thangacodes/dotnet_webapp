## This script is use to create AWS VPC and it require components like Internet Gateway, Private/Public Subnets, RouteTable..

resource "aws_vpc" "main" {
 cidr_block = var.vpc_cidr
  tags= merge(var.tagging, { Name="Dev-Account"}
}
