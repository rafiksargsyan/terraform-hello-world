resource "aws_elb" "lb" {
  name = "lb"
  internal = false
  instances = [aws_instance.web-server-1.id, aws_instance.web-server-2.id]
  subnets = [aws_subnet.public-subnet.id]
  security_groups = [aws_security_group.web-server.id]

  listener {
    instance_port = "80"
    instance_protocol = "tcp"
    lb_port = "80"
    lb_protocol = "tcp"
  }
}
