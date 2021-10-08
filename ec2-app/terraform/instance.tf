provider "aws" {
  region = var.region
  access_key = var.access_key 
  secret_key = var.secret_key 
}

resource "aws_security_group" "frontend-sg" {
  
  name = "${var.instance_name}-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2" {
  availability_zone = var.availability_zone
  ami = "${var.ami_image}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = [
    aws_security_group.frontend-sg.id
  ]
  
  key_name = "${var.key_name}"
  
  tags = {
    Name = "${var.instance_name}"
  }
  
  volume_tags = {
    Name = "${var.instance_name}"
  }
  
  root_block_device {
    volume_type = "gp2"
    volume_size = 30
  }

  provisioner "file" {
    source      = "${var.fileSorcePath}"
    destination = "/tmp/install-script.sh"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    password    = ""
    private_key = file(var.keyPath)
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      password    = ""
      private_key = file(var.keyPath)
      host        = self.public_ip
    }
    inline = [
      "chmod +x /tmp/install-script.sh",
      "sudo /tmp/install-script.sh",
    ]
  }
}

output "instance" {
  value = aws_instance.ec2
}