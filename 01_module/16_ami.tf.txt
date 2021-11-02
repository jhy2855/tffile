resource "aws_ami_from_instance" "jhy_ami" {
  name                      = "jhy-ami"
  source_instance_id        = aws_instance.jhy_weba.id
}