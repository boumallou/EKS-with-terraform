terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.58.0"
    }

  }
}

# Configure the AWS Provider - Region Singapour
provider "aws" {
  region = "ap-southeast-1"
}

# Configure the AWS Provider - Region Paris
provider "aws" {
  region = "eu-west-3"
  alias = "Paris"
}

# Configure the AWS Provider - Virginia Region
provider "aws" {
  region = "us-east-1"
  alias = "Virginia"
}
#  provider "helm" {
#   kubernetes {
#     host = module.eks.cluster_endpoint
#     cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
#     exec {
#       api_version = "client.authentication.k8s.io/v1beta1"
#       args        = ["eks", "get-token", "--cluster-name", var.Octnis_eks_cluster_name]
#       command     = "aws"
#     }
#   }
# }

 provider "helm" {
  kubernetes {
    host = module.eks-eu.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks-eu.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.Octnis_eks_cluster_name-eu]
      command     = "aws"
    }
  }
  alias = "Paris"
}


# provider "kubernetes" {
#   host                   = module.eks.cluster_endpoint
#   cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     args = ["eks", "get-token", "--cluster-name", var.Octnis_eks_cluster_name]
#     command     = "aws"
#   }
# }

provider "kubernetes" {
  host                   = module.eks-eu.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks-eu.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args = ["eks", "get-token", "--cluster-name", var.Octnis_eks_cluster_name-eu]
    command     = "aws"
  }
  alias = "Paris"
}

