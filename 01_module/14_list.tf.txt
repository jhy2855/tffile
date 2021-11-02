resource "aws_lb_listener" "jhy_lblist" {
  load_balancer_arn       = aws_lb.jhy_alb.arn
  port                    = 80
  protocol                = "HTTP" 

  default_action {
    type                  = "forward"
    target_group_arn      = aws_lb_target_group.jhy_lbtg.arn
  } 
}