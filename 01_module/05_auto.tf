resource "aws_ami_from_instance" "jhy_ami" {
  name                      = "jhy-ami"
  source_instance_id        = aws_instance.jhy_web.id
}

resource "aws_launch_configuration" "jhy_lacf" {
  name_prefix          = "jhy-web-"
  image_id   = aws_ami_from_instance.jhy_ami.id
  instance_type        = var.instance
  iam_instance_profile = "admin_role"
  security_groups      = [aws_security_group.jhy_websg.id]
  key_name = var.key
  user_data = <<-EOF
              #!/bin/bash
              systemctl start httpd
              systemctl enable httpd
              EOF
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_placement_group" "jhy_pg" {
  name = "jhy-pg"
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
  vpc_zone_identifier       = [aws_subnet.jhy_pub[0].id,aws_subnet.jhy_pub[1].id]
  }

resource "aws_autoscaling_attachment" "jhy_atatt" {
    autoscaling_group_name = aws_autoscaling_group.jhy_at_sg.id
    alb_target_group_arn = aws_lb_target_group.jhy_lbtg.arn
}