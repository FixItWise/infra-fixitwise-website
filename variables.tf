variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Local AWS Profile"
  type        = string
  default     = "fixitwise"
}


variable "acm_domain_website" {
  description = "Certificate Domain Name"
  default     = "sabioreparador.com"
}
