---
description: Changes and upgrade considerations for Resource Manager 5.2.0 through 5.2.2.
---

# Resource Manager 5.2 updates

This page supplements the Resource Manager guide. It covers the changes released in 5.2.0, 5.2.1, and 5.2.2. See the [ID Allocator](id-allocator.md) and [IP Address Allocator](ip-allocator.md) pages for pool configuration and service API examples.

{% hint style="warning" %}
When upgrading from 5.1, check whether your deployment relied on quarantine being enabled without an explicit setting. The default changed from `true` to `false` in 5.2.0. Configure `/resource-pools/settings/quarantine/enabled` explicitly as `true` if you need to keep quarantining newly deallocated resources.
{% endhint %}

## Compatibility when upgrading from 5.1

| Behavior | First version | What to check |
| --- | --- | --- |
| Allocation entries hidden from ordinary CLI display; `show-cache` renamed to `show-reservations` | 5.1.0 | These changes already exist in 5.1, but older CLI instructions and scripts may need `unhide debug` or the new action name. |
| Quarantine disabled by default | 5.2.0 | This changes behavior if the deployment relied on the 5.1 implicit `enabled true` default. Set the value explicitly if quarantine is required. |
| `show-reservations` and `clear-reservations` hidden from ordinary CLI display | 5.2.1 | Use `unhide debug` before these per-pool actions. Scripts that call them may need updating. |
| Corrected selection when excludes change | 5.2.2 | A **new** allocation may select a different value than an older version would have selected. These 5.2.2 fixes add no new YANG data nodes or service-API method signatures; 5.2.0 separately added the cleanup action described below. |

### Allocation entries and reservation actions

Committed allocations are stored under each pool's `allocation` list. Since 5.1.0, that list has been hidden from the ordinary NSO CLI display. To display allocation entries, or to remove one manually, enable the CLI debug view in that session:

```text
admin@ncs# unhide debug
admin@ncs# show running-config resource-pools id-pool <id-pool-name>
admin@ncs# show running-config resource-pools ip-address-pool <ip-pool-name>
```

The old `show-cache` action was renamed to `show-reservations` in 5.1.0, **not** `show-allocations`. It shows active, temporary in-memory reservations, not committed allocation entries. An empty reservation result does not mean a pool has no committed allocations. `clear-reservations` removes temporary reservations; it does not deallocate committed resources.

From 5.2.1, both reservation actions are hidden from the ordinary CLI. After `unhide debug`, they can be called on each pool:

```text
admin@ncs# resource-pools id-pool <id-pool-name> show-reservations
admin@ncs# resource-pools ip-address-pool <ip-pool-name> show-reservations
admin@ncs# resource-pools id-pool <id-pool-name> clear-reservations
admin@ncs# resource-pools ip-address-pool <ip-pool-name> clear-reservations
```

{% hint style="info" %}
A commit dry-run does not create a global in-memory reservation. `show-reservations` may also show no entry for a service-driven allocation whose reservation was short-lived. Use the pool's `allocation` list to inspect committed assignments.
{% endhint %}

### Pool selection and service code

An ID request may name several ID pools and select one ID that can be used in all of them. An IP address or prefix request names one IP pool. Both pool types support `firstfree` and `sequential` allocation methods.

Use `Allocator.id()` and `Allocator.ip()` in service callbacks. The `find-id` and `find-ip` actions are for manual CLI allocation, not for invocation from service code or another action callback.

Each ID or IP pool also has a `get-metrics` action, available since 5.1.0, which calculates total, available, and available percentage on demand:

```text
admin@ncs# resource-pools id-pool <id-pool-name> get-metrics
admin@ncs# resource-pools ip-address-pool <ip-pool-name> get-metrics
```

## Quarantine and expiration

When quarantine is enabled and its timer is greater than zero, a deallocated ID or IP is held for the configured interval so an allocation with the same name can reclaim it. Quarantine entries are stored in persistent CDB operational data, not only in memory. The default timer is 3,600 seconds.

From 5.2.0, quarantine is **disabled by default**. With quarantine enabled and a positive timer, a scheduler removes expired entries; in an HA setup, the primary node performs that cleanup. Setting the timer to zero stops the scheduler. To remove expired entries on demand across ID and IP pools, use:

```text
admin@ncs# resource-pools remove-stale-quarantine
```

The action reports the number of expired records removed. The separate per-pool `release-quarantine` actions remove a specified quarantine record by allocation name; they are not the global expiration cleanup action.

## Excludes and allocation

From 5.2.2, when Resource Manager selects a **new** resource from an existing ID or IP pool, it applies the excludes visible in the current NSO transaction before choosing. For example, if a service adds an IP exclude and requests another IP in the same transaction, the newly excluded address is not selected from the pool's previously saved availability. This corrects ENG-41570 / CSCwv61345.

Also from 5.2.2, removing old excludes and adding replacement excludes in one commit cannot put a value that remains excluded back into operational availability. This correction applies to both ID and IP pools and addresses ENG-43020 / CSCww57944.

These corrections concern new-resource selection and the saved free list. They should not be interpreted as a claim that every same-name allocation or quarantine-reuse path applies current-transaction excludes.

## Release history since 5.1

### 5.2.0 (26 May 2026)

- Fixed an allocation failure when a service-created pool became empty while the service changed its allocation key (ENG-40377).
- Added scheduled cleanup of expired quarantine records and the `remove-stale-quarantine` action (ENG-39762). Quarantine became disabled by default; see the upgrade warning above.
- Improved allocation performance at scale by optimizing lookups, reservation state, and alarm calls (ENG-40604). The released change note reports up to 3.5× improvement in its scale context, not a guaranteed speedup for every deployment.

### 5.2.1 (16 July 2026)

- Corrected duplicate ID values and IP prefixes in multi-allocation commit dry-run output (ENG-40645). Earlier allocations in the same dry-run transaction are considered without creating global reservations.
- Fixed a Resource Manager subscriber and commit-queue interaction that could leave a rollback-on-error queue item stuck (ENG-40166).
- Hid `show-reservations` and `clear-reservations` behind `unhide debug` for ID and IP pools (ENG-40688).

### 5.2.2 (30 September 2026)

- Fixed Resource Manager startup with local IPC enabled on NSO 6.4–6.6 (ENG-42199).
- Kept replaced ID and IP excludes from returning still-excluded resources to operational availability (ENG-43020 / CSCww57944).
- Applied current-transaction excludes when selecting a new resource from an existing ID or IP pool (ENG-41570 / CSCwv61345).
