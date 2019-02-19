# create a VPC
resource "aws_vpc" "blog-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}

# create public subnet

resource "aws_subnet" "blog-public-subnet" {
  cidr_block = "10.0.0.0/24"
  vpc_id = "${aws_vpc.blog-vpc.id}"
  availability_zone = "us-west-1b"
}

# create private subnet
resource "aws_subnet" "blog-private-subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = "${aws_vpc.blog-vpc.id}"
  availability_zone = "us-west-1b"
}

# TODO: add an internet gateway, or provision a NAT instance

# TODO: create a security group (not modified for new infrstructure yet...)

# resource "aws_security_group" "subnetsecurity" {
#   vpc_id = "${aws_vpc.blog-vpc.id}"

#   ingress {
#     cidr_blocks = [
#       "${aws_vpc.blog-vpc.cidr_block}"
#     ]

#   from_port = 80
#   to_port = 80
#   protocol = "tcp"
#   }
# }