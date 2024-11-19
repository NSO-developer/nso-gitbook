---
description: Learn about compaction mechanism in NSO.
---

# Compaction

CDB implements write-ahead logging to provide durability in the datastores, appending a new log for each CDB transaction to the target datastore (`A.cdb` for configuration, `O.cdb` for operational, and `S.cdb` for snapshot datastore). Depending on the size and number of transactions towards the system, these files will grow in size leading to increased disk utilization, longer boot times, and longer initial data synchronization time when setting up a high-availability cluster.

Compaction is a mechanism used to reduce the size of the write-ahead logs to a minimum. It works by replacing an existing write-ahead log, which is composed by a number of consecutive transaction logs created in run-time, with a single transaction log representing the full current state of the datastore. From this perspective, it can be seen that a compaction acts similar to a write transaction towards a datastore. To ensure data integrity, 'write' transactions towards the datastore are not permitted during the time compaction takes place.

## Automatic Compaction <a href="#d5e4274" id="d5e4274"></a>

By default, compaction is handled automatically by the CDB. After each transaction, CDB evaluates whether compaction is required for the affected data store.

This is done by examining the number of added nodes as well as the file size changes since the last performed compaction. The thresholds used can be modified in the `ncs.conf` file by configuring the `/ncs-config/compaction/file-size-relative`, `/ncs-config/compaction/file-size-absolute`, and `/ncs-config/compaction/num-node-relative` settings.

It is also possible to automatically trigger compaction after a set number of transactions by setting the `/ncs-config/compaction/num-transaction` property.

## Manual Compaction <a href="#d5e4283" id="d5e4283"></a>

Compaction may require a significant amount of time, during which write transactions cannot be performed. In certain use cases, it may be preferable to disable automatic compaction by CDB and instead trigger compaction manually according to the specific needs. If doing so, it is highly recommended to have another automated system in place.

CDB CAPI provides a set of functions that may be used to create an external mechanism for compaction. See `cdb_initiate_journal_compaction()`, `cdb_initiate_journal_dbfile_compaction()`, and `cdb_get_compaction_info()` in [confd\_lib\_cdb(3)](https://developer.cisco.com/docs/nso-guides-6.2/#!ncs-man-pages-volume-3/man.3.confd\_lib\_cdb) in Manual Pages.

Automation of compaction can be done by using a scheduling mechanism such as CRON, or by using the NCS scheduler. See [Scheduler](../../development/connected-topics/scheduler.md) for more information.

By default, CDB may perform compaction during its boot process. This may be disabled if required, by starting NSO with the flag `--disable-compaction-on-start`.

## Delayed Compaction <a href="#d5e4296" id="d5e4296"></a>

In the configuration datastore, compaction is by default delayed by 5 seconds when the threshold is reached to prevent any upcoming write transaction from being blocked. If the system is idle during these 5 seconds, meaning that there is no new transaction, the compaction will initiate. Otherwise, compaction is delayed by another 5 seconds. The delay time can be configured in `ncs.conf` by setting the `/ncs-config/compaction/delayed-compaction-timeout` property.
