# 가용영역 a의 Public Subnet
resource "aws_subnet" "jhy_puba" {
  vpc_id            = aws_vpc.jhy_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "jhy-puba"
  }
}

# 가용영역 a의 Private Subnet
resource "aws_subnet" "jhy_pria" {
  vpc_id            = aws_vpc.jhy_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "jhy-pria"
  }
}

# 가용영역 c의 Public Subnet
resource "aws_subnet" "jhy_pubc" {
  vpc_id            = aws_vpc.jhy_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "jhy-pubc"
  }
}

# 가용영역 c의 Private Subnet
resource "aws_subnet" "jhy_pric" {
  vpc_id            = aws_vpc.jhy_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "jhy-pric"
  }
}

  resource "aws_subnet" "jhy_pridba" {
  vpc_id            = aws_vpc.jhy_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "jhy-pridba"
  }
}
resource "aws_subnet" "jhy_pridbc" {
  vpc_id            = aws_vpc.jhy_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "jhy-pridbc"
  }
}