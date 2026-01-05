output "aws_region" {
  description = "Region for AWS"
  value       = var.aws_region

}

output "cidr_block" {
  value       = var.cidr_block
  description = "CIDR for VPC and webapps"

}

output "Azs" {
  description = "AZs for webapps"
  value       = var.azs

}

# output "aws_publi_ip" {
#   description = "webapps instance public_ip"
#   value       = aws_instance.web_app_intance.public_ip

# }

# output "aws_private_ip" {
#   description = "webapps instance private_ip"
#   value       = aws_instance.web_app_intance.private_ip
# }

# output "instance_type" {
#   description = "instance type for webap"
#   value       = var.instance_type

# }

# output "vpc_id" {
#     description = "vpc id"
#     value = aws_vpc.ch_lab_vpc.id
# }