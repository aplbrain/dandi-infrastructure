module "staging_dandiset_bucket" {
  source                  = "./modules/dandiset_bucket"
  bucket_name             = "ember-dandi-api-staging-dandisets"
  public                  = true
  versioning              = true
  allow_heroku_put_object = true
  heroku_user             = data.aws_iam_user.api_staging
  log_bucket_name         = "ember-dandi-api-staging-dandiset-logs"
  providers = {
    aws         = aws
    aws.project = aws
  }
}

module "staging_embargo_bucket" {
  source          = "./modules/dandiset_bucket"
  bucket_name     = "ember-dandi-api-staging-private-dandisets"
  versioning      = false
  heroku_user     = data.aws_iam_user.api_staging
  log_bucket_name = "ember-dandi-api-staging-private-dandisets-logs"
  providers = {
    aws         = aws
    aws.project = aws
  }
}
