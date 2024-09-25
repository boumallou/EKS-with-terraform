variable "RoleName" {
  type = string
}
#addInlinePolicy
variable "addInlinePolicy" {
  type = bool
}
# bucket-policy
variable "policy-document" {
  type = string
}