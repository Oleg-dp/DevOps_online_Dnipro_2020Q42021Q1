#Start 3 instanse
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

####### Declare Security Group
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
    to_port     = 443
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
####### Declare Security Group

####### DeclareAWS KEY
resource "aws_key_pair" "sneo-aws-key" {
  key_name   = "sneo-aws-key"
  public_key = "${file("${var.key_pair_path["public_key_path"]}")}"
}
####### DeclareAWS KEY

####### Declare EIP 
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.FinalTask.id
  allocation_id = "eipalloc-3acdb51d"
#  association_id = "{aws_instance.FinalTask.id}"
}

#resource "aws_eip" "FinalTaskEIP" {
#  vpc = true
#}

data "aws_eip" "by_allocation_id" {
  id = "eipalloc-3acdb51d"
}

####### Declare EC2 Instance
resource "aws_instance" "FinalTask" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.FinalTask-SecGrp.id}"]
  key_name = "sneo-aws-key"

  tags = {
    Name = "FinalTask"
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
