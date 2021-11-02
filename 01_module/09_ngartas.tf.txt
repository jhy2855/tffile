resource "aws_route_table_association" "jhy_ngartas_a" {
  subnet_id       = aws_subnet.jhy_pria.id
  route_table_id  = aws_route_table.jhy_ngart_a.id
}

resource "aws_route_table_association" "jhy_ngartas_c" {
  subnet_id       = aws_subnet.jhy_pric.id
  route_table_id  = aws_route_table.jhy_ngart_c.id
}