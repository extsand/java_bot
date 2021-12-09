terraform {
	source = "../../../iac-modules//aws_alb"
}

include {
	path = find_in_parent_folders()
}

dependencies {
	path = ["../aws_vpc"]
}

dependency "aws_vpc"{
	config_path = "../aws_vpc"
	mock_outputs = {
		vpc_id = "vpc-000"
		public_subnet_id = ["subnet-000","subnet-001"]
		private_subnet_id = ["subnet-002","subnet-003"]
	}
}

inputs = {
	vpc_id = dependency.aws_vpc.outputs.vpc_id
	public_subnet_id = dependency.aws_vpc.outputs.public_subnet_id
	private_subnet_id = dependency.aws_vpc.outputs.private_subnet_id
}

