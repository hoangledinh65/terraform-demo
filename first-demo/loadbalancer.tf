resource "aws_lb" "hoangdl-alb" {
  name               = "hoangdl-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.hoangdl-sg.id]
  subnets            = [for subnet in data.aws_subnet.hoangdl-subnet : subnet.id]
}