output "ELB" {
  value = aws_elb.my-elb.dns_name
}
# Output
output "app-ip" {
  value = [aws_instance.example.*.public_ip]
}
