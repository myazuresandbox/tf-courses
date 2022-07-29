resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-21"
  acl    = "private"

  tags = {
    Name        = "My bucket test"
    Environment = "Dev"
  }
}