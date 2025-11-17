# Network

This document holds network related notes.

<!--toc:start-->
- [Network](#network)
  - [Enable routing](#enable-routing)
  - [Create local network with dhcp/dns](#create-local-network-with-dhcpdns)
    - [`dnsmasq` configuration](#dnsmasq-configuration)
    - [`nftables` configuration](#nftables-configuration)
    - [starting the routing system](#starting-the-routing-system)
<!--toc:end-->


## Enable routing

To enable routing **temporarily** use the following command:

```sh
echo 1 > /proc/sys/net/ipv4/ip_forward
```

To enable routing **permanently** add a file `/etc/sysctl.d/` with the following contents:

```ini
net.ipv4.ip_forward=1
```


## Create local network with dhcp/dns

> **WARNING:** do not use this configuration for an edge router (directly connected to the internet/isp)!
> for an edge router you *absolutely need* to set up a reasonable firewall!

(On the device that acts as router) install `dnsmasq` and `nftables`.
Also install a trusted network manager (e.g. `NetworkManager` or `dhcpcd`).

Decide on an interface each for the local and the parent network.
In this chapter the examples use `enp1s0` for the local network and is referred to as local interface.
For the external or parent network the interface `enp0s0` is used and is referred to as external interface.

Use the network manager to set a static ip for the local interface, in this example `10.1.0.1` is used.
Make sure this address is in the same subnet as the dhcp-range configured later in the dnsmasq configuration.
Set up the external interface to request an ip address via DHCP.


### `dnsmasq` configuration

Configure `dnsmasq` by editing `/etc/dnsmasq.conf`:

```ini
# required settings
## set interface for local network
interface=enp1s0
## set address range for local network
## exclude the first two and last address in your subnet (network-, router- and broadcast address)
## the last value is the lease time
dhcp-range=10.1.0.2,10.1.0.254,12h

# optional settings
domain-needed
bogus-priv
filterwin2k
expand-hosts
domain=hans
```


### `nftables` configuration

Configure `nftables` by editing `/etc/nftables.conf`:

```
define local_network=10.1.0.0/24
define lan_interface="enp1s0"
define wan_interface="enp0s0"

flush ruleset

table inet filter {
    chain routing {
        type nat hook postrouting priority srcnat; policy accept;
        ip saddr { $local_network } oifname { $wan_interface } masquerade
    }
}
```

> **NOTE:** This is where one would insert a few more "chains" to set up a firewall,
> if the external network is not trusted.


### starting the routing system

Enable the services for `dnsmasq`, `nftables` and the network manager of choice.
On a system with `systemd` use:

```sh
sudo systemd enable --now dnsmasq nftables <network-manager-of-choice>
```

Enable routing in the kernel, see [Enable routing](#enable-routing).

The system should now serve a DHCP/DNS server on the local interface and mask packets from the local to the external network with its own ip address.

