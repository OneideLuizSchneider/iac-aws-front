
module "frontend_next" {
  source = "../"
  // Frankfurt Germany
  region = "eu-central-1" 
  availability_zone = "eu-central-1a" 
  key_name = "frontend_next"
  keyPath = "../iam_key/frontend_next.pem"
  fileSorcePath = "../install-script.sh"
  // Ubuntu 20.04 lts
  ami_image = "ami-05f7491af5eef733a"
  
  instance_type = "t2.micro"
  instance_name = "frontend-next"  
}

output "ip" {
  value = module.frontend_next.instance.public_ip
}