output "ssm_vpc_id" {
  value       = aws_ssm_parameter.vpc.id
  description = "ID da VPC armazenado no AWS Systems Manager Parameter Store"
}

output "ssm_subnet_private_1a" {
  value       = aws_ssm_parameter.private_1a.id
  description = "ID da private subnet na zona de disponibilidade 1a armazenada no AWS Systems Manager Parameter Store"
}

output "ssm_subnet_private_1b" {
  value       = aws_ssm_parameter.private_1b.id
  description = "ID da private subnet na zona de disponibilidade 1b armazenada no AWS Systems Manager Parameter Store"
}

output "ssm_subnet_private_1c" {
  value       = aws_ssm_parameter.private_1c.id
  description = "ID da private subnet na zona de disponibilidade 1c armazenada no AWS Systems Manager Parameter Store"
}

output "ssm_subnet_public_1a" {
  value       = aws_ssm_parameter.public_1a.id
  description = "ID da public subnet na zona de disponibilidade 1a armazenada no AWS Systems Manager Parameter Store"
}

output "ssm_subnet_public_1b" {
  value       = aws_ssm_parameter.public_1b.id
  description = "ID da public subnet na zona de disponibilidade 1b armazenada no AWS Systems Manager Parameter Store"
}

output "ssm_subnet_public_1c" {
  value       = aws_ssm_parameter.public_1c.id
  description = "ID da public subnet na zona de disponibilidade 1c armazenada no AWS Systems Manager Parameter Store"
}


output "ssm_subnet_databases_1a" {
  value       = aws_ssm_parameter.ssm_subnet_databases_1a.id
  description = "ID da public subnet de databases na zona de disponibilidade 1a armazenada no AWS Systems Manager Parameter Store"
}

output "ssm_subnet_databases_1b" {
  value       = aws_ssm_parameter.ssm_subnet_databases_1b.id
  description = "ID da public subnet de databases na zona de disponibilidade 1b armazenada no AWS Systems Manager Parameter Store"
}

output "ssm_subnet_databases_1c" {
  value       = aws_ssm_parameter.ssm_subnet_databases_1c.id
  description = "ID da public subnet de databases na zona de disponibilidade 1c armazenada no AWS Systems Manager Parameter Store"
}