
resource "aws_ecr_repository" "myapp-repository" {
  name                 = "myapp-repo"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository_policy" "myapp-repo-policy" {
  repository = aws_ecr_repository.myapp-repository.name
  policy     = <<EOF
  {
    "Version": "2022-04-16",
    "Statement": [
      {
        "Sid": "adds full ecr access to the myapp repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
}
