variable "eks_cluster_name" {
  default = ""
}

variable "enabled" {
  type    = bool
  default = true
}

variable "chart_version" {
  default = "5.14.1"
}

variable "context" {
  description = "Set option for ArgoCD"
  type        = map(any)
  default     = {}
}

variable "depends_list" {
  default = []
}

variable "node_selector" {
  type = map(any)
  default = {
    "nodegroup-role" = "main"
  }
}

variable "tolerations" {
  type    = any
  default = []
}