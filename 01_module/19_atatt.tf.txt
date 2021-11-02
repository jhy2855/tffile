resource "aws_autoscaling_attachment" "jhy_atatt" {
    autoscaling_group_name = aws_autoscaling_group.jhy_at_sg.id
    alb_target_group_arn = aws_lb_target_group.jhy_lbtg.arn
    }