variable subs {
  type = list(object({
    p = string
    v = string
  }))
  default = []
}

resource "aws_ssm_parameter" "secret" {
  for_each    = { for s in var.subs: s.p => s }
  name        = each.value.p
  description = "The parameter description"
  type        = "SecureString"
  value       = each.value.v
}
