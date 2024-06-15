### Variable Values declaration
vpc_cidr       = "192.168.0.0/16"
private_subnet1 = "192.168.1.0/24"
private_subnet2 = "192.168.2.0/24"
private_subnet3 = "192.168.3.0/24"
public_subnet1  = "192.168.5.0/24"
region          = "ap-south-1"
instance_type   = "t2.micro"
key_name        = "ssh"
tagging = {
  CreationDate = "15/06/2024"
  Environment  = "Development"
  Owner        = "Thangadurai.Murugan@example.com"
  Tfversion    = "~> 5.0"
  Costcenter   = "100000"
  Reason       = "assesment"
  Company      = "example.com"
}
