## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tags"></a> [tags](#module\_tags) | cloudopsworks/tags/local | 1.0.9 |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.default_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_vpc_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags to add to the resources | `map(string)` | `{}` | no |
| <a name="input_is_hub"></a> [is\_hub](#input\_is\_hub) | Is this a hub or spoke configuration? | `bool` | `false` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Prefix for the name of the private link | `string` | n/a | yes |
| <a name="input_org"></a> [org](#input\_org) | Organization details | <pre>object({<br/>    organization_name = string<br/>    organization_unit = string<br/>    environment_type  = string<br/>    environment_name  = string<br/>  })</pre> | n/a | yes |
| <a name="input_private_link_id"></a> [private\_link\_id](#input\_private\_link\_id) | Private link ID to use for the private link | `string` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | Settings for the private link | `any` | `{}` | no |
| <a name="input_spoke_def"></a> [spoke\_def](#input\_spoke\_def) | Spoke ID Number, must be a 3 digit number | `string` | `"001"` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | VPC object to use for the private link | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint_security_group_id"></a> [endpoint\_security\_group\_id](#output\_endpoint\_security\_group\_id) | n/a |
| <a name="output_endpoint_security_group_name"></a> [endpoint\_security\_group\_name](#output\_endpoint\_security\_group\_name) | n/a |
| <a name="output_endpoint_vpc_dns_entry"></a> [endpoint\_vpc\_dns\_entry](#output\_endpoint\_vpc\_dns\_entry) | n/a |
| <a name="output_endpoint_vpc_endpoint_id"></a> [endpoint\_vpc\_endpoint\_id](#output\_endpoint\_vpc\_endpoint\_id) | n/a |
| <a name="output_endpoint_vpc_endpoint_status"></a> [endpoint\_vpc\_endpoint\_status](#output\_endpoint\_vpc\_endpoint\_status) | n/a |
