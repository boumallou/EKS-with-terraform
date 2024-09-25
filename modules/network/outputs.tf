
output "VPC" {
  description = "ID of the VPC"
  value       = aws_vpc.main-vpc
}
output "private_subnets_id" {
    value =  values(aws_subnet.private_subnet)[*].id
}
output "public_subnets_id" {
    value =  values(aws_subnet.public_subnet)[*].id
}
# output "nat_gateway_ip" {
#   value = aws_eip.nat_gateway_IP.public_ip
# }
output "public_route_table_id" {
  description = "ID of public route table"
  value       = aws_route_table.public.id
}
output "private_route_table_id" {
  description = "ID of private route table"
  value       = aws_route_table.private.id 
//  value       = var.addPrivateRouteTable == 1 ? aws_route_table.private[0].id : null
}

