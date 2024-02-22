#Terraform Elastic Load Balancer Listener
#---------------------------------------------------------------------------------
#Application Load Balancer - Listener
resource "aws_lb_listener" "nlb_443" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = 443
  protocol          = "TLS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.ssl_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_443.arn
  }
}

resource "aws_lb_listener" "nlb_943" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = 943
  protocol          = "TLS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.ssl_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_943.arn
  }
}

resource "aws_lb_listener" "nlb_1194" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = 1194
  protocol          = "UDP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_1194.arn
  }
}