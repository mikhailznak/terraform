resource "aws_iot_thing" "thing" {
  name = var.thing_name
}

data "aws_iam_policy_document" "iot_policy" {
  dynamic "statement" {
    for_each = var.policy_statement

    content {
      effect    = lookup(statement.value, "Effect")
      actions   = lookup(statement.value, "Action")
      resources = lookup(statement.value, "Resource")
    }
  }
}

resource "aws_iot_policy" "policy" {
  name = "${var.thing_name}-policy"

  policy = data.aws_iam_policy_document.iot_policy.json
}