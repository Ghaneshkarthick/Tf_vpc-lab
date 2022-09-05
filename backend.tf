terraform {
    backend "s3" {
        bucket = "talent-academy-g-bucket"
        key = "ta-labbucket/Tf_vpc-lab/terraform.tfstates"
        region = "eu-west-1"
        dynamodb_table = "terraform-lock"
  }
}

