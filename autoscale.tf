locals {
  common_tags = {
    Environment = "Dev"
    Department  = "eliteInfra"
    Company     = "elite Solutions"
    Managedwith = "Terraform"
  }
}

resource "aws_launch_configuration" "Elite-launch-config" {
  name_prefix     = "Elite-launch-config"
  image_id        = var.amis[var.aws_region]
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.mykeypair.key_name
  security_groups = [aws_security_group.myinstance.id]
  user_data       = "#!/bin/bash\napt-get update\napt-get -y install net-tools nginx\nMYIP=`ifconfig | grep -E '(inet 10)|(addr:10)' | awk '{ print $2 }' | cut -d ':' -f2`\necho 'this is: '$MYIP > /var/www/html/index.html"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "Elite-autoscale" {
  name                      = "Elite-autoscale"
  vpc_zone_identifier       = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
  launch_configuration      = aws_launch_configuration.Elite-launch-config.name
  min_size                  = 2
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  load_balancers            = [aws_elb.my-elb.name]
  force_delete              = true
  tag {
    key                 = "Name"
    value               = "elite-autoscaleVM"
    propagate_at_launch = true
  }
}
