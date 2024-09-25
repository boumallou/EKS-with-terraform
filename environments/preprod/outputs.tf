output "octnis_eks_cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks-eu.cluster_endpoint
}

output "octnis_eks_cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks-eu.cluster_name
}
output "node_security_group_id" {
  description = "ID of the node shared security group"
  value       = module.eks-eu.node_security_group_id
}
output "UserPoolArn" {
  description = "UserPoolArn"
  value = aws_cognito_user_pool.user_pool-eu.arn
}
output "UserPoolClientId" {
  description = "UserPoolClientId"
  value = aws_cognito_user_pool_client.userpool_client-eu.id
}
output "UserPoolDomain" {
  description = "UserPoolDomain"
  value = aws_cognito_user_pool.user_pool-eu.domain
}
