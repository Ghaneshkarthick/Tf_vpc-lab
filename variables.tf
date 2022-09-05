variable "vpc_name" {
    description = "This is the VPC name"
    type = string
}
variable "vpc_cidr" {
    description = "This is the cidr value of the vpc"
}
variable "cidr_public_a" {
    description = "This is the cidr value for public_a subnet"
}
variable "cidr_public_b" {
    description = "This is the cidr value for public_b subnet"
}
variable "cidr_public_c" {
    description = "This is the cidr value for public_c subnet"
}

variable "cidr_private_a" {
    description = "This is the cidr value for private_a subnet"
}
variable "cidr_private_b" {
    description = "This is the cidr value for private_b subnet"
}
variable "cidr_private_c" {
    description = "This is the cidr value for private_c subnet"
}
variable "cidr_private_d" {
    description = "This is the cidr value for private_a subnet"
}
variable "cidr_data" {
    description = "This is the cidr value for data subnet"
}