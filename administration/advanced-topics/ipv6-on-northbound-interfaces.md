---
description: Learn about using IPv6 on NSO's northbound interfaces.
---

# IPv6 on Northbound Interfaces

NSO supports access to all northbound interfaces via IPv6, and in the most simple case, i.e. IPv6-only access, this is just a matter of configuring an IPv6 address (typically the wildcard address `::`) instead of IPv4 for the respective agents and transports in `ncs.conf`, e.g. `/ncs-config/cli/ssh/ip` for SSH connections to the CLI, or `/ncs-config/netconf-north-bound/transport/ssh/ip` for SSH to the NETCONF agent. The SNMP agent configuration is configured via one of the other northbound interfaces rather than via `ncs.conf`, see [NSO SNMP Agent](../../development/core-concepts/northbound-apis/#the-nso-snmp-agent) in Northbound APIs. For example, via the CLI, we would set `snmp agent ip` to the desired address. All these addresses default to the IPv4 wildcard address `0.0.0.0`.

In most IPv6 deployments, it will however be necessary to support IPv6 and IPv4 access simultaneously. This requires that both IPv4 and IPv6 addresses are configured, typically `0.0.0.0` plus `::`. To support this, there is in addition to the `ip` and `port` leafs also a list `extra-listen` for each agent and transport, where additional IP addresses and port pairs can be configured. Thus, to configure the CLI to accept SSH connections to port 2024 on any local IPv6 address, in addition to the default (port 2024 on any local IPv4 address), we can add an `<extra-listen>` section under `/ncs-config/cli/ssh` in `ncs.conf`:

```xml
  <cli>
    <enabled>true</enabled>

    <!-- Use the built-in SSH server -->
    <ssh>
      <enabled>true</enabled>
      <ip>0.0.0.0</ip>
      <port>2024</port>

      <extra-listen>
        <ip>::</ip>
        <port>2024</port>
      </extra-listen>

    </ssh>

    ...
  </cli>
```

To configure the SNMP agent to accept requests to port 161 on any local IPv6 address, we could similarly use the CLI and give the command:

```cli
admin@ncs(config)# snmp agent extra-listen :: 161
```

The `extra-listen` list can take any number of address/port pairs, thus this method can also be used when we want to accept connections/requests on several specified (IPv4 and/or IPv6) addresses instead of the wildcard address, or we want to use multiple ports.
