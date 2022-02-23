terraform {
  required_providers {
    aws      = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.2"
    }
    archive  = {
      source  = "hashicorp/archive"
      version = "~> 2.1"
    }
  }
}

provider "aws" {
  region                  = var.aws_region
  profile                 = var.profile
  shared_credentials_file = var.shared_credentials_file
}

module "lambda" {
  source = "./modules/lambda"
}

module "appsync" {
  source = "./modules/app_sync"
  function_arn = module.lambda.app_sync_function_arn
}