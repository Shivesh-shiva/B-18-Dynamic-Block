rg = {
  rg1 = {
    name     = "shivesh-rg"
    location = "centralindia"
  }
}

vnet = {
  vnet1 = {
    name          = "shivesh-vnet"
    location      = "centralindia"
    rg_name       = "shivesh-rg"
    address_space = ["10.0.0.0/16"]
    subnet = [
      {
        subnet_name     = "shivesh-subnet"
        addres_prefixes = ["10.0.2.0/24"]
      },
      {
        subnet_name     = "shivesh-subnet1"
        addres_prefixes = ["10.0.3.0/24"]
      }
    ]
  }
  vnet2 = {
    name          = "ravi-vnet"
    location      = "centralindia"
    rg_name       = "shivesh-rg"
    address_space = ["10.1.0.0/16"]
  }
}