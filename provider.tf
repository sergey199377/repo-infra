terraform {
  required_version = ">= 0.14, < 0.15"
  required_providers {
    aws = {
      access_key = ""
      secret key = ""
      region = "eu-central-1"
    }
  }
}

provider "vault" {
  address = "http://vault.myapp.ru"
}


data "vault_generic_secret" "keys" {
  path = "kv/myapp_env"
}
