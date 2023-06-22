terraform {
  backend "s3" {
    bucket = "terraform-state-learn-iac-conteiner"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}
