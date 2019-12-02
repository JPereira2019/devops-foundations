data "aws_ami" "amazon_linux_ec2" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}

data "template_file" "user_data" {
  template = "${file("${path.module}/template/user-data.tpl")}"
}

data "aws_availability_zones" "all" {}

resource "aws_launch_configuration" "terraformlab4" {
  image_id = "${data.aws_ami.amazon_linux_ec2.id}"
  instance_type = "${var.aws_instance_type}"
  key_name = "demo"
  security_groups = [ "${aws_security_group.security_group.id}" ]
  user_data = "${data.template_file.user_data.rendered}"
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_autoscaling_group" "terraform-ASGlab4" {
  launch_configuration  = "${aws_launch_configuration.terraformlab4.id}"
  vpc_zone_identifier   = ["subnet-02e2501d089873c29", "subnet-0d45a460e80029489"]

  load_balancers        = ["${aws_elb.terraformlab4.name}"]
  health_check_type     = "EC2"
  max_size              = 10
  min_size              = 3
  desired_capacity      = 3
  tag {
    key                 = "Name"
    value               = "${var.name}"
    propagate_at_launch = true
  }
}
