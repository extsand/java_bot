output "aws_alb" {
	value = aws_alb.app_lb
}

output "aws_alb_target_group" {
	value = aws_alb_target_group.app_lb_tg
}

output "aws_alb_listener" {
	value = aws_alb_listener.app_listener
}

output "aws_route53_certificate_arn"{
	value = var.aws_route53_certificate_arn 
}

output "aws_alb_security_group"{
	value = aws_security_group.lb_sg.id
}