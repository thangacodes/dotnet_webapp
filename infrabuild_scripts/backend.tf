terraform {
  backend "s3" {
    bucket         = "project-cicd-tf-eks"
    key            = "eks/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
