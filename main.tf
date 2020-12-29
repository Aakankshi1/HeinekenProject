locals {
  user_data = <<EOF
#!/bin/bash
echo "Hello Terraform!"
EOF
}

resource "aws_instance" "staticService" {
#  count = var.instance_count

  ami              = var.ami
  instance_type    = var.instance_type
  subnet_id        = var.subnet_id
  vpc_security_group_ids  = var.vpc_sg_id
  
  tags = {
      Name =  var.name
    }

}