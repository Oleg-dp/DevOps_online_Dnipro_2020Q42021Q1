####### Declare OS for instance
data "aws_ami" "centos" {
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS Linux 7 *"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["679593333241"]
}
####### Declare OS for instance


####### begin - Declare Security Group
resource "aws_security_group" "FinalTask-SecGrp" {
    name = "Final task Security Group"
    description = "Final task Security Group Description"
#allow SSH
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
#allow 80
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
#allow 443
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 448
    protocol    = "tcp"
  }

# allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Final task Security Group"
    Description = "Final task Security Group Description"
  }
}
####### end - Declare Security Group

####### DeclareAWS KEY
resource "aws_key_pair" "sneo-aws-key" {
  key_name   = "sneo-aws-key"
  public_key = "${file("${var.key_pair_path["public_key_path"]}")}"
}
####### DeclareAWS KEY

####### begin - Declare EC2 Instance FinalTask1
resource "aws_instance" "FinalTask1" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.FinalTask-SecGrp.id}"]
  key_name = "sneo-aws-key"

  tags = {
    Name = "FinalTask1"
}
    connection {
        type = "ssh"
        host = "${self.public_ip}"
        user = "centos"
        private_key = "${file("${var.key_pair_path["private_key_path"]}")}"
        }
    provisioner "file" {
	source      = "./scripts/"
	destination = "/tmp/"
	}

    provisioner "remote-exec" {
	inline = [
	    "sudo sh /tmp/setup-first.sh",
	]
  }
#Deletes volume
  root_block_device {
  delete_on_termination = true
 }

}
####### end - Declare EC2 Instance FinalTask1

####### begin - Declare EC2 Instance FinalTask2-Jenkins
resource "aws_instance" "FinalTask2" {
  ami           = "${data.aws_ami.centos.id}"
#  instance_type = "t2.micro"
  instance_type = "t2.small"
  vpc_security_group_ids = ["${aws_security_group.FinalTask-SecGrp.id}"]
  key_name = "sneo-aws-key"

  tags = {
    Name = "FinalTask2"
}
    connection {
        type = "ssh"
        host = "${self.public_ip}"
        user = "centos"
        private_key = "${file("${var.key_pair_path["private_key_path"]}")}"
        }
    provisioner "file" {
	source      = "./scripts/"
	destination = "/tmp/"
	}

    provisioner "remote-exec" {
	inline = [
	    "sudo sh /tmp/setup-first.sh",
	]
  }
#Deletes volume
  root_block_device {
  delete_on_termination = true
 }

}
####### end - Declare EC2 Instance FinalTask2

####### begin - Declare EC2 Instance FinalTask3
resource "aws_instance" "FinalTask3" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.micro"
#  instance_type = "t2.small"
  vpc_security_group_ids = ["${aws_security_group.FinalTask-SecGrp.id}"]
  key_name = "sneo-aws-key"

  tags = {
    Name = "FinalTask3"
}
    connection {
        type = "ssh"
        host = "${self.public_ip}"
        user = "centos"
        private_key = "${file("${var.key_pair_path["private_key_path"]}")}"
        }
    provisioner "file" {
	source      = "./scripts/"
	destination = "/tmp/"
	}

    provisioner "remote-exec" {
	inline = [
	    "sudo sh /tmp/setup-first.sh",
	]
  }
#Deletes volume
  root_block_device {
  delete_on_termination = true
 }

}
####### end - Declare EC2 Instance FinalTask3

####### Declare EIP 1
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.FinalTask1.id
  allocation_id = "eipalloc-3acdb51d"
}

data "aws_eip" "by_allocation_id1" {
  id = "eipalloc-3acdb51d"
}
####### Declare EIP 1

####### Declare EIP 2
resource "aws_eip_association" "eip_assoc2" {
  instance_id   = aws_instance.FinalTask2.id
  allocation_id = "eipalloc-50753c77"
}

data "aws_eip" "by_allocation_id2" {
  id = "eipalloc-50753c77"
}
####### Declare EIP 2

####### Declare EIP 3
resource "aws_eip_association" "eip_assoc3" {
  instance_id   = aws_instance.FinalTask3.id
  allocation_id = "eipalloc-944ea3b2"
}

data "aws_eip" "by_allocation_id3" {
  id = "eipalloc-944ea3b2"
}
####### Declare EIP 3

