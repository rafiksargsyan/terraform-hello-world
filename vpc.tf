resource "aws_vpc" "vpc" {
  cidr_block = "10.10.0.0/16"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  instance_tenancy = "default"
}

resource "aws_internet_gateway" "igw" {
  depends_on = [aws_vpc.vpc]
  vpc_id = aws_vpc.vpc.id
}
