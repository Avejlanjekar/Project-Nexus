resource "aws_vpc" "this_vpc" {
  cidr_block           = var.VPC_CIDR_BLOCK
  enable_dns_hostnames = var.ENABLE_DNS_HOSTNAMES
  enable_dns_support   = var.ENABLE_DNS_SUPPORT
  tags = merge(var.VPC_COMMON_TAGS, {
    Name = var.VPC_NAME
  })
}


resource "aws_internet_gateway" "this_igw" {
  vpc_id = aws_vpc.this_vpc.id
  tags = {
    Name = var.IGW_NAME
  }
}


resource "aws_subnet" "this_public_subnet" {
  count                   = length(var.PUBLIC_SUBNET_CIDRS)
  vpc_id                  = aws_vpc.this_vpc.id
  cidr_block              = var.PUBLIC_SUBNET_CIDRS[count.index]
  availability_zone       = var.AVAILABILITY_ZONES[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}


resource "aws_subnet" "this_private_app_subnet" {
  count             = length(var.APP_SUBNET_CIDRS)
  vpc_id            = aws_vpc.this_vpc.id
  cidr_block        = var.APP_SUBNET_CIDRS[count.index]
  availability_zone = var.AVAILABILITY_ZONES[count.index]
  tags = {
    Name = "App_Subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "this_private_db_subnet" {
  count             = length(var.DB_SUBNET_CIDRS)
  vpc_id            = aws_vpc.this_vpc.id
  cidr_block        = var.DB_SUBNET_CIDRS[count.index]
  availability_zone = var.AVAILABILITY_ZONES[count.index]
  tags = {
    Name = "DB_Subnet-${count.index + 1}"
  }
}

resource "aws_eip" "this_eip" {
  domain = "vpc"
  tags = {
    Name = var.EIP_NAME
  }
}

resource "aws_nat_gateway" "this_nat" {
  allocation_id = aws_eip.this_eip.id
  subnet_id     = aws_subnet.this_public_subnet[0].id
  depends_on    = [aws_internet_gateway.this_igw]
  tags = {
    Name = var.NAT_GATEWAY_NAME
  }
}

resource "aws_route_table" "this_public_rt" {
  vpc_id = aws_vpc.this_vpc.id
  route {
    cidr_block = var.PUBLIC_ROUTE_CIDR
    gateway_id = aws_internet_gateway.this_igw.id
  }
  tags = {
    Name = var.PUBLIC_RT_NAME
  }
}

resource "aws_route_table" "this_private_rt" {
  vpc_id = aws_vpc.this_vpc.id
  route {
    cidr_block     = var.PRIVATE_ROUTE_CIDR
    nat_gateway_id = aws_nat_gateway.this_nat.id
  }
  tags = {
    Name = var.PRIVATE_RT_NAME
  }
}

resource "aws_route_table" "this_database_rt" {

  vpc_id = aws_vpc.this_vpc.id

  tags = {
    Name = var.DATABASE_RT_NAME
  }

}

resource "aws_route_table_association" "this_public" {
  count          = length(var.PUBLIC_SUBNET_CIDRS)
  subnet_id      = aws_subnet.this_public_subnet[count.index].id
  route_table_id = aws_route_table.this_public_rt.id
}

resource "aws_route_table_association" "this_private" {
  count          = length(var.APP_SUBNET_CIDRS)
  subnet_id      = aws_subnet.this_private_app_subnet[count.index].id
  route_table_id = aws_route_table.this_private_rt.id
}

resource "aws_route_table_association" "this_database" {
  count          = length(var.DB_SUBNET_CIDRS)
  subnet_id      = aws_subnet.this_private_db_subnet[count.index].id
  route_table_id = aws_route_table.this_database_rt.id
}