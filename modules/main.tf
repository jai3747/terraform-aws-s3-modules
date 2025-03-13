# main.tf
provider "aws" {
  region = var.aws_region
}

# S3 Bucket Resource
resource "aws_s3_bucket" "buckets" {
  for_each = var.s3_buckets

  bucket        = each.value.bucket_name
  force_destroy = coalesce(each.value.force_destroy, false)

  tags = each.value.tags
}

# Public Access Block
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  for_each = var.s3_buckets

  bucket = aws_s3_bucket.buckets[each.key].id

  block_public_acls       = lookup(each.value.public_access_block, "block_public_acls", true)
  block_public_policy     = lookup(each.value.public_access_block, "block_public_policy", true)
  ignore_public_acls      = lookup(each.value.public_access_block, "ignore_public_acls", true)
  restrict_public_buckets = lookup(each.value.public_access_block, "restrict_public_buckets", true)
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  for_each = var.s3_buckets

  bucket = aws_s3_bucket.buckets[each.key].id

  rule {
    object_ownership = each.value.object_ownership
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  for_each = {
    for k, v in var.s3_buckets : k => v 
    if lookup(v.bucket_policy, "policy", null) != null && 
       coalesce(lookup(v.bucket_policy, "enabled", false), false)
  }

  bucket = aws_s3_bucket.buckets[each.key].id
  policy = each.value.bucket_policy.policy
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  for_each = var.s3_buckets

  bucket = aws_s3_bucket.buckets[each.key].id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = each.value.encryption_algorithm
      kms_master_key_id = each.value.encryption_algorithm == "aws:kms" ? each.value.kms_key_arn : null
    }
    # Always set bucket_key_enabled regardless of algorithm
    bucket_key_enabled = lookup(each.value, "bucket_key_enabled", each.value.encryption_algorithm == "aws:kms")
  }
}

# Handle versioning based on versioning_enabled parameter
resource "aws_s3_bucket_versioning" "versioning" {
  for_each = var.s3_buckets

  bucket = aws_s3_bucket.buckets[each.key].id

  versioning_configuration {
    status = each.value.versioning_enabled
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "storage_class" {
  for_each = {
    for k, v in var.s3_buckets : k => v 
    if length(v.storage_class_transitions) > 0 && 
       anytrue([for transition in v.storage_class_transitions : coalesce(transition.status, true)])
  }

  bucket = aws_s3_bucket.buckets[each.key].id

  dynamic "rule" {
    for_each = each.value.storage_class_transitions
    content {
      id     = rule.value.id != null ? rule.value.id : "transition-to-${rule.value.storage_class}"
      status = coalesce(rule.value.status, true) ? "Enabled" : "Disabled"
      
      transition {
        days          = rule.value.days
        storage_class = rule.value.storage_class
      }
    }
  }
}

