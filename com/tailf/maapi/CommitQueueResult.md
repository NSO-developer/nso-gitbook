<a id="s-CommitQueueResult"></a>
# CommitQueueResult

```java
public class com.tailf.maapi.CommitQueueResult
    extends com.tailf.maapi.ApplyResult
```

Types: [ApplyResult](ApplyResult.md#s-ApplyResult)

Represents a successful invocation of the
 [`Maapi`](Maapi.md#s-Maapi) method.

 The purpose of this class is to represent the result of a transaction where
 the configuration change for the participating devices has been placed
 in the commit queue.

## Members

**Constructors**:

- [CommitQueueResult(ConfResponse)](#s-CommitQueueResult-1)

**Methods**:

- [getFailedDevices()](#s-getFailedDevices)
- [getId()](#s-getId)
- [getStatus()](#s-getStatus)
- [getStatusAsString()](#s-getStatusAsString)

**Nested Types**:

- [Status](CommitQueueResult/Status.md#s-Status)

## Constructors

<a id="s-CommitQueueResult-1"></a>
### CommitQueueResult(ConfResponse)

```java
public CommitQueueResult(
    com.tailf.conf.ConfResponse result
)
    throws com.tailf.maapi.MaapiException, com.tailf.conf.ConfException
```

Types: [ConfResponse](../conf/ConfResponse.md#s-ConfResponse), [MaapiException](MaapiException.md#s-MaapiException), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfResponse result`


## Methods

<a id="s-getFailedDevices"></a>
### getFailedDevices()

```java
public java.util.Map<String,String> getFailedDevices()
```

Return the error reason for each failed device.

<a id="s-getId"></a>
### getId()

```java
public long getId()
```

Return the commit queue id. If the status is
 [`Status`](CommitQueueResult/Status.md#s-Status) this method will return 0.

<a id="s-getStatus"></a>
### getStatus()

```java
public com.tailf.maapi.CommitQueueResult.Status getStatus()
```

Types: [Status](CommitQueueResult/Status.md#s-Status)

Return the status of the commit queue item.

 The status could be any of the following:

 [`Status`](CommitQueueResult/Status.md#s-Status) means that no device was
 involved in the transaction.

 [`Status`](CommitQueueResult/Status.md#s-Status) means that the transaction has
 successfully placed the configuration change for the participating
 devices in the commit queue.

 [`Status`](CommitQueueResult/Status.md#s-Status) means that the queue item
 was successfully completed.

 [`Status`](CommitQueueResult/Status.md#s-Status) means that the timer expired
 before the queue item was completed.

 [`Status`](CommitQueueResult/Status.md#s-Status) means that queue item was deleted
 from the queue.

 [`Status`](CommitQueueResult/Status.md#s-Status) means that the queue item failed.
 The [`CommitQueueResult`](CommitQueueResult.md#s-CommitQueueResult) method will provide
 the error reason for each failed device.

<a id="s-getStatusAsString"></a>
### getStatusAsString()

```java
public String getStatusAsString()
```

Return the status as a string.


## Nested Types

- [Status](CommitQueueResult/Status.md)
