provider "aws" {
	region = var.aws_region
	profile = var.aws_profile
}








## Uncomment for Terragrunt usage
# variable "remote_state_bucket" {}
# terraform {
#   backend "s3" {
#     # region         = var.aws_region
#     # encrypt        = true
#   }
#   required_providers {
#     aws = {
#       version = "~> 3.35"
#     }
#   }
# }






