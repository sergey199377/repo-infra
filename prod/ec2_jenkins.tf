
resource "aws_instance" "node01-jenkins-prod-myapp" {
  name          = "node01.jenkins.prod.myapp"
  key_name      = "myapp_key"
  ami           = "ami-08b6d44b4f6f7b279"
  instance_type = "t2.large"

  tags = {
    Name = "Jenkins_myapp"
  }

  vpc_security_group_ids = [
    aws_security_group.ubuntu.id
  ]

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = 30
  }

resource "aws_eip" "myapp_jenkins_eip" {
  vpc      = true
  instance = aws_instance.node01-jenkins-prod-myapp.id
}

  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.access_ip_v4},' --extra-vars '{\"owner\":\"'${self.tags.owner}'\",\"service\":\"'${self.tags.service}'\",\"team\":\"'${self.tags.team}'\"}' jenkins_common.yml -D -v"
  }
}


