resource "aws_alb" "app_lb" {
	count = var.aws_az_count
	name = "${local.name_generator}-load-balancer"
	subnets = var.public_subnet_id
	security_groups = [ aws_security_group.lb_sg.id ]
}

resource "aws_alb_target_group" "app_lb_tg" {
	name = "${local.name_generator}-target-group"
	port = 80
	protocol = "HTTP"
	target_type = "ip"
	vpc_id = var.vpc_id

	health_check {
		healthy_threshold = 3
		unhealthy_threshold = 2
		timeout = 3
		interval = 30
		protocol = "HTTP"
		matcher = "200"
		path = var.health_check_path
	}
}

resource "aws_alb_listener" "app_listener" {
	count = var.aws_az_count
	# load_balancer_arn = aws_alb.app_lb[count.index]
	# load_balancer_arn = aws_alb.app_lb.arn
	## ==================================================================
	## Unexpected behaviour
	load_balancer_arn = element(aws_alb.app_lb.*.id, count.index)
	## ==================================================================
	
	# load_balancer_arn = aws_alb.app_lb.id
	# load_balancer_arn = "arn:aws:elasticloadbalancing:eu-central-1:530117518858:loadbalancer/app/java-bot-dev-load-balancer/e5c9319816cffa6a"

	port = var.app_port
	protocol = "HTTP"
	
	# If we use HTTPS - we will add SSL  
	# protocol = "HTTPS"
	# ssl_policy = "ELBSecurityPolicy-2016-08"
	# certificate_arn = "arn:aws:iam::xxxxxxxxxxxxxxx:server-certificate/name_of_sertificate"
	
	default_action {
		target_group_arn = aws_alb_target_group.app_lb_tg.id
		type = "forward"
	}

}

# resource "aws_alb_listener" "app_listener_https" {
# 	count = var.aws_az_count
# 	# load_balancer_arn = aws_alb.app_lb[count.index]
# 	# load_balancer_arn = aws_alb.app_lb.arn
# 	## ==================================================================
# 	## Unexpected behaviour
# 	load_balancer_arn = element(aws_alb.app_lb.*.id, count.index)
# 	## ==================================================================
	
# 	# load_balancer_arn = aws_alb.app_lb.id
# 	# load_balancer_arn = "arn:aws:elasticloadbalancing:eu-central-1:530117518858:loadbalancer/app/java-bot-dev-load-balancer/e5c9319816cffa6a"

# 	port = "443"
# 	protocol = "HTTPS"
	
# 	# If we use HTTPS - we will add SSL  
# 	# protocol = "HTTPS"
# 	ssl_policy = "ELBSecurityPolicy-2016-08"
# 	# certificate_arn = "arn:aws:iam::xxxxxxxxxxxxxxx:server-certificate/name_of_sertificate"
# 	certificate_arn = var.aws_route53_certificate_arn
		
# 	default_action {
# 		target_group_arn = aws_alb_target_group.app_lb_tg.id
# 		type = "forward"
# 	}

# }