terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }

    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "random" {
  # Configuration options
}

provider "aws" {
  region = "us-west-2"
}

# terraform {
#   cloud {
#     organization = "Abhi1204"

#     workspaces {
#       name = "terra-house-1"
#     }
#   }
# }