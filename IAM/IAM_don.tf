resource "aws_iam_user" "don_guro" {
  name = "don.guro"
}

resource "aws_iam_user_policy" "don_policy" {
  name  = "super-admin"
  user  = aws_iam_user.don_guro.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "*"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
}