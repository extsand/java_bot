variable "aws_region" {
	type = string
	default = "eu-central-1"
}
variable "aws_profile" {
	type = string
	description = "aws profile"
	default = "default"
}
data "aws_availability_zones" "available" {}
variable "aws_az_count" {
	type = string
	default = "2"
	
}


variable "app_name" {
	type = string
	default = "java-bot"
}
variable "environment" {
	type = string
	default = "dev"
}



variable "vpc_cidr_block" {
	type = string
	default = "10.0.0.0/16"
}





locals {
	repository_name = format("%s-%s", var.app_name, var.environment)
	name_generator = format("%s-%s", var.app_name, var.environment)
}
