# data "aws_ami" "myec2" {
#   most_recent = true
#   owners = [ "amazon" ]
#   filter {
#     name = "root-device-type"
#     values = [ "ebs" ]
#   }

#   filter {
#     name = "virtualization-type"
#     values = [ "hvm" ]
#   }
#   filter {
#      name = "name"
#      values = [ "amzn2-ami-hvm-*" ]
#   }
# }