output "public_ip" {
  description = "IP pública de la instancia"
  value       = aws_instance.dev_ec2.public_ip
}
 
