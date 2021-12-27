data "cloudinit_config" "workers_userdata" {
  gzip          = false
  base64_encode = true
  boundary      = "//"

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/userdata.sh.tpl",
      {
        cluster_name         = var.cluster_name
        cluster_endpoint     = var.cluster_endpoint
        cluster_auth_base64  = var.cluster_auth_base64
        ami_id               = var.launch_template_image_id
        pre_userdata         = var.pre_userdata
        capacity_type        = var.capacity_type
      }
    )
  }
}
resource "aws_launch_template" "this" {
  count                  = var.create_tpl ? 1 : 0
  name                   = format("%s-${var.suffix}", var.name)
  image_id               = var.launch_template_image_id
  update_default_version = true
  user_data              = data.cloudinit_config.workers_userdata.rendered
  key_name               = var.key_name

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