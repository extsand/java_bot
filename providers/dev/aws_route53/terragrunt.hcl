terraform {
	source = "../../../iac-modules//aws_route53"
}

include {
	path = find_in_parent_folders()
}

dependencies {
	paths = ["../aws_alb"]
}

dependency "aws_alb"{
	config_path = "../aws_alb"
	mock_outputs = {
		lb_dns_name = "arn:aws:00000000000000000000000000000000000000000000000000000000000000000000000000000"
		lb_zone_id = "AAAAAAA"
		lb_arn = "arn:aws:00000000000000000000000000000000000000000000000000000000000000000000000000000"
		lb_target_group_arn = "arn:aws:00000000000000000000000000000000000000000000000000000000000000000000000000000"

		# arn:aws:elasticloadbalancing:eu-central-1:530117518858:targetgroup/java-bot-dev-target-group/8858ad80b91255f2
	}
}

inputs = {
	lb_dns_name = dependency.aws_alb.outputs.lb_dns_name
	lb_zone_id = dependency.aws_alb.outputs.lb_zone_id
	lb_arn = dependency.aws_alb.outputs.lb_arn
	lb_target_group_arn = dependency.aws_alb.outputs.lb_target_group_arn
}

