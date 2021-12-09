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

#get from output VPC module
variable "vpc_id" {
	type = string
	default = "vpc-08e25b43ae98bd369"
}
#get from output VPC module
variable "public_subnet_id" {
	type = list
	default = ["subnet-0237ac6267e8d5f9a", "subnet-0230a66fe3b45713f"]
}


# Listener 443 migrate to Route53 module
#get from Route53
# variable "aws_route53_certificate_arn" {
# 	type = string
# 	default = "arn:aws:acm:eu-central-1:530117518858:certificate/f3ae44e4-fc36-4c27-8aa6-9e5e2eb55b9a"
	
# }



variable "app_name" {
	type = string
	default = "java-bot"
}
variable "environment" {
	type = string
	default = "dev"
}
variable "app_port" {
	type = string
	default = "80"
	
}


variable "health_check_path" {
	type = string
	default = "/"
}

locals {
	repository_name = format("%s-%s", var.app_name, var.environment)
	name_generator = format("%s-%s", var.app_name, var.environment)
}
