terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }

backend "s3" { 
bucket = "bedrock-backend-alt-soe-025-1507" 
key = "global/terraform.tfstate" 
region = "us-east-1" 
dynamodb_table = "project-bedrock-locks" 
encrypt = true 
}

}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project = "Bedrock"
    }
  }
}