# Deploys a Check Point TGW HA cross AZ Cluster in a new VPC (20201215) 
# Download  template from SK111013 & review which parameters you'd like to customize,.  

resource "aws_cloudformation_stack" "Checkpoint_TGWHA" {
  name = "TGWHA"

  parameters = {
    AvailabilityZones         = var.availability_zones
    VPCCIDR                   = var.geocluster_vpc
    PublicSubnet1CIDR         = var.public_subnet1
    PublicSubnet2CIDR         = var.public_subnet2
    PrivateSubnet1CIDR        = var.private_subnet1
    PrivateSubnet2CIDR        = var.private_subnet2
    TgwSubnet1CIDR            = var.tgw_subnet1
    TgwSubnet2CIDR            = var.tgw_subnet2
    GatewayName               = var.gateway_name
    GatewayInstanceType       = var.gateway_instance_type
    AllocatePublicAddress     = "true"
    VolumeSize                = "100"
    VolumeEncryption          = var.kmskey_identifier
    EnableInstanceConnect     = "true"
    GatewayPredefinedRole     = var.gateway_iamrole
    KeyName                   = var.key_name
    GatewayVersion            = var.cpversion
    GatewayPasswordHash       = var.password_hash
    Shell                     = "/bin/bash"
    GatewaySICKey             = var.sic_key
    GatewayHostname           = var.gateway_hostname
    AllowUploadDownload       = "true"
    NTPPrimary                = "169.254.169.123"
    NTPSecondary              = "0.pool.ntp.org"
}

  template_url        = "https://cgi-cfts.s3.amazonaws.com/cluster/tgw-ha-master.yaml"
  capabilities        = ["CAPABILITY_IAM"]
  disable_rollback    = true
  timeout_in_minutes  = 30
}