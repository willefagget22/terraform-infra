
variable "location" {
  type = string
  default = "Sweden Central"
  description = "The azure region."
}
#----------------------------------------------------------------------------------


variable "tags" {
  type = map(string)
  default = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
    Owner       = "Wille"
    Location    = "Sweden Central"
  }
}


#----------------------------------------------------------------------------------

variable "tagsrg" {
  type = map(string)
    default = {
        Environment = "Lab"
        ManagedBy   = "Terraform"

    }
}

#  --------------------------------------------------------------------------------
variable "prefix" {
  default = "tfvmex"
}

