
 # source = "git::https://bitbucket.org/mmfss/mf-iac-modules.git//s3?ref=main"


  provider "aws" {
  region = var.aws_region
}

module "s3_buckets" {
    source      = "git::https://bitbucket.org/mmfss/mf-iac-modules.git//s3?ref=main"
  # source                    = "git::ssh://git@bitbucket.org/mmfss/mf-iac-modules.git//s3"
  aws_region  = var.aws_region
  s3_buckets  = var.s3_buckets
}