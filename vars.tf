variable "rg" {
  type = map(any)
}

# variable "vnet" {
#   type = map(any)
# }

variable "vnet" {
  type = map(object({
    name = string
    location = string
    rg_name = string
    address_space = list(string)
    subnet = optional(list(object({
      subnet_name = string
      addres_prefixes = list(string)
    })))
  }))
}