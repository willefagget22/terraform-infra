
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


variable "counterstrike" {
  type = map(string)
  default = {
    game1 = "Counter-Strike 1.6"
    game2 = "Counter-Strike: Source"
    game3 = "Counter-Strike: Global Offensive"
  }
}




# 1 lägg till variable
# 2 lägg till text om den 