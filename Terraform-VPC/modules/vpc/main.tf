#VPC
resource "aws_vpc" "rwt_vpc"{
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"

    tags = {
      "name" = "RWT-VPC"
    }
    
}


#Subnet

resource "aws_subnet" "subnet" {
    count = length(var.subnet_cidr)
    vpc_id = aws_vpc.rwt_vpc.id
    cidr_block = var.subnet_cidr[count.index]
   availability_zone = data.aws_availability_zones.available.names[count.index]
    map_public_ip_on_launch = true


    tags = {
        name = var.subne_name[count.index]
    }
  
}



#Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.rwt_vpc.id

  tags = {
    Name = "RWT_IGW"
  }
}


#Route Tables

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.rwt_vpc.id

  route  {
    cidr_block = "0.0.0.0/0"
     gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rwt_rt"
  }
}



#Route Tables Association

resource "aws_route_table_association" "rta" {
  count = length(var.subnet_cidr)  
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.rt.id
}