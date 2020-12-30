output "id" {
  description = "List of IDs of instances"
  value       = aws_instance.staticService.*.id
}

output "arn" {
  description = "List of ARNs of instances"
  value       = aws_instance.staticService.*.arn
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = aws_instance.staticService.*.availability_zone
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.staticService.*.public_ip
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = aws_instance.staticService.*.private_ip
}

output "security_groups" {
  description = "List of associated security groups of instances"
  value       = aws_instance.staticService.*.security_groups
}

output "vpc_security_group_ids" {
  description = "List of associated security groups of instances, if running in non-default VPC"
  value       = aws_instance.staticService.*.vpc_security_group_ids
}

output "subnet_id" {
  description = "List of IDs of VPC subnets of instances"
  value       = aws_instance.staticService.*.subnet_id
}

output "instance_state" {
  description = "List of instance states of instances"
  value       = aws_instance.staticService.*.instance_state
}

output "tags" {
  description = "List of tags of instances"
  value       = aws_instance.staticService.*.tags
}
