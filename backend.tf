terraform {
  backend "s3" {
    bucket         = "mf-commonsnonprod-terraform-state"
    key            = "Infra/s3-terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
