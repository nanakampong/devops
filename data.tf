data "aws_iam_policy_document" "terra" {
  statement {
    sid = "bobpolicy"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
      "s3:DescribeJob"
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }


}