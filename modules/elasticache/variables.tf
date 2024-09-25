# cluster_name
variable "cluster_name" {
  type = string
}
# description
variable "description" {
  type = string
}
# multi_az
variable "multi_az" {
  type = bool
}
# Auto-failover
variable "Auto-failover" {
  type = bool
}
# encryption_at_rest
variable "encryption_at_rest" {
  type = bool
}
# encryption_in_transit
variable "encryption_in_transit" {
  type = bool
}

# engine_version
variable "engine_version" {
  type = string
}
# Parameter group
variable "param_group" {
  type = string
}
# Node_type
variable "Node_type" {
  type = string
}
# Number of nodes
variable "num_nodes" {
  type = number
}
variable "subnets" {
    type = list(string)
}
variable "vpc_security_group_ids" {
    type    = list(string)
}