resource "aws_internet_gateway" "jhy_ig" {
  vpc_id  = aws_vpc.jhy_vpc.id

  tags  = {
    Name  = "jhy-ig"
  }
}