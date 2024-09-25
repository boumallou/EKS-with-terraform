output "secret_manager_arn" {
  description = "ARN of secret manager"
  value       = aws_secretsmanager_secret.secret.arn
}