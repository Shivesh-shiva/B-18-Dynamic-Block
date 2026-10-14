locals {
  mera_tag = {
    environment = "Production"
    owner = "shivesh"
    managed_by = "archana"
    cost_center = "Information&Technology"
  }
}

resource "azurerm_resource_group" "rg" {
  for_each = var.rg
  name     = each.value.name
  location = each.value.location
  tags = local.mera_tag
  # lifecycle {
  #   ignore_changes = [ tags ]
  # }

}
resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet
  depends_on = [ azurerm_resource_group.rg ]
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space 

  dynamic "subnet" {
    for_each = each.value.subnet != null ? each.value.subnet : []
    content {
      name             = subnet.value.subnet_name
      address_prefixes = subnet.value.addres_prefixes 
    }
  }

  tags = local.mera_tag

  # lifecycle {
  #   ignore_changes = [ tags ]
  # }


}