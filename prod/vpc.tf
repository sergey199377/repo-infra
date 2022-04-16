---

resource "aws_vpc" "myapp_vpc" {
    cidr_block = "10.0.0.0/24"
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags       = {
        Name = "myapp VPC"
    }
}


resource "aws_internet_gateway" "myapp_internet_gateway" {
    vpc_id = aws_vpc.myapp_vpc.id
}


resource "aws_subnet" "pub_subnet" {
    vpc_id                  = aws_vpc.myapp_vpc.id
    cidr_block              = "10.1.0.0/22"
}


