resource "aws_alb_listener" "app_listener_https" {
	# count = var.aws_az_count
	load_balancer_arn = var.lb_arn
	## ==================================================================	
	# If we use HTTPS - we will add SSL  
	# protocol = "HTTPS"
	port = "443"
	protocol = "HTTPS"
	ssl_policy = "ELBSecurityPolicy-2016-08"
	# certificate_arn = "arn:aws:iam::xxxxxxxxxxxxxxx:server-certificate/name_of_sertificate"
	certificate_arn = aws_acm_certificate.app_certificate.id
		
	default_action {
		target_group_arn = var.lb_target_group_arn
		type = "forward"
	}

}

resource "aws_alb_listener" "app_listener_http_to_https" {
	load_balancer_arn = var.lb_arn
	port = "80"
	protocol = "HTTP"

	default_action {
		type = "redirect"
		redirect {
			port = "443"
			protocol = "HTTPS"
			status_code = "HTTP_301"
		}
	}
}
