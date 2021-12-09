output "lb_dns_name" {
	# index = "0"
	# value = aws_alb.app_lb.0.dns_name
	value = element(aws_alb.app_lb.*.dns_name, "0")
}
output "lb_zone_id" {
	# value = aws_alb.app_lb.0.zone_id
	value = element(aws_alb.app_lb.*.zone_id, "0")
}
output "lb_arn" {
	# value = aws_alb.app_lb.0.arn
	value = element(aws_alb.app_lb.*.arn, "0")
	
}
output "lb_target_group_arn" {
		value = element(aws_alb_target_group.app_lb_tg.*.arn, "0")
}

output "aws_alb_security_group"{
	value = aws_security_group.lb_sg.id
}