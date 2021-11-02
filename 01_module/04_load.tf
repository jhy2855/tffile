# Application LoadBalancer Deploy
resource "aws_lb" "jhy_alb" {
  name                  = "jhy-alb"
  internal              = false
  load_balancer_type    = "application"
  security_groups       = [aws_security_group.jhy_websg.id]
  subnets               = [aws_subnet.jhy_pub[0].id,aws_subnet.jhy_pub[1].id]
  
  tags = {
    Name  =  "${var.name}-alb"
  }
}

resource "aws_lb_target_group" "jhy_lbtg" {
  name                = "jhy-lbtg"
  port                = var.http_port
  protocol            = var.protocol_HTTP
  vpc_id              = aws_vpc.jhy_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/health.html" 
    port                = "traffic-port"
    protocol            = var.protocol_HTTP
    timeout             = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "jhy_lblist" {
  load_balancer_arn       = aws_lb.jhy_alb.arn
  port                    = var.http_port
  protocol                = var.protocol_HTTP

  default_action {
    type                  = "forward"
    target_group_arn      = aws_lb_target_group.jhy_lbtg.arn
  } 
}

resource "aws_lb_target_group_attachment" "jhy_lbtg_att" {
  target_group_arn          = aws_lb_target_group.jhy_lbtg.arn
  target_id                 = aws_instance.jhy_web.id
  port                      = var.http_port

}