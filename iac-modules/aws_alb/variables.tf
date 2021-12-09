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
	default = "vpc-0a69265db7a8cd875"
}
#get from output VPC module
variable "public_subnet_id" {
	type = list
	default = ["subnet-08d09cc1a1e860d8a", "subnet-0569ffe96ac4e2870"]
}


#get from Route53
variable "aws_route53_certificate_arn" {
	type = string
	default = "arn:aws:acm:eu-central-1:530117518858:certificate/f3ae44e4-fc36-4c27-8aa6-9e5e2eb55b9a"
	
}



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



# variable "vpc_cidr_block" {
# 	type = string
# 	default = "10.0.0.0/16"
# }



variable "health_check_path" {
	type = string
	default = "/"
}

locals {
	repository_name = format("%s-%s", var.app_name, var.environment)
	name_generator = format("%s-%s", var.app_name, var.environment)
}
