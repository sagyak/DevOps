pterraform {
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

resource "snowflake_database" "devops_db" {
  name    = "DEVOPS_DB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "devops_schema" {
  database = snowflake_database.devops_db.name
  name    = "DEVOPS_SCHEMA"
  comment = "Database for Snowflake Terraform demo"
}
