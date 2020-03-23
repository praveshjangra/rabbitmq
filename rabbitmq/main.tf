resource "aws_instance" "axon_instance" {
  ami                         = var.axon_ami
  availability_zone           = var.availability_zone
  user_data_base64            = var.base64_userdata
  security_groups             = var.instance_security_groups
  subnet_id                   = var.instance_subnet_id
  key_name                    = var.key_name
  ebs_optimized               = var.ebs_optimized
  iam_instance_profile        = var.vault_role
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address

  ebs_block_device {
    device_name = var.device_name
    volume_size = var.volume_size
    volume_type = var.volume_type
    encrypted   = var.encrypted
  }

  tags = {
    BUSINESSUNIT    = "AXON"
    APPLICATIONENV  = "PROD"
    RUNNINGSCHEDULE = "00:00:23:59:1-7"
    APPLICATIONROLE = "APPSVR"
    OWNEREMAIL      = "JOHN.DULLAGHAN@INFORMATICA.COM"
    ALERTGROUP      = "axon_team"
    NAME            = var.instance_name
    Name            = var.instance_name
    SHORT_HOSTNAME  = var.fqdn
    SKIPAUTOCONFIG  = "YES"
    DOMAIN          = "diaku.com"
    CONSUL          = var.consul
    LONG_HOSTNAME   = "${var.fqdn}.diaku.com"
    INTERNALPROXY   = "OFF"
    SERVICENAME     = "AXON"
    BUSINESSENTITY  = "HOSTED"
    SERVICEENTITY   = "AXON"
    POD             = "NOPOD"
    PERMANENTSTATUS = var.permanent_status
    DONOTDELETE     = var.delete_status
    REQUIREMENT     = var.requirement
  }
}

