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

# variable "amis" {
#   type = map(string)
#   default = {
#     us-east-1 = "ami-06b6de9dbf2dbf9b7"
#   }
# }

variable "ports" {
  type = map(list(string))
  default = {
    "22"   = [ "0.0.0.0/0" ]
    "443"  = [ "0.0.0.0/0" ]
    "80"   = [ "0.0.0.0/0" ]
    "8080" = [ "0.0.0.0/0" ]
    "9090" = [ "0.0.0.0/0" ]
  }
}
