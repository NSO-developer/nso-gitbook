<a id="s-CdbSubscription"></a>
# CdbSubscription

```java
public class com.tailf.cdb.CdbSubscription
    implements com.tailf.conf.MountIdInterface
```

Types: [MountIdInterface](../conf/MountIdInterface.md#s-MountIdInterface)

This class provides subscription functionality to CDB.

 The subscription functionality makes it possible to receive
 events/notifications of *CDB* configuration/operational
 changes. Subscriptions are always towards the running
 datastore (it is not possible to subscribe to changes to the
 startup datastore). Subscriptions towards the operational data kept
 in CDB are also possible, but the mechanism is slightly different.

 Subscription to configuration or operational
 data is specified with the [`CdbSubscriptionType`](CdbSubscriptionType.md#s-CdbSubscriptionType) type.

 To subscribe to a particular path the
 [`CdbSubscriptionType`](CdbSubscriptionType.md#s-CdbSubscriptionType)
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
   `#read()` it will receive points that was affected by a transaction
   and it can iterate through the changes that caused the
   particular subscription notification using the `diffIterate`
   method. It is also possible to start a new read-session to
   the `CDB_PRE_COMMIT_RUNNING` database to read the
   running database as it was before the pending transaction.
- Once we have read the subscription notification through a call to
 `read` and optionally used the `diffIterate`
 to iterate through the changes as well as acted on the changes to *CDB*,
 we must synchronize [`CdbSubscriptionSyncType`](CdbSubscriptionSyncType.md#s-CdbSubscriptionSyncType)  with
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

- [CdbSubscription(Cdb)](#s-CdbSubscription-1)

**Methods**:

- [abortTransaction(CdbExtendedException)](#s-abortTransaction)
- [acceptTagPath()](#s-acceptTagPath)
- [diffIterate(int, CdbDiffIterate)](#s-diffIterate)
- [diffIterate(int, CdbDiffIterate, EnumSet<DiffIterateFlags>, Object)](#s-diffIterate-1)
- [getCdb()](#s-getCdb)
- [getFlags()](#s-getFlags)
- [getLatestNotificationType()](#s-getLatestNotificationType)
- [getModifications(EnumSet<CdbGetModificationFlag>)](#s-getModifications)
- [getModifications(int, EnumSet<CdbGetModificationFlag>, ConfPath)](#s-getModifications-1)
- [getModifications(int, EnumSet<CdbGetModificationFlag>, String, Object[])](#s-getModifications-2)
- [getModificationsCLI(int)](#s-getModificationsCLI)
- [getModificationsCLI(int, int)](#s-getModificationsCLI-1)
- [getMountId(ConfPath)](#s-getMountId)
- [getUserSession()](#s-getUserSession)
- [read()](#s-read)
- [setMandatory(String)](#s-setMandatory)
- [subscribe(CdbSubscriptionType, EnumSet<CdbSubscrConfigFlag>, int, ConfNamespace, String, Object[])](#s-subscribe)
- [subscribe(CdbSubscriptionType, EnumSet<CdbSubscrConfigFlag>, int, int, String, Object[])](#s-subscribe-1)
- [subscribe(CdbSubscriptionType, int, ConfNamespace, String, Object[])](#s-subscribe-2)
- [subscribe(CdbSubscriptionType, int, int, String, Object[])](#s-subscribe-3)
- [subscribe(int, ConfNamespace, String, Object[])](#s-subscribe-4)
- [subscribe(int, int, String, Object[])](#s-subscribe-5)
- [subscribeDone()](#s-subscribeDone)
- [sync(CdbSubscriptionSyncType)](#s-sync)

## Constructors

<a id="s-CdbSubscription-1"></a>
### CdbSubscription(Cdb)

```java
public CdbSubscription(com.tailf.cdb.Cdb cdb)
```

Types: [Cdb](Cdb.md#s-Cdb)

Creates a CDB subscription instance, with the specified
 `Cdb` socket.

**Parameters**

- `com.tailf.cdb.Cdb cdb` - A cdb instance connected to ConfD/NCS


## Methods

<a id="s-abortTransaction"></a>
### abortTransaction(CdbExtendedException)

```java
public void abortTransaction(
    com.tailf.cdb.CdbExtendedException ex
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbExtendedException](CdbExtendedException.md#s-CdbExtendedException), [ConfException](../conf/ConfException.md#s-ConfException)

Abort the transaction.

  This method is used when a two phase subscriber wishes to abort an
 transaction (the opposite to acknowledge it with
 [`CdbSubscriptionSyncType`](CdbSubscriptionSyncType.md#s-CdbSubscriptionSyncType)).

 The `abortTransaction` call is only valid for notifications with
 notificationType [`CdbNotificationType`](CdbNotificationType.md#s-CdbNotificationType).


 The subscriber is required to supply an instance of the
 [`CdbExtendedException`](CdbExtendedException.md#s-CdbExtendedException) which will be used to notify the clients on
 the reason for the transaction abort.

**Parameters**

- `com.tailf.cdb.CdbExtendedException ex` - [`CdbExtendedException`](CdbExtendedException.md#s-CdbExtendedException) carrying application specific
        error info supplied by the subscriber

**Throws**

- `ConfException` - if the abort cannot be processed by ConfD/NCS
- `IOException` - if an I/O error occurs while communicating with the
         server

<a id="s-acceptTagPath"></a>
### acceptTagPath()

```java
public boolean acceptTagPath()
```

<a id="s-diffIterate"></a>
### diffIterate(int, CdbDiffIterate)

```java
public void diffIterate(
    int subid,
    com.tailf.cdb.CdbDiffIterate iter
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [CdbDiffIterate](CdbDiffIterate.md#s-CdbDiffIterate), [ConfException](../conf/ConfException.md#s-ConfException)

Iterate over changes made in CDB.

 After reading the subscription socket the `diffIterate`
 method can be used to iterate over the changes made in CDB  that
 matched the particular `subid`.

 The supplied user implementation of the
 [`CdbDiffIterate`](CdbDiffIterate.md#s-CdbDiffIterate) , `iter` corresponding
 method
 [`CdbDiffIterate`](CdbDiffIterate.md#s-CdbDiffIterate) will be invoked by the library
 for each element that has been modified and matches the subscription.

 The `iterate` callback receives an `ConfObject[]`
  `kp` array (reversed keypath) which uniquely identifies
 which node in the data tree that has been affected, the operation,
 and optionally the values it has before and after the transaction
 [`DiffIterateFlags`](../conf/DiffIterateFlags.md#s-DiffIterateFlags).

 A modification op [`DiffIterateOperFlag`](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag) is
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
 [`DiffIterateFlags`](../conf/DiffIterateFlags.md#s-DiffIterateFlags) is passed to
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
 [`CdbDBType`](CdbDBType.md#s-CdbDBType) that holds "old"
 operational data.


 If `iterate` returns
 [`DiffIterateResultFlag`](../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag),
 no more iteration is done, is returned.

 If `iterate` returns
 [`DiffIterateResultFlag`](../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag)
 iteration continues with all children to the node.


 If `iterate` returns
 [`DiffIterateResultFlag`](../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag)
 iteration ignores the children to the node (if any), and continues
 with the node's sibling.

  This version sends passes `ITER_WANT_PREV` as default.
 If the ITER_WANT_PREV is not desired or additional flags is require use
 [`CdbDiffIterate`](CdbDiffIterate.md#s-CdbDiffIterate)

**Parameters**

- `int subid` - Subscription identifier point
- `com.tailf.cdb.CdbDiffIterate iter` - A User implementation `CdbDiffIterate` interface.

**Throws**

- `CdbException` - Failed to diff iterate
- `IOException` - Failed to read/write cdb socket

<a id="s-diffIterate-1"></a>
### diffIterate(int, CdbDiffIterate, EnumSet<DiffIterateFlags>, Object)

```java
public void diffIterate(
    int subid,
    com.tailf.cdb.CdbDiffIterate iter,
    java.util.EnumSet<com.tailf.conf.DiffIterateFlags> flags,
    Object initstate
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [CdbDiffIterate](CdbDiffIterate.md#s-CdbDiffIterate), [DiffIterateFlags](../conf/DiffIterateFlags.md#s-DiffIterateFlags), [ConfException](../conf/ConfException.md#s-ConfException)

Iterate over changes made in CDB with additional supplied flags.

 After reading the subscription socket the `diffIterate`
 method can be used to iterate over the changes made in CDB  that
 matched the particular `subid`.

 The supplied user implementation of the
 [`CdbDiffIterate`](CdbDiffIterate.md#s-CdbDiffIterate) interface, `iter` corresponding
 method
 [`CdbDiffIterate`](CdbDiffIterate.md#s-CdbDiffIterate) will be invoked by the library
 for each element that has been modified and matches the subscription.

 The `iterate` callback receives an `ConfObject[]`
 `kp` array (reversed keypath) which uniquely identifies
 which node in the data tree that has been affected, the operation,
 and optionally the values it has before (old value) and after the
 transaction ( new value ) [`DiffIterateFlags`](../conf/DiffIterateFlags.md#s-DiffIterateFlags).

 A modification op [`DiffIterateOperFlag`](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag) is
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
 [`DiffIterateFlags`](../conf/DiffIterateFlags.md#s-DiffIterateFlags) is passed to
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
 [`CdbDBType`](CdbDBType.md#s-CdbDBType) that holds "old"
 operational data.


 If `iterate` returns
 [`DiffIterateResultFlag`](../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag),
 no more iteration is done, is returned.

 If `iterate` returns
 [`DiffIterateResultFlag`](../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag)
 iteration continues with all children to the node.


 If `iterate` returns
 [`DiffIterateResultFlag`](../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag)
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

<a id="s-getCdb"></a>
### getCdb()

```java
public com.tailf.cdb.Cdb getCdb()
```

Types: [Cdb](Cdb.md#s-Cdb)

<a id="s-getFlags"></a>
### getFlags()

```java
public java.util.EnumSet<com.tailf.cdb.CdbSubscriptionFlagType> getFlags()
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#s-CdbSubscriptionFlagType)

Returns an `EnumSet<CdbSubscriptionFlagType>` of current
 flags for this subscription.

**Returns:** `EnumSet<CdbSubscriptionFlagType>`

<a id="s-getLatestNotificationType"></a>
### getLatestNotificationType()

```java
public com.tailf.cdb.CdbNotificationType getLatestNotificationType()
```

Types: [CdbNotificationType](CdbNotificationType.md#s-CdbNotificationType)

Retrieve the latest notification type.

 Each notification retrieved by the `#read()` method has a
 notificationType.

 This method retrieves the notification type from  the latest
 `read` call.


 If no `read` call has been performed then this method
 returns null.

**Returns:** notificationType or null if not applicable

<a id="s-getModifications"></a>
### getModifications(EnumSet<CdbGetModificationFlag>)

```java
public java.util.List<com.tailf.conf.ConfXMLParam> getModifications(
    java.util.EnumSet<com.tailf.cdb.CdbGetModificationFlag> flags
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [CdbGetModificationFlag](CdbGetModificationFlag.md#s-CdbGetModificationFlag), [ConfException](../conf/ConfException.md#s-ConfException)

Retrieve changes that caused by subscription notification.

 Convenient short-hand of the
 [`ConfPath`](../conf/ConfPath.md#s-ConfPath)
 method intended to be used from within a iteration started by
 [`CdbDiffIterate`](CdbDiffIterate.md#s-CdbDiffIterate).

 In this case no subscription id is needed, and the path is implicitly
 the current position in the iteration.

 Combining this call with `diffIterate` makes it for
 example possible to iterate over a list, and for each list instance
 fetch the changes using `getModifications`, and then return
 [`DiffIterateResultFlag`](../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag) to process
 next instance.

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbGetModificationFlag> flags` - selection flags controlling which modifications are returned

**Returns:** list of XML params describing the modifications

**Throws**

- `ConfException` - if the server reports an error retrieving changes
- `IOException` - if an I/O error occurs while communicating with the
         server

**See also:** `#getModifications(int,EnumSet,ConfPath)`

<a id="s-getModifications-1"></a>
### getModifications(int, EnumSet<CdbGetModificationFlag>, ConfPath)

```java
public java.util.List<com.tailf.conf.ConfXMLParam> getModifications(
    int subid,
    java.util.EnumSet<com.tailf.cdb.CdbGetModificationFlag> flags,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [CdbGetModificationFlag](CdbGetModificationFlag.md#s-CdbGetModificationFlag), [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

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
        [`ConfNoExists`](../conf/ConfNoExists.md#s-ConfNoExists), and when it is created
        it has the value [`ConfXMLParamLeaf`](../conf/ConfXMLParamLeaf.md#s-ConfXMLParamLeaf).
- A leaf or a leaf-list that has been set to a new value
      (or its default value) is included with that new value.
      If the leaf or leaf-list is optional, then when
      it is deleted the value is [`ConfNoExists`](../conf/ConfNoExists.md#s-ConfNoExists).
- Presence containers are included when they are created or when
      they have modifications below them (by the usual
      [`ConfXMLParamStart`](../conf/ConfXMLParamStart.md#s-ConfXMLParamStart),
      [`ConfXMLParamStop`](../conf/ConfXMLParamStop.md#s-ConfXMLParamStop) pair). If a presence
       container have been deleted its tag is included, but is set to
       [`ConfNoExists`](../conf/ConfNoExists.md#s-ConfNoExists).

**Parameters**

- `int subid` - subscription id
- `java.util.EnumSet<com.tailf.cdb.CdbGetModificationFlag> flags` - enumset of CdbGetModificationFlag
- `com.tailf.conf.ConfPath path` - optional path to limit what is returned

**Returns:** the modifications for the specified subscription

**Throws**

- `ConfException` - if the server reports an error retrieving changes
- `IOException` - if an I/O error occurs while communicating with the
         server

<a id="s-getModifications-2"></a>
### getModifications(int, EnumSet<CdbGetModificationFlag>, String, Object[])

```java
public java.util.List<com.tailf.conf.ConfXMLParam> getModifications(
    int subid,
    java.util.EnumSet<com.tailf.cdb.CdbGetModificationFlag> flags,
    String fmt,
    Object[] args
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [CdbGetModificationFlag](CdbGetModificationFlag.md#s-CdbGetModificationFlag), [ConfException](../conf/ConfException.md#s-ConfException)

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
        [`ConfNoExists`](../conf/ConfNoExists.md#s-ConfNoExists), and when it is created
        it has the value [`ConfXMLParamLeaf`](../conf/ConfXMLParamLeaf.md#s-ConfXMLParamLeaf).
- A leaf or a leaf-list that has been set to a new value
      (or its default value) is included with that new value.
      If the leaf or leaf-list is optional, then when
      it is deleted the value is [`ConfNoExists`](../conf/ConfNoExists.md#s-ConfNoExists).
- Presence containers are included when they are created or when
      they have modifications below them (by the usual
      [`ConfXMLParamStart`](../conf/ConfXMLParamStart.md#s-ConfXMLParamStart),
      [`ConfXMLParamStop`](../conf/ConfXMLParamStop.md#s-ConfXMLParamStop) pair). If a presence
       container have been deleted its tag is included, but is set to
       [`ConfNoExists`](../conf/ConfNoExists.md#s-ConfNoExists).

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

<a id="s-getModificationsCLI"></a>
### getModificationsCLI(int)

```java
public String getModificationsCLI(
    int subid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Return a string with the CLI commands that corresponds to the
 changes that triggered subscription.

**Parameters**

- `int subid` - subscription id

**Returns:** CLI representation of the modifications

**Throws**

- `IOException` - if an I/O error occurs while communicating with the
         server
- `ConfException` - if the server reports an error producing CLI data

**See also:** [`getModificationsCLI(int, int)`](CdbSubscription.md#s-getModificationsCLI-1)

<a id="s-getModificationsCLI-1"></a>
### getModificationsCLI(int, int)

```java
public String getModificationsCLI(
    int subid,
    int flags
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

CLI string that corresponds to the changes that triggered subscription.

**Parameters**

- `int subid` - subscription id
- `int flags` - formatting/control flags

**Returns:** CLI representation of the modifications

**Throws**

- `IOException` - if an I/O error occurs while communicating with the
         server
- `ConfException` - if the server reports an error producing CLI data

<a id="s-getMountId"></a>
### getMountId(ConfPath)

```java
public java.util.List<String> getMountId(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfPath path`

<a id="s-getUserSession"></a>
### getUserSession()

```java
public long getUserSession() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Retrieve the user session id associated with this subscription socket.

**Returns:** user session id

**Throws**

- `ConfException` - if the ConfD/NCS server reports an error
- `IOException` - if an I/O error occurs while communicating with the
         server

<a id="s-read"></a>
### read()

```java
public int[] read() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Reads the Cdb subscription socket for events and blocks.

 The triggering notification is of a type.
 This information in important in two-phase subscriptions.
 The notificationType can be retrieved using
 `#getLatestNotificationType()`

**Returns:** the subscription points that triggered a change

**Throws**

- `CdbException` - Failed to read.
- `IOException` - Failed to read/write cdb socket

<a id="s-setMandatory"></a>
### setMandatory(String)

```java
public void setMandatory(
    String mandatoryName
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-subscribe"></a>
### subscribe(CdbSubscriptionType, EnumSet<CdbSubscrConfigFlag>, int, ConfNamespace, String, Object[])

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

Types: [CdbSubscriptionType](CdbSubscriptionType.md#s-CdbSubscriptionType), [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#s-CdbSubscrConfigFlag), [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace), [ConfException](../conf/ConfException.md#s-ConfException)

Subscribe to a path.

 Same as the
 [`CdbSubscriptionType`](CdbSubscriptionType.md#s-CdbSubscriptionType)
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

<a id="s-subscribe-1"></a>
### subscribe(CdbSubscriptionType, EnumSet<CdbSubscrConfigFlag>, int, int, String, Object[])

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

Types: [CdbSubscriptionType](CdbSubscriptionType.md#s-CdbSubscriptionType), [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#s-CdbSubscrConfigFlag), [ConfException](../conf/ConfException.md#s-ConfException)

Subscribe to a path.

 Same as the
 [`CdbSubscriptionType`](CdbSubscriptionType.md#s-CdbSubscriptionType)
 with the addition of the flags parameter which is an EnumSet of
 configuration flags for the subscription see [`CdbSubscrConfigFlag`](CdbSubscrConfigFlag.md#s-CdbSubscrConfigFlag)

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

<a id="s-subscribe-2"></a>
### subscribe(CdbSubscriptionType, int, ConfNamespace, String, Object[])

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

Types: [CdbSubscriptionType](CdbSubscriptionType.md#s-CdbSubscriptionType), [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace), [ConfException](../conf/ConfException.md#s-ConfException)

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
 [`CdbDiffIterate`](CdbDiffIterate.md#s-CdbDiffIterate).
 Thus to get the new "effective" value of a referring leaf in this
 case, it is necessary to either read the
 value of the leaf with e.g. [`CdbSession`](CdbSession.md#s-CdbSession) -
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
  to [`CdbSubscriptionSyncType`](CdbSubscriptionSyncType.md#s-CdbSubscriptionSyncType)
  the next set - at the next priority  level is handled by CDB.

  Priority numbers are global, i.e. if there
  are multiple client daemons notifications will still be delivered
  in priority order per all subscriptions, not per daemon.

  See [`CdbDiffIterate`](CdbDiffIterate.md#s-CdbDiffIterate)
  for ways of filtering  subscription notifications and finding out
  what changed.  The easiest way is though to solely
  rely on the positioning of the subscription points in the tree to
  figure out what changed.

  `subscribe` returns a subscription point
  This integer value is used to identify this particular
  subscription.

  Because there can be many subscriptions on the same socket the
  client must notify when it is done subscribing and ready to receive
  notifications. This is done using `#subscribeDone()`.

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

<a id="s-subscribe-3"></a>
### subscribe(CdbSubscriptionType, int, int, String, Object[])

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

Types: [CdbSubscriptionType](CdbSubscriptionType.md#s-CdbSubscriptionType), [ConfException](../conf/ConfException.md#s-ConfException)

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
 [`CdbDiffIterate`](CdbDiffIterate.md#s-CdbDiffIterate).
 Thus to get the new "effective" value of a referring leaf in this
 case, it is necessary to either read the
 value of the leaf with e.g. [`CdbSession`](CdbSession.md#s-CdbSession) -
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
  to [`CdbSubscriptionSyncType`](CdbSubscriptionSyncType.md#s-CdbSubscriptionSyncType)
  the next set - at the next priority  level is handled by CDB.

  Priority numbers are global, i.e. if there
  are multiple client daemons notifications will still be delivered
  in priority order per all subscriptions, not per daemon.

  See [`CdbDiffIterate`](CdbDiffIterate.md#s-CdbDiffIterate)
  for ways of filtering  subscription notifications and finding out
  what changed.  The easiest way is though to solely
  rely on the positioning of the subscription points in the tree to
  figure out what changed.

  `subscribe` returns a subscription point
  This integer value is used to identify this particular
  subscription.

  Because there can be many subscriptions on the same socket the
  client must notify when it is done subscribing and ready to receive
  notifications. This is done using `#subscribeDone()`.

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

<a id="s-subscribe-4"></a>
### subscribe(int, ConfNamespace, String, Object[])

```java
public int subscribe(
    int priority,
    com.tailf.conf.ConfNamespace ns,
    String fmt,
    Object[] args
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace), [ConfException](../conf/ConfException.md#s-ConfException)

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
  [`CdbDiffIterate`](CdbDiffIterate.md#s-CdbDiffIterate).
 Thus to get the new "effective" value of a referring leaf in this
 case, it is necessary to either read the
 value of the leaf with e.g. [`CdbSession`](CdbSession.md#s-CdbSession) - or
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
  to [`CdbSubscriptionSyncType`](CdbSubscriptionSyncType.md#s-CdbSubscriptionSyncType)
  the next set - at the next priority  level is handled by CDB.

  Priority numbers are global, i.e. if there
  are multiple client daemons notifications will still be delivered
  in priority order per all subscriptions, not per daemon.

  See [`CdbDiffIterate`](CdbDiffIterate.md#s-CdbDiffIterate)
  for ways of filtering  subscription notifications and finding out
  what changed.  The easiest way is though to solely
  rely on the positioning of the subscription points in the tree to
  figure out what changed.

  `subscribe` returns a subscription point
  This integer value is used to identify this particular
  subscription.

  Because there can be many subscriptions on the same socket the
  client must notify when it is done subscribing and ready to receive
  notifications. This is done using `#subscribeDone()`.

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

<a id="s-subscribe-5"></a>
### subscribe(int, int, String, Object[])

```java
public int subscribe(
    int priority,
    int nshash,
    String fmt,
    Object[] args
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

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
 [`CdbSubscriptionSyncType`](CdbSubscriptionSyncType.md#s-CdbSubscriptionSyncType) the next set - at the
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

 See  [`CdbDiffIterate`](CdbDiffIterate.md#s-CdbDiffIterate) for ways of filtering
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

<a id="s-subscribeDone"></a>
### subscribeDone()

```java
public void subscribeDone() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Finishing the subscription setup.

 When a client is done registering all its subscriptions on a
 particular subscription socket it must call `subscribeDone`.

 No notifications will be delivered until then.

**Throws**

- `IOException` - if an I/O error occurs while sending the request
- `ConfException` - if ConfD/NCS reports an error completing setup

<a id="s-sync"></a>
### sync(CdbSubscriptionSyncType)

```java
public void sync(
    com.tailf.cdb.CdbSubscriptionSyncType subscriptionSyncType
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#s-CdbSubscriptionSyncType), [ConfException](../conf/ConfException.md#s-ConfException)

Synchronize the subscriber.

 Once we have read the subscription notification through a call to
 `#read()` and also have acted on the changes to
 CDB, we must synchronize with CDB so that CDB can continue and
 deliver further subscription messages to subscribers with higher
 priority numbers.

  There are three different types of synchronization replies the
 application can use in the subscriptionSyncType parameter:
 see [`CdbSubscriptionSyncType`](CdbSubscriptionSyncType.md#s-CdbSubscriptionSyncType)


 CDB is locked for writing while subscriptions are delivered.

**Parameters**

- `com.tailf.cdb.CdbSubscriptionSyncType subscriptionSyncType` - the type of synchronization to perform

**Throws**

- `CdbException` - Failed to sync
- `IOException` - Failed to read/write cdb socket
