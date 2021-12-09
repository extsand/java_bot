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
variable "public_subnet_id" {
	type = list
	default = ["subnet-0237ac6267e8d5f9a", "subnet-0230a66fe3b45713f"]
}
variable "private_subnet_id" {
	type = list
	default = ["subnet-0295b845bebf21e42", "subnet-0cd46e24ed8fcc710"]
}


#Get from ECR module
variable "ecr_repository_url" {
  type = string
	default = "530117518858.dkr.ecr.eu-central-1.amazonaws.com/docker_app"
}


#Get from Load Balancer module
# variable "app_load_balancer" {
# 	type = string
# 	default = "arn:aws:elasticloadbalancing:eu-central-1:530117518858:loadbalancer/app/java-bot-dev-load-balancer/433973262268dbb7"
# }
variable "aws_alb_security_group" {
	type = string
	default = "sg-0891f3f26d5dbbb25"
	description = "load balancer security group"
}
variable "lb_target_group_arn"{
	type = string
	default = "arn:aws:elasticloadbalancing:eu-central-1:530117518858:targetgroup/java-bot-dev-target-group/8858ad80b91255f2"
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
variable "app_count" {
	type = string
	default = "1"
}

variable "image_tag" {
	type = string
	default = "latest"
	description = "git commit like tag"
	
}


variable "fargate_cpu" {
	type = string
	default = "512"
	description = "Fargate instance CPU"	
}
variable "fargate_memory" {
	type = string
	default = "1024"
	description = "Fargare instance memory"
}
variable "container_definition_template" {
	type = string
	default = "container_definition_template.json.tpl"
	
}



locals {
	repository_name = format("%s-%s", var.app_name, var.environment)
	name_generator = format("%s-%s", var.app_name, var.environment)
}
