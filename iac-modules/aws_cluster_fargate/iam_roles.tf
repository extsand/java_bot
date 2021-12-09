resource "aws_iam_role" "ecs_task_execution_role" {
	name = "${local.name_generator}-ecs-tast-exec-role"
	assume_role_policy = data.template_file.ecs_task_execution_role.rendered


}
resource "aws_iam_role_policy" "ecs_task_execution_role_policy"{
	name_prefix = "ecs_iam_role_policy"
	role = aws_iam_role.ecs_task_execution_role.id
	policy = data.template_file.ecs_task_execution_role_policy.rendered
}

resource "aws_iam_role" "ecs_task_role" {
	name = "${local.name_generator}-ecs-tast-role"
	assume_role_policy = data.template_file.ecs_task_role.rendered
}

resource "aws_iam_role_policy" "ecs_task_role_policy" {
	name = "${local.name_generator}-ecs-tast-role-policy"
	role = aws_iam_role.ecs_task_role.id
	policy = data.template_file.ecs_task_role_policy.rendered
}