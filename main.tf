# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "ch_lab_vpc" {
  cidr_block = var.cidr_block[0]


  tags = {
    "name" = "Production VPC"
  }
}

resource "aws_subnet" "webapps" {
  vpc_id            = aws_vpc.ch_lab_vpc.id
  cidr_block        = var.cidr_block[1]
  availability_zone = var.azs
  map_public_ip_on_launch = true


  tags = {
    "name" = "Web Applications Subnet"

  }
}
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.ch_lab_vpc.id

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# resource "aws_instance" "web_app_intance" {
#   ami                         = "ami-0e6a50b0059fd2cc3"
#   instance_type               = var.instance_type
#   subnet_id                   = aws_subnet.webapps.id
#   vpc_security_group_ids      = [aws_default_security_group.default.id]
#   associate_public_ip_address = true
#   key_name                    = aws_key_pair.prod_key.key_name


# }

# resource "aws_key_pair" "prod_key" {
#   key_name   = "production_ssh_key"
#   public_key = file("~/.ssh/id_rsa.pub")
# }


# # resource "aws_instance" "webapps_instance" {
# #   ami           = "ami-0623300d1b7caee89"
# #   instance_type = var.instance_type

# # }


# resource "aws_internet_gateway" "webapps_igw" {
#   vpc_id = aws_vpc.ch_lab_vpc.id

# }

# resource "aws_default_route_table" "my_default_test_rt" {
#   default_route_table_id = aws_vpc.ch_lab_vpc.default_route_table_id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.webapps_igw.id
#   }
# }


# resource "aws_route" "default_route" {
#   route_table_id         = aws_vpc.ch_lab_vpc.default_route_table_id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.webapps_igw.id
# }


# resource "aws_route_table_association" "webapps_rt_association" {
#     subnet_id = aws_subnet.webapps.id
#     route_table_id = aws_default_route_table.my_default_test_rt.id
# }