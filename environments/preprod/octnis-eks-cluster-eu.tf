module "eks-eu" {
  source = "terraform-aws-modules/eks/aws"
  providers = {
    aws = aws.Paris
  }
  version                         = "= 20.20"
  cluster_name                    = var.Octnis_eks_cluster_name-eu
  cluster_version                 = "1.30"
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = false
  vpc_id                          = module.vpc-preprod-eu.VPC.id
  subnet_ids                      = ["${module.vpc-preprod-eu.private_subnets_id[0]}", "${module.vpc-preprod-eu.private_subnets_id[1]}"]
  iam_role_name                   = "${var.Octnis_eks_cluster_name-eu}-cluster"
  iam_role_use_name_prefix        = false
  cluster_addons = {
    eks-pod-identity-agent = {}
  }
  eks_managed_node_groups = {
    eks_nodes = {
      instance_types = ["c5.xlarge"]
      min_size       = 3
      max_size       = 5
      desired_size   = 3
      capacity_type  = "ON_DEMAND"
      iam_role_additional_policies = {
        AmazonEBSCSIDriverPolicy     = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
        AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      }
      iam_role_name            = "eks_nodes-eks-node-group-eu"
      iam_role_use_name_prefix = false
      iam_role_description     = "EKS managed node group IAM role - eu"
    }
  }
  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true
  // This prevented the karpenter discovery tag we were adding being added to the defauly security group, which means only the security groups actually created and managed by the terraform module got attached to karpenter nodes
  create_cluster_primary_security_group_tags = false

  tags = {
    "karpenter.sh/discovery" = var.Octnis_eks_cluster_name-eu
  }
}

# //https://aws-ia.github.io/terraform-aws-eks-blueprints/
# //https://github.com/aws-ia/terraform-aws-eks-blueprints-addons/tree/main

module "eks_blueprints_addons-eu" {
  source = "aws-ia/eks-blueprints-addons/aws"
  providers = {
    aws  = aws.Paris
    helm = helm.Paris
  }
  version = "~> 1.0" #ensure to update this to the latest/desired version
  eks_addons = {
    aws-ebs-csi-driver = {
      most_recent = true
    }
    coredns = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
  }
  cluster_name                        = module.eks-eu.cluster_name
  cluster_endpoint                    = module.eks-eu.cluster_endpoint
  cluster_version                     = module.eks-eu.cluster_version
  oidc_provider_arn                   = module.eks-eu.oidc_provider_arn
  enable_aws_load_balancer_controller = true
  enable_argocd                       = true
  argocd = {
    chart_version = "7.1.1"
  }
  enable_external_secrets               = true
  external_secrets_secrets_manager_arns = ["${module.octnis_secrets-eu.secret_manager_arn}"]
  external_secrets = {
    namespace = var.environment
    #IRSA for external-secrets operator
    role_name            = "external-secret-eu"
    role_name_use_prefix = false
  }
  enable_kube_prometheus_stack = true
  kube_prometheus_stack = {
    namespace = "monitoring"
  }

  enable_karpenter = true
  karpenter = {
    namespace     = "kube-system"
    chart_version = "1.0.0"
    #IRSA for Karpenter
    role_name            = "karpenter-eu"
    role_name_use_prefix = false
  }
  karpenter_node = {
    #Karpenter EC2 node IAM role
    iam_role_name            = "${var.Octnis_eks_cluster_name-eu}"
    iam_role_use_name_prefix = false

    # Used to attach additional IAM policies to the Karpenter node IAM role
    iam_role_additional_policies = {
      AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      AmazonEBSCSIDriverPolicy     = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
    }
  }
  // https://github.com/kubernetes-sigs/external-dns
  enable_external_dns            = true // Enable to create automatically dns record in hosted Zone
  external_dns_route53_zone_arns = [data.aws_route53_zone.preprod-hosted-zone-eu.arn]
  external_dns = {
    namespace     = "external-dns"
    chart_version = "1.14.4"
    // IRSA for external-dns operator
    role_name = "external-dns-eu"

  }
  // https://github.com/kubernetes-sigs/metrics-server/blob/master/charts/metrics-server/Chart.yaml
  enable_metrics_server = true // Enable metrics for HPA
  metrics_server = {
    namespace     = "kube-system"
    chart_version = "3.12.0"
  }

}

