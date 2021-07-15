output "s3websitename" {
  description = "S3 website end point"
  value = aws_s3_bucket.s3bucket.website_endpoint
}

output "ec2publiip" {
  description = "Public ip of EC2"
  value = aws_instance.demoec2.public_ip
}

output "ec2privateip" {
  description = "Private IP of ec2"
  value = aws_instance.demoec2.private_ip
}