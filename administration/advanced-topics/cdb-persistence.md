---
description: Select the optimal CDB persistence mode for your use case.
---

# CDB Persistence

The Configuration Database (CDB) is a built-in datastore for NSO, specifically designed for network automation use cases and backed by the YANG schema. Since NSO 6.4, the CDB can be configured to operate in one of the two distinct modes: `in-memory-v1` and `on-demand-v1`.

The `in-memory-v1` mode keeps all the configuration data in RAM for the fastest access time. New data is persisted to disk in the form of journal (WAL) files, which the system uses on every restart to reconstruct the RAM database. But the amount of RAM needed is proportional to the number of managed devices and services. When NSO is used to manage a large network, the amount of needed RAM can be quite large. This is the only CDB persistence mode available before NSO 6.4.

The `on-demand-v1` mode loads data on demand from the disk into the RAM and supports offloading the least-used data to free up memory. Loading only the compiled YANG schema initially (in the form of .fxs files), results in faster system startup times. This mode was first introduced in NSO 6.4.

{% hint style="warning" %}
For reliable storage of the configuration on disk, regardless of the persistence mode, the CDB requires that the file system correctly implements the standard primitives for file synchronization and truncation. For this reason (as well as for performance), NFS or other network file systems are unsuitable for use with the CDB - they may be acceptable for development, but using them in production is unsupported and strongly discouraged.
{% endhint %}

Compared to `in-memory-v1`, `on-demand-v1` mode has a number of benefits:

* **Faster startup time**: Data is not loaded into memory at startup, only schema is.
* **Lower memory requirements**: Data is loaded into memory only when needed and offloaded when not.
* **Faster sync of high-availability nodes**: Only subscribed data on the followers is loaded at once.
* **Background compaction**: Compaction process no longer locks the CDB, allowing writes to proceed uninterrupted.

While the `on-demand-v1` mode is as fast for reads of "hot" data (already in memory) as the `in-memory-v1` mode, reads are slower for "cold" data (not loaded in memory), since the data first has to be read from disk. In turn, this results in a bigger variance in the time that a read takes in the `on-demand-v1` mode, based on whether the data is already available in RAM or not. The variance could express in different ways, for example taking a longer time to produce the service mapping or creating a rollback for the first request. To lessen the effect, we highly recommend fast storage, such as NVMe flash drives.

Furthermore, the two modes differ in the way they internally organize and store data, resulting in different performance characteristics. If sufficient RAM is available, in some cases `in-memory-v1` performs better, while in others, `on-demand-v1` performs better. One known case where the performance of `on-demand-v1` does not reach that of `in-memory-v1` is deleting large trees of data. But in general, only extensive testing of the specific use case can tell which mode performs better.

As a rule of thumb, we recommend the `on-demand-v1` mode as it has typical performance comparable to `in-memory-v1` but has better maintainability properties. However, if performance requirements and testing favor the `in-memory-v1` mode, that may be a viable choice. Discounting the migration time, you can easily switch between the two modes with automatic migration at system startup.

## Configuring Persistence Mode

The CDB persistence is configured under `/ncs-config/cdb/persistence` in the `ncs.conf` file. The `format` leaf selects the desired persistence mode, either `on-demand-v1` or `in-memory-v1` (default is `in-memory-v1`), and the system automatically migrates the data on the next start if needed. Note that the system will not be available for the migration duration.

With the `on-demand-v1` mode, additional offloading configuration under `offload` container becomes relevant (`in-memory-v1` keeps all data in RAM and does not perform any offloading). The `offload/interval` specifies how often the system checks its memory consumption and starts the offload process if required.

During the offloading process, data is evicted from memory:

1. If the piece of data was last accessed more than `offload/threshold/max-age` ago (the default value of infinity disables this check).
2. The least-recently-used items are evicted until their usage drops below the allowed amount.

The allowed amount is defined either by the absolute value `offload/threshold/megabytes` or by `offload/threshold/system-memory-percentage`, where the value is calculated dynamically based on the available system RAM. We recommend using the latter unless testing has shown specific requirements.

The actual value should be adjusted according to the use case and system requirements; there is no single optimal setting for all cases. We recommend you start with defaults and then adjust according to observations. You can enable the new `/ncs-config/cdb/persistence/db-statistics` property to aid you in this task (producing `LOG` files inside the CDB directory), as well as the counters and gauges that are available under `/ncs:metric/sysadmin/*/cdb`.

## Compaction

For durability, improved performance, and snapshot isolation, CDB writes in NSO use data structures, such as a write-ahead log (WAL), that require periodic compaction.

For example, the `in-memory-v1` persistence mode appends a new log entry for each CDB transaction to the target datastore WAL file (`A.cdb` for configuration, `O.cdb` for operational, and `S.cdb` for snapshot datastore). Depending on the size and number of transactions towards the system, these files will grow in size leading to increased disk utilization, longer boot times, and longer initial data synchronization time when setting up a high-availability cluster using this persistence mode.

Compaction is a mechanism used to reduce the size of the write-ahead logs to a minimum. In `on-demand-v1` mode, it is automatic, non-configurable, and runs in the background without affecting the ongoing transactions.

But in `in-memory-v1` mode, it works by replacing an existing write-ahead log, which is composed of a number of consecutive transaction logs created in run-time, with a single transaction log representing the full current state of the datastore. From this perspective, a compaction acts similarly to a write transaction towards a datastore. To ensure data integrity, 'write' transactions towards the datastore are not permitted during the time compaction takes place. For this reason, NSO exposes a number of settings to control the compaction process in `in-memory-v1` mode (these have no effect for `on-demand-v1`).

### Compacting In-Memory CDB

By default, compaction is handled automatically by the CDB. After each transaction, CDB evaluates whether compaction is required for the affected datastore.

This is done by examining the number of added nodes as well as the file size changes since the last performed compaction. The thresholds used can be modified in the `ncs.conf` file by configuring the `/ncs-config/compaction/file-size-relative`, `/ncs-config/compaction/file-size-absolute`, and `/ncs-config/compaction/num-node-relative` settings.

It is also possible to automatically trigger compaction after a set number of transactions by setting the `/ncs-config/compaction/num-transaction` property.

In the configuration datastore, compaction is by default delayed by 5 seconds when the threshold is reached to prevent any upcoming write transaction from being blocked. If the system is idle during these 5 seconds, meaning that there is no new transaction, the compaction will initiate. Otherwise, compaction is delayed by another 5 seconds. The delay time can be configured in `ncs.conf` by setting the `/ncs-config/compaction/delayed-compaction-timeout` property.

As compaction may require a significant amount of time, it may be preferable to disable automatic compaction by CDB and instead trigger compaction manually according to specific needs. If doing so, it is highly recommended to have another automated system in place. Automation of compaction can be done by using a scheduling mechanism such as CRON, or by using the NCS scheduler. See [Scheduler](../../development/connected-topics/scheduler.md) for more information.

By default, CDB may perform compaction during its boot process. This may be disabled if required, by starting NSO with the flag `--disable-compaction-on-start`.

Additionally, CDB CAPI provides a set of functions that may be used to create an external mechanism for compaction. See `cdb_initiate_journal_compaction()`, `cdb_initiate_journal_dbfile_compaction()`, and `cdb_get_compaction_info()` in [confd\_lib\_cdb(3)](../../man/section3.md#confd_lib_cdb) in Manual Pages.
