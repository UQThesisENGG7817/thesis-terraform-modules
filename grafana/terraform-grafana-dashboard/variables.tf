variable "enabled" {
  description = "Enable or disable the creation of the Grafana dashboard module"
  type        = bool
  default     = true
}

variable "create_folder" {
  description = "Create a folder in Grafana"
  type        = bool
  default     = true
}

variable "create_dashboard" {
  description = "Create a dashboard in Grafana"
  type        = bool
  default     = true
}

variable "folder" {
  description = "Grafana Folder to be created"
  type        = any
  default     = null
}

variable "dashboard_folder_id" {
  description = "ID of the folder where the dashboard will be created"
  type        = string
  default     = null
}

variable "dashboard_folder_json" {
  description = "Path to the folder containing the dashboard JSON files"
  type        = string
  default     = "json"
}
