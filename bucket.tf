resource "aws_s3_bucket" "s3bucket" {
  bucket = var.bucket_name
  acl    = "public-read"

  versioning {
    enabled = true
  }
  website {
    index_document = "index.html"
  }

  policy = jsonencode({
    "Id" : "Policy1626330150067",
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "Stmt1626330149223",
        "Action" : [
          "s3:GetObject"
        ],
        "Effect" : "Allow",
        "Resource" : "arn:aws:s3:::${var.bucket_name}/*",
        "Principal" : "*"
      }
    ]
  })
  provisioner "local-exec" {
    command = "aws s3 cp ./demoapp/. s3://${var.bucket_name} --recursive"
  }
}