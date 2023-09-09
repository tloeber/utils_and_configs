provider "aws" {
  # shared_config_files      = ["${HOME}/.aws/conf"]
  # shared_credentials_files = ["${HOME}/.aws/credentials"]
  profile = "default"
}


resource "aws_instance" "ML dev instance" {
  ami           = ""
  instance_type = ""
}
