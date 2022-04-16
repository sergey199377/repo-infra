resource "aws_route_table" "public" {
    vpc_id = aws_vpc.myapp_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = myapp_internet_gateway.internet_gateway.id
    }
}

resource "aws_route_table_association" "route_table_association" {
    subnet_id      = aws_subnet.pub_subnet.id
    route_table_id = aws_route_table.public.id
}


