resource "aws_iot_certificate" "cert" {
  active = true
}

resource "aws_iot_policy_attachment" "attach_policy" {
  policy = aws_iot_policy.policy.name
  target = aws_iot_certificate.cert.arn
}

resource "local_file" "certificate_pem" {
  content  = aws_iot_certificate.cert.certificate_pem
  filename = "${var.path}/certs/certificate.pem"
}
resource "local_file" "private_key" {
  content  = aws_iot_certificate.cert.private_key
  filename = "${var.path}/certs/private_key.pem"
}
resource "local_file" "public_key" {
  content  = aws_iot_certificate.cert.public_key
  filename = "${var.path}/certs/public_key.pem"
}
