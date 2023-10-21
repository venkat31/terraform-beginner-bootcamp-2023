
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