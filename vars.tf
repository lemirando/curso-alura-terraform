variable "amis" {
  type = map(string)
  default = {
    us-east-1 = "ami-0729e439b6769d6ab" # essa imagem tem só nessa região
  }
}

variable "cidr_blocks" {
  type = list(string)
  default = [ "186.219.150.181/32" ]
}

variable "key_name" {
  default = "keypair"
}