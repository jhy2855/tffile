resource "aws_placement_group" "jhy_pg" {
  name = "jhy_pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "jhy_at_sg" {
  name = "jhy-at-sg"
  min_size                  = 2
  max_size                  = 8
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.jhy_lacf.name
  vpc_zone_identifier       = [aws_subnet.jhy_puba.id,aws_subnet.jhy_pubc.id]
  }
