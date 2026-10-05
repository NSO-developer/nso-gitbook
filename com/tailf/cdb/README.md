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

- [Cdb](Cdb.md#cdb-cb7fc41768c9)
- [CdbCompactionInfo](CdbCompactionInfo.md#cdbcompactioninfo-5ec90640fdd8)
- [CdbDbfileType](CdbDbfileType.md#cdbdbfiletype-a0872754369c)
- [CdbDBType](CdbDBType.md#cdbdbtype-5ae1aed3f97a)
- [CdbDiffIterate](CdbDiffIterate.md#cdbdiffiterate-ab6fafeeb31e)
- [CdbException](CdbException.md#cdbexception-a14a27a1a190)
- [CdbExtendedException](CdbExtendedException.md#cdbextendedexception-9de7535dd8dd)
- [CdbGetModificationFlag](CdbGetModificationFlag.md#cdbgetmodificationflag-5905bbf36241)
- [CdbLockType](CdbLockType.md#cdblocktype-1d165621c0a3)
- [CdbNotificationType](CdbNotificationType.md#cdbnotificationtype-ed004a968992)
- [CdbPhase](CdbPhase.md#cdbphase-a1a97094371f)
- [CdbProto](CdbProto.md#cdbproto-3cf455453285)
- [CdbSession](CdbSession.md#cdbsession-9ffa54666283)
- [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cdbsubscrconfigflag-881f5a524821)
- [CdbSubscription](CdbSubscription.md#cdbsubscription-f17c8fe4dc81)
- [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cdbsubscriptionflagtype-34d1a6785826)
- [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#cdbsubscriptionsynctype-adacba3ff512)
- [CdbSubscriptionType](CdbSubscriptionType.md#cdbsubscriptiontype-e11484b3379f)
- [CdbTxId](CdbTxId.md#cdbtxid-d5b5c859de80)
- [CdbUpgradeSession](CdbUpgradeSession.md#cdbupgradesession-a832ac9abf0d)
