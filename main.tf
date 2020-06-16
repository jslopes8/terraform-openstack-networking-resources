resource "openstack_networking_router_v2" "router" {
    count   = var.create ? length(var.networking_router) : 0

    name                = var.networking_router[count.index]["name"]
    admin_state_up      = var.networking_router[count.index]["admin_state_up"]
    external_network_id = var.networking_router[count.index]["external_network_id"]
}

resource "openstack_networking_network_v2" "network" {
    count   = var.create ? length(var.network) : 0

    name           = var.network[count.index]["name"]
    admin_state_up = var.network[count.index]["admin_state_up"]
}

resource "openstack_networking_subnet_v2" "subnet" {
    count   = var.create ? length(var.subnet) : 0

    name            = var.subnet[count.index]["name"]
    network_id      = "${openstack_networking_network_v2.network.0.id}"
    cidr            = var.subnet[count.index]["cidr"]
    ip_version      = var.subnet[count.index]["ip_version"]
    dns_nameservers = "${var.dns_nameservers}"
}

resource "openstack_networking_router_interface_v2" "interface" {
    count   =  var.create ? length(var.networking_router) : 0

    router_id = "${openstack_networking_router_v2.router.0.id}"
    subnet_id = "${openstack_networking_subnet_v2.subnet.0.id}"
}
