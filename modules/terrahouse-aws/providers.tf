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
