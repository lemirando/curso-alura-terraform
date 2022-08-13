resource "aws_security_group" "sg_ssh_us_east_1" {
  provider = aws.us-east-1
  ingress {
    cidr_blocks = var.cidr_blocks
    from_port = 22
    protocol = "tcp"
    to_port = 22
  }
  tags = {
    "Name" = "sg_ssh_us_east_1"
  }
}

resource "aws_security_group" "sg_ssh_us_east_2" {
  provider = aws.us-east-2
  ingress {
    cidr_blocks = var.cidr_blocks
    from_port = 22
    protocol = "tcp"
    to_port = 22
  }
  tags = {
    "Name" = "sg_ssh_us_east_2"
  }
}