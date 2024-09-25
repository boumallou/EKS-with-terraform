/*==== The VPC ======*/
resource "aws_vpc" "main-vpc" {
  cidr_block = var.vpc-cidr
  enable_dns_hostnames = var.EnableDnsHostname
  enable_dns_support   = true
  assign_generated_ipv6_cidr_block = var.assign-ipv6_cidr
  ipv6_cidr_block = var.ipv6-cidr-block
  ipv6_ipam_pool_id = ""
  tags = {
    Name = var.vpc_name
    environemnt = var.env
  }
}
/*==== Subnets ======*/
/* Public subnets */
resource "aws_subnet" "public_subnet" {
  for_each = var.public_subnets
  availability_zone_id = each.value["az"]
  cidr_block = each.value["cidr"]
  vpc_id     = aws_vpc.main-vpc.id
  map_public_ip_on_launch = each.value["map-ip-public"]
  private_dns_hostname_type_on_launch = "ip-name"
  ipv6_cidr_block = each.value["ipv6-cidr"] 
  tags = {
    Name = "${each.key}"
    environemnt = var.env
    "kubernetes.io/role/elb" = 1
  }
}
/* Private subnets */
resource "aws_subnet" "private_subnet" {
  for_each = var.private_subnets
  availability_zone_id = each.value["az"]
  cidr_block = each.value["cidr"]
  vpc_id = "${aws_vpc.main-vpc.id}"
  private_dns_hostname_type_on_launch = "ip-name"
  ipv6_cidr_block = each.value["ipv6-cidr"]
  tags = {
    Name = "${each.key}"
    environemnt = var.env
    "kubernetes.io/role/internal-elb" = 1
    "karpenter.sh/discovery" = each.value["add-eks-tag"]
  }
}

/*==== ROUTING ======*/
/* Routing table for private subnet */
resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.main-vpc.id}"

  dynamic "route" {
  for_each = var.priv-routes
  content {
    cidr_block                = route.value.cidr-block-type == 0 ? route.value.cidr : null 
    ipv6_cidr_block           = route.value.cidr-block-type == 1 ? route.value.cidr : null
    gateway_id                = route.value.add_target == 0 ? route.value.target : null 
    nat_gateway_id            = route.value.add_target == 1 ? route.value.target : null
    vpc_peering_connection_id = route.value.add_target == 2 ? route.value.target : null
    }
  }
  tags = {
    Name        = "${var.env}-private-route-table"
    Environment = "${var.env}"
  }
}


/* Routing table for public subnet */
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main-vpc.id}"
  dynamic "route" {
  for_each = var.pub-routes
  content {
    cidr_block                = route.value.cidr-block-type == 0 ? route.value.cidr : null 
    ipv6_cidr_block           = route.value.cidr-block-type == 1 ? route.value.cidr : null
    gateway_id                = route.value.add_target == 0 ? route.value.target : null 
    nat_gateway_id            = route.value.add_target == 1 ? route.value.target : null
    vpc_peering_connection_id = route.value.add_target == 2 ? route.value.target : null
    }
  }

  tags = {
    Name        = "${var.env}-public-route-table"
    Environment = "${var.env}"
  }
}


/* Public Route table associations */
resource "aws_route_table_association" "public" {
    for_each = var.public_subnets
    subnet_id = aws_subnet.public_subnet[each.key].id
    route_table_id = "${aws_route_table.public.id}"
}

#  
/* Private Route table associations */
resource "aws_route_table_association" "private" {
    for_each = var.private_subnets
    subnet_id = aws_subnet.private_subnet[each.key].id
    route_table_id = "${aws_route_table.private.id}"
}