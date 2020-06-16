variable "create" {
    type    = bool
    default = true
}
variable "networking_router" {
    type    =   list(map(string))
    default = []
}
variable "network" {
    type    =   list(map(string))
    default = []
}
variable "subnet" {
    type    =   list(map(string))
    default = []
}
variable "dns_nameservers" {
    type    = list
    default = []
}
#variable "pool" {
#    type    = string
#}
variable "cluster_node_count" {
    type    = number
    default = "1"
}

