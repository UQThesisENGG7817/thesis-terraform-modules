locals {
  create_folder    = var.enabled && var.create_folder && length(var.folder) > 0
  create_dashboard = var.enabled && var.create_dashboard
}

resource "grafana_folder" "this" {
  count = local.create_folder ? 1 : 0

  title                        = lookup(var.folder, "title", null)
  uid                          = lookup(var.folder, "uid", null)
  parent_folder_uid            = lookup(var.folder, "parent_uid", null)
  prevent_destroy_if_not_empty = lookup(var.folder, "prevent_destroy_if_not_empty", false)
}

resource "grafana_dashboard" "this" {
  for_each    = local.create_dashboard ? fileset("${path.module}/${var.dashboard_folder_json}", "*.json") : []
  config_json = file("${path.module}/${var.dashboard_folder_json}/${each.key}")
  folder      = local.create_folder ? grafana_folder.this[0].id : var.dashboard_folder_id
}
