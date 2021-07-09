resource "aws_instance" "demoec2" {
  ami = data.aws_ami.myec2.id
  instance_type = var.ec2type
  subnet_id = aws_subnet.demosubnet.id
  vpc_security_group_ids = [ aws_security_group.demosg1.id, aws_security_group.demosg2.id ]
  key_name = "nagesh"
  user_data = <<EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y 
    sudo systemctl start httpd
    sudo systemctl enable httpd
  EOF

iam_instance_profile = aws_iam_instance_profile.demoprofile.name

connection {
  type = "ssh"
  host = self.public_ip
  user = "ec2-user"
  password = ""
  private_key = file("nagesh.pem")
}

  provisioner "remote-exec" {
    inline = [
      "sleep 30",
      "sudo aws s3 cp s3://${var.bucket_name}/ /var/www/html --recursive"
    ]
    on_failure = continue
  }
tags = {
  "Name" = "Demo EC2"
}
}