# ---------------------------------------------------------------------------------------------------------------------
# S3 Build
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_s3_bucket" "s3_build" {
  bucket        = "build-${var.aws_profile}"
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.s3_build.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.s3_build.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "s3_build_ownership" {
  bucket = aws_s3_bucket.s3_build.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_build_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_build_ownership]

  bucket = aws_s3_bucket.s3_build.id
  acl    = "private"
}
