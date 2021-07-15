resource "aws_security_group" "demosg" {
  name        = "demonsg"
  description = "Default security group"
  vpc_id      = aws_vpc.demovpc.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ssh"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow http"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  tags = {
    "Name" = "Demo Security group"
  }
}