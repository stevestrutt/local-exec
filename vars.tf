# variable interp {
#   description = "intepolated value"
#   default     = "${data.ibm_schematics_output.test.output_values.hostname}"
# }

variable ssh_label {
  description = "ssh label"
  default     = "wcpclouduk1"
}
