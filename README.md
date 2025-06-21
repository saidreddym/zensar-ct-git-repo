Steps to Launch AWS Landing Zone via Terraform from scratch

    1.  Provision a Jump Server (Linux or Windows): 
    
        Deploy a jump server in the Root AWS account. Install the latest versions of Terraform and Git on   
        the jump server.

    2. Configure EC2 Instance IAM Role and Permissions: 

        Create an IAM role with the AWS-managed AdministratorAccess policy. Attach this role to the EC2     
        instance. Use the following trust relationship policy for the role:

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}

Verify the role attachment using the AWS CLI: aws sts get-caller-identity

3. Clone the Terraform Repository repository from GitHub:

    git clone https://github.com/saidreddym/zensar-cttower-tf-setup.git

4. Update Account Email Addresses
    Modify the audit and log archive account email addresses in the variables.tf or appropriate variable 
    files.

5.  Update Governed Regions
    Edit LandingZoneManifest.json.tmpl to specify the governed AWS regions as per your requirements. 
    

6.  Configure Terraform Backend
    Create an S3 bucket in the root account for the Terraform backend and update the bucket details in 
    backend.tf.

7. Run Terraform Commands; Execute the following commands to deploy the Landing Zone:

   terraform init
   terraform fmt
   terraform validate
   terraform plan
   terraform apply --auto-approve

8. Wait for Deployment Completion
   The deployment will take approximately 30–45 minutes.
   After completion, you should see a fully configured AWS Landing Zone with pre-configured preventive and 
    detective guardrails and other foundational services.