resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket-name


}
resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.mybucket.id
    rule {
        object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_public_access_block" "access" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.ownership,
    aws_s3_bucket_public_access_block.access,
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}
resource "aws_s3_bucket_website_configuration" "website" {
    bucket = aws_s3_bucket.mybucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

