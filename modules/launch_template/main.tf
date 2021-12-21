resource "aws_launch_template" "this" {
  count                  = var.create_tpl ? 1 : 0              
  name                   = format("%s-${var.suffix}", var.name)
  image_id               = var.launch_template_image_id
  update_default_version = true
  user_data              = base64encode(var.user_data) 

  block_device_mappings {
    device_name = var.device_name
    
    ebs {
      delete_on_termination = var.delete_on_termination
      volume_size           = var.ebs_volume_size
      volume_type           = var.ebs_volume_type
      iops                  = var.ebs_iops
    }
  }

  monitoring {
      enabled = var.enabled_monitoring
  }

  network_interfaces {
    associate_public_ip_address = var.associate_public_ip_address
    delete_on_termination       = var.delete_on_termination_nic
    security_groups             = var.security_groups
  }

  tags = var.tags

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      var.tags,
      var.template_tags,
    )
  }

}