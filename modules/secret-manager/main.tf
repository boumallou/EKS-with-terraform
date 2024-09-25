resource "aws_secretsmanager_secret" "secret" {
  name                              = var.secret_name
  recovery_window_in_days           = 0  // Number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days. The default value is 30.
    lifecycle {
    create_before_destroy = true
  }
}
resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id                         = aws_secretsmanager_secret.secret.id
  secret_string                     = var.secret_values

}
