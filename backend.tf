terraform {
 backend "s3" {
   bucket = "terraform-state-3cv"
   key    = "state"
   region = "us-east-1"
 }
}