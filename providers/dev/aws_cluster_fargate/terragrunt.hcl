terraform {
	source = "../../../iac-modules//aws_route53"
}

include {
	path = find_in_parent_folders()
}

dependencies {
	path = ["../aws_vpc",
					"../aws_alb",
					"../aws_ecr"]
}

dependency "aws_vpc"{
	config_path = "../aws_vpc"
	mock_outputs = {
		vpc_id = "vpc-000"
		public_subnet_id = ["subnet-000","subnet-001"]
		private_subnet_id = ["subnet-002","subnet-003"]
	}
}

dependency "aws_alb"{
	config_path = "../aws_alb"
	mock_outputs = {
		# dns_name = "arn:000"
		# zone_id = "AAAAAAA"
		# arn = "arn:001"
		# target_group_arn = "arn:002"
		aws_alb = "arn:000"
		aws_alb_security_group = "arn:001"
		aws_alb_target_group = "arn:002"


	}
}

inputs = {
	vpc_id = dependency.aws_vpc.outputs.vpc_id
	public_subnet_id = dependency.aws_vpc.outputs.public_subnet_id
	private_subnet_id = dependency.aws_vpc.outputs.private_subnet_id

	app_load_balancer = dependency.aws_alb.outputs.aws_alb
	lb_sg = dependency.aws_alb.outputs.aws_alb_security_group
	lb_tg_arn = dependency.aws_alb.outputs.aws_alb_target_group
}

