resource "aws_iam_role_policy" "demopolicy" {
    name = "ec2s3access"
    role = aws_iam_role.demorole.id
    policy = file("ec2_policy.json")
}

resource "aws_iam_role" "demorole" {
  name = "ec2demorole"
  assume_role_policy =file("ec2_role.json")
}


resource "aws_iam_instance_profile" "demoprofile" {
  name  = "demo_profile"
  role = aws_iam_role.demorole.name
}
