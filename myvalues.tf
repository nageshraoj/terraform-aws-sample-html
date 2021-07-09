variable "bucket_name" {
  description = "My Bucket Name"
  type = string
  default = "appdata-070921"
}

variable "ec2type" {
  description = "My Instance type"
  type = string
  default = "t2.micro"
}