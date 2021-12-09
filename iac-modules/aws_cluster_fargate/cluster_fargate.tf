resource "aws_ecs_cluster" "app_cluster" {
	name = "${local.name_generator}-cluster"
}

resource "aws_ecs_service" "app_service" {
	name = "${local.name_generator}-service"
	cluster = aws_ecs_cluster.app_cluster.id
	task_definition = aws_ecs_task_definition.app_task_definition.arn
	desired_count = var.app_count
	launch_type = "FARGATE"

	network_configuration {
		security_groups = [aws_security_group.ecs_tasks_sg.id]
		subnets = var.private_subnet_id
		assign_public_ip = true
	}

	load_balancer {
		target_group_arn = var.lb_target_group_arn
		container_name = "${local.name_generator}-app"
		container_port = var.app_port
	}

	depends_on = [
		aws_iam_role_policy.ecs_task_execution_role_policy
		]
		#Depends from Load Balancer Module
		#should create in this tf module
		# aws_alb_listener.app_listener
		
	

}

resource "aws_ecs_task_definition" "app_task_definition" {
	family = "${local.name_generator}-task-definition"
	execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
	task_role_arn = aws_iam_role.ecs_task_role.arn
	

	network_mode = "awsvpc"
	requires_compatibilities = ["FARGATE"]

	cpu = var.fargate_cpu
	memory = var.fargate_memory
	container_definitions = data.template_file.app_container_template.rendered
}

data "template_file" "app_container_template" {
	template = file(var.container_definition_template)
	vars = {
		aws_region = var.aws_region
		env = var.environment

		app_image = var.ecr_repository_url #universal variable! should pay attention
		app_name = var.app_name
		app_port = var.app_port

	
		image_tag = var.app_tag

		fargate_cpu = var.fargate_cpu
		fargate_memory = var.fargate_memory
	}
}

