resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "hoangdl-sg" {
  name        = "hoangdl-sg"
  description = "Inbound traffic"
  vpc_id      = aws_default_vpc.default.id

}

resource "aws_security_group_rule" "HTTP-traffic" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.hoangdl-sg.id
}

resource "aws_security_group_rule" "SSH-traffic" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["118.68.118.82/32"]
  security_group_id = aws_security_group.hoangdl-sg.id
}

resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.hoangdl-sg.id
}