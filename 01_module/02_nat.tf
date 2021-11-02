resource "aws_eip" "lb_ip_a" {
#   instance = aws_instance.web.id
  vpc = true
}

resource "aws_nat_gateway" "jhy_nga" {
  allocation_id = aws_eip.lb_ip_a.id
  subnet_id     = aws_subnet.jhy_pub[0].id
  tags = {
    Name = "${var.name}-nga-${var.avazone[0]}"
  }
}

resource "aws_route_table" "jhy_ngart" {
  vpc_id  = aws_vpc.jhy_vpc.id

  route {
    cidr_block  = var.cidr
    gateway_id = aws_nat_gateway.jhy_nga.id
  }
  tags = {
    Name = "${var.name}-rt"
  }
}

resource "aws_route_table_association" "jhy_ngartas" {
  count = "${length(var.private_s)}"
  subnet_id       = aws_subnet.jhy_pri[count.index].id
  route_table_id  = aws_route_table.jhy_ngart.id
}