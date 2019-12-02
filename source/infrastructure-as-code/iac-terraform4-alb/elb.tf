resource "aws_elb" "terraformlab4" {
  name                       = "${var.name}"
  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 8000
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 8080
    instance_protocol  = "http"
    lb_port            = 8080
    lb_protocol        = "http"
  }

  listener {
    instance_port      = 8081
    instance_protocol  = "http"
    lb_port            = 8081
    lb_protocol        = "http"
  }

  listener {
    instance_port      = 8082
    instance_protocol  = "http"
    lb_port            = 8082
    lb_protocol        = "http"
  }

  listener {
    instance_port      = 9000
    instance_protocol  = "http"
    lb_port            = 9000
    lb_protocol        = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  security_groups             = [ "${aws_security_group.security_group.id}" ]
  subnets                     = ["subnet-049706ae911f72263","subnet-08bb614d5f1235d54"]

  tags = {
    Name =  "${var.name}"
  }
}