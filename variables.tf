#########################################
############# Variables #################
#########################################

# Geo-Cluster VPC & Subnets

variable "geocluster_vpc" {
  description = "Check Point Geocluster VPC CIDR Block"
  default     = "10.4.0.0/16"
}

variable "public_subnet1" {
  description = "Geocluster Public Subnet AZ1 CIDR"
  default     = "10.4.1.0/24"
}

variable "public_subnet2" {
  description = "Geocluster Public Subnet AZ2"
  default     = "10.4.2.0/24"
}

variable "private_subnet1" {
  description = "Geocluster Private Subnet AZ1"
  default     = "10.4.3.0/24"
}

variable "private_subnet2" {
  description = "Geocluster Private Subnet AZ2"
  default     = "10.4.4.0/24"
}

variable "tgw_subnet1" {
  description = "Geocluster TGW Subnet AZ1"
  default     = "10.4.5.0/24"
}

variable "tgw_subnet2" {
  description = "Geocluster TGW Subnet AZ2"
  default     = "10.4.6.0/24"
}


#######################################################
############# Check Point Settings ####################
#######################################################
# Hashed password for the Check Point servers - you can generate this with the command 'openssl passwd -1 <PASSWORD>'
# (Optional) You can instead SSH into the server and run (from clish): 'set user admin password', fowlloed by 'save config'

variable "password_hash" {
  description = "Hashed password for the Check Point servers - Optional but recommended"
  default     = "$1$5b8270b8$XTwkTQUC.Ddce5rSALyBj/"
}

variable "sic_key" {
  description = "OTP to establish connectivity between Mgmt & Security Gateway"
  default     = "vpn123vpn123"
}

variable "cpversion" {
  description = "Check Point version"
  default     = "R80.40-BYOL"
}

variable "key_name" {
  description = "Key Pair to SSH into Check Point instances"
  default     = "Canada"
}


variable "gateway_instance_type" {
  default = "c5.large"
}

variable "availability_zones" {
  description = "AZs for each member of CP Geocluster"
  default     = "ca-central-1a,ca-central-1b"
}

variable "kmskey_identifier" {
  description = "KMS or CMK key Identifier - Use key ID, alias or ARN. Key alias should be prefixed with 'alias/' "
  default     = "alias/aws/ebs"
}

variable "gateway_iamrole" {
  description = "AWS IAM Role for Geocluster Instances API Failover"
  default     = "Checkpoint_EA"
}

variable "gateway_name" {
  description = "Name of Geocluster Instances"
  default     = "geocluster"
}

variable "gateway_hostname" {
  description = "Geocluster Instances Hostname"
  default     = "tgwha"
}