resource "aws_instance" "web-server-1" {
  ami = "ami-0f7cd40eac2214b37"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.web-server.id]
  key_name = "piwigo_key_pair"
  depends_on = [aws_internet_gateway.igw]
  user_data = data.template_file.piwigo-bootstrap.rendered
}

resource "aws_instance" "web-server-2" {
  ami = "ami-0f7cd40eac2214b37"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.web-server.id]
  key_name = "piwigo_key_pair"
  depends_on = [aws_internet_gateway.igw]
  user_data = data.template_file.piwigo-bootstrap.rendered
}

resource "aws_instance" "db" {
  ami = "ami-0f7cd40eac2214b37"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private-subnet.id
  vpc_security_group_ids = [aws_security_group.db.id]
  key_name = "piwigo_key_pair"
  depends_on = [aws_internet_gateway.igw]
  user_data = data.template_file.db-bootstrap.rendered
}

data "template_file" "db-bootstrap" {
  template = file("./run-mysql.sh")
}

data "template_file" "piwigo-bootstrap" {
  template = file("./run-piwigo.sh")
}

/*output "app1_endpoint" {
  value = aws_instance.app1.public_ip
}

output "app2_endpoint" {
  value = aws_instance.app2.public_ip
}

resource "aws_key_pair" "dev-key-pair" {
  key_name = "dev-key-pair"
  public_key = file(var.public_key_path)
}*/
