resource "aws_security_group" "lb_sg" {
	name = "${local.name_generator}-load_balancer-sg"
	description = "Access to Application Load Balancer"
	vpc_id = var.vpc_id


	dynamic "ingress"{
		for_each = ["${var.app_port}", "443"]
		content {
			from_port = ingress.value
			to_port = ingress.value
			protocol = "tcp"
			cidr_blocks = ["0.0.0.0/0"]
		}
	}

	# ingress {
	# 	protocol = "tcp"
	# 	from_port = var.app_port
	# 	to_port = var.app_port
	# 	cidr_blocks = ["0.0.0.0/0"]
	# }

	egress {
		protocol = "-1"
		from_port = 0
		to_port = 0
		cidr_blocks = ["0.0.0.0/0"]
	}
	tags = {
		Name = "${local.name_generator}-lb-sg"
	}
	
}