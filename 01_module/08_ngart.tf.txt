resource "aws_route_table" "jhy_ngart_a" {
  vpc_id  = aws_vpc.jhy_vpc.id
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.jhy_nga_a.id
  }
  tags = {
    Name = "jhy-nga-rta"
  }
}

resource "aws_route_table" "jhy_ngart_c" {
  vpc_id  = aws_vpc.jhy_vpc.id
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.jhy_nga_c.id
  }
  tags = {
    Name = "jhy-nga-rtc"
  }
}