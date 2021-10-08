variable "access_key" {
  default = "..."
}

variable "secret_key" {
  default = "..."
}

variable "region" {
  description = "aws region"
  default = "eu-central-1"
}

variable "availability_zone" {
  description = "aws zone"
  default = "eu-central-1a"
}

variable "instance_name" {
  description = "aws instance name"
  default = "frontend-next-default-name"
}

variable "ami_image" {
  description = "aws id image"
  default = "default"
}

variable "instance_type" {
  description = "aws instance type"
  default = "default"
}

variable "key_name" {
  default = "default-name"
}
variable "keyPath" {
   default = "/default"
}
variable "fileSorcePath" {
   default = "/default"
}
