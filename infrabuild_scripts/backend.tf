terraform {
  backend "s3" {
    bucket         = "project-cicd-tf-durai-state"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
