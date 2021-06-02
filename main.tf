provider "aws" {
  region = var.region_name

  default_tags {
    tags = {
      Environment = "dev"
    }
  }
}

module "policies" {
  source = "./modules/iam-policy"
  #convert to map so terraform can have identifier for each
  iam_policies = {
    for policy in local.iam_policies :
    policy.name => policy
  }
}
