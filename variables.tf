
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
    provider    = "Azure"
    managed     = "yes"
  }
}


#----------------------------------------------------------------------------------

variable "tagsrg" {
  type = map(string)
    default = {
        Environment = "Lab"
        ManagedBy   = "Terraform"
        Owner       = "Wille"
        Location    = "Sweden Central"
        provider    = "WilleJ"

    }
}

#  --------------------------------------------------------------------------------
variable "prefix" {
  default = "tfvmex"
}

variable "CounterStrike" {
  type = map(string)
  default = {
    TeamA = "Terrorists"
    TeamB = "Counter-Terrorists"
    TeamC = "Spectators"
    TeamD = "Coaches"
  }
}

