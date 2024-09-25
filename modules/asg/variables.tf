variable "sg_id" {
  type = string
}
variable "image_id" {
  type = string
}
variable "alb_id" {
  type = string
}
variable "subnets" {
    type = list(string)
}
variable "target_group_arn" {
  type = string
}
variable "prefix" {
  type = string
}
variable "instance_size" {
  type = string
}
variable "key_name" {
  type = string
}
# Tags
variable "env" {
  type = string
}
#UserData
variable "UserData" {
  type = string
}
#InstanceProfile
variable "InstanceProfile" {
  type = string
}
