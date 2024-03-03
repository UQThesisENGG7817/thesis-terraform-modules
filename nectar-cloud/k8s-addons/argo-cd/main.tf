resource "helm_release" "argo-cd" {
  count            = var.enabled ? 1 : 0
  name             = "argo-cd"
  namespace        = "argo"
  create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.chart_version

  values = [templatefile("${path.module}/values.yaml", {
    node_selector = var.node_selector
    tolerations   = var.tolerations
  })]

  dynamic "set" {
    iterator = each_item
    for_each = try(var.context, {})

    content {
      name  = each_item.key
      value = each_item.value
    }
  }
}