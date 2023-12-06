data "aws_acm_certificate" "acm_alb_service" {
  domain   = var.acm_domain_website
  statuses = ["ISSUED"]
}
