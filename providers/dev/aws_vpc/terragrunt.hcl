terraform {
	source = "../../../iac-modules//aws_vpc"
}

include {
	path = find_in_parent_folders()
}

dependencies {
	path = ["../aws_ecr",
					"../local_build_init"]
}

