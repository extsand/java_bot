
data "aws_route53_zone" "selected" {
  name         = "krotek.click"
  private_zone = false
}

# #add domain record
# #set load balancer to domain name record
## More about alias
## https://stackoverflow.com/questions/48919317/how-can-i-create-a-route-53-record-to-an-alb-aws
## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone
resource "aws_route53_record" "app_domain" {
	zone_id = data.aws_route53_zone.selected.zone_id
	name = "${var.app_domain_name}.${data.aws_route53_zone.selected.name}"
	type = "A"
	# ttl = "300"
	# records = ["10.0.10.1"]

	alias {
    name                   = var.lb_dns_name
    zone_id                = var.lb_zone_id
    evaluate_target_health = true
  }
}


# Create certificate
resource "aws_acm_certificate" "app_certificate" {
	domain_name = "${var.app_domain_name}.${data.aws_route53_zone.selected.name}"
	validation_method = "DNS"
	tags = {
		Name = "${local.name_generator}-app_certificate"
	}
	lifecycle {
		create_before_destroy = true
	}

}

# Add certificate to Route53 record
## More about certificate records
## https://www.oss-group.co.nz/blog/automated-certificates-aws
resource "aws_route53_record" "certificate_validation" {
	allow_overwrite = true
	name = tolist(aws_acm_certificate.app_certificate.domain_validation_options)[0].resource_record_name
	records = [tolist(aws_acm_certificate.app_certificate.domain_validation_options)[0].resource_record_value]
	type = tolist(aws_acm_certificate.app_certificate.domain_validation_options)[0].resource_record_type
	zone_id = aws_route53_record.app_domain.zone_id
	ttl = 60
	
}



resource "aws_alb_listener" "app_listener_https" {
	# count = var.aws_az_count
	load_balancer_arn = var.lb_arn
	## ==================================================================	
	# If we use HTTPS - we will add SSL  
	# protocol = "HTTPS"
	port = "443"
	protocol = "HTTPS"
	ssl_policy = "ELBSecurityPolicy-2016-08"
	# certificate_arn = "arn:aws:iam::xxxxxxxxxxxxxxx:server-certificate/name_of_sertificate"
	certificate_arn = aws_acm_certificate.app_certificate.id
		
	default_action {
		target_group_arn = var.lb_target_group_arn
		type = "forward"
	}

}