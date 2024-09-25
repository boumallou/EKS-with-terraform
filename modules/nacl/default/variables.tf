variable "tag" {
    type = object({
      Environment = string
      Name        = string
      Role = string
    })
}
variable "subnetID" {
    type    = list(string)
}
 variable "nacl_ingress_rule" {
  type = list(object({
    rule-number = number
    protocol = string
    rule-action = string
    cidr-block = string
    from-port = number
    to-port = number
  }))
}
 variable "nacl_egress_rule" {
  type = list(object({
    rule-number = number
    protocol = string
    rule-action = string
    cidr-block = string
    from-port = number
    to-port = number
  }))
}
variable "default-nacl-id" {
    type    = string
}