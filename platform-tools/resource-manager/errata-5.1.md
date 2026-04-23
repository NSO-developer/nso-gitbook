# Errata (5.1)

In the current Resource Manager 5.1 release, a resource can remain visible under `quarantine-resource` after the quarantine timer has expired, even though the same resource is already available for allocation in the pool.

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

