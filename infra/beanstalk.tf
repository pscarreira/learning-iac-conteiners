resource "aws_elastic_beanstalk_application" "beanstalk_app" {
  name        = var.beanstalk_app_name
  description = var.beanstalk_app_description
}

resource "aws_elastic_beanstalk_environment" "beanstalk_env" {
  name                = var.beanstalk_env_name
  application         = aws_elastic_beanstalk_application.beanstalk_app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.8 running Docker"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type

  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max_size
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_ec2_profile.name
  }

}

resource "aws_elastic_beanstalk_application_version" "beanstalk_app_version" {
  depends_on = [
    aws_elastic_beanstalk_environment.beanstalk_env,
    aws_elastic_beanstalk_application.beanstalk_app,
    aws_s3_object.deploy
  ]
  name        = "${var.beanstalk_app_name}-${var.beanstalk_env_name}"
  application = var.beanstalk_app_name
  description = var.beanstalk_app_description
  bucket      = aws_s3_bucket.beanstalk_deploy.id
  key         = aws_s3_object.deploy.id
}
