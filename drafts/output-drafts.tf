
# ECR =>>>
output "ecr_repository_url" {
	value = aws_ecr_repository.ecr_repository.repository_url
}
ecr_repository_url = "530117518858.dkr.ecr.eu-central-1.amazonaws.com/java-bot-dev"



#INIT BUILD=>>>
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}
output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}
account_id       = "530117518858"
app-build-status = "Application Build was success"
caller_arn       = "arn:aws:iam::530117518858:user/terraform_academy"
caller_user      = "AIDAXW3LXMYFEY54JJBJ7"

#VPC=>>>
output "vpc_id" {
	value = aws_vpc.vpc_app.id
}
output "private_subnet_id" {
	value = aws_subnet.private.*.id
}
output "public_subnet_id" {
	value = aws_subnet.public.*.id
}

private_subnet_id = [
  "subnet-0295b845bebf21e42",
  "subnet-0cd46e24ed8fcc710",
]
public_subnet_id = [
  "subnet-0237ac6267e8d5f9a",
  "subnet-0230a66fe3b45713f",
]
vpc_id = "vpc-08e25b43ae98bd369"

#LOAD BALANCER=>>>
output "lb_dns_name" {
	# index = "0"
	# value = aws_alb.app_lb.0.dns_name
	value = element(aws_alb.app_lb.*.dns_name, "0")
}
output "lb_zone_id" {
	# value = aws_alb.app_lb.0.zone_id
	value = element(aws_alb.app_lb.*.zone_id, "0")
}
output "lb_arn" {
	# value = aws_alb.app_lb.0.arn
	value = element(aws_alb.app_lb.*.arn, "0")
	
}
output "lb_target_group_arn" {
		value = element(aws_alb_target_group.app_lb_tg.*.arn, "0")
}
output "aws_alb_security_group"{
	value = aws_security_group.lb_sg.id
}
aws_alb_security_group = "sg-0891f3f26d5dbbb25"
lb_arn = "arn:aws:elasticloadbalancing:eu-central-1:530117518858:loadbalancer/app/java-bot-dev-load-balancer/43e83a8bbce69f84"
lb_dns_name = "java-bot-dev-load-balancer-1502142239.eu-central-1.elb.amazonaws.com"
lb_target_group_arn = "arn:aws:elasticloadbalancing:eu-central-1:530117518858:targetgroup/java-bot-dev-target-group/8858ad80b91255f2"
lb_zone_id = "Z215JYRZR1TBD5"

#ROUTE53=>>>
output "route53_certificate_arn" {
	value = aws_acm_certificate.app_certificate.id
}
certificate_body = <sensitive>
route53_certificate_arn = "arn:aws:acm:eu-central-1:530117518858:certificate/6534c205-8070-4eaa-a0ef-dbef49fbed2d"

#CLUSTER=>>>


