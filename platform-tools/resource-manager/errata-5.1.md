# Errata (5.1)

In Resource Manager 5.1, a resource can remain visible under `quarantine-resource` after the quarantine timer has expired, even though the same resource is already available for allocation in the pool. RM 5.2.0 introduced scheduled cleanup when quarantine is enabled and a manual expired-record cleanup action. See [Resource Manager 5.2 updates](updates-5.2.md). The workaround below is retained for the historical 5.1 behavior; this note does not establish that every stale-entry case is resolved in 5.2.

**Workarounds**

1. Trigger an allocation and then revert:

`request resource-pools find-id pool [ <pool-name> ] allocation-name <temporary-allocation-name> allocate`\
`revert no-confirm`

For IP pools:&#x20;

`request resource-pools find-ip pool <pool-name> allocation-name <temporary-allocation-name> prefix-length <prefix-length> allocate`\
`revert no-confirm`

2. Enable/Disable alarms on the affected pool:

Disable: `delete resource-pools id-pool <pool-name> alarms`

Enable: `set resource-pools id-pool <pool-name> alarms enabled`
