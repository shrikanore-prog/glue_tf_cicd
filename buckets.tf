# S3 Bucket for Source Data
resource "aws_s3_bucket" "tf-source-data-bucket" {
  bucket        = "tf-source-data-bucket"
  force_destroy = true
}

resource "aws_s3_bucket_object" "data-object" {
  bucket = aws_s3_bucket.tf-source-data-bucket.bucket
  key    = "organizations.csv"
  source = "C:/Users/ADMIN/Desktop/etl_glue_pipeline_terraform/data_file/organizations.csv"
}

# S3 Bucket for Traget 
resource "aws_s3_bucket" "tf-target-data-bucket" {
  bucket        = "tf-target-data-bucket"
  force_destroy = true
}


# S3 Bucket for saving code
resource "aws_s3_bucket" "tf-code-bucket-shri" {
  bucket        = "tf-code-bucket-shri"
  force_destroy = true
}

resource "aws_s3_bucket_object" "code-data-object" {
  bucket = aws_s3_bucket.tf-code-bucket-shri.bucket
  key    = "script.py"
  source = "C:/Users/ADMIN/Desktop/etl_glue_pipeline_terraform/data_file/script.py"
}