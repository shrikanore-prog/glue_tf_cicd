resource "aws_glue_job" "glue_job" {
  name              = "tf-glue-job"
  role_arn          = aws_iam_role.glue_service_role.arn
  description       = "Transfer csv from source to bucket"
  glue_version      = "4.0"
  worker_type       = "G.1X"
  timeout           = 2880
  max_retries       = 1
  number_of_workers = 2

  command {
    name            = "glueetl"
    python_version  = 3
    script_location = "s3://${aws_s3_bucket.tf-code-bucket-shri.id}/script.py"
  }

  default_arguments = {
    "--enable-auto-scaling"           = "true"
    "--enable-continuous-cloudwatch-log" = "true"
    "--datalake-formats"              = "delta"
    "--source-path"                   = "s3://${aws_s3_bucket.tf-source-data-bucket.id}/"
    "--destination-path"              = "s3://${aws_s3_bucket.tf-target-data-bucket.id}/"
    "--job-name"                      = "tf-glue-job"
    "--enable-continuous-log-filter"  = "true"
    "--enable-metrics"                = "true"
  }
}