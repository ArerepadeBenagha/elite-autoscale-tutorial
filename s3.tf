resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-3cv"
  acl    = "private"
  versioning {
    enabled = true
  }
tags = local.common_tags
}
