terraform {
	source = "../../../iac-modules//aws_codebuild"
}

include {
	path = find_in_parent_folders()
}

dependencies {
	paths = ["../aws_vpc",
						"../aws_cluster_fargate",
						"../aws_ecr",
						"../local_build_init"]
}

dependency "aws_vpc"{
	config_path = "../aws_vpc"
	mock_outputs = {
		vpc_id = "vpc-000"
		private_subnet_id = ["subnet-002","subnet-003"]
	}
}

inputs = {
	vpc_id = dependency.aws_vpc.outputs.vpc_id
	private_subnet_id = dependency.aws_vpc.outputs.private_subnet_id
}

