resource "aws_lb" "hoangdl-alb" {
  name               = "hoangdl-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.terraform_remote_state.networking.outputs.sg-id]
  subnets            = [for subnet in data.aws_subnet.hoangdl-subnet : subnet.id]

}
resource "aws_lb_target_group" "test" {
  name     = "hoangdl-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.networking.outputs.vpc-id
}



resource "aws_lb_target_group_attachment" "ec2-0" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.hoangdl-amz-ec2[0].id
  port             = 80
}
resource "aws_lb_target_group_attachment" "ec2-1" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.hoangdl-amz-ec2[1].id
  port             = 80
}

resource "aws_lb_listener" "hoangdl" {
  load_balancer_arn = aws_lb.hoangdl-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}

resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.hoangdl.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }

  condition {
    path_pattern {
      values = ["/test*"]
    }
  }

}