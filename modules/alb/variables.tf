
variable "subnets" {
    type = list(string)
}
variable "app_name" {
  type = string
}
variable "vpc_security_group_ids" {
    type    = list(string)
    nullable = false
}
variable "target_group_name" {
    type = string
}
variable "vpc_id" {
    type = string
}
# Tags
variable "env" {
  type = string
}
variable "certificat_arn" {
  type = string
}



