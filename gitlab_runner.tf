module "gitlab_runner" {
  #source  = "npalm/gitlab-runner/aws"
  #version = "3.3.0"
  source = "../terraform-aws-gitlab-runner/"

  aws_region               = "us-west-2"
  environment              = "gitlab_runner"
  ssh_public_key           = "${data.local_file.public_ssh_key.content}"
  vpc_id                   = "${aws_vpc.main.id}"
  subnet_ids_gitlab_runner = ["${aws_subnet.public.id}"]
  subnet_id_runners        = "${aws_subnet.public.id}"
  aws_zone                 = "a"

  # GitLab Runner instance
  instance_type              = "t3.micro"
  runner_instance_spot_price = "0.01"

  # Worker instances
  docker_machine_instance_type  = "m3.medium"
  docker_machine_spot_price_bid = "0.02"

  runners_name                = "aws.m3"
  runners_gitlab_url          = "https://gitlab.com"
  runners_use_private_address = false

  gitlab_runner_registration_config = {
    registration_token = "${var.gitlab_runner_registration_token}"
    description        = "GitLab Runner on AWS"
    tag_list           = "aws"
    locked_to_project  = "true"
    run_untagged       = "false"
    maximum_timeout    = "3600"
  }
}

data "local_file" "public_ssh_key" {
  filename = ".sshkey.pub"
}