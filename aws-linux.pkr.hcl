packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.6"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "amazon-linux" {


  ami_name      = "my-first-packer-image"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami    = "ami-04823729c75214919"
  ssh_username  = "ec2-user"

}


build {
  name = "hq-packer"
  sources = ["source.amazon-ebs.amazon-linux"]

  provisioner "file" {
    source      = "provisioner.sh"
    destination = "/tmp/provisioner.sh"
  }

  provisioner "shell" {
    inline = ["chmod a+x /tmp/provisioner.sh"]
  }

  provisioner "shell" {
    inline = ["ls -la /tmp"]
  }

  provisioner "shell" {
    inline = ["pwd"]
  }

  provisioner "shell" {
    inline = ["/tmp/provisioner.sh"]
  }
}




