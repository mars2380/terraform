provider "aws" {
  access_key = "XXXXXXXXXXXXXXXXXXXX"
  secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  region     = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-1b791862"
  instance_type = "t2.micro"
  }

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
