terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.16.2"
    }
  }
  required_version = ">= 1.5.7"

  backend "s3" {
    bucket         = "infra-backend-tf-fixitwise"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "infra-backend-tf-fixitwise"
    profile        = "fixitwise"
  }
}
