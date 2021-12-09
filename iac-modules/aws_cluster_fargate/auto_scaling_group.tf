#set target for auto scaling
resource "aws_appautoscaling_target" "ecs_target" {
	resource_id = "service/${aws_ecs_cluster.app_cluster.name}/${aws_ecs_service.app_service.name}"
	scalable_dimension = "ecs:service:DesiredCount"
	service_namespace = "ecs"

	min_capacity = 1
	max_capacity = 1
}

#set policy for target
#get up policy
resource "aws_appautoscaling_policy" "ecs_policy_up" {
	name = "${local.name_generator}-scale-up"
	resource_id = "service/${aws_ecs_cluster.app_cluster.name}/${aws_ecs_service.app_service.name}"
	scalable_dimension = "ecs:service:DesiredCount"
	service_namespace = "ecs"

	step_scaling_policy_configuration {
		adjustment_type = "ChangeInCapacity"
		cooldown = 60
		metric_aggregation_type = "Maximum"

		step_adjustment {
			metric_interval_upper_bound = 0
			scaling_adjustment = 1
		}
	}
	depends_on = [
		aws_appautoscaling_target.ecs_target
	]
}

#get down policy
resource "aws_appautoscaling_policy" "ecs_policy_down" {
	name = "${local.name_generator}-scale-down"
	resource_id = "service/${aws_ecs_cluster.app_cluster.name}/${aws_ecs_service.app_service.name}"
	scalable_dimension = "ecs:service:DesiredCount"
	service_namespace = "ecs"

	step_scaling_policy_configuration {
		adjustment_type = "ChangeInCapacity"
		cooldown = 60
		metric_aggregation_type = "Maximum"

		step_adjustment {
			metric_interval_upper_bound = 0
			scaling_adjustment = -1
		}
	}
	depends_on = [
		aws_appautoscaling_target.ecs_target
	]
}

