resource "aws_security_group" "vpc_sg" {
	vpc_id = aws_vpc.vpc_app.id
	description = "Dynamic Security Group for VPC"
	dynamic "ingress"{
		for_each = ["22", "443", "80"]
		content {
			from_port = ingress.value
			to_port = ingress.value
			protocol = "tcp"
			cidr_blocks = ["0.0.0.0/0"]
		}
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = -1
		cidr_blocks = ["0.0.0.0/0"]
	}
	tags = {
		Name = "${local.name_generator}-VPC-sg"
	}
}