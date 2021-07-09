resource "aws_security_group" "demosg1" {
  name = "demonsg1"
  description = "Default Security Group"
  vpc_id = aws_vpc.demovpc.id
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow SSH"
    from_port = 22
    protocol = "tcp"
    to_port = 22
  } 
  egress{
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow all outbound traffic"
    from_port = 0
    protocol = "-1"
    to_port = 0
  } 
}

resource "aws_security_group" "demosg2" {
  name = "demonsg2"
  description = "Security Group for web site"
    vpc_id = aws_vpc.demovpc.id
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow http"
    from_port = 80
    protocol = "tcp"
    to_port = 80
  } 
}