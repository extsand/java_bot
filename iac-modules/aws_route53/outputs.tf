output "certificate_body" {
	sensitive = true
	value = aws_acm_certificate.app_certificate.id
}

# output "route53_existed_zone" {
# 	value = data.aws_route53_zone.existed_zone
# }

# output "route53_domain" {
# 	value = aws_route53_record.domain
# }

# output "all_cert" {
# 	sensitive = true
# 	value = aws_acm_certificate.app_certificate
# }

# output for Load Balancer
output "route53_certificate_arn" {
	value = aws_acm_certificate.app_certificate.id
}
