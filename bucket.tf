resource "aws_s3_bucket" "appdata" {
  bucket = var.bucket_name
  acl = "private"
  versioning {
    enabled = true
  }
  provisioner "local-exec" {
    command = "aws s3 cp ./sampleapp/. s3://${var.bucket_name} --recursive"
  }
  force_destroy = true
}