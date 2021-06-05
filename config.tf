locals {
  iam_policies = [
    {
      name        = "s3access"
      description = "s3 read only access"
      location    = "policies/s3readaccess.json"
    },
    {
      name        = "ec2state"
      description = "EC2 start and stop access"
      location    = "policies/ec2states.json"
    }
  ]

  iam_account = {
    user_change_password = true
    company_alias        = var.company
  }

  iam_users = ["john", "jane", "steve"]
  
  iam_roles = [
    {
      name    = "bucketmanagement"
      version = "2012-09-12"
      policy  = "policies/ec2role.json"
    },
    {
      name    = "management2"
      version = "2012-09-12"
      policy  = "policies/lamdapolicy.json"
    }
  ]

  iam_groups = ["Dev","QA"]
}

