# aws-gitlab-runner-starter

GitLab Runner on AWS using https://github.com/npalm/terraform-aws-gitlab-runner.


## Getting Started

```sh
export TF_VAR_gitlab_runner_registration_token=
export AWS_PROFILE=
```

```sh
ssh-keygen -f .sshkey
```

```sh
terraform init
terraform apply
```
