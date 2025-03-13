output "s3_bucket_names" {
  description = "Names of the created S3 buckets"
  value       = { for k, bucket in aws_s3_bucket.buckets : k => bucket.id }
}

output "s3_bucket_arns" {
  description = "ARNs of the created S3 buckets"
  value       = { for k, bucket in aws_s3_bucket.buckets : k => bucket.arn }
}

output "s3_bucket_region" {
  description = "Region of the S3 buckets"
  value       = var.aws_region
}