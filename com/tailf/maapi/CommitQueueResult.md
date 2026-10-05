# CommitQueueResult <a href="#commitqueueresult-0daa10abf91a" id="commitqueueresult-0daa10abf91a"></a>

```java
public class com.tailf.maapi.CommitQueueResult
    extends com.tailf.maapi.ApplyResult
```

Types: [ApplyResult](ApplyResult.md#applyresult-77b049ed4f17)

Represents a successful invocation of the
 [`Maapi#applyTransParams(int, boolean, CommitParams)`](Maapi.md#applytransparams-6c20b7896663) method.

 The purpose of this class is to represent the result of a transaction where
 the configuration change for the participating devices has been placed
 in the commit queue.

## Members

**Constructors**:

- [CommitQueueResult\(ConfResponse\)](#commitqueueresult-e7caa08c3f55)

**Methods**:

- [getFailedDevices\(\)](#getfaileddevices-70e71b879fad)
- [getId\(\)](#getid-199a349c70ef)
- [getStatus\(\)](#getstatus-5037266e52a9)
- [getStatusAsString\(\)](#getstatusasstring-6ccae2b57156)

**Nested Types**:

- [Status](CommitQueueResult/Status.md#status-84eaa40b9dbc)

## Constructors

### CommitQueueResult(ConfResponse) <a href="#commitqueueresult-e7caa08c3f55" id="commitqueueresult-e7caa08c3f55"></a>

```java
public CommitQueueResult(
    com.tailf.conf.ConfResponse result
)
    throws com.tailf.maapi.MaapiException, com.tailf.conf.ConfException
```

Types: [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfResponse result`


## Methods

### getFailedDevices() <a href="#getfaileddevices-70e71b879fad" id="getfaileddevices-70e71b879fad"></a>

```java
public java.util.Map<String,String> getFailedDevices()
```

Return the error reason for each failed device.

### getId() <a href="#getid-199a349c70ef" id="getid-199a349c70ef"></a>

```java
public long getId()
```

Return the commit queue id. If the status is
 [`Status#NONE`](CommitQueueResult/Status.md#none-f29411358a7b) this method will return 0.

### getStatus() <a href="#getstatus-5037266e52a9" id="getstatus-5037266e52a9"></a>

```java
public com.tailf.maapi.CommitQueueResult.Status getStatus()
```

Types: [Status](CommitQueueResult/Status.md#status-84eaa40b9dbc)

Return the status of the commit queue item.

 The status could be any of the following:

 [`Status#NONE`](CommitQueueResult/Status.md#none-f29411358a7b) means that no device was
 involved in the transaction.

 [`Status#ASYNC`](CommitQueueResult/Status.md#async-84416e99cf56) means that the transaction has
 successfully placed the configuration change for the participating
 devices in the commit queue.

 [`Status#COMPLETED`](CommitQueueResult/Status.md#completed-a27eb844ceac) means that the queue item
 was successfully completed.

 [`Status#TIMEOUT`](CommitQueueResult/Status.md#timeout-7555a653de51) means that the timer expired
 before the queue item was completed.

 [`Status#DELETED`](CommitQueueResult/Status.md#deleted-dafb9dab21f9) means that queue item was deleted
 from the queue.

 [`Status#FAILED`](CommitQueueResult/Status.md#failed-d300719affb0) means that the queue item failed.
 The [`CommitQueueResult#getFailedDevices()`](CommitQueueResult.md#getfaileddevices-70e71b879fad) method will provide
 the error reason for each failed device.

### getStatusAsString() <a href="#getstatusasstring-6ccae2b57156" id="getstatusasstring-6ccae2b57156"></a>

```java
public String getStatusAsString()
```

Return the status as a string.


## Nested Types

- [Status](CommitQueueResult/Status.md#status-84eaa40b9dbc)
