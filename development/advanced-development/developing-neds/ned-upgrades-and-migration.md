---
description: Perform NED version upgrades and migration.
---

# NED Upgrades and Migration

Many services in NSO rely on NEDs to perform network provisioning. These services map service-specific configuration to the device data models, provided by the NEDs. As the NED packages can be upgraded independently, they can introduce changes in the device YANG models that cause issues for the services using them.

NSO provides tools to migrate between backward incompatible NED versions. The tools are designed to give you a structured analysis of which paths will change between two NED versions and visibility into the scope of the potential impact that a change in the NED will drive in the service code.

The tools allow for a usage-based analysis of which parts of the NED data model (and instance tree) a particular service has written to. This will give you an (at least opportunistic) sense of which paths must change in the service code.

These features aim to lower the barrier of upgrading NEDs and significantly reduce the amount of uncertainty and side effects that NED upgrades were historically associated with.

## The `migrate` Action <a href="#ug.ned.migration.migration" id="ug.ned.migration.migration"></a>

By using the `/ncs:devices/device/migrate` action, you can change the NED major/minor version of a device. The action migrates all configuration and service meta-data. The action can also be executed in parallel on a device group or on all devices matching a NED identity. The procedure for migrating devices is further described in [NED Migration](../../../administration/management/package-management.md#ug.package\_mgmt.ned\_migration).

Additionally, the example `examples.ncs/getting-started/developing-with-ncs/26-ned-migration` in the NSO examples collection illustrates how to migrate devices between different NED versions using the `migrate` action.

What makes it particularly useful to a service developer is that the action reports what paths have been modified and the service instances affected by those changes. This information can then be used to prepare the service code to handle the new NED version. If the `verbose` option is used, all service instances are reported instead of just the service points. If the `dry-run` option is used, the action simply reports what it would do. This gives you the chance to analyze before any actual change is performed.
