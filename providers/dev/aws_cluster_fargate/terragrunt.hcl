terraform {
	source = "../../../iac-modules//aws_cluster_fargate"
}

include {
	path = find_in_parent_folders()
}

dependencies {
	paths = ["../aws_vpc",
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
		aws_alb_security_group = "arn:001"
		lb_target_group_arn = "arn:002"
	}
}

dependency "aws_ecr"{
	config_path = "../aws_ecr"
	mock_outputs = {
		ecr_repository_url = "000000"
	}
}

inputs = {
	vpc_id = dependency.aws_vpc.outputs.vpc_id
	public_subnet_id = dependency.aws_vpc.outputs.public_subnet_id
	private_subnet_id = dependency.aws_vpc.outputs.private_subnet_id

	aws_alb_security_group = dependency.aws_alb.outputs.aws_alb_security_group
	lb_target_group_arn = dependency.aws_alb.outputs.lb_target_group_arn

	ecr_repository_url = dependency.aws_ecr.outputs.ecr_repository_url

}

