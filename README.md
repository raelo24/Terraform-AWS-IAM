# Introduction #
This is a sample kickstart project for configuring IAM infrastructure on AWS. It designed such that adding more instances of the created resources is a parameter setting. It also makes easy the reuse of already defined policies rather than having them always as inline configurations.

## Usage ##
The config.tf serves as the file to set most account-specific details for the cloud. The values therein are referenced as
```
local.xxxx
```

### IAM Users ###
Set the list of users in the config file as shown here. Users can be added and removed here. Terraform will manage each state correctly.
```
  iam_users = ["john", "jane", "steve"]
```

The access keys and login profiles are also created. The access key and login passwords are saved in the state files. They can be retrieved and transmiteed securely to the recipients. The users are created individually as shown:
```
resource "aws_iam_user_login_profile" "login_profiles" {
  for_each                = aws_iam_user.users
  user                    = each.value.name
  pgp_key                 = var.pgp_key
  password_length         = 8
  password_reset_required = var.reset_required
}
```

The access keys generation is shown as:
```
resource "aws_iam_access_key" "access_keys" {
  for_each                         = aws_iam_user.users
  user                             = each.value.name

  lifecycle {
    create_before_destroy = true
    replace_triggered_by = [
      time_rotating.trigger.rotation_rfc3339
    ]
  }
}
```
 **Note** Email addresses are recommended for user creation rather than username. Also, since users are not permanent resources on the cloud infrastructure, they can be manually created, instead.

You can use your <a href="https://www.keybase.io">keybase</a> details for password creation.

### IAM Policies ### 
Policies are created using this module. Specify the policies in the sample config file as shown below
```
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
```
A folder named policies contains the various custom policies of the account. You can create subfolders if you choose to categorize the policies but remember to reference the paths correctly.

### IAM Roles ### 
The roles are defined in the sample config file.
```
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
```
Roles make use of trust policies not document policies, so include the trust policy file and it will be assigned for the respective role.

### IAM Groups ### 
You can set the groups like this:
```
iam_groups = {
    developers = {
      users  = ["john", "steve"]
      policy = "s3access"
    },
    QAEngineers = {
      users  = ["jane"]
      policy = "ec2state"
    }
  }
```
The system creates each of the groups specified here and does two assigments. 

i. It assigns the user(s) to the group. So, make sure the users have been created or specify them for creation as explained above in <a href="#iam-users">IAM Users</a>

ii. It assigns the policy to the group. Note that the name of the policy is used here not the filename This is the name of the policy already created in <a href="#iam-policies">IAM Policies</a> So, make sure it has been specified for creation as explained above.

### IAM Password Policy ### 
Specify the password policy for users who are given access to the console. If you want MFA for such users, you will need to create a policy and assign it to the group the users belong to.

## LICENSE ## 
This is provided under the Apache 2.0 lecense.

## Contributions ##
Contributions are welcome. Feel free to fork the repo and contribute.
