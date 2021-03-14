variable "key_pair_path" {
    type = "map"
    default = {
	public_key_path = "./key/finaltask.pub",
	private_key_path = "./key/finaltask.pem",
  }
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.200.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.100.0/24"
}
