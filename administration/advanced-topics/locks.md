---
description: Learn about different transaction locks in NSO and their interactions.
---

# Locks

This section explains the different locks that exist in NSO and how they interact. It is important to understand the architecture of NSO with its management backplane, and the transaction state machine as described in [Package Development](../../development/advanced-development/developing-packages.md) to be able to understand how the different locks fit into the picture.

## Global Locks <a href="#d5e4197" id="d5e4197"></a>

The NSO management backplane keeps a lock on the datastore running. This lock is usually referred to as the global lock and it provides a mechanism to grant exclusive access to the datastore.

The global is the only lock that can explicitly be taken through a northbound agent, for example by the NETCONF `<lock>` operation, or by calling `Maapi.lock()`.

A global lock can be taken for the whole datastore, or it can be a partial lock (for a subset of the data model). Partial locks are exposed through NETCONF and Maapi.

An agent can request a global lock to ensure that it has exclusive write access. When a global lock is held by an agent, it is not possible for anyone else to write to the datastore that the lock guards - this is enforced by the transaction engine. A global lock on running is granted to an agent if there are no other holders of it (including partial locks) and if all data providers approve the lock request. Each data provider (CDB and/or external data providers) will have its `lock()` callback invoked to get a chance to refuse or accept the lock. The output of `ncs --status` includes locking status. For each user session locks (if any) per datastore is listed.

## Transaction Locks <a href="#d5e4207" id="d5e4207"></a>

A northbound agent starts a user session towards NSO's management backplane. Each user session can then start multiple transactions. A transaction is either read/write or read-only.

The transaction engine has its internal locks towards the running datastore. These transaction locks exist to serialize configuration updates towards the datastore and are separate from the global locks.

As a northbound agent wants to update the running datastore with a new configuration, it will implicitly grab and release the transactional lock. The transaction engine takes care of managing the locks, as it moves through the transaction state machine and there is no API that exposes the transactional locks to the northbound agents.

When the transaction engine wants to take a lock for a transaction (for example when entering the validate state), it first checks that no other transaction has the lock. Then it checks that no user session has a global lock on that datastore. Finally, each data provider is invoked by its `transLock()` callback.

## Northbound Agents and Global Locks <a href="#d5e4214" id="d5e4214"></a>

In contrast to the implicit transactional locks, some northbound agents expose explicit access to the global locks. This is done a bit differently by each agent.

The management API exposes the global locks by providing `Maapi.lock()` and `Maapi.unlock()` methods (and the corresponding `Maapi.lockPartial()` `Maapi.unlockPartial()` for partial locking). Once a user session is established (or attached to) these functions can be called.

In the CLI, the global locks are taken when entering different configure modes as follows:

* `config exclusive`: The running datastore global lock will be taken.
* `config terminal`: Does not grab any locks.

The global lock is then kept by the CLI until the configure mode is exited.

The Web UI behaves in the same way as the CLI (it presents three edit tabs called **Edit private**, **Edit exclusive**, and which correspond to the CLI modes described above).

The NETCONF agent translates the `<lock>` operation into a request for the global lock for the requested datastore. Partial locks are also exposed through the partial-lock RPC.

## External Data Providers <a href="#d5e4238" id="d5e4238"></a>

Implementing the `lock()` and `unlock()` callbacks is not required of an external data provider. NSO will never try to initiate the `transLock()` state transition (see the transaction state diagram in [Package Development](../../development/advanced-development/developing-packages.md)) towards a data provider while a global lock is taken - so the reason for a data provider to implement the locking callbacks is if someone else can write (or lock for example to take a backup) to the data providers database.

## CDB and Locks <a href="#d5e4245" id="d5e4245"></a>

CDB ignores the `lock()` and `unlock()` callbacks (since the data-provider interface is the only write interface towards it).

CDB has its own internal locks on the database. The running datastore has a single write and multiple read locks. It is not possible to grab the write-lock on a datastore while there are active read-locks on it. The locks in CDB exist to make sure that a reader always gets a consistent view of the data (in particular it becomes very confusing if another user is able to delete configuration nodes in between calls to getNext() on YANG list entries).

During a transaction `transLock()` takes a CDB read-lock towards the transactions datastore and writeStart() tries to release the read-lock and grab the write-lock instead.

A CDB external reader client implicitly takes a CDB read-lock between `Cdb.startSession()` and `Cdb.endSession()` This means that while a CDB client is reading, a transaction can not pass through `writeStart()` (and conversely, a CDB reader can not start while a transaction is in between `writeStart()` and `commit()` or `abort()`).

The Operational store in CDB does not have any locks. NSO's transaction engine can only read from it, and the CDB client writes are atomic per write operation.

## Lock Impact on User Sessions <a href="#d5e4261" id="d5e4261"></a>

When a session tries to modify a data store that is locked in some way, it will fail. For example, the CLI might print:

```
admin@ncs(config)# commit
Aborted: the configuration database is locked
```

Since some of the locks are short-lived (such as a CDB read-lock), NSO is by default, configured to retry the failing operation for a short period of time. If the data store still is locked after this time, the operation fails.

To configure this, set `/ncs-config/commit-retry-timeout` in `ncs.conf`.
