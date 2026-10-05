# CdbSubscription <a href="#cdbsubscription-f17c8fe4dc81" id="cdbsubscription-f17c8fe4dc81"></a>

```java
public class com.tailf.cdb.CdbSubscription
    implements com.tailf.conf.MountIdInterface
```

Types: [MountIdInterface](../conf/MountIdInterface.md#mountidinterface-113d1b54dae0)

This class provides subscription functionality to CDB.

 The subscription functionality makes it possible to receive
 events/notifications of *CDB* configuration/operational
 changes. Subscriptions are always towards the running
 datastore (it is not possible to subscribe to changes to the
 startup datastore). Subscriptions towards the operational data kept
 in CDB are also possible, but the mechanism is slightly different.

 Subscription to configuration or operational
 data is specified with the [`CdbSubscriptionType`](CdbSubscriptionType.md#cdbsubscriptiontype-e11484b3379f) type.

 To subscribe to a particular path the
 `subscribe(CdbSubscriptionType,int,ConfNamespace,String,Object...)`
 should be used. For each invocation of the method a subscription identifier
 (*subscription point*) is returned.

 Every *subscription point* is defined through a path similar to
 the paths we use for read operations, with the exception that instead of
 fully instantiated paths to list instances we can also
 selectively use tagpaths.

 Each subscriber can have multiple subscription points,
 and there can be many different subscribers.

 ***The subscription process***
 After establishing a connection against *CDB* the process is
 as follow:


- Registering on path(s) trough the `subscribe` method
 specifying Subscription type and priority which in turns returns a
 *subscription point*.
- When a client is done subscribing it needs to inform that it is
 ready to receive notifications. This is done by first calling
 `subscribeDone` method, after which the subscription socket
 is ready to receive notifications.
- A direct call to `read` will retrieve a subscription
  notification. The read call will block on the socket until an notification
  is received.
- As a subscriber has read its subscription notifications using
   [`read()`](CdbSubscription.md#read-b28b830b98d6) it will receive points that was affected by a transaction
   and it can iterate through the changes that caused the
   particular subscription notification using the `diffIterate`
   method. It is also possible to start a new read-session to
   the `CDB_PRE_COMMIT_RUNNING` database to read the
   running database as it was before the pending transaction.
- Once we have read the subscription notification through a call to
 `read` and optionally used the `diffIterate`
 to iterate through the changes as well as acted on the changes to *CDB*,
 we must synchronize `sync(CdbSubscriptionSyncType)`  with
 *CDB* so that *CDB* can continue and deliver further subscription
 messages to subscribers with higher priority numbers.




 **Subscription code snippet**



```
  // int port = Conf.PORT; // ConfD TCP; NCS uses Conf.NCS_PATH (Unix socket)
  // create new socket and Cdb instance
  Socket sock = new Socket(localhost, port);
  Cdb cdb2 = new Cdb(test,sock);
  // create new CdbSubscription instance
  final CdbSubscription sub2= cdb2.newSubscription();
  // subscribe on a path
  int subid2 = sub2.subscribe(1,new mtest(), /mtest/servers);
  // tell CDB we are ready for notifications
  sub2.subscribeDone();

  Thread subThread2 = new Thread(new Runnable() {

      public void run() {
          // now do the blocking read
          try {
              while (true) {
                  int[] points= sub2.read();
                  // now do something here like diffIterate
                  // Synchronize with CDB so that we do not
                  // block CDB and can receive new subscriptions.
                  sub2.sync(CdbSubscriptionSyncType.DONE_PRIORITY);
              }
          } catch (Exception e) {
              e.printStackTrace();
              return;
          }
      }
  });

  subThread2.start();
```

## Members

**Constructors**:

- [CdbSubscription(Cdb)](#cdbsubscription-f5d9a99e8f38)

**Methods**:

- [abortTransaction(CdbExtendedException)](#aborttransaction-c0694458d9be)
- [acceptTagPath()](#accepttagpath-3efa26ad697b)
- [diffIterate(int, CdbDiffIterate)](#diffiterate-89b9ae6f39bb)
- [diffIterate(int, CdbDiffIterate, EnumSet<DiffIterateFlags>, Object)](#diffiterate-ca2d7f4353f7)
- [getCdb()](#getcdb-62d7a3429687)
- [getFlags()](#getflags-3c1ca90fd29c)
- [getLatestNotificationType()](#getlatestnotificationtype-c16a1e94affc)
- [getModifications(EnumSet<CdbGetModificationFlag>)](#getmodifications-f4cc98961a6d)
- [getModifications(int, EnumSet<CdbGetModificationFlag>, ConfPath)](#getmodifications-10bc3a627227)
- [getModifications(int, EnumSet<CdbGetModificationFlag>, String, Object[])](#getmodifications-3667ef39ee3e)
- [getModificationsCLI(int)](#getmodificationscli-45ceff108167)
- [getModificationsCLI(int, int)](#getmodificationscli-2622ef2fb979)
- [getMountId(ConfPath)](#getmountid-83243c09b7c3)
- [getUserSession()](#getusersession-7a9eeeb92f85)
- [read()](#read-b28b830b98d6)
- [setMandatory(String)](#setmandatory-bd0c402c922f)
- [subscribe(CdbSubscriptionType, EnumSet<CdbSubscrConfigFlag>, int, ConfNamespace, String, Object[])](#subscribe-a9fe2d87f620)
- [subscribe(CdbSubscriptionType, EnumSet<CdbSubscrConfigFlag>, int, int, String, Object[])](#subscribe-5ac35b379f66)
- [subscribe(CdbSubscriptionType, int, ConfNamespace, String, Object[])](#subscribe-d63c8b36d369)
- [subscribe(CdbSubscriptionType, int, int, String, Object[])](#subscribe-ed12bc09ef9a)
- [subscribe(int, ConfNamespace, String, Object[])](#subscribe-362f9d74bbcb)
- [subscribe(int, int, String, Object[])](#subscribe-cc3174ab5159)
- [subscribeDone()](#subscribedone-4d52aa9e4d50)
- [sync(CdbSubscriptionSyncType)](#sync-e4ae9cc34a8a)

## Constructors

### CdbSubscription(Cdb) <a href="#cdbsubscription-f5d9a99e8f38" id="cdbsubscription-f5d9a99e8f38"></a>

```java
public CdbSubscription(com.tailf.cdb.Cdb cdb)
```

Types: [Cdb](Cdb.md#cdb-cb7fc41768c9)

Creates a CDB subscription instance, with the specified
 `Cdb` socket.

**Parameters**

- `com.tailf.cdb.Cdb cdb` - A cdb instance connected to ConfD/NCS


## Methods

### abortTransaction(CdbExtendedException) <a href="#aborttransaction-c0694458d9be" id="aborttransaction-c0694458d9be"></a>

```java
public void abortTransaction(
    com.tailf.cdb.CdbExtendedException ex
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbExtendedException](CdbExtendedException.md#cdbextendedexception-9de7535dd8dd), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Abort the transaction.

  This method is used when a two phase subscriber wishes to abort an
 transaction (the opposite to acknowledge it with
 `sync(CdbSubscriptionSyncType)`).

 The `abortTransaction` call is only valid for notifications with
 notificationType [`CdbNotificationType#SUB_PREPARE`](CdbNotificationType.md#sub_prepare-1762334ebd19).


 The subscriber is required to supply an instance of the
 [`CdbExtendedException`](CdbExtendedException.md#cdbextendedexception-9de7535dd8dd) which will be used to notify the clients on
 the reason for the transaction abort.

**Parameters**

- `com.tailf.cdb.CdbExtendedException ex` - [`CdbExtendedException`](CdbExtendedException.md#cdbextendedexception-9de7535dd8dd) carrying application specific
        error info supplied by the subscriber

**Throws**

- `ConfException` - if the abort cannot be processed by ConfD/NCS
- `IOException` - if an I/O error occurs while communicating with the
         server

### acceptTagPath() <a href="#accepttagpath-3efa26ad697b" id="accepttagpath-3efa26ad697b"></a>

```java
public boolean acceptTagPath()
```

### diffIterate(int, CdbDiffIterate) <a href="#diffiterate-89b9ae6f39bb" id="diffiterate-89b9ae6f39bb"></a>

```java
public void diffIterate(
    int subid,
    com.tailf.cdb.CdbDiffIterate iter
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [CdbDiffIterate](CdbDiffIterate.md#cdbdiffiterate-ab6fafeeb31e), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Iterate over changes made in CDB.

 After reading the subscription socket the `diffIterate`
 method can be used to iterate over the changes made in CDB  that
 matched the particular `subid`.

 The supplied user implementation of the
 [`CdbDiffIterate`](CdbDiffIterate.md#cdbdiffiterate-ab6fafeeb31e) , `iter` corresponding
 method
 [`CdbDiffIterate#iterate(ConfObject[],DiffIterateOperFlag,
  ConfObject,ConfObject,Object)`](CdbDiffIterate.md#iterate-d80a566b7e0a) will be invoked by the library
 for each element that has been modified and matches the subscription.

 The `iterate` callback receives an `ConfObject[]`
  `kp` array (reversed keypath) which uniquely identifies
 which node in the data tree that has been affected, the operation,
 and optionally the values it has before and after the transaction
 [`DiffIterateFlags#ITER_WANT_PREV`](../conf/DiffIterateFlags.md#iter_want_prev-20404d5d1d20).

 A modification op [`DiffIterateOperFlag`](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec) is
 supplied to the `iterate` method and it gives the modification
 as:


- `MOP_CREATED`:
 The list entry, presence container, or leaf of type empty
 given by `kp` has been created.
- `MOP_DELETED`:
  The list entry, presence container, or optional leaf
  given by `kp` has been deleted.

 If the subscription was triggered because an ancestor was deleted,
 the `iterate` method will not called at all if the delete
 was above the subscription point.

 However if the flag
 [`DiffIterateFlags#ITER_WANT_ANCESTOR_DELETE`](../conf/DiffIterateFlags.md#iter_want_ancestor_delete-8aeb50c9a808) is passed to
 `diffIterate` then deletes that trigger a descendant
 subscription will also generate a call to `iterate`,
 and in this case `kp` will be the path that was actually deleted.
- `MOP_MODIFIED`:
 A descendant of the list entry given by `kp` has been modified.
- `MOP_VALUE_SET`:
 The value of the leaf given by kp has been set.
- `MOP_MOVED_AFTER`:
 The list entry given by `kp`, in an `ordered-by`
 user list, has been moved. If new value is null, the entry has been
 moved first in the list, otherwise it has been moved after the entry
 given by the new value.



 For configuration subscriptions, the previous value
 of the node can also be passed to `iterate` if the
 flags parameter contains `ITER_WANT_PREV`, in which case
 the old value is supplied ,otherwise it will be null.


 For operational data subscriptions,
 the `ITER_WANT_PREV` flag is ignored, and old value is always
  null - there is no equivalent to
 [`CdbDBType#CDB_PRE_COMMIT_RUNNING`](CdbDBType.md#cdb_pre_commit_running-68ec740136a8) that holds "old"
 operational data.


 If `iterate` returns
 [`DiffIterateResultFlag#ITER_STOP`](../conf/DiffIterateResultFlag.md#iter_stop-1b807e9343da),
 no more iteration is done, is returned.

 If `iterate` returns
 [`DiffIterateResultFlag#ITER_RECURSE`](../conf/DiffIterateResultFlag.md#iter_recurse-691241795ec1)
 iteration continues with all children to the node.


 If `iterate` returns
 [`DiffIterateResultFlag#ITER_CONTINUE`](../conf/DiffIterateResultFlag.md#iter_continue-987b3f3577df)
 iteration ignores the children to the node (if any), and continues
 with the node's sibling.

  This version sends passes `ITER_WANT_PREV` as default.
 If the ITER_WANT_PREV is not desired or additional flags is require use
 `diffIterate(int,CdbDiffIterate,EnumSet, Object)`

**Parameters**

- `int subid` - Subscription identifier point
- `com.tailf.cdb.CdbDiffIterate iter` - A User implementation `CdbDiffIterate` interface.

**Throws**

- `CdbException` - Failed to diff iterate
- `IOException` - Failed to read/write cdb socket

### diffIterate(int, CdbDiffIterate, EnumSet&lt;DiffIterateFlags&gt;, Object) <a href="#diffiterate-ca2d7f4353f7" id="diffiterate-ca2d7f4353f7"></a>

```java
public void diffIterate(
    int subid,
    com.tailf.cdb.CdbDiffIterate iter,
    java.util.EnumSet<com.tailf.conf.DiffIterateFlags> flags,
    Object initstate
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [CdbDiffIterate](CdbDiffIterate.md#cdbdiffiterate-ab6fafeeb31e), [DiffIterateFlags](../conf/DiffIterateFlags.md#diffiterateflags-79473c9fdab6), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Iterate over changes made in CDB with additional supplied flags.

 After reading the subscription socket the `diffIterate`
 method can be used to iterate over the changes made in CDB  that
 matched the particular `subid`.

 The supplied user implementation of the
 [`CdbDiffIterate`](CdbDiffIterate.md#cdbdiffiterate-ab6fafeeb31e) interface, `iter` corresponding
 method
 [`CdbDiffIterate#iterate(ConfObject[],DiffIterateOperFlag,
  ConfObject,ConfObject,Object)`](CdbDiffIterate.md#iterate-d80a566b7e0a) will be invoked by the library
 for each element that has been modified and matches the subscription.

 The `iterate` callback receives an `ConfObject[]`
 `kp` array (reversed keypath) which uniquely identifies
 which node in the data tree that has been affected, the operation,
 and optionally the values it has before (old value) and after the
 transaction ( new value ) [`DiffIterateFlags#ITER_WANT_PREV`](../conf/DiffIterateFlags.md#iter_want_prev-20404d5d1d20).

 A modification op [`DiffIterateOperFlag`](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec) is
 supplied to the `iterate` method and it gives the modification
 as:


- `{@link DiffIterateOperFlag#MOP_CREATED}`:
 The list entry, presence container, or leaf of type empty
 given by `kp` has been created.
- `{@link DiffIterateOperFlag#MOP_DELETED}`:
  The list entry, presence container, or optional leaf
  given by `kp` has been deleted.

 If the subscription was triggered because an ancestor was deleted,
 the `iterate` method will not called at all if the delete
 was above the subscription point.

 However if the flag
 [`DiffIterateFlags#ITER_WANT_ANCESTOR_DELETE`](../conf/DiffIterateFlags.md#iter_want_ancestor_delete-8aeb50c9a808) is passed to
 `diffIterate` then deletes that trigger a descendant
 subscription will also generate a call to `iterate`,
 and in this case `kp` will be the path that was actually deleted.
- `MOP_MODIFIED`:
 A descendant of the list entry given by `kp` has been modified.
- `MOP_VALUE_SET`:
 The value of the leaf given by kp has been set.
- `MOP_MOVED_AFTER`
 The list entry given by `kp`, in an `ordered-by`
 user list, has been moved. If new value is null, the entry has been
 moved first in the list, otherwise it has been moved after the entry
 given by the new value.



 For configuration subscriptions, the previous value
 of the node can also be passed to `iterate` if the
 flags parameter contains `ITER_WANT_PREV`, in which case
 the old value is supplied ,otherwise it will be null.


 For operational data subscriptions,
 the `ITER_WANT_PREV` flag is ignored, and old value is always
 null - there is no equivalent to
 [`CdbDBType#CDB_PRE_COMMIT_RUNNING`](CdbDBType.md#cdb_pre_commit_running-68ec740136a8) that holds "old"
 operational data.


 If `iterate` returns
 [`DiffIterateResultFlag#ITER_STOP`](../conf/DiffIterateResultFlag.md#iter_stop-1b807e9343da),
 no more iteration is done, is returned.

 If `iterate` returns
 [`DiffIterateResultFlag#ITER_RECURSE`](../conf/DiffIterateResultFlag.md#iter_recurse-691241795ec1)
 iteration continues with all children to the node.


 If `iterate` returns
 [`DiffIterateResultFlag#ITER_CONTINUE`](../conf/DiffIterateResultFlag.md#iter_continue-987b3f3577df)
 iteration ignores the children to the node (if any), and continues
 with the node's sibling.

**Parameters**

- `int subid` - Subscription identifier point
- `com.tailf.cdb.CdbDiffIterate iter` - A User implementation `CdbDiffIterate` interface
- `java.util.EnumSet<com.tailf.conf.DiffIterateFlags> flags` - iteration flags controlling traversal and value inclusion
- `Object initstate` - user supplied opaque state object passed to callbacks

**Throws**

- `CdbException` - Failed to diff iterate
- `IOException` - Failed to read/write cdb socket

### getCdb() <a href="#getcdb-62d7a3429687" id="getcdb-62d7a3429687"></a>

```java
public com.tailf.cdb.Cdb getCdb()
```

Types: [Cdb](Cdb.md#cdb-cb7fc41768c9)

### getFlags() <a href="#getflags-3c1ca90fd29c" id="getflags-3c1ca90fd29c"></a>

```java
public java.util.EnumSet<com.tailf.cdb.CdbSubscriptionFlagType> getFlags()
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cdbsubscriptionflagtype-34d1a6785826)

Returns an `EnumSet<CdbSubscriptionFlagType>` of current
 flags for this subscription.

**Returns:** `EnumSet<CdbSubscriptionFlagType>`

### getLatestNotificationType() <a href="#getlatestnotificationtype-c16a1e94affc" id="getlatestnotificationtype-c16a1e94affc"></a>

```java
public com.tailf.cdb.CdbNotificationType getLatestNotificationType()
```

Types: [CdbNotificationType](CdbNotificationType.md#cdbnotificationtype-ed004a968992)

Retrieve the latest notification type.

 Each notification retrieved by the [`read()`](CdbSubscription.md#read-b28b830b98d6) method has a
 notificationType.

 This method retrieves the notification type from  the latest
 `read` call.


 If no `read` call has been performed then this method
 returns null.

**Returns:** notificationType or null if not applicable

### getModifications(EnumSet&lt;CdbGetModificationFlag&gt;) <a href="#getmodifications-f4cc98961a6d" id="getmodifications-f4cc98961a6d"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> getModifications(
    java.util.EnumSet<com.tailf.cdb.CdbGetModificationFlag> flags
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [CdbGetModificationFlag](CdbGetModificationFlag.md#cdbgetmodificationflag-5905bbf36241), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Retrieve changes that caused by subscription notification.

 Convenient short-hand of the
 `getModifications(int,EnumSet,ConfPath)`
 method intended to be used from within a iteration started by
 `diffIterate(int,CdbDiffIterate)`.

 In this case no subscription id is needed, and the path is implicitly
 the current position in the iteration.

 Combining this call with `diffIterate` makes it for
 example possible to iterate over a list, and for each list instance
 fetch the changes using `getModifications`, and then return
 [`DiffIterateResultFlag#ITER_CONTINUE`](../conf/DiffIterateResultFlag.md#iter_continue-987b3f3577df) to process
 next instance.

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbGetModificationFlag> flags` - selection flags controlling which modifications are returned

**Returns:** list of XML params describing the modifications

**Throws**

- `ConfException` - if the server reports an error retrieving changes
- `IOException` - if an I/O error occurs while communicating with the
         server

**See also:** `#getModifications(int,EnumSet,ConfPath)`

### getModifications(int, EnumSet&lt;CdbGetModificationFlag&gt;, ConfPath) <a href="#getmodifications-10bc3a627227" id="getmodifications-10bc3a627227"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> getModifications(
    int subid,
    java.util.EnumSet<com.tailf.cdb.CdbGetModificationFlag> flags,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [CdbGetModificationFlag](CdbGetModificationFlag.md#cdbgetmodificationflag-5905bbf36241), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Retrieve changes that caused by subscription notification.

 The `getModifications` can be called after
 reception of a subscription notification to retrieve all the
 changes that caused the subscription notification.

 The subscription id `subid` must be provide
 Optionally a path `path` can  be used to limit what is
 returned further (only changes below the supplied path will be
 returned), if this isn't needed a null could be provided.

 Only the values that were  modified in this transaction are included.
 In addition to that these are the different values
 of the tags depending on what happened in the transaction:



- A leaf of type empty that has been deleted has the value of
        [`ConfNoExists`](../conf/ConfNoExists.md#confnoexists-bdcf8f2c7ab9), and when it is created
        it has the value [`ConfXMLParamLeaf`](../conf/ConfXMLParamLeaf.md#confxmlparamleaf-107412653048).
- A leaf or a leaf-list that has been set to a new value
      (or its default value) is included with that new value.
      If the leaf or leaf-list is optional, then when
      it is deleted the value is [`ConfNoExists`](../conf/ConfNoExists.md#confnoexists-bdcf8f2c7ab9).
- Presence containers are included when they are created or when
      they have modifications below them (by the usual
      [`ConfXMLParamStart`](../conf/ConfXMLParamStart.md#confxmlparamstart-05eace141688),
      [`ConfXMLParamStop`](../conf/ConfXMLParamStop.md#confxmlparamstop-d1e86c4fdecc) pair). If a presence
       container have been deleted its tag is included, but is set to
       [`ConfNoExists`](../conf/ConfNoExists.md#confnoexists-bdcf8f2c7ab9).

**Parameters**

- `int subid` - subscription id
- `java.util.EnumSet<com.tailf.cdb.CdbGetModificationFlag> flags` - enumset of CdbGetModificationFlag
- `com.tailf.conf.ConfPath path` - optional path to limit what is returned

**Returns:** the modifications for the specified subscription

**Throws**

- `ConfException` - if the server reports an error retrieving changes
- `IOException` - if an I/O error occurs while communicating with the
         server

### getModifications(int, EnumSet&lt;CdbGetModificationFlag&gt;, String, Object[]) <a href="#getmodifications-3667ef39ee3e" id="getmodifications-3667ef39ee3e"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> getModifications(
    int subid,
    java.util.EnumSet<com.tailf.cdb.CdbGetModificationFlag> flags,
    String fmt,
    Object[] args
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [CdbGetModificationFlag](CdbGetModificationFlag.md#cdbgetmodificationflag-5905bbf36241), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Retrieve changes that caused by subscription notification.

 The `getModifications` can be called after
 reception of a subscription notification to retrieve all the
 changes that caused the subscription notification.

 The subscription id `subid` must be provide
 Optionally a path `path` can  be used to limit what is
 returned further (only changes below the supplied path will be
 returned), if this isn't needed a null could be provided.

 Only the values that were  modified in this transaction are included.
 In addition to that these are the different values
 of the tags depending on what happened in the transaction:



- A leaf of type empty that has been deleted has the value of
        [`ConfNoExists`](../conf/ConfNoExists.md#confnoexists-bdcf8f2c7ab9), and when it is created
        it has the value [`ConfXMLParamLeaf`](../conf/ConfXMLParamLeaf.md#confxmlparamleaf-107412653048).
- A leaf or a leaf-list that has been set to a new value
      (or its default value) is included with that new value.
      If the leaf or leaf-list is optional, then when
      it is deleted the value is [`ConfNoExists`](../conf/ConfNoExists.md#confnoexists-bdcf8f2c7ab9).
- Presence containers are included when they are created or when
      they have modifications below them (by the usual
      [`ConfXMLParamStart`](../conf/ConfXMLParamStart.md#confxmlparamstart-05eace141688),
      [`ConfXMLParamStop`](../conf/ConfXMLParamStop.md#confxmlparamstop-d1e86c4fdecc) pair). If a presence
       container have been deleted its tag is included, but is set to
       [`ConfNoExists`](../conf/ConfNoExists.md#confnoexists-bdcf8f2c7ab9).

**Parameters**

- `int subid` - Subscription id
- `java.util.EnumSet<com.tailf.cdb.CdbGetModificationFlag> flags` - EnumSet of CdbGetModificationFlag
- `String fmt` - path format string for optional path to limit what is returned
- `Object[] args` - optional arguments for the path format string

**Returns:** the modifications for the specified subscription

**Throws**

- `ConfException` - if the server reports an error retrieving changes
- `IOException` - if an I/O error occurs while communicating with the
         server

### getModificationsCLI(int) <a href="#getmodificationscli-45ceff108167" id="getmodificationscli-45ceff108167"></a>

```java
public String getModificationsCLI(
    int subid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Return a string with the CLI commands that corresponds to the
 changes that triggered subscription.

**Parameters**

- `int subid` - subscription id

**Returns:** CLI representation of the modifications

**Throws**

- `IOException` - if an I/O error occurs while communicating with the
         server
- `ConfException` - if the server reports an error producing CLI data

**See also:** [`getModificationsCLI(int, int)`](CdbSubscription.md#getmodificationscli-2622ef2fb979)

### getModificationsCLI(int, int) <a href="#getmodificationscli-2622ef2fb979" id="getmodificationscli-2622ef2fb979"></a>

```java
public String getModificationsCLI(
    int subid,
    int flags
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

CLI string that corresponds to the changes that triggered subscription.

**Parameters**

- `int subid` - subscription id
- `int flags` - formatting/control flags

**Returns:** CLI representation of the modifications

**Throws**

- `IOException` - if an I/O error occurs while communicating with the
         server
- `ConfException` - if the server reports an error producing CLI data

### getMountId(ConfPath) <a href="#getmountid-83243c09b7c3" id="getmountid-83243c09b7c3"></a>

```java
public java.util.List<String> getMountId(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfPath path`

### getUserSession() <a href="#getusersession-7a9eeeb92f85" id="getusersession-7a9eeeb92f85"></a>

```java
public long getUserSession() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Retrieve the user session id associated with this subscription socket.

**Returns:** user session id

**Throws**

- `ConfException` - if the ConfD/NCS server reports an error
- `IOException` - if an I/O error occurs while communicating with the
         server

### read() <a href="#read-b28b830b98d6" id="read-b28b830b98d6"></a>

```java
public int[] read() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Reads the Cdb subscription socket for events and blocks.

 The triggering notification is of a type.
 This information in important in two-phase subscriptions.
 The notificationType can be retrieved using
 [`getLatestNotificationType()`](CdbSubscription.md#getlatestnotificationtype-c16a1e94affc)

**Returns:** the subscription points that triggered a change

**Throws**

- `CdbException` - Failed to read.
- `IOException` - Failed to read/write cdb socket

### setMandatory(String) <a href="#setmandatory-bd0c402c922f" id="setmandatory-bd0c402c922f"></a>

```java
public void setMandatory(
    String mandatoryName
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Attaches a mandatory attribute and a mandatory name to this subscriber
 CDB keeps a list of mandatory subscribers for infinite extent, i.e.
 until ConfD/NCS is restarted. The function is idempotent.

 Absence of one or more mandatory subscribers will result in abort of
 all transactions. A mandatory subscriber must be present during the
 entire PREPARE delivery phase.

 If a mandatory subscriber crash during a PREPARE delivery phase, the
 subscriber should be restarted and the commit operation should be
 retried.

 A mandatory subscriber is present if the subscriber has issued at least
 one subscribe() call followed by a subscribeDone() call.


 A call to setMandatory() is only allowed before
 subscribe() has been called.

 Note, this functionality is only applicable for two-phase subscribers.

**Parameters**

- `String mandatoryName` - unique mandatory subscriber name

**Throws**

- `IOException` - if an I/O error occurs while sending the request
- `ConfException` - if the name is invalid or server rejects operation

### subscribe(CdbSubscriptionType, EnumSet&lt;CdbSubscrConfigFlag&gt;, int, ConfNamespace, String, Object[]) <a href="#subscribe-a9fe2d87f620" id="subscribe-a9fe2d87f620"></a>

```java
public int subscribe(
    com.tailf.cdb.CdbSubscriptionType subscriptionType,
    java.util.EnumSet<com.tailf.cdb.CdbSubscrConfigFlag> flags,
    int priority,
    com.tailf.conf.ConfNamespace ns,
    String fmt,
    Object[] args
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#cdbsubscriptiontype-e11484b3379f), [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cdbsubscrconfigflag-881f5a524821), [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Subscribe to a path.

 Same as the
 `subscribe(CdbSubscriptionType,EnumSet,int,int,String,Object...)`
 with the difference that the namespace is given as a ConfNamespace.

**Parameters**

- `com.tailf.cdb.CdbSubscriptionType subscriptionType` - The subscription type
- `java.util.EnumSet<com.tailf.cdb.CdbSubscrConfigFlag> flags` - `EnumSet<CdbSubscrConfigFlag>` controlling
              the subscription
- `int priority` - The priority of the subscription
- `com.tailf.conf.ConfNamespace ns` - Namespace where the path belongs to
- `String fmt` - subscription path
- `Object[] args` - arguments to be substituted into fmt string

**Returns:** The final subscription point which is
          used to identify this particular subscription

**Throws**

- `IOException` - if an I/O error occurs while sending the request
- `ConfException` - if the subscription cannot be established

### subscribe(CdbSubscriptionType, EnumSet&lt;CdbSubscrConfigFlag&gt;, int, int, String, Object[]) <a href="#subscribe-5ac35b379f66" id="subscribe-5ac35b379f66"></a>

```java
public int subscribe(
    com.tailf.cdb.CdbSubscriptionType subscriptionType,
    java.util.EnumSet<com.tailf.cdb.CdbSubscrConfigFlag> flags,
    int priority,
    int nshash,
    String fmt,
    Object[] args
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#cdbsubscriptiontype-e11484b3379f), [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cdbsubscrconfigflag-881f5a524821), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Subscribe to a path.

 Same as the
 `subscribe(CdbSubscriptionType, int, int, String, Object...)`
 with the addition of the flags parameter which is an EnumSet of
 configuration flags for the subscription see [`CdbSubscrConfigFlag`](CdbSubscrConfigFlag.md#cdbsubscrconfigflag-881f5a524821)

**Parameters**

- `com.tailf.cdb.CdbSubscriptionType subscriptionType` - subscription type
- `java.util.EnumSet<com.tailf.cdb.CdbSubscrConfigFlag> flags` - `EnumSet<CdbSubscrConfigFlag>` controlling
              the subscription
- `int priority` - subscription priority
- `int nshash` - namespace hash
- `String fmt` - subscription path
- `Object[] args` - arguments to be substituted into fmt string

**Returns:** The final subscription point which is
          used to identify this particular subscription

**Throws**

- `IOException` - if an I/O error occurs while sending the request
- `ConfException` - If failed to subscribe to the given path
 for some reason

### subscribe(CdbSubscriptionType, int, ConfNamespace, String, Object[]) <a href="#subscribe-d63c8b36d369" id="subscribe-d63c8b36d369"></a>

```java
public int subscribe(
    com.tailf.cdb.CdbSubscriptionType subscriptionType,
    int priority,
    com.tailf.conf.ConfNamespace ns,
    String fmt,
    Object[] args
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#cdbsubscriptiontype-e11484b3379f), [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Subscribe to a path.

  Sets up a CDB subscription so that we are notified when CDB
 configuration data changes. There can be multiple subscription points
 from different sources, that is a single client daemon can have many
 subscriptions and there can be many client daemons.


 Each subscription point is defined through a path similar to the
 paths we use for read operations. We can subscribe either to
 specific leafs or entire subtrees. Subscribing to list entries can
 be done using fully qualified paths, or tagpaths to match multiple
 entries. A path which isn't a leaf element automatically
 matches the subtree below that path. When specifying keys to a
 list entry it is possible to use the wild card character * which will
 match any key value.

 When subscribing to a leaf with a `tailf:default-ref` statement,
 or to a subtree with elements that have `tailf:default-ref`,
 implicit subscriptions to the referred leafs are added.
 This means that a change in a referred leaf will generate a
 notification for the subscription that has referring leaf(s) - but
 currently such a change will not be reported by
 `diffIterate(int, CdbDiffIterate, EnumSet, Object)`.
 Thus to get the new "effective" value of a referring leaf in this
 case, it is necessary to either read the
 value of the leaf with e.g. [`CdbSession#getElem(ConfPath)`](CdbSession.md#getelem-f8219fa65c5d) -
 or to use a
 subscription that includes the referred leafs, and use
 `diffIterate()` when a notification for that
 subscription is received.

 Some examples


```
 /hosts
         Means that we subscribe to any changes in the subtree - rooted
         at /hosts. This includes additions or removals of host
         entries as well as changes to already  existing host entries.

 /hosts/host{www}/interfaces/interface{eth0}/ip
         Means we are notified when host www changes its IP address on
         eth0.

 /hosts/host/interfaces/interface/ip
         Means we are notified when any host changes any of its IP
         addresses.

 /hosts/host/interfaces
         Means we are notified when either an interface is
         added/removed or when an individual leaf element in an
         existing interface is changed.
```



  The priority value is an integer. When CDB is changed, the
  change is performed inside a transaction. Either a commit
  operation from the CLI or a candidate-commit operation in
  NETCONF means that the running database is changed.
  These changes occur inside a transaction.

  CDB will handle the subscriptions in lock-step priority order.
  First all subscribers at the lowest priority are handled, once
  they all have replied and synchronized through calls
  to `sync(CdbSubscriptionSyncType)`
  the next set - at the next priority  level is handled by CDB.

  Priority numbers are global, i.e. if there
  are multiple client daemons notifications will still be delivered
  in priority order per all subscriptions, not per daemon.

  See `diffIterate(int,CdbDiffIterate,EnumSet,Object)`
  for ways of filtering  subscription notifications and finding out
  what changed.  The easiest way is though to solely
  rely on the positioning of the subscription points in the tree to
  figure out what changed.

  `subscribe` returns a subscription point
  This integer value is used to identify this particular
  subscription.

  Because there can be many subscriptions on the same socket the
  client must notify when it is done subscribing and ready to receive
  notifications. This is done using [`subscribeDone()`](CdbSubscription.md#subscribedone-4d52aa9e4d50).

**Parameters**

- `com.tailf.cdb.CdbSubscriptionType subscriptionType` - The subscription type
- `int priority` - The priority of the subscription
- `com.tailf.conf.ConfNamespace ns` - Namespace where the path belongs to
- `String fmt` - subscription path
- `Object[] args` - arguments to be substituted into fmt string

**Returns:** The final subscription point which is
            used to identify this particular subscription

**Throws**

- `IOException` - if an I/O error occurs while sending the request
- `ConfException` - if the subscription cannot be established

### subscribe(CdbSubscriptionType, int, int, String, Object[]) <a href="#subscribe-ed12bc09ef9a" id="subscribe-ed12bc09ef9a"></a>

```java
public int subscribe(
    com.tailf.cdb.CdbSubscriptionType subscriptionType,
    int priority,
    int nshash,
    String fmt,
    Object[] args
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#cdbsubscriptiontype-e11484b3379f), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Subscribe to a path.

  Sets up a CDB subscription so that we are notified when CDB
 configuration data changes. There can be multiple subscription points
 from different sources, that is a single client daemon can have many
 subscriptions and there can be many client daemons.


 Each subscription point is defined through a path similar to the
 paths we use for read operations. We can subscribe either to
 specific leafs or entire subtrees. Subscribing to list entries can
 be done using fully qualified paths, or tagpaths to match multiple
 entries. A path which isn't a leaf element automatically
 matches the subtree below that path. When specifying keys to a
 list entry it is possible to use the wild card character '*' which will
 match any key value.

 When subscribing to a leaf with a `tailf:default-ref` statement,
 or to a subtree with elements that have `tailf:default-ref`,
 implicit subscriptions to the referred leafs are added.
 This means that a change in a referred leaf will generate a
 notification for the subscription that has referring leaf(s) - but
 currently such a change will not be reported by
 `diffIterate(int,CdbDiffIterate,EnumSet,Object)`.
 Thus to get the new "effective" value of a referring leaf in this
 case, it is necessary to either read the
 value of the leaf with e.g. [`CdbSession#getElem(ConfPath)`](CdbSession.md#getelem-f8219fa65c5d) -
 or to use a
 subscription that includes the referred leafs, and use
 `diffIterate` when a notification for that
 subscription is received.

 Some examples


```
 /hosts
         Means that we subscribe to any changes in the subtree - rooted
         at /hosts. This includes additions or removals of host
         entries as well as changes to already  existing host entries.

 /hosts/host{www}/interfaces/interface{eth0}/ip
         Means we are notified when host www changes its IP address on
         eth0.

 /hosts/host/interfaces/interface/ip
         Means we are notified when any host changes any of its IP
         addresses.

 /hosts/host/interfaces
         Means we are notified when either an interface is
         added/removed or when an individual leaf element in an
         existing interface is changed.
```



  The priority value is an integer. When CDB is changed, the
  change is performed inside a transaction. Either a commit
  operation from the CLI or a candidate-commit operation in
  NETCONF means that the running database is changed.
  These changes occur inside a transaction.

  CDB will handle the subscriptions in lock-step priority order.
  First all subscribers at the lowest priority are handled, once
  they all have replied and synchronized through calls
  to `sync(CdbSubscriptionSyncType)`
  the next set - at the next priority  level is handled by CDB.

  Priority numbers are global, i.e. if there
  are multiple client daemons notifications will still be delivered
  in priority order per all subscriptions, not per daemon.

  See `diffIterate(int,CdbDiffIterate,EnumSet,Object)`
  for ways of filtering  subscription notifications and finding out
  what changed.  The easiest way is though to solely
  rely on the positioning of the subscription points in the tree to
  figure out what changed.

  `subscribe` returns a subscription point
  This integer value is used to identify this particular
  subscription.

  Because there can be many subscriptions on the same socket the
  client must notify when it is done subscribing and ready to receive
  notifications. This is done using [`subscribeDone()`](CdbSubscription.md#subscribedone-4d52aa9e4d50).

**Parameters**

- `com.tailf.cdb.CdbSubscriptionType subscriptionType` - subscription type
- `int priority` - subscription priority
- `int nshash` - namespace hash
- `String fmt` - subscription path
- `Object[] args` - arguments to be substituted into fmt string

**Returns:** The final subscription point which is
            used to identify this particular subscription

**Throws**

- `IOException` - if an I/O error occurs while sending the request
- `ConfException` - If failed to subscribe to the given path
 for some reason

### subscribe(int, ConfNamespace, String, Object[]) <a href="#subscribe-362f9d74bbcb" id="subscribe-362f9d74bbcb"></a>

```java
public int subscribe(
    int priority,
    com.tailf.conf.ConfNamespace ns,
    String fmt,
    Object[] args
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Subscribe to a given path.

  Sets up a CDB subscription so that we are notified when CDB
 configuration data changes. There can be multiple subscription points
 from different sources, that is a single client daemon can have many
 subscriptions and there can be many client daemons.


 Each subscription point is defined through a path similar to the
 paths we use for read operations. We can subscribe either to
 specific leafs or entire subtrees. Subscribing to list entries can
 be done using fully qualified paths, or tagpaths to match multiple
 entries. A path which isn't a leaf element automatically
 matches the subtree below that path. When specifying keys to a
 list entry it is possible to use the wild card character * which will
 match any key value.

 When subscribing to a leaf with a `tailf:default-ref` statement,
 or to a subtree with elements that have `tailf:default-ref`,
 implicit subscriptions to the referred leafs are added.
 This means that a change in a referred leaf will generate a
 notification for the subscription that has referring leaf(s) - but
 currently such a change will not be reported by
  `diffIterate(int,CdbDiffIterate,EnumSet,Object)`.
 Thus to get the new "effective" value of a referring leaf in this
 case, it is necessary to either read the
 value of the leaf with e.g. [`CdbSession#getElem(ConfPath)`](CdbSession.md#getelem-f8219fa65c5d) - or
 to use a
 subscription that includes the referred leafs, and use
 `diffIterate` when a notification for that
 subscription is received.

 Some examples


```
 /hosts
         Means that we subscribe to any changes in the subtree - rooted
         at /hosts. This includes additions or removals of host
         entries as well as changes to already  existing host entries.

 /hosts/host{www}/interfaces/interface{eth0}/ip
         Means we are notified when host www changes its IP address on
         eth0.

 /hosts/host/interfaces/interface/ip
         Means we are notified when any host changes any of its IP
         addresses.

 /hosts/host/interfaces
         Means we are notified when either an interface is
         added/removed or when an individual leaf element in an
         existing interface is changed.
```



  The priority value is an integer. When CDB is changed, the
  change is performed inside a transaction. Either a commit
  operation from the CLI or a candidate-commit operation in
  NETCONF means that the running database is changed.
  These changes occur inside a transaction.

  CDB will handle the subscriptions in lock-step priority order.
  First all subscribers at the lowest priority are handled, once
  they all have replied and synchronized through calls
  to `sync(CdbSubscriptionSyncType)`
  the next set - at the next priority  level is handled by CDB.

  Priority numbers are global, i.e. if there
  are multiple client daemons notifications will still be delivered
  in priority order per all subscriptions, not per daemon.

  See `diffIterate(int,CdbDiffIterate,EnumSet,Object)`
  for ways of filtering  subscription notifications and finding out
  what changed.  The easiest way is though to solely
  rely on the positioning of the subscription points in the tree to
  figure out what changed.

  `subscribe` returns a subscription point
  This integer value is used to identify this particular
  subscription.

  Because there can be many subscriptions on the same socket the
  client must notify when it is done subscribing and ready to receive
  notifications. This is done using [`subscribeDone()`](CdbSubscription.md#subscribedone-4d52aa9e4d50).

**Parameters**

- `int priority` - subscription priority
- `com.tailf.conf.ConfNamespace ns` - namespace
- `String fmt` - subscription path
- `Object[] args` - arguments to be substituted into fmt string

**Returns:** subscription point
         which is used to identify this particular subscription

**Throws**

- `IOException` - if an I/O error occurs while sending the request
- `ConfException` - if the subscription cannot be established

### subscribe(int, int, String, Object[]) <a href="#subscribe-cc3174ab5159" id="subscribe-cc3174ab5159"></a>

```java
public int subscribe(
    int priority,
    int nshash,
    String fmt,
    Object[] args
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Subscribe to given path.

 Sets up a CDB description so that we are notified when CDB changes.
 There can be multiple subscription points from different sources,
 that is a single client daemon can have many subscriptions and there
 can be many client daemons.

 Each  subscription  point  is  defined through a path similar to the
 paths we use for read operations. We can subscribe either to specific
 leaf elements or entire subtrees. Subscribing to YANG list entries can
 be done using fully qualified paths, or tagpaths to match
 multiple list entries. A path which isn't a leaf automatically
 matches the subtree below that path.

 Some examples:


- /hosts - Means that we subscribe to  any  changes  in the subtree  -
 rooted  at  "/hosts".  This includes additions or removals of
 "host" entries as well as changes to already existing  "host"
 entries.

   - /hosts/host{www}/interfaces/interface{eth0}/ip -
 Means we are notified when host www changes its IP address on
 eth0.

     - /hosts/host/interfaces/interface/ip -
 Means we are notified when any host changes  any  of  its  IP
 addresses.

       - /hosts/host/interfaces -
 Means   we   are   notified   when  either  an  interface  is
 added/removed or when an individual leaf in an existing
 interface is changed.


 The priority value is an integer. When CDB is changed, the change is
 performed inside a transaction. Either a commit operation  from  the
 CLI  or  a candidate-commit operation in NETCONF means that the running
 database is changed. These changes occur inside a transaction.
 CDB  will  handle  the  subscriptions in lock-step priority
 order. First all subscribers at the  lowest  priority  are  handled,
 once  they  all  have  replied  and  synchronized  through  calls to
 `sync(CdbSubscriptionSyncType)` the next set - at the
 next  priority
 level  is handled by CDB. Priority numbers are global, i.e. if there
 are multiple client daemons notifications will still be delivered in
 priority order per all subscriptions, not per daemon.

 Operational and configuration subscriptions can be done on
 the same socket, but in that case the notifications may be
 arbitrarily interleaved, including operational notifications
 arriving between different configuration notifications for the
 same transaction. If this is a problem, use separate CdbSubscription
 instances with separate Cdb instances for operational and configuration
 subscriptions.

 See  `diffIterate(int,CdbDiffIterate)` for ways of filtering
 subscription
 notifications and finding out what changed.

**Parameters**

- `int priority` - Subscription priority
- `int nshash` - namespace hash
- `String fmt` - subscription path
- `Object[] args` - arguments to be substituted into fmt string

**Returns:** A subscription point. This integer value is used to
 identify this particular subscription.

**Throws**

- `CdbException` - Failed to subscribe to the specified path
- `IOException` - Failed to read/write cdb socket

### subscribeDone() <a href="#subscribedone-4d52aa9e4d50" id="subscribedone-4d52aa9e4d50"></a>

```java
public void subscribeDone() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Finishing the subscription setup.

 When a client is done registering all its subscriptions on a
 particular subscription socket it must call `subscribeDone`.

 No notifications will be delivered until then.

**Throws**

- `IOException` - if an I/O error occurs while sending the request
- `ConfException` - if ConfD/NCS reports an error completing setup

### sync(CdbSubscriptionSyncType) <a href="#sync-e4ae9cc34a8a" id="sync-e4ae9cc34a8a"></a>

```java
public void sync(
    com.tailf.cdb.CdbSubscriptionSyncType subscriptionSyncType
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#cdbsubscriptionsynctype-adacba3ff512), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Synchronize the subscriber.

 Once we have read the subscription notification through a call to
 [`read()`](CdbSubscription.md#read-b28b830b98d6) and also have acted on the changes to
 CDB, we must synchronize with CDB so that CDB can continue and
 deliver further subscription messages to subscribers with higher
 priority numbers.

  There are three different types of synchronization replies the
 application can use in the subscriptionSyncType parameter:
 see [`CdbSubscriptionSyncType`](CdbSubscriptionSyncType.md#cdbsubscriptionsynctype-adacba3ff512)


 CDB is locked for writing while subscriptions are delivered.

**Parameters**

- `com.tailf.cdb.CdbSubscriptionSyncType subscriptionSyncType` - the type of synchronization to perform

**Throws**

- `CdbException` - Failed to sync
- `IOException` - Failed to read/write cdb socket
