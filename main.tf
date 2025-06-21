
##############################################################################################
####### Create Audit and Log Archive accounts#######
resource "aws_organizations_account" "security_account" {
  name      = "Audit"
  email     = var.security_account_email
  
}

resource "aws_organizations_account" "logging_account" {
  
  name      = "Log Archive"
  email     = var.logging_account_email
  
}
##############################################################################################
#######Creating the Landing Zone#######
data "template_file" "landing_zone_manifest" {
  template = file("${path.module}/LandingZoneManifest.json.tmpl")

  vars = {
    logging_account_id  = aws_organizations_account.logging_account.id
    security_account_id = aws_organizations_account.security_account.id
  }
}

resource "aws_controltower_landing_zone" "control_tower" {
  manifest_json = data.template_file.landing_zone_manifest.rendered
  version          = "3.3"
}

##############################################################################################
#######Creating the IAM Roles and Policy to setting up the landing zone#######
resource "null_resource" "run_shell_script" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = "chmod +x ${path.module}/CTTowerIAMroleNpolicy.sh && ${path.module}/CTTowerIAMroleNpolicy.sh"
  }
}

##############################################################################################
