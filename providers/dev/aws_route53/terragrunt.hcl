terraform {
	source = "../../../iac-modules//aws_route53"
}

include {
	path = find_in_parent_folders()
}

dependencies {
	path = ["../aws_alb"]
}

dependency "aws_alb"{
	config_path = "../aws_alb"
	mock_outputs = {
		dns_name = "arn:000"
		zone_id = "AAAAAAA"
		arn = "arn:001"
		target_group_arn = "arn:002"
	}
}

inputs = {
	lb_dns_name = dependency.aws_alb.outputs.dns_name
	lb_zone_id = dependency.aws_alb.outputs.zone_id
	lb_arn = dependency.aws_alb.outputs.arn
	lb_target_group_arn = dependency.aws_alb.outputs.target_group_arn
}

