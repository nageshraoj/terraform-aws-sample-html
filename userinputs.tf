variable "ec2type" {
  description = "EC2 type"
  type        = string
}

variable "bucket_name" {
  description = "S3 Bucket Name"
  type        = string
}

variable "vpc_cider_range" {
  description = "Cider range for VPC"
  type = string
}

variable "subnet_cider_range" {
  description = "Cider range for subnet"
  type = string
}

