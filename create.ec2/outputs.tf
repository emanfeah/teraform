
# output the Instance ID and Public IP of above two created Instances.

# output "instance_ID_Sample" {
#   description = "Instance ID "
#   value       = aws_instance.Ec2-instance["Sample"].ami
# }
# output "instance_ID_Test" {
#   description = "Instance ID "
#   value       = aws_instance.Ec2-instance["Test"].ami
# }
# output "public_IP_Test" {
#   description = "the Public IP"
#   value       = aws_instance.Ec2-instance["Test"].public_ip
 
# }
# output "public_IP_Sample" {
#   description = "the Public IP"
#   value       = aws_instance.Ec2-instance["Sample"].public_ip
 
# }


# output "public_dns_ubuntu" {
#   description = "Public dns  "
#   value       = aws_instance.ubuntu.public_dns
# }

# output "public_ip_ubuntu" {
#   description = "Public ip  "
#   value       = aws_instance.ubuntu.public_ip
# }
# output "az_ubuntu" {
#   description = "az "
#   value       = aws_instance.ubuntu.availability_zone
# }


output "public_dns_linux" {
  description = "publiic dns "
  value       = aws_instance.linux.public_dns
}



output "public_ip_linux" {
  description = "publiic ip "
  value       = aws_instance.linux.public_ip
}


output "az_linux" {
  description = "az "
  value       = aws_instance.linux.availability_zone
}


