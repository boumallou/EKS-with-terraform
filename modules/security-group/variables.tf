variable "vpc_id" {
  type = string
}
variable "SG_description" {
  type = string
}
variable "SG_name" {
  type = string
}

 variable "ingress_rules" {
  type = list(object({
    from = number
    to  = number
    source = string
    protocol = string
    add_source = number // IF 0, add cidr as source ; if 1, add security group as source ; if 2, add Prefix List as source
    description = string
  }))
}
 variable "egress_rules" {
  type = list(object({
    from = number
    to  = number
    source = string
    protocol = string
    add_source = number // IF 0, add cidr as source ; if 1, add security group as source ; if 2, add Prefix List as source
    description = string
  }))
}

variable "tag" {
    type = object({
      Environment = string
      Name        = string
      Application = string
    })
}