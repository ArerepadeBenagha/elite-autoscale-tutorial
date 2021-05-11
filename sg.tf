resource "aws_security_group" "elb-securitygroup" {
  name = "elb"
  vpc_id      = aws_vpc.main.id
  description = "security group for my instance"

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      cidr_blocks = ingress.value
      protocol    = "tcp"
    }
  }
}

resource "aws_security_group" "myinstance" {
  name = "myinstance"
  vpc_id      = aws_vpc.main.id
  description = "security group for my instance"

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      cidr_blocks = ingress.value
      protocol    = "tcp"
    }
  }
}
