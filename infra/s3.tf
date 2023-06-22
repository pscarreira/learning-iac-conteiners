resource "aws_s3_bucket" "beanstalk_deploy" {
  bucket = "${var.repository_name}-deploys"
}

resource "aws_s3_bucket_object" "deploy" {

  depends_on = [aws_s3_bucket.beanstalk_deploy]

  bucket = "${var.repository_name}-deploys"
  key    = "${var.repository_name}.zip"
  source = "${var.repository_name}.zip"

  etag = filemd5("${var.repository_name}.zip")
}
