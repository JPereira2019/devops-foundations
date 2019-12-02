# Crea el grupo de seguridad para la instancia

resource "aws_security_group" "security_group" {
  name = "${var.name}-sg"
  description = "Security group for instance ${var.name}"
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "ssh_ingress_access" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ] 
  security_group_id = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "jenkins" {
  type = "ingress"
  from_port = 8000
  to_port = 8000
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ] 
  security_group_id = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "sonar" {
  type = "ingress"
  from_port = 8080
  to_port = 8080
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ] 
  security_group_id = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "sitio" {
  type = "ingress"
  from_port = 8081
  to_port = 8081
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ] 
  security_group_id = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "portainer" {
  type = "ingress"
  from_port = 8082
  to_port = 8082
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ] 
  security_group_id = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "allow_all" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["10.100.0.0/16"]
  security_group_id = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "egress_access" {
  type = "egress"
  from_port = 0
  to_port = 65535
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
  security_group_id = "${aws_security_group.security_group.id}"
}
