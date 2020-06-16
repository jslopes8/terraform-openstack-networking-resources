# Terraform module to Openstack (Neutron v10)
Manages a Network resource within OpenStack.

O codigo irá prover os seguintes recursos no Openstack.
* [Network](https://www.terraform.io/docs/providers/openstack/r/networking_network_v2.html)
* [Subnet](https://www.terraform.io/docs/providers/openstack/r/networking_subnet_v2.html)
* [Router](https://www.terraform.io/docs/providers/openstack/r/networking_router_v2.html)
* [Router Interface](https://www.terraform.io/docs/providers/openstack/r/networking_router_interface_v2.html)


## Usage
Example create Security Group for VM Instance

```hcl
module "network" {
    source  = "./modules/networking/network/"

    # The network DNS domain
    dns_nameservers = [ 
        "8.8.8.8", "8.8.4.4"
    ]
    
    # Networking Router with External Network
    networking_router = [
        {
            name                = "Router"
            admin_state_up      = "true"
            external_network_id = "75dde624-a4e4-4d6f-b8a7-fcb9b3486ee6"
        }
    ]
    
    # Create Network internal
    network = [
        {
            name            = "Network-Internal"
            admin_state_up  = "true"
        }
    ]
    
    # Create Subnet for network internal
    subnet = [
        {
            name        = "Subnet"
            cidr        = "10.0.0.0/16"
            ip_version  = "4"
        }
    ]
}


```

## Variable Outputs

| Name | Description |
| ---- | ----------- |
| network_name | Return with name of the resource create |
| network_id | Return with Id of the resource create |
| router_id | Return with Id of the resource create |