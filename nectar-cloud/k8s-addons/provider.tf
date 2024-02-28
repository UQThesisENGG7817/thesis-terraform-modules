# Get EKS Cluster infomation
data "aws_eks_cluster" "cluster" {
  name = var.eks_cluster_name

  depends_on = [var.depends_list]
}

data "aws_eks_cluster_auth" "cluster" {
  name = var.eks_cluster_name

  depends_on = [var.depends_list]
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}

terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.7.1"
    }
  }
}