output "rds_endpoint" {
  description = "DNS address of the RDS instance"
  value       = aws_rds_cluster.dbcluster.endpoint
}

output "rds_cluster_identifier" {
  description = "DNS address of the RDS instance"
  value       = aws_rds_cluster.dbcluster.cluster_identifier
}