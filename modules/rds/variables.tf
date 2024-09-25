
# cluster_name
variable "cluster_name" {
  type = string
}
# engine
variable "engine" {
  type = string
}
# engine-mode
variable "engine-mode" {
  type = string
}
# engine-version
variable "engine-version" {
  type = string
}

# master-username
variable "master-username" {
  type = string
}
# master-master-password
variable "master-master-password" {
  type = string
}
# serverless-max-capacity
variable "serverless-max-capacity" {
  type = number
}
# serverless-min-capacity
variable "serverless-min-capacity" {
  type = number
}
# enable-monitoting
variable "enable-monitoring" {
  type = bool
}
# monitoring-interval
variable "monitoring-interval" {
  type = number
}
# DBName
variable "DBName" {
  type = string
}
# db_parameter_group
variable "db_parameter_group" {
  type = string
}
# Environemnt
variable "deletion-protection" {
  type = bool
}
# instance-identifier-writer
variable "instance-identifier-writer" {
  type = string
}
# instance-identifier-reader
variable "instance-identifier-reader" {
  type = list(string)
}
# instance-class-writer
variable "instance-class-writer" {
  type = string
}
# instance-class-reader
variable "instance-class-reader" {
  type = list(string)
}
variable "serverless-instance" {
  type = bool
}

variable vpc_SG_ids {
  type = list(string)
}
variable db-subnet-group-name {
  type = string
}