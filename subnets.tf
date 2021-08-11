resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.10.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = data.aws_availability_zones.availability_zones.names[0]
}


resource "aws_subnet" "private-subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.10.2.0/24"
  availability_zone = data.aws_availability_zones.availability_zones.names[0]
}

data "aws_availability_zones" "availability_zones" {
  state = "available"
}
