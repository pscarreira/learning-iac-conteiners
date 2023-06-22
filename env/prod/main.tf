module "prod" {
  source = "../../infra"

  repository_name           = "prod"
  beanstalk_app_name        = "app-prod"
  beanstalk_app_description = "App for prod"
  beanstalk_env_name        = "env-prod"
  instance_type             = "t2.micro"
  max_size                  = 5
  version_name              = "prod-v2"
}
