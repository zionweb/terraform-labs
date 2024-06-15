# Resource-8: Crear instancia EC2
resource "aws_instance" "my-ec2-vm" {
  ami = "ami-0be2609ba883822ec" # Amazon Linux
  instance_type = "t2.micro"
  subnet_id = aws_subnet.vpc-dev-public-subnet-1.id
  key_name = "terraform-key"
	#user_data = file("apache-install.sh")
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to Practico Terraform de Sebastián Berrospe ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF  
  vpc_security_group_ids = [ aws_security_group.dev-vpc-sg.id ]
}