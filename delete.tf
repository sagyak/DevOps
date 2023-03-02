terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "sagya"

    workspaces {
      name = "DevOps"
    }
  }
}

provider "snowflake" {
}

destroy {
  snowflake_database.devops_db.name
}
