resource "aws_lb_target_group_attachment" "jhy_lbtg_att" {
  target_group_arn          = aws_lb_target_group.jhy_lbtg.arn
  target_id                 = aws_instance.jhy_weba.id
  port                      = 80

}