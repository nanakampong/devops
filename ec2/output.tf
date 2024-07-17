output "ec2east1" {
  value = aws_instance.web.private_ip
}

output "ec2west1" {
  value = aws_instance.web2.private_ip
}