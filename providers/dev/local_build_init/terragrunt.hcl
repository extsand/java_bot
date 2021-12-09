terraform {
	source = "../../../iac-modules//local_build_init"
}

include {
	path = find_in_parent_folders()
}

dependency "aws_ecr"{
	config_path = "../aws_ecr"
	# skip_outputs = true
}

inputs = {
	#TF_VAR_working_dir="name_of_folder"
	working_dir = format("%s/../../../app", get_terragrunt_dir())
}