packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.6"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "amazon-linux" {

  access_key    = "AKIAXBJNMQQJZU227AF6"
  secret_key    = "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"
  ami_name      = "my-first-packer-image"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami    = "ami-04823729c75214919"
  ssh_username  = "ec2-user"

}

// build {
//   name    = "my-first-build"
//   sources = ["source.amazon-ebs.amazon-linux"]

// provisioner "shell" {
//   inline = [
//     "sudo apt update",
//     "sudo apt install nginx -y",
//     "sudo systemctl enable nginx",
//     "sudo systemctl start nginx",
//     "sudo ufw allow proto tcp from any to any port 22,80,443",
//     "echo 'y' | sudo ufw enable"
//   ]
// }

build {
  name = "hq-packer"
  sources = [
    "source.amazon-ebs.amazon-linux"
  ]

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




