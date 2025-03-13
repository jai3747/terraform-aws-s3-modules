variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "s3_buckets" {
  description = "Map of S3 bucket configurations"
  type = map(object({
    bucket_name   = string
    force_destroy = optional(bool, false)
    
    # Versioning
    versioning_enabled = optional(bool, false)
    
    # Encryption
    encryption_algorithm  = optional(string, "AES256")
    kms_key_arn          = optional(string)
    
    # Public Access Block
    public_access_block = optional(object({
      block_public_acls       = optional(bool)
      block_public_policy     = optional(bool)
      ignore_public_acls      = optional(bool)
      restrict_public_buckets = optional(bool)
    }), {})
    
    # Object Ownership
    object_ownership = optional(string, "BucketOwnerPreferred")
    
    # Bucket Policy
    bucket_policy = optional(object({
      policy = optional(string)
      enabled = optional(bool) 
    }), {})
    
    # Storage Class Transitions
    storage_class_transitions = optional(list(object({
      id             = optional(string)
      days           = number
      storage_class  = string
      status         = optional(bool)  
    })), [])
    
    # Tags
    tags = optional(map(string), {})
  }))
}
