# S3 Bucket for Source Data
resource "aws_s3_bucket" "tutorial-source-data-bucket-om1" {
  bucket        = "tutorial-source-data-bucket-om1"
  force_destroy = true
}

resource "aws_s3_bucket_object" "data-object" {
  bucket = aws_s3_bucket.tutorial-source-data-bucket-om1.bucket
  key    = "organizations.csv"
  source = "${path.module}/data_file/organizations.csv"
}

# S3 Bucket for Target
resource "aws_s3_bucket" "tutorial-target-data-bucket-om1" {
  bucket        = "tutorial-target-data-bucket-om1"
  force_destroy = true
}

# S3 Bucket for saving code
resource "aws_s3_bucket" "tutorial-code-bucket-om1" {
  bucket        = "tutorial-code-bucket-om1"
  force_destroy = true
}

resource "aws_s3_bucket_object" "code-data-object" {
  bucket = aws_s3_bucket.tutorial-code-bucket-om1.bucket
  key    = "script.py"
  source = "${path.module}/data_file/script.py"
}
