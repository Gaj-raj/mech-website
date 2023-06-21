provider "aws" {
  region        = "us-east-1"
  access_key    = "AKIA3M27GT265OTQHAEZ"
  secret_key   = "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"
}

resource "aws_instance" "ec2_web_server" {
  
  ami  = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
  key_name = "demo-ssh-key"
  vpc_security_group_ids = [aws_security_group.sg.id]
    tags = {
           Name = "Terraform EC2"
   }
}

resource "aws_security_group" "sg" {
    egress = [
        {
            cidr_blocks = ["0.0.0.0/0",]
            description = " "
            from_port = 0
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            protocol = "-1"
            security_groups = []
            self = false
            to_port = 0

        }
    ]
  ingress = [
    {
        cidr_blocks = ["0.0.0.0/0", ]
        description = "ssh_port"
        from_port = 22
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        protocol = "tcp"
        security_groups = []
        self = false
        to_port = 22
    },
    {
        cidr_blocks = ["0.0.0.0/0", ]
        description = "http"
        from_port = 80
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        protocol = "tcp"
        security_groups = []
        self = false
        to_port = 80
    }
  ]
    tags = {
           Name = "Terraform EC2 security sg"
   }
}

resource "aws_key_pair" "key_deploy" {
    key_name = "demo-ssh-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCcRoNXO1NClR5GNahdofrNvFOcRZJjcDm+nf3rKgFxR6WkkvHrYbGkEruqgz1p4pegtt810NggQNMScwO54JnXQqs8dmyg1GaUoIhbJnt0OPlezOiCmTCt7lu1Nd8fn+KuLJ6eyovu5wstb7N79YDApV7XVzn5g3kL7NAxj9ibMinNhdSOPJMZxZpGhPzuhfJ7gV0qzyrMjq2Jm3FOMF1aaLHMOqDQfgxNtDtrpEnBNjd+djyoQ4yIqXgNRF2db/MwK3y6ilSiFLqOVvwg8eOxv/08ANNUsfvQEH1+gdTKDR5fWL3Pxaj27hLWqWz5HZtVQpyoSdt/wkHau6XDhEL3 chaud@DESKTOP-0BG3MPF"
}