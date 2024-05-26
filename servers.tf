resource "aws_security_group" "server" {

  name        = "youtube-server"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.youtube.id
  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
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


resource "aws_instance" "web1" {
  ami           = "ami-456871456"
  instance_type = var.server_type
  subnet_id     = aws_subnet.youtube_sub1.id

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "web2" {
  ami           = "ami-456871456"
  instance_type = var.server_type
  subnet_id     = aws_subnet.youtube_sub2.id

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "web3" {
  ami           = "ami-456871456"
  instance_type = var.server_type
  subnet_id     = aws_subnet.youtube_sub3.id

  tags = {
    Name = "HelloWorld"
  }
}