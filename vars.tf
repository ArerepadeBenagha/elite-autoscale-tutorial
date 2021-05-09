variable "aws_access_key"  {}
variable "aws_secret_key"  {}

variable "aws_region" {
  default = "us-east-1"
}

variable "path_to_private_key" {
  default = "mykey"
}

variable "path_to_public_key" {
  default = "mykey.pub"
}

variable "amis" {
  type = map(string)
  default = {
    us-east-1 = "ami-062014dc3e1c37615"
  }
}
