variable "users" {
  default = {
    ade : "Niger"
    ravs : "us"
    tom : "India"
  }

}

provider "aws" {
  region = "us-west-1"
  //version = "~> 2.46" 
}

resource "aws_iam_user" "my_iam_users" {
    for_each = var.users
      name = each.key
      tags = {
        country: each.value
      }
}