data "aws_route53_zone" "preprod-hosted-zone-eu" {
  name     = "preprod.eu.uws-tech.com"
  provider = aws.Paris
}


################################################################################
# Karpenter provisionner manifests files
################################################################################


resource "kubernetes_manifest" "karpenter_node_class-eu" {
  manifest = yamldecode(<<-EOF
    apiVersion: karpenter.k8s.aws/v1
    kind: EC2NodeClass
    metadata:
      name: default
    spec:
      amiSelectorTerms:
      - alias: bottlerocket@v1.20.3
      role: "${var.Octnis_eks_cluster_name-eu}"
      subnetSelectorTerms:
        - tags:
            karpenter.sh/discovery: ${var.Octnis_eks_cluster_name-eu}
      securityGroupSelectorTerms:
        - tags:
            karpenter.sh/discovery: ${var.Octnis_eks_cluster_name-eu}
      tags:
        karpenter.sh/discovery: ${var.Octnis_eks_cluster_name-eu}
      # Optional, configures IMDS for the instance
      metadataOptions:
        httpEndpoint: enabled
        httpProtocolIPv6: disabled
        httpPutResponseHopLimit: 2 # To avoid the process of falling back to IMDSv1 and the resultant delay, in a container environment we recommend that you set the hop limit to 2.
        httpTokens: required
    EOF
  )
  depends_on = [
    module.eks_blueprints_addons-eu
  ]
  field_manager {
    # force field manager conflicts to be overridden
    force_conflicts = true
  }
  provider = kubernetes.Paris
}


resource "kubernetes_manifest" "karpenter_node_pool-eu" {
  manifest = yamldecode(<<-EOF
apiVersion: karpenter.sh/v1
kind: NodePool
metadata:
  name: default
spec:
  template:
    spec:
      terminationGracePeriod: 1h
      expireAfter: 720h
      nodeClassRef:
        group: karpenter.k8s.aws
        kind: EC2NodeClass
        name: default
      requirements:
        - key: karpenter.sh/capacity-type
          operator: In
          values:
            - on-demand
            - spot
        - key: kubernetes.io/arch
          operator: In
          values:
            - x86_64
            - amd64
        - key: karpenter.k8s.aws/instance-category
          operator: In
          values:
            - c
            - m
            - r
        - key: karpenter.k8s.aws/instance-cpu
          operator: In
          values:
            - "4"
            - "8"
            - "16"
        - key: karpenter.k8s.aws/instance-hypervisor
          operator: In
          values:
            - nitro
        - key: kubernetes.io/os
          operator: In
          values:
            - linux
  limits:
    cpu: 100
    memory: 100Gi
  disruption:
    budgets:
      - nodes: "0"
        schedule: 0 9 * * mon-fri
        duration: 8h
        reasons:
          - Drifted
          - Underutilized
      - nodes: 100%
        reasons:
          - Empty
      - nodes: 10%
        reasons:
          - Drifted
          - Underutilized
    consolidationPolicy: WhenEmptyOrUnderutilized
    consolidateAfter: 30s
    EOF
  )
  depends_on = [
    kubernetes_manifest.karpenter_node_class-eu
  ]
  provider = kubernetes.Paris

}





# # The formula for defining the maximum number of Pods per EC2 Node instance is as follows:

# # N * (M-1) + 2export AWS_SECRET_ACCESS_KEY="WuRfj8PkPEa784oZdAnE3cQGarpANjnFeFgK3W7H"

# # Where:

# # N is the number of Elastic Network Interfaces (ENI) of the instance type

# # M is the number of IP addresses per ENI

# # So for the instance you used which is t3.micro the number of pods that can be deployed are:

# # 2 * (2-1) + 2 = 4 Pods, the 4 pods capacity is already used by pods in kube-system namespace