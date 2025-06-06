resource "aws_glue_job" "glue_job" {
  name              = "poc-glue-job"
  role_arn          = aws_iam_role.glue_service_role.arn
  description       = "Transfer csv from source to bucket"
  glue_version      = "4.0"
  worker_type       = "G.1X"
  timeout           = 2880
  max_retries       = 1
  number_of_workers = 2

  command {
    name            = "glueetl"
    python_version  = "3"
    script_location = "s3://${aws_s3_bucket.tutorial-code-bucket-om1.id}/script.py"
  }

  default_arguments = {
    "--enable-auto-scaling"              = "true",
    "--enable-continuous-cloudwatch-log" = "true",
    "--datalake-formats"                 = "delta",                                                     # Remove this if you're not using Delta format
    "--source-path"                      = "s3://${aws_s3_bucket.tutorial-source-data-bucket-om1.id}/", # Specify the source S3 path
    "--destination-path"                 = "s3://${aws_s3_bucket.tutorial-target-data-bucket-om1.id}/", # Specify the destination S3 path
    "--job-name"                         = "poc-glue-job",
    "--enable-continuous-log-filter"     = "true",
    "--enable-metrics"                   = "true"
  }
}

output "glue_crawler_name" {
  value = "s3://${aws_s3_bucket.tutorial-source-data-bucket-om1.id}/"
}
