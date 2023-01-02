resource "aws_iam_group" "dons_group" {
  name = "dons"
}

resource "aws_iam_group_membership" "name" {
    name = aws_iam_group.dons_group.name
    users =[
        aws_iam_user.don_guro.name
  ]
    group = aws_iam_group.dons_group.name
}

resource "aws_iam_group_policy" "dons_policy" {
  name = "group-super-policy"
  group = aws_iam_group.dons_group.name
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