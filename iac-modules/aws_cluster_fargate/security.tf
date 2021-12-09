resource "aws_security_group" "ecs_tasks_sg" {
	vpc_id = var.vpc_id
	ingress {
		protocol = "tcp"
		from_port = var.app_port
		to_port = var.app_port
		security_groups = [var.aws_alb_security_group]
	}
	egress {
		protocol = "-1"
		from_port = 0
		to_port = 0
		cidr_blocks = ["0.0.0.0/0"]
	}
	tags = {
		Name = "${local.name_generator}-ecs-tasks-sg"
	}
}