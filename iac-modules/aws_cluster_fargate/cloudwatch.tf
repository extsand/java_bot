#Cloudwatch metrics
resource "aws_cloudwatch_metric_alarm" "service_cpu_hight" {
	alarm_name = "${local.name_generator}-cpu_utilization_hight"
	comparison_operator = "GreaterThanOrEqualToThreshold"
	evaluation_periods = "2"
	metric_name = "CPU-Utilization"
	namespace = "AWS/ECS"
	period = "60"
	statistic = "Average"
	threshold = "85"

	dimensions = {
		ClusterName = aws_ecs_cluster.app_cluster.name
		ServiceName = aws_ecs_service.app_service.name
	}

	alarm_actions = [aws_appautoscaling_policy.ecs_policy_up.arn]
}

resource "aws_cloudwatch_metric_alarm" "service_cpu_low" {
	alarm_name = "${local.name_generator}-cpu_utilization_low"
	comparison_operator = "LessThanOrEqualToThreshold"
	evaluation_periods = "2"
	metric_name = "CPU-Utilization"
	namespace = "AWS/ECS"
	period = "60"
	statistic = "Average"
	threshold = "0"

	dimensions = {
		ClusterName = aws_ecs_cluster.app_cluster.name
		ServiceName = aws_ecs_service.app_service.name
	}

	alarm_actions = [aws_appautoscaling_policy.ecs_policy_down.arn]
}

#Set Cloudwatch log
resource "aws_cloudwatch_log_group" "app_log_group" {
	name ="/ecs/${local.name_generator}-log"
	retention_in_days = 14
	tags = {
		Name = "${local.name_generator}-log-group"
	}
}

resource "aws_cloudwatch_log_stream" "app_log_stream" {
	name ="/ecs/${local.name_generator}-log-stream"
	log_group_name = aws_cloudwatch_log_group.app_log_group.name
	
}

	