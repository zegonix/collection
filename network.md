# network

This document holds network related notes.

<!--toc:start-->
- [network](#network)
  - [enable routing](#enable-routing)
<!--toc:end-->


## enable routing

To enable routing permanently add a file `/etc/sysctl.d/` with the following contents:

```ini
net.ipv4.ip_forward=1
```

## simple gateway with nftables

> **WARNING:** do not use this configuration for an edge router (directly connected to the internet/isp)!

