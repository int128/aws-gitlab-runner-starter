# aws-gitlab-runner-starter

This is an example of GitLab Runner on AWS using the Terraform module https://github.com/npalm/terraform-aws-gitlab-runner.

This will provision the following stack:

- VPC
- Public Subnet with an Internet Gateway
- GitLab Runner
  - Auto Scaling Group
  - S3 Bucket
  - CloudWatch Logs


## Getting Started

You need to get the registration token and export it as:

```sh
# registration token (required)
export TF_VAR_gitlab_runner_registration_token=

# if needed
export AWS_PROFILE=
```

Generate a key pair:

```sh
ssh-keygen -f .sshkey
```

Render the stack:

```sh
terraform init
terraform apply
```
