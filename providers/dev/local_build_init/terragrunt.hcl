terraform {
	source = "../../../iac-modules//local_build_init"
}

include {
	path = find_in_parent_folders()
}

dependencies {
	paths = ["../aws_ecr"]
}

inputs = {
	#TF_VAR_working_dir="name_of_folder"
	working_dir = format("%s/../../../app", get_terragrunt_dir())
}