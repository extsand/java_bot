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
variable "private_subnet_id" {
	type = list
	default = ["subnet-02f1566bceafc2559", "subnet-0b8f69c16225bdbbb"]
}

#get from Route53
# variable "aws_route53_certificate_arn" {
# 	type = string
# 	default = "arn:aws:acm:eu-central-1:530117518858:certificate/14423c89-f3ae-453f-9d5b-c141d0373638"
	
# }

#get from Load Balancer
variable "app_load_balancer" {
	type = string
	default = "arn:aws:elasticloadbalancing:eu-central-1:530117518858:loadbalancer/app/java-bot-dev-load-balancer/433973262268dbb7"
}
variable "lb_sg" {
	type = string
	default = "sg-06ff3ee5909ca28c5"
	description = "load balancer security group"
}
variable "lb_tg_arn"{
	type = string
	default = "arn:aws:elasticloadbalancing:eu-central-1:530117518858:targetgroup/java-bot-dev-target-group/38554a8a5aae8367"
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

variable "ecr_repository_url" {
  type = string
	default = "530117518858.dkr.ecr.eu-central-1.amazonaws.com/docker_app"
}



variable "health_check_path" {
	type = string
	default = "/"
}

locals {
	repository_name = format("%s-%s", var.app_name, var.environment)
	name_generator = format("%s-%s", var.app_name, var.environment)
}
