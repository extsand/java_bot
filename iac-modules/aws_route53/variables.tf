variable "aws_region" {
	type = string
	default = "eu-central-1"
}
variable "aws_profile" {
	type = string
	description = "aws profile"
	default = "default"
}
variable "aws_az_count" {
	type = string
	default = "2"
	
}



variable "primary_dns_zone" {
	type = string
	default = "krotek.click"
	description = "Primary DNS name from Route53"
}
variable "app_domain_name" {
	type = string
	default = "lawn"
	description = "DNS name from Route53"
}

#get from Load Balancer Module
variable "lb_dns_name"{
	type = string
	default = "java-bot-dev-load-balancer-796335352.eu-central-1.elb.amazonaws.com"
	description = "Load Balancer dns_name"
}
variable "lb_zone_id" {
	type = string
	default = "Z215JYRZR1TBD5"
	description = "Load Balancer zone_id"
}
variable "lb_arn" {
	type = string
	default = "arn:aws:elasticloadbalancing:eu-central-1:530117518858:loadbalancer/app/java-bot-dev-load-balancer/433973262268dbb7"
	description = "Load Balancer arn"
}
variable "lb_target_group_arn" {
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

locals {
	name_generator = format("%s-%s", var.app_name, var.environment)
}
