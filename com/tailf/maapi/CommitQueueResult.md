<a id="cls-CommitQueueResult"></a>
# CommitQueueResult

```java
public class com.tailf.maapi.CommitQueueResult
    extends com.tailf.maapi.ApplyResult
```

Types: [ApplyResult](ApplyResult.md#cls-ApplyResult)

Represents a successful invocation of the
 [`Maapi#applyTransParams(int, boolean, CommitParams)`](Maapi.md#m-applytransparams-6c20b7896663) method.

 The purpose of this class is to represent the result of a transaction where
 the configuration change for the participating devices has been placed
 in the commit queue.

## Members

**Constructors**:

- [CommitQueueResult(ConfResponse)](#m-commitqueueresult-e7caa08c3f55)

**Methods**:

- [getFailedDevices()](#m-getfaileddevices-70e71b879fad)
- [getId()](#m-getid-199a349c70ef)
- [getStatus()](#m-getstatus-5037266e52a9)
- [getStatusAsString()](#m-getstatusasstring-6ccae2b57156)

**Nested Types**:

- [Status](CommitQueueResult/Status.md#cls-Status)

## Constructors

<a id="m-commitqueueresult-e7caa08c3f55"></a>
### CommitQueueResult(ConfResponse)

```java
public CommitQueueResult(
    com.tailf.conf.ConfResponse result
)
    throws com.tailf.maapi.MaapiException, com.tailf.conf.ConfException
```

Types: [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse), [MaapiException](MaapiException.md#cls-MaapiException), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfResponse result`


## Methods

<a id="m-getfaileddevices-70e71b879fad"></a>
### getFailedDevices()

```java
public java.util.Map<String,String> getFailedDevices()
```

Return the error reason for each failed device.

<a id="m-getid-199a349c70ef"></a>
### getId()

```java
public long getId()
```

Return the commit queue id. If the status is
 [`Status#NONE`](CommitQueueResult/Status.md#m-NONE) this method will return 0.

<a id="m-getstatus-5037266e52a9"></a>
### getStatus()

```java
public com.tailf.maapi.CommitQueueResult.Status getStatus()
```

Types: [Status](CommitQueueResult/Status.md#cls-Status)

Return the status of the commit queue item.

 The status could be any of the following:

 [`Status#NONE`](CommitQueueResult/Status.md#m-NONE) means that no device was
 involved in the transaction.

 [`Status#ASYNC`](CommitQueueResult/Status.md#m-ASYNC) means that the transaction has
 successfully placed the configuration change for the participating
 devices in the commit queue.

 [`Status#COMPLETED`](CommitQueueResult/Status.md#m-COMPLETED) means that the queue item
 was successfully completed.

 [`Status#TIMEOUT`](CommitQueueResult/Status.md#m-TIMEOUT) means that the timer expired
 before the queue item was completed.

 [`Status#DELETED`](CommitQueueResult/Status.md#m-DELETED) means that queue item was deleted
 from the queue.

 [`Status#FAILED`](CommitQueueResult/Status.md#m-FAILED) means that the queue item failed.
 The [`CommitQueueResult#getFailedDevices()`](CommitQueueResult.md#m-getfaileddevices-70e71b879fad) method will provide
 the error reason for each failed device.

<a id="m-getstatusasstring-6ccae2b57156"></a>
### getStatusAsString()

```java
public String getStatusAsString()
```

Return the status as a string.


## Nested Types

- [Status](CommitQueueResult/Status.md#cls-Status)
