resource "aws_s3_bucket" "beanstalk_deploy" {
  bucket = "${var.repository_name}-bs-deploy"
}

resource "aws_s3_object" "deploy" {

  depends_on = [aws_s3_bucket.beanstalk_deploy]

  bucket = "${var.repository_name}-bs-deploy"
  key    = "${var.version_name}.zip"
  source = "${var.repository_name}.zip"

  etag = filemd5("${var.repository_name}.zip")
}
