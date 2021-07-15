resource "aws_instance" "demoec2" {
  ami                    = data.aws_ami.demoami.id
  instance_type          = var.ec2type
  subnet_id              = aws_subnet.demosubnet.id
  vpc_security_group_ids = [aws_security_group.demosg.id]
  user_data              = <<EOF
    #!/bin/bash
    sudo yum update -y 
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
  EOF

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    password    = ""
  }

  provisioner "file" {
    source      = "./demoapp/"
    destination = "/home/ec2-user"
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 30",
      "sudo cp -R /home/ec2-user/. /var/www/html"
    ]
  }

  tags = {
    "Name" = "Demo EC2"
  }
}