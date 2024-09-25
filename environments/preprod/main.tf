# Define Terraform Backend for preprod environment
terraform {
   backend "s3" {
    bucket = "terraform-backend-uex-preprod"
    key    = "state/preprod.tfstate"
    region = "ap-southeast-1"
    encrypt = true
    dynamodb_table = "terraform_lock_table"
  } 
}



resource "aws_vpc_endpoint" "ssm-endpoint" {
  vpc_id       = "${module.vpc-preprod-asia.VPC.id}"
  service_name = "com.amazonaws.ap-southeast-1.ssm"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids        = ["${module.vpc-preprod-asia.private_subnets_id[0]}"]
  security_group_ids = ["${module.octnis-preprod-ec2-sg.sg_id}"]
  tags = {
    Name = "ssm-endpoint"
  }
}
resource "aws_vpc_endpoint" "ssm-ec2messages" {
  vpc_id       = "${module.vpc-preprod-asia.VPC.id}"
  service_name = "com.amazonaws.ap-southeast-1.ec2messages"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids        = ["${module.vpc-preprod-asia.private_subnets_id[0]}"]
  security_group_ids = ["${module.octnis-preprod-ec2-sg.sg_id}"]
  tags = {
    Name = "ssm-ec2messages"
  }
}
resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id       = "${module.vpc-preprod-asia.VPC.id}"
  service_name = "com.amazonaws.ap-southeast-1.ssmmessages"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids        = ["${module.vpc-preprod-asia.private_subnets_id[0]}"]
  security_group_ids = ["${module.octnis-preprod-ec2-sg.sg_id}"]
  tags = {
    Name = "ssmmessages"
  }
}

resource "aws_vpc_endpoint" "CloudwatchLogs" {
  vpc_id       = "${module.vpc-preprod-asia.VPC.id}"
  service_name = "com.amazonaws.ap-southeast-1.logs"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids        = ["${module.vpc-preprod-asia.private_subnets_id[0]}"]
  security_group_ids = ["${module.octnis-preprod-ec2-sg.sg_id}"]
  tags = {
    Name = "CloudwatchLogs"
  }
}
resource "aws_vpc_endpoint" "secretsmanager" {
  vpc_id       = "${module.vpc-preprod-asia.VPC.id}"
  service_name = "com.amazonaws.ap-southeast-1.secretsmanager"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids        = ["${module.vpc-preprod-asia.private_subnets_id[0]}"]
  security_group_ids = ["${module.octnis-preprod-ec2-sg.sg_id}"]
  tags = {
    Name = "secretsmanager"
  }
}

