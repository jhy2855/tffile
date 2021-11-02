resource "aws_launch_configuration" "jhy_lacf" {
  name_prefix          = "jhy-web-"
  image_id   = aws_ami_from_instance.jhy_ami.id
  instance_type        = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups      = [aws_security_group.jhy_websg.id]
  key_name = "tf-key"
  user_data = <<-EOF
              #!/bin/bash
              systemctl start httpd
              systemctl enable httpd
              EOF
  lifecycle {
    create_before_destroy = true
  }
}