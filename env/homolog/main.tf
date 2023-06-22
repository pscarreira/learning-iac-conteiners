module "homolog" {
  source = "../../infra"

  repository_name           = "homolog"
  beanstalk_app_name        = "app-homolog"
  beanstalk_app_description = "App for homolog"
  beanstalk_env_name        = "env-homolog"
  instance_type             = "t2.micro"
  max_size                  = 2
}
