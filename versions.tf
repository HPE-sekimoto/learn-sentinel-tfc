terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.6.5"

  #backend "remote" {
  #  organization = "hpehitcoe"

  #  workspaces {
  #    name = "learn-sentinel-tfc"
  #  }
  #}

}
