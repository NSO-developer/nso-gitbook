# com.tailf.cdb

Package with methods for connecting to the configuration database.

 It is important to consider that CDB is locked for writing during a read
 session using the java api.
 A session starts with Cdb.startSession() and the lock is not released until
 the Cdb.endSession() call.
 CDB will also automatically release the lock if the socket is closed for
 some other reason, such as program termination.



```
 // Setup socket to server
 Socket s = new Socket(localhost, 4565);
 Cdb cdb = new Cdb(test, s);
 CdbSession session = cdb.startSession();
 session.cd(/mtest/servers/);
 ConfValue val = session.getElem(server{www}/ip);
 session.endSession();
 s.close();
```



 The CDB subscription mechanism allows an external program to be notified
 when different parts
 of the configuration changes. At the time of notification it is also
 possible to iterate through the changes written to CDB. Subscriptions are
 always towards the running datastore
 (it is not possible to subscribe to changes to the startup datastore).
 Subscriptions towards the operational data kept in CDB are also possible,
 but the mechanism is slightly different.

## Types

- [Cdb](Cdb.md#cls-Cdb)
- [CdbCompactionInfo](CdbCompactionInfo.md#cls-CdbCompactionInfo)
- [CdbDbfileType](CdbDbfileType.md#cls-CdbDbfileType)
- [CdbDBType](CdbDBType.md#cls-CdbDBType)
- [CdbDiffIterate](CdbDiffIterate.md#cls-CdbDiffIterate)
- [CdbException](CdbException.md#cls-CdbException)
- [CdbExtendedException](CdbExtendedException.md#cls-CdbExtendedException)
- [CdbGetModificationFlag](CdbGetModificationFlag.md#cls-CdbGetModificationFlag)
- [CdbLockType](CdbLockType.md#cls-CdbLockType)
- [CdbNotificationType](CdbNotificationType.md#cls-CdbNotificationType)
- [CdbPhase](CdbPhase.md#cls-CdbPhase)
- [CdbProto](CdbProto.md#cls-CdbProto)
- [CdbSession](CdbSession.md#cls-CdbSession)
- [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cls-CdbSubscrConfigFlag)
- [CdbSubscription](CdbSubscription.md#cls-CdbSubscription)
- [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cls-CdbSubscriptionFlagType)
- [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#cls-CdbSubscriptionSyncType)
- [CdbSubscriptionType](CdbSubscriptionType.md#cls-CdbSubscriptionType)
- [CdbTxId](CdbTxId.md#cls-CdbTxId)
- [CdbUpgradeSession](CdbUpgradeSession.md#cls-CdbUpgradeSession)
