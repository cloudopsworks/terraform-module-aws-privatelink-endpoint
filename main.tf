##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

locals {
  sglist = try(var.settings.security_group_ids, [])
}

resource "aws_security_group" "default" {
  vpc_id      = var.vpc.vpc_id
  name        = "endpoint-${local.system_name}-sg"
  description = "Security Group for Endpoint Private Link"

  # Egress all
  egress {
    description = "Allow all traffic out"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge({
    Name = "endpoint-${local.system_name}-sg"
  }, local.all_tags)

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "default_ingress" {
  security_group_id = aws_security_group.default.id
  description       = "Allow Traffic for Endpoint"
  type              = "ingress"
  protocol          = "TCP"
  from_port         = try(var.settings.port, 1024)
  to_port           = try(var.settings.port, 65535)
  cidr_blocks       = concat(try(var.settings.vpc_cidr_blocks, []), [var.vpc.vpc_cidr_block])
}

resource "aws_vpc_endpoint" "this" {
  vpc_id              = var.vpc.vpc_id
  service_name        = var.private_link_id
  vpc_endpoint_type   = "Interface"
  subnet_ids          = var.vpc.subnet_ids
  security_group_ids  = concat(local.sglist, [aws_security_group.default.id])
  private_dns_enabled = try(var.settings.private_dns, false)
  dynamic "dns_options" {
    for_each = length(try(var.settings.options, {})) > 0 ? [var.settings.options] : []
    content {
      dns_record_ip_type                             = try(dns_options.value.dns_record_ip_type, "service-defined")
      private_dns_only_for_inbound_resolver_endpoint = try(dns_options.value.private_resolver, false)
    }
  }

  tags = merge({
    Name = "endpoint-${local.system_name}-vpce"
  }, local.all_tags)
}
