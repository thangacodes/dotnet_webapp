resource "aws_vpc" "main" {
 cidr_block = var.cidr
  tags = merge(var.tagging, { Name = "DotNet-Project" })
}
