variable "vpc_name" {
   type = string
}

variable "vpc-cidr" {
   type = string
}


#map of public subnets
variable "public_subnets" {
   type = map
}

#map of private subnets
variable "private_subnets" {
   type = map
}

# Tags
variable "env" {
  type = string
}

#EnableDnsHostname
variable "EnableDnsHostname" {
  type = bool
}

#assign-ipv6_cidr
variable "assign-ipv6_cidr" {
  type = bool
}
#ipv6-cidr-block
variable "ipv6-cidr-block" {
  type = string
}

 variable "pub-routes" {
  type = list(object({
    cidr = string
    target     = string
    add_target = number // IF 0, add gateway_id as target ; if 1, add nat_gateway_id as target ; if 2, add vpc_peering_connection_id as target
    cidr-block-type = number // if 0 then add cidr-block ; if 1 then add ipv6-cidr-block
}))
}
 variable "priv-routes" {
  type = list(object({
    cidr = string
    target     = string
    add_target = number // IF 0, add gateway_id as target ; if 1, add nat_gateway_id as target ; if 2, add vpc_peering_connection_id as target
    cidr-block-type = number // if 0 then add cidr-block ; if 1 then add ipv6-cidr-block
  }))
}
