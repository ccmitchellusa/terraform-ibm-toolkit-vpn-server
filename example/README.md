# IBM Cloud Client to Site VPN Gateway example

This folder contains example terraform code to create only a client-to-site VPN server instance for an existing VPC with subnets already defined. An existing Secrets Manager instance in either the same or a different region can be used for the VPN server certificates.

When running the code, the existing Secrets Manager instance will have a new secret group added with server and client certificates imported. The imported certificates will be tagged with the name of the VPN server instance.

## Setting up

To use this example, copy the `terraform.tfvars.template` file to `terraform.tfvars` and fill in the necessary variables:

- `resource_group_name` = provide the resource group where the VPC resides and the VPN server will be added
- `region` = provide the region where the VPC and VPN server will reside
- `sm_region` = if the Secrets Manager instance is in a different region, provide the region for Secrets Manager
- `ibmcloud_api_key` = if using terraform on a workstation, it is best to keep this blank and use the TF_VAR environment variable
- `vpc_name` = the name of the pre-existing VPC
- `secrets_manager_guid` = the guid for the Secrets Manager instance, the default for the Build Lab **One Secrets Manager** instance is pre-set
- `name_prefix` = prefix for resources created, if left blank it will default to the resource group name
- `resource_label` = a suffix used for resources created

## Creating the VPN Gateway

Once completed, use these commands to deploy the VPN server:

```shell
terraform init
terraform plan
terraform apply -auto-approve
```

## Using the VPN Gateway

After the VPN gateway is created, the output will include a file name for OpenVPN client configuration file. Go to [OpenVPN](https://openvpn.net/) to download a client for your system and import the profile. **Caution** this profile contains client certificate data which is sufficient for the VPN Gateway to trust any endpoint that presents it. Store and share this profile securely, for example using a [1Password](https://1password.com/) vault.
