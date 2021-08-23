provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}



resource "aws_ecr_repository" "default" {
  name                 = "terraform_ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
