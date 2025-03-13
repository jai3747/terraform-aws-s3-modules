aws_region = "ap-south-1"

s3_buckets = {
  "test-poc-data-sync" = {
    bucket_name       = "test-poc-data-sync"
   # force_destroy     = false

    # Setting to false will result in "Suspended" instead of "Enabled"
     versioning_enabled = "Enabled"
    
    public_access_block = {
      block_public_acls       = false
      block_public_policy     = false
      ignore_public_acls      = false
      restrict_public_buckets = false
    }
    
    # Using S3 managed keys (SSE-S3) instead of KMS
    encryption_algorithm = "AES256"
     bucket_key_enabled = false
    # Empty storage class transitions list
    storage_class_transitions = []
    
    # Adding Environment tag
    tags = {
      "map-migrated" = "migAKYMKZTLHB"
      
    }
  },
  "amifailurecheck-cnp" = {
  bucket_name       = "amifailurecheck-cnp"
  # force_destroy     = false
   versioning_enabled = "Disabled"
  
  public_access_block = {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
  
  # Change from AES256 to aws:kms to use KMS encryption
  encryption_algorithm = "AES256"
  bucket_key_enabled = true
  # Empty storage class transitions list
  storage_class_transitions = []
  
  # Adding Environment tag
  tags = {
    "map-migrated" = "migAKYMKZTLHB"
  }
},
 "aws-cloudtrail-logs-140023395256-6132658e" = {
  bucket_name       = "aws-cloudtrail-logs-140023395256-6132658e"
  # force_destroy     = false
   versioning_enabled = "Disabled"
  
  public_access_block = {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
  
  # Change from AES256 to aws:kms to use KMS encryption
  encryption_algorithm = "AES256"
  
  # Empty storage class transitions list
  storage_class_transitions = []
  
  # Adding Environment tag
  tags = {
    "map-migrated" = "migAKYMKZTLHB"
  }
},
  "mahindra-finance-ova-files" = {
  bucket_name       = "mahindra-finance-ovf-files"
  # force_destroy     = false
  versioning_enabled = "Disabled"
  
  public_access_block = {
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
  }
  encryption_algorithm = "AES256"
  bucket_key_enabled = true
  # Empty storage class transitions list
  storage_class_transitions = []
  
  # Adding Environment tag
  tags = {
    "map-migrated" = "migAKYMKZTLHB"
  }
},
  "sectonacode" = {
  bucket_name       = "sectonacode"
  # force_destroy     = false
  versioning_enabled = "Disabled"
  
  public_access_block = {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
  encryption_algorithm = "AES256"
  bucket_key_enabled = true
  # Empty storage class transitions list
  storage_class_transitions = []
  
  # Adding Environment tag
  tags = {
    "map-migrated" = "migAKYMKZTLHB"
  }
},
  "sectona-mapping-test" = {
  bucket_name       = "sectona-mapping-test"
  # force_destroy     = false
  versioning_enabled = "Disabled"
  
  public_access_block = {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
  encryption_algorithm = "AES256"
  bucket_key_enabled = true
  # Empty storage class transitions list
  storage_class_transitions = []
  
  # Adding Environment tag
  tags = {
    "map-migrated" = "migAKYMKZTLHB"
  }
},
  "mf-commonsnonprod-terraform-state" = {
  bucket_name       = "mf-commonsnonprod-terraform-state"
  versioning_enabled = "Enabled"
  
  public_access_block = {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
  
  # Change from AES256 to aws:kms to use KMS encryption
  encryption_algorithm = "aws:kms"
  bucket_key_enabled = true
  # Add the KMS key ARN
  kms_key_arn = "arn:aws:kms:ap-south-1:140023395256:key/a190355b-b261-4d08-b9b1-3753f72a4289"
  
  # Empty storage class transitions list
  storage_class_transitions = []
  
  # Adding Environment tag
  tags = {
    "map-migrated" = "migAKYMKZTLHB"
  }
},
  "mf-ami-lambda-mumbai-140023395256" = {
  bucket_name       = "mf-ami-lambda-mumbai-140023395256"
  versioning_enabled = "Disabled"
  
  public_access_block = {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
  
  # Change from AES256 to aws:kms to use KMS encryption
  encryption_algorithm = "AES256"
  bucket_key_enabled = true
  # # Add the KMS key ARN
  # kms_key_arn = "arn:aws:kms:ap-south-2:061051235441:key/fcae41aa-9000-4919-bb14-6b9e44d2f365"
  
  # Empty storage class transitions list
  storage_class_transitions = []
  
  # Adding Environment tag
  tags = {
    "map-migrated" = "migAKYMKZTLHB"
  }
},
 "elasticbeanstalk-ap-south-1-140023395256" = {
  bucket_name       = "elasticbeanstalk-ap-south-1-140023395256"
  versioning_enabled = "Disabled"
  
  public_access_block = {
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
  }
  
  # Change from AES256 to aws:kms to use KMS encryption
  encryption_algorithm = "AES256"
  
  # # Add the KMS key ARN
  # kms_key_arn = "arn:aws:kms:ap-south-2:061051235441:key/fcae41aa-9000-4919-bb14-6b9e44d2f365"
  
  # Empty storage class transitions list
  storage_class_transitions = []
  
  # Adding Environment tag
  tags = {
    "map-migrated" = "migAKYMKZTLHB"
  }
},
 "do-not-delete-ssm-diagnosis-140023395256-ap-south-1-2v3p1" = {
  bucket_name       = "do-not-delete-ssm-diagnosis-140023395256-ap-south-1-2v3p1"
  versioning_enabled = "Enabled"
  
  public_access_block = {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
  
  # Change from AES256 to aws:kms to use KMS encryption
  encryption_algorithm = "AES256"
  
  # # Add the KMS key ARN
  # kms_key_arn = "arn:aws:kms:ap-south-2:061051235441:key/fcae41aa-9000-4919-bb14-6b9e44d2f365"
  
  # Empty storage class transitions list
  storage_class_transitions = []
  
  # Adding Environment tag
tags = {
  "QuickSetupDefinitionID"        = "2v3p1"
  "QuickSetupDocument"            = "AWSQuickSetupType-SSM"
  "QuickSetupDocumentVersionName" = "1.2"
  "QuickSetupManagerAccount"      = "140023395256"
  "QuickSetupManagerArn"          = "arn:aws:ssm-quicksetup:ap-south-1:140023395256:configuration-manager/202eae6b-8075-4fd0-8d65-22c095fe1c9c"
  "QuickSetupManagerID"           = "202eae6b-8075-4fd0-8d65-22c095fe1c9c"
  "QuickSetupManagerRegion"       = "ap-south-1"
  "map-migrated"                  = "migAKYMKZTLHB"
}
},
 "cortex-commons-nonprod" = {
  bucket_name       = "cortex-commons-nonprod"
  versioning_enabled = "Disabled"
  
  public_access_block = {
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
  }
  
  # Change from AES256 to aws:kms to use KMS encryption
  encryption_algorithm = "AES256"
  bucket_key_enabled = true
  # # Add the KMS key ARN
  # kms_key_arn = "arn:aws:kms:ap-south-2:061051235441:key/fcae41aa-9000-4919-bb14-6b9e44d2f365"
  
  # Empty storage class transitions list
  storage_class_transitions = []
  
  # Adding Environment tag
  tags = {
    "map-migrated" = "migAKYMKZTLHB"
  }
}

}

