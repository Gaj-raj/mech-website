# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket    = "mech-website-for-the-testing-2023"
    key       = "mech-website.tfstate"
    region    = "us-east-1"
    profile   = "root"
  }
}
