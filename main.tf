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

data "ibm_schematics_workspace" "test" {
  workspace_id = "remote-exec-vsi-e4d93b50-33ed-43"
}

output "TemplateID" {
  value = "${data.ibm_schematics_workspace.test.template_id}"
}

output "Name" {
  value = "${data.ibm_schematics_workspace.test.name}"
}

output "Tags" {
  value = "${data.ibm_schematics_workspace.test.tags}"
}

data "ibm_schematics_state" "test" {
  workspace_id = "remote-exec-vsi-e4d93b50-33ed-43"
  template_id  = "fbb5d752-b0cc-4f"
}

output "StateStoreValues" {
  value = "${data.ibm_schematics_state.test.state_store}"
}

#   template_id  = "${data.ibm_schematics_workspace.test.template_id.0}"

