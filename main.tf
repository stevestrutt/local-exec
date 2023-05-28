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
    command = "printenv; python3 --version; ansible --version"
  }
}

data "external" "env" {
  program = ["jq", "-n", "env"]
# to cause parse errorXXXXXXXXX 
}

locals {
  workspace_id = lookup(data.external.env.result, "TF_VAR_IC_SCHEMATICS_WORKSPACE_ID", "")
}

output "workspace_id" {
  value = local.workspace_id
}
  

# data "ibm_schematics_workspace" "test" {
#   workspace_id = "apache-03-31-2020-mujeeb-739e8590-b49f-47"
#   #workspace_id = "myworkspace-4may1-6a4d3963-a74d-4c"
#   #workspace_id = "remote-exec-vsi-e4d93b50-33ed-43"
# }

# output "TemplateID" {
#   value = "${data.ibm_schematics_workspace.test.template_id}"
# }

# output "Name" {
#   value = "${data.ibm_schematics_workspace.test.name}"
# }

# output "Tags" {
#   value = "${data.ibm_schematics_workspace.test.tags}"
# }

# data "ibm_schematics_state" "test" {
#   workspace_id = "remote-exec-vsi-e4d93b50-33ed-43"
#   template_id  = "fbb5d752-b0cc-4f"
# }


# data "ibm_schematics_output" "test" {
#   workspace_id = "remote-exec-vsi-e4d93b50-33ed-43"
#   template_id  = "fbb5d752-b0cc-4f"
# }


# output "Output_vars" {
#   value = "${data.ibm_schematics_output.test.output_values}"
# }


# output "RemoteHostName" {
#   value = "${data.ibm_schematics_output.test.output_values.hostname}"
# }


# output "StateStoreValues" {
#   value = "${data.ibm_schematics_state.test.state_store}"
# }


# output "hostname" {
#   value = "${data.ibm_schematics_state.test.state_store.ibm_compute_vm_instance.webapp1.hostname}"
# }


#     template_id  = "${data.ibm_schematics_workspace.test.template_id.0}"

