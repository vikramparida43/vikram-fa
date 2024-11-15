# Subnet
resource "aws_subnet" "this" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr
  availability_zone = "us-east-1a"
}

# Security Group
resource "aws_security_group" "this" {
  vpc_id = var.vpc_id
  name   = "${var.environment}-sg"

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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance
resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.this.id
  key_name      = "ec2-dev-user28-key"

  security_groups = [aws_security_group.this.name]

  tags = {
    Name = "${var.environment}-ec2"
  }
}

# Generate Private Key
resource "tls_private_key" "devk1" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create AWS Key Pair
resource "aws_key_pair" "this" {
  key_name   = "ec2-dev-user28-key"
  public_key = tls_private_key.devk1.public_key_openssh

  tags = {
    Name = "ec2-dev-tls-user28key"
  }
}

# Save the Private Key to a .pem File
resource "local_file" "devk1_pem" {
  filename        = "ec2-dev-user28-key.pem"
  content         = tls_private_key.devk1.private_key_pem
  file_permission = "0400"
}

output "private_key_path" {
  value = local_file.devk1_pem.filename
}