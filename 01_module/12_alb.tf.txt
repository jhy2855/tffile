# Application LoadBalancer Deploy
resource "aws_lb" "jhy_alb" {
  name                  = "jhy-alb"
  internal              = false
  load_balancer_type    = "application"
  security_groups       = [aws_security_group.jhy_websg.id]
  subnets               = [aws_subnet.jhy_puba.id,aws_subnet.jhy_pubc.id]
  
  tags = {
    Name  =  "jhy-alb"
  }
}