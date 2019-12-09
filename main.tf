# resource "ibm_compute_ssh_key" "ssh_key" {
#   label      = "${var.ssh_label}"
#   notes      = "${var.ssh_notes}"
#   public_key = "${var.ssh_key}"
# }

########################################################
# Create VM configured to for SSH remote access
########################################################

resource "null_resource" "webapp1" {
  provisioner "local-exec" {
    command = "./update.sh"
  }
}
