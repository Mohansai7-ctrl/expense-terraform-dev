terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }

    backend "s3" {
        bucket = "mohan-remote-state"
        dynamodb_table = "mohan-locking"
        region = "us-east-1"
        key = "expense-apps"
    }
}

provider "aws" {
    region = "us-east-1"
}