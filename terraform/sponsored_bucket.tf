module "sponsored_dandiset_bucket" {
  source                                = "./modules/dandiset_bucket"
  bucket_name                           = "ember-open-data"
  aws_open_data                         = true
  heroku_user                           = aws_iam_user.api_heroku_user
  embargo_readers                       = [aws_iam_user.backup] #, aws_iam_user.backups2datalad]
  log_bucket_name                       = "ember-open-data-logs"
  providers = {
    aws         = aws.sponsored
    aws.project = aws
  }
}

import {
  to = module.sponsored_dandiset_bucket.aws_s3_bucket.dandiset_bucket
  id = "ember-open-data"
}

import {
  to = module.sponsored_dandiset_bucket.aws_s3_bucket.log_bucket
  id = "ember-open-data-logs"
}
