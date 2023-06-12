output "bucket-arn" {
  value = aws_s3_bucket.mybucket.arn
}
output "bucket-endpoint" {
  value = aws_s3_bucket.mybucket.website_endpoint
}
output "bucket-name" {
  value = aws_s3_bucket.mybucket.id
}