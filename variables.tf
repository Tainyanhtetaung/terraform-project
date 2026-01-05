variable "aws_region" {
  description = "Region for aws"
  type        = string
  default     = "us-west-1"
}

variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = list(string)
  default     = ["192.168.0.0/24", "192.168.0.32/27"]

}

variable "azs" {
  description = "AZs for webapps"
  type        = string
  default     = "us-west-1b"

}

variable "instance_type" {
  description = "instance type for webapps"
  type        = string
  default     = "t3.micro"


}

variable "ingress_ports" {
  description = "Inbound rule for webapps"
  type        = list(number)
  default     = [22,25,80,443]


}

