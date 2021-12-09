variable "aws_region" {
	type = string
	default = "eu-central-1"
}
variable "app_name" {
	type = string
	default = "java-bot"

}
variable "environment" {
	type = string
	default = "dev"
}
variable "aws_profile" {
	type = string
	description = "aws profile"
	default = "default"
}

locals {
	repository_name = format("%s-%s", var.app_name, var.environment)
}
