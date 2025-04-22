##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

output "endpoint_security_group_id" {
  value = aws_security_group.default.id
}

output "endpoint_security_group_name" {
  value = aws_security_group.default.name
}

output "endpoint_vpc_endpoint_id" {
  value = aws_vpc_endpoint.this.id
}

output "endpoint_vpc_endpoint_status" {
  value = aws_vpc_endpoint.this.state
}

output "endpoint_vpc_dns_entry" {
  value = aws_vpc_endpoint.this.dns_entry
}