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

- [Cdb](Cdb.md#s-Cdb)
- [CdbCompactionInfo](CdbCompactionInfo.md#s-CdbCompactionInfo)
- [CdbDbfileType](CdbDbfileType.md#s-CdbDbfileType)
- [CdbDBType](CdbDBType.md#s-CdbDBType)
- [CdbDiffIterate](CdbDiffIterate.md#s-CdbDiffIterate)
- [CdbException](CdbException.md#s-CdbException)
- [CdbExtendedException](CdbExtendedException.md#s-CdbExtendedException)
- [CdbGetModificationFlag](CdbGetModificationFlag.md#s-CdbGetModificationFlag)
- [CdbLockType](CdbLockType.md#s-CdbLockType)
- [CdbNotificationType](CdbNotificationType.md#s-CdbNotificationType)
- [CdbPhase](CdbPhase.md#s-CdbPhase)
- [CdbProto](CdbProto.md#s-CdbProto)
- [CdbSession](CdbSession.md#s-CdbSession)
- [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#s-CdbSubscrConfigFlag)
- [CdbSubscription](CdbSubscription.md#s-CdbSubscription)
- [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#s-CdbSubscriptionFlagType)
- [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#s-CdbSubscriptionSyncType)
- [CdbSubscriptionType](CdbSubscriptionType.md#s-CdbSubscriptionType)
- [CdbTxId](CdbTxId.md#s-CdbTxId)
- [CdbUpgradeSession](CdbUpgradeSession.md#s-CdbUpgradeSession)
