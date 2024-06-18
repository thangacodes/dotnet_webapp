locals {
  region = "us-east-1"
  name   = "project-cluster"
  vpc_cidr = "192.168.0.0/16"
  azs      = ["us-east-1a", "us-east-1b"]
  private_subnets = ["192.168.1.0/24", "192.168.2.0/24"]
  public_subnets  = ["192.168.3.0/24", "192.168.4.0/24"]
  intra_subnets   = ["192.168.5.0/24", "192.168.6.0/24"]
  tags = {
    Example = local.name
  }
}
