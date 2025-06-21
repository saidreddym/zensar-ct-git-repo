terraform {
  backend "s3" {
    bucket         = "tflandingzonestpnew"
    key            = "landing-zone/terraform.tfstate"
    region         = "us-east-1"
    
  }
}
