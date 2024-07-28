variable "project_id" {
  type = string
}

# 本来はシークレットマネージャなどを使用するべき
variable "password" {
  type      = string
  sensitive = true
}
