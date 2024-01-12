provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = var.amiid
  instance_type = var.type
  key_name      = var.pemfile

  provisioner "local-exec" {
    command = "export ANSIBLE_HOST_KEY_CHECKING=False; sleep 30; ansible-playbook -i ${self.private_ip}, -u ${var.user} --key-file ${var.pemfile}.pem sample.yml"
  }
}
