output "router_id" {
  value = "${openstack_networking_router_interface_v2.interface.0.id}"
}
output "network_id" {
  value = "${openstack_networking_subnet_v2.subnet.0.id}"
}
output "network_name" {
    value   = openstack_networking_network_v2.network.0.name
}

