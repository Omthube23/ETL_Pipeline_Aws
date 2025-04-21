# Create Glue Data Catalog Database
resource "aws_glue_catalog_database" "prod_org_report_database" {
  name         = "prod-org-report"
  location_uri = "s3://${aws_s3_bucket.tutorial-source-data-bucket-om1.bucket}/"
}

# Create Glue Crawler
resource "aws_glue_crawler" "prod_org_report_crawler" {
  name          = "prod-org-report-crawler"
  database_name = aws_glue_catalog_database.prod_org_report_database.name
  role          = aws_iam_role.glue_service_role.name

  s3_target {
    path = "s3://${aws_s3_bucket.tutorial-source-data-bucket-om1.bucket}/"
  }

  schema_change_policy {
    delete_behavior = "LOG"
  }

  configuration = <<EOF
{
  "Version":1.0,
  "Grouping": {
    "TableGroupingPolicy": "CombineCompatibleSchemas"
  }
}
EOF
}

# Glue Trigger to start the crawler on demand
resource "aws_glue_trigger" "prod_org_report_trigger" {
  name = "prod-org-report-trigger"
  type = "ON_DEMAND"

  actions {
    crawler_name = aws_glue_crawler.prod_org_report_crawler.name
  }
}
