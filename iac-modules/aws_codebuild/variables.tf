variable "aws_region" {
	type = string
	default = "eu-central-1"
}
variable "aws_profile" {
	type = string
	default = "default"
	
}

variable "environment" {
	type = string
	default = "dev"
}



variable "app_name" {
	type = string
	default = "perfectapp"
}


variable "git_token" {
	type = string
}
variable "repo_url" {
	type = string
	default = "https://github.com/extsand/java_bot.ci_sample.git"
}

variable "branch_pattern" {
	type = string
	default = "^refs/heads/dev$"
}
variable "git_trigger_event" {
	type = string
	default = "PUSH"
}
variable "buildspec" {
	type = string
	default = "./../aws_codebuild/buildspec.yml"
	
	# default = "buildspec.yml"
}

variable "vpc_id" {
	type = string
	default = "vpc-0a82f03906d393c32"
}

variable "private_subnet_id" {
	type = list
	default = ["subnet-0a1ffde84c0af844c", "subnet-07128ad5e237edc61"]

}


variable "project_tags" {
	type = map
	default = {
		"project" = "DevOps Academy Example"
		"owner" = "extsand"
	}
	description = "Set project tags"
}

locals {
	name_generator = "${var.app_name}-${var.environment}"
}

# variable "buffer-value" {}
