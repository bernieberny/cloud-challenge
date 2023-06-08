terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "755638950787_AdministratorAccess"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "cloud_resume"{
  bucket = "stuffaboutbernie.cloud"

  website {
    redirect_all_requests_to = "https://www.stuffaboutbernie.cloud"
  }
}

resource "aws_s3_bucket" "cloud_resume"{
  bucket = "wwww.stuffaboutbernie.cloud"
  
}



resource "aws_cloudfront_distribution" "cloud_resume"{
  origin {
    domain_name = stuffaboutbernie.cloud.s3-website-us-east-1.amazonaws.com
    origin_id = "BaseDomain"
  }

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods = ["GET", "HEAD", "OPTIONS"]
    path_pattern = 
    viewer_protocol_policy = "redirect-to-https"

    
  }

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.resume_website.arn
    ssl_support_method  = "sni-only"
  }

  enabled          = true
  is_ipv6_enabled  = true

  aliases = ["stuffaboutbernie.cloud","www.stuffaboutbernie.cloud"] 

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}


resource "aws_cloudfront_distribution" "www_cloud_resume"{
  origin {
    domain_name = www.stuffaboutbernie.cloud.s3.us-east-1.amazonaws.com
    origin_id = "wwwDomain"
  }

  default_cache_behavior {
    
  }
}

resource "aws_acm_certificate" "cloud_resume" {

  domain_name               = "stuffaboutbernie.cloud"
  subject_alternative_names = ["*.stuffaboutbernie.cloud"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }

}


resource "aws_lambda_function" "cloud_resume" {

}