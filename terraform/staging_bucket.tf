module "staging_dandiset_bucket" {
  source                  = "./modules/dandiset_bucket"
  bucket_name             = "ember-public-data-sandbox"
  aws_open_data           = true
  heroku_user             = aws_iam_user.api_sandbox_heroku_user
  log_bucket_name         = "ember-public-data-sandbox-logs"
  providers = {
    aws         = aws
    aws.project = aws
  }
}

import {
  to = module.staging_dandiset_bucket.aws_s3_bucket.dandiset_bucket
  id = "ember-public-data-sandbox"
}

import {
  to = module.staging_dandiset_bucket.aws_s3_bucket.log_bucket
  id = "ember-public-data-sandbox-logs"
}
