
module "vpc-Admin-EU" {
  source = "../../modules/network"
  providers = {
    aws = aws.Paris
  }
  vpc-cidr = "172.17.0.0/21"
  vpc_name = "EU-Admin-VPC"
  assign-ipv6_cidr = null
  ipv6-cidr-block = null
  public_subnets = {
      Admin-3a = {
         az = "euw3-az1"
         cidr = "172.17.4.0/24"
         ipv6-cidr = null
         map-ip-public = true
      }
      Admin-3b = {
         az = "euw3-az2"
         cidr = "172.17.1.0/24"
         ipv6-cidr = null
         map-ip-public = false
      }
}
  private_subnets = {}
  EnableDnsHostname = false
  env = var.environment
  priv-routes =  []
  pub-routes = [
    {
      cidr-block-type = 0
      cidr = "0.0.0.0/0"
      add_target = 0
      target = "${aws_internet_gateway.EU-Admin-GW.id}"
    },
     {
      cidr-block-type = 0
      cidr = "10.1.0.0/20"
      add_target = 2
      target = "${aws_vpc_peering_connection.Admin-Baymax-EU-EU.id}"
    },
      {
      cidr-block-type = 0
      cidr = "172.16.0.0/21"
      add_target = 2
      target = "${aws_vpc_peering_connection.Admin-Asia-EU.id}"
    }
  ]
}

/*==== Internet Gateway ======*/


resource "aws_internet_gateway" "EU-Admin-GW" {
  provider = aws.Paris
  vpc_id = "${module.vpc-Admin-EU.VPC.id}"
  tags = {
    Name        = "EU-Admin-GW"
    Environment = "${var.environment}"
  }
}

resource "aws_vpc_peering_connection" "Admin-Baymax-EU-EU" {
  provider = aws.Paris
  peer_owner_id = "${data.aws_caller_identity.current.account_id}"
  peer_vpc_id   = "${module.vpc-Baymax-EU.VPC.id}"
  vpc_id        = "${module.vpc-Admin-EU.VPC.id}"
  tags = {
    Name = "Admin-Baymax-EU-EU"
      }
}