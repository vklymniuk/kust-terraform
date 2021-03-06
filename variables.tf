variable "region" {
  default = "asia-southeast1"
}

variable "project" {
  default = "kustceramics"
}

variable "credentials" {
  default = "eu-west-1"
}

variable "bucket_prefix" {
  default = "terraform/state"
}

variable "bucket_name" {
  default = "kustceramics"
}

variable "service_account_key" {
  default = "key.json"
}


variable "backend_key" {
  default = "./key.json"
}

variable "gke_node_instance_type" {
  default = "n1-standard-1"
}


variable "gke_name" {
  default = "kust-ceramics"
}

variable "gke_network" {
  default = "default"
}

variable "vpn_ip" {
  default = "54.219.241.86/32"
}

# variable "server_port_egress_all_protocol" {
#   description = "The output connections server port configuration will use for security group setup."
#   default     = "-1"
#   type        = "string"
# }

# variable "server_port_egress_all_cidr_blocks_all" {
#   description = "The output connections server cidr_blocks configuration will use for security group setup."
#   type        = "list"
#   default     = ["0.0.0.0/0"]
# }