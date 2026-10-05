<a id="cls-DpTrans"></a>
# DpTrans

```java
public class com.tailf.dp.DpTrans
    extends Thread
```

The transaction context.
 Each transaction is running in separate thread.

**Related classes**

- [DpActionTrans](DpActionTrans.md#cls-DpActionTrans)
- [DpValidateTrans](DpValidateTrans.md#cls-DpValidateTrans)

**See also:** [`DpTransCallback`](DpTransCallback.md#cls-DpTransCallback), [`DpDataCallback`](DpDataCallback.md#cls-DpDataCallback)

## Members

**Constructors**:

- [DpTrans()](#m-dptrans-e828adde331b)
- [DpTrans(Dp, int, int, int, int, int, DpUserInfo)](#m-dptrans-d3592aa18486)
- [DpTrans(Dp, int, int, int, int, int, DpUserInfo, boolean)](#m-dptrans-f65e37999f51)

**Fields**:

- [dp](#m-dp)
- [index](#m-index)
- [lastDid](#m-lastDid)
- [lastOp](#m-lastOp)
- [lastProtoOp](#m-lastProtoOp)
- [lastQref](#m-lastQref)
- [opaque](#m-opaque)
- [socket](#m-socket)
- [stop](#m-stop)
- [thandle](#m-thandle)
- [uinfo](#m-uinfo)

**Methods**:

- [accumulated()](#m-accumulated-2f58da3048dd)
- [dataSetTimeout(int)](#m-datasettimeout-8ad3068e3a46)
- [getDBName()](#m-getdbname-65ff0bdb2339)
- [getDeviceType()](#m-getdevicetype-c8eec3b01523)
- [getDevNo()](#m-getdevno-b1169ef876ed)
- [getDp()](#m-getdp-b1462199cc2e)
- [getMode()](#m-getmode-c3dc73476e30)
- [getNsList()](#m-getnslist-0345f486e876)
- [getOpaque()](#m-getopaque-92e4945ec92d)
- [getSecondaryIndex()](#m-getsecondaryindex-8efa1ee57e9c)
- [getSocket()](#m-getsocket-d7da2de81b81)
- [getTransaction()](#m-gettransaction-4f1c72a828a1)
- [getTransactionUserOpaque()](#m-gettransactionuseropaque-87a9bf7a20e1)
- [getUserInfo()](#m-getuserinfo-3ecef1f24d3d)
- [getWorkerSocket()](#m-getworkersocket-ba1472e0f5a7)
- [honorFilter(boolean)](#m-honorfilter-5ff04bbbf2d0)
- [isHideInactive()](#m-ishideinactive-1d32c2838395)
- [protoReply(boolean)](#m-protoreply-e8de0386a2d0)
- [protoReply(ConfEObject)](#m-protoreply-47f22a8227a5)
- [protoReply(ConfObject)](#m-protoreply-3ecaf76eaab8)
- [protoReply(ConfObject[])](#m-protoreply-cee1bb25672e)
- [protoReplyXMLParam(ConfXMLParam[])](#m-protoreplyxmlparam-9dcf8f14a8dc)
- [replyError(ConfEObject)](#m-replyerror-3184cd2ad634)
- [replyError(String)](#m-replyerror-48c78d28e991)
- [replyError(String, Throwable)](#m-replyerror-c4e21f52074d)
- [replyError(Throwable)](#m-replyerror-26f4ce830453)
- [replyExtendedError(String, DpCallbackExtendedException)](#m-replyextendederror-b54351b1555f)
- [replyOther(boolean, String, String)](#m-replyother-c2352ec6bb73)
- [run()](#m-run-b6dbda048863)
- [setSocket(Socket)](#m-setsocket-183068848e4c)
- [setTransactionUserOpaque(Object)](#m-settransactionuseropaque-ce392ad59d2e)
- [transReplyOK()](#m-transreplyok-92425e2f5c67)

## Constructors

<a id="m-dptrans-e828adde331b"></a>
### DpTrans()

**Package-private**

```java
DpTrans()
```

Constructor.

<a id="m-dptrans-d3592aa18486"></a>
### DpTrans(Dp, int, int, int, int, int, DpUserInfo)

**Package-private**

```java
DpTrans(
    com.tailf.dp.Dp dp,
    int thandle,
    int qref,
    int mode,
    int dbname,
    int op,
    com.tailf.dp.DpUserInfo uinfo
)
```

Types: [Dp](Dp.md#cls-Dp), [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)

Lots of parameters here. But since only Dp should be allowed to
 create the transaction there's no need to do anything about it.

**Parameters**

- `com.tailf.dp.Dp dp`
- `int thandle`
- `int qref`
- `int mode`
- `int dbname`
- `int op`
- `com.tailf.dp.DpUserInfo uinfo`

<a id="m-dptrans-f65e37999f51"></a>
### DpTrans(Dp, int, int, int, int, int, DpUserInfo, boolean)

**Package-private**

```java
DpTrans(
    com.tailf.dp.Dp dp,
    int thandle,
    int qref,
    int mode,
    int dbname,
    int op,
    com.tailf.dp.DpUserInfo uinfo,
    boolean hideInactive
)
```

Types: [Dp](Dp.md#cls-Dp), [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)

**Parameters**

- `com.tailf.dp.Dp dp`
- `int thandle`
- `int qref`
- `int mode`
- `int dbname`
- `int op`
- `com.tailf.dp.DpUserInfo uinfo`
- `boolean hideInactive`


## Fields

<a id="m-dp"></a>
### dp

```java
protected com.tailf.dp.Dp dp = null;
```

Types: [Dp](Dp.md#cls-Dp)

<a id="m-index"></a>
### index

```java
protected int index = null;
```

<a id="m-lastDid"></a>
### lastDid

```java
protected int lastDid = null;
```

<a id="m-lastOp"></a>
### lastOp

```java
protected int lastOp = null;
```

<a id="m-lastProtoOp"></a>
### lastProtoOp

```java
protected int lastProtoOp = null;
```

<a id="m-lastQref"></a>
### lastQref

```java
protected int lastQref = null;
```

<a id="m-opaque"></a>
### opaque

```java
protected String opaque = null;
```

<a id="m-socket"></a>
### socket

```java
protected java.net.Socket socket = null;
```

<a id="m-stop"></a>
### stop

```java
protected boolean stop = null;
```

<a id="m-thandle"></a>
### thandle

```java
protected int thandle = null;
```

<a id="m-uinfo"></a>
### uinfo

```java
protected com.tailf.dp.DpUserInfo uinfo = null;
```

Types: [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)


## Methods

<a id="m-accumulated-2f58da3048dd"></a>
### accumulated()

```java
public java.util.Iterator<com.tailf.dp.DpAccumulate> accumulated()
```

Types: [DpAccumulate](DpAccumulate.md#cls-DpAccumulate)

Returns an iterator for the accumulated
 objects.

<a id="m-datasettimeout-8ad3068e3a46"></a>
### dataSetTimeout(int)

```java
public void dataSetTimeout(
    int timeoutSeconds
)
    throws java.io.IOException, com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

A data callback should normally complete "quickly", since e.g. the
 execution of a show command in the CLI may require many data callback
 invocations. Thus it should be possible to set the
 /ncs-config/api/action-timeout in ncs.conf such that it
 covers the longest possible execution time for any data callback. In
 some rare cases it may still be necessary for a data callback to have a
 longer execution time, and then this function can be used to extend (or
 shorten) the timeout for the current callback invocation. The timeout
 is given in seconds from the point in time when the function is called.

**Parameters**

- `int timeoutSeconds` - timeout in seconds

**Throws**

- `IOException`
- `DpCallbackException`

<a id="m-getdbname-65ff0bdb2339"></a>
### getDBName()

```java
public int getDBName()
```

The database name.

 Is always either of:


- [`Conf#DB_RUNNING`](../conf/Conf.md#m-DB_RUNNING) -
    - [`Conf#DB_STARTUP`](../conf/Conf.md#m-DB_STARTUP) -
      - [`Conf#DB_CANDIDATE`](../conf/Conf.md#m-DB_CANDIDATE) -
        - [`Conf#DB_NONE`](../conf/Conf.md#m-DB_NONE) -

<a id="m-getdevicetype-c8eec3b01523"></a>
### getDeviceType()

```java
public int getDeviceType()
```

for ConfM
 The device type
 (needs to be public since access from Maapi package)

<a id="m-getdevno-b1169ef876ed"></a>
### getDevNo()

```java
public int getDevNo()
```

for ConfM
 The device number
 (needs to be public since access from Maapi package)

<a id="m-getdp-b1462199cc2e"></a>
### getDp()

```java
public com.tailf.dp.Dp getDp()
```

Types: [Dp](Dp.md#cls-Dp)

Return the data provider (DP) instance that this transaction
 belongs to.

**Returns:** Data provider instance

<a id="m-getmode-c3dc73476e30"></a>
### getMode()

```java
public int getMode()
```

The mode.  Is always either Conf.MODE_READ or
  Conf.MODE_READ_WRITE

<a id="m-getnslist-0345f486e876"></a>
### getNsList()

```java
public java.util.ArrayList<com.tailf.conf.ConfNamespace> getNsList()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

Returns the namespace list stored by the data provider.

<a id="m-getopaque-92e4945ec92d"></a>
### getOpaque()

```java
public String getOpaque()
```

If the tailf:opaque substatement has been used with the tailf:callpoint
 statement in the data model, the argument string is made available to
 the callbacks via this method

<a id="m-getsecondaryindex-8efa1ee57e9c"></a>
### getSecondaryIndex()

```java
public long getSecondaryIndex()
```

Secondary index.
 When specified in get-next operations the provider needs to
 sort objects on this named secondary-index.

<a id="m-getsocket-d7da2de81b81"></a>
### getSocket()

```java
public java.net.Socket getSocket()
```

Return the worker socket `socket`.

 A default is allocated by `Dp`, but
  this can be changed with setSocket from
  the init callback (e.g before the socket is connected to Conf)

<a id="m-gettransaction-4f1c72a828a1"></a>
### getTransaction()

```java
public int getTransaction()
```

Return the current transaction handle.

**Returns:** transaction handle

<a id="m-gettransactionuseropaque-87a9bf7a20e1"></a>
### getTransactionUserOpaque()

```java
public Object getTransactionUserOpaque()
```

Get method for User owned opaque data.
 This field is meant to be used by the user so
 that we easily can pass data between our Data callbacks
 and out transaction callbacks. Typically in the Transaction
 init() callback, we open a database handle which is the later
 used by the various DataProvider callbacks such as getElem()
 and setElem()

<a id="m-getuserinfo-3ecef1f24d3d"></a>
### getUserInfo()

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)

The user information.

<a id="m-getworkersocket-ba1472e0f5a7"></a>
### getWorkerSocket()

```java
public java.net.Socket getWorkerSocket()
```

<a id="m-honorfilter-5ff04bbbf2d0"></a>
### honorFilter(boolean)

```java
public void honorFilter(boolean h)
```

Tell the server whether the currently requested filtering is being
 honored or not.
 Only use this method from within one of the DpDataCallback.iterator()
 methods. If this method is not called, the server will assume that the
 filter was not honored.

**Parameters**

- `boolean h` - whether or not the filter is being honored

<a id="m-ishideinactive-1d32c2838395"></a>
### isHideInactive()

```java
public boolean isHideInactive()
```

hideInactive flag.
 Set to true if inactive element is not present.

<a id="m-protoreply-e8de0386a2d0"></a>
### protoReply(boolean)

```java
protected void protoReply(boolean val) throws java.io.IOException
```

**Parameters**

- `boolean val`

<a id="m-protoreply-47f22a8227a5"></a>
### protoReply(ConfEObject)

```java
protected void protoReply(com.tailf.proto.ConfEObject term) throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

**Parameters**

- `com.tailf.proto.ConfEObject term`

<a id="m-protoreply-3ecaf76eaab8"></a>
### protoReply(ConfObject)

```java
protected void protoReply(com.tailf.conf.ConfObject val) throws java.io.IOException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

Send back a valid reply to ConfD/NCS.

**Parameters**

- `com.tailf.conf.ConfObject val`

<a id="m-protoreply-cee1bb25672e"></a>
### protoReply(ConfObject[])

```java
protected void protoReply(com.tailf.conf.ConfObject[] vals) throws java.io.IOException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject[] vals`

<a id="m-protoreplyxmlparam-9dcf8f14a8dc"></a>
### protoReplyXMLParam(ConfXMLParam[])

```java
protected void protoReplyXMLParam(com.tailf.conf.ConfXMLParam[] params) throws java.io.IOException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

<a id="m-replyerror-3184cd2ad634"></a>
### replyError(ConfEObject)

```java
protected void replyError(com.tailf.proto.ConfEObject errEObj) throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

**Parameters**

- `com.tailf.proto.ConfEObject errEObj`

<a id="m-replyerror-48c78d28e991"></a>
### replyError(String)

```java
protected void replyError(String errStr) throws java.io.IOException
```

**Parameters**

- `String errStr`

<a id="m-replyerror-c4e21f52074d"></a>
### replyError(String, Throwable)

```java
protected void replyError(String errStr, Throwable e) throws java.io.IOException
```

**Parameters**

- `String errStr`
- `Throwable e`

<a id="m-replyerror-26f4ce830453"></a>
### replyError(Throwable)

```java
protected void replyError(Throwable e) throws java.io.IOException
```

Send back an error to ConfD/NCS.

**Parameters**

- `Throwable e`

<a id="m-replyextendederror-b54351b1555f"></a>
### replyExtendedError(String, DpCallbackExtendedException)

```java
protected void replyExtendedError(
    String errStr,
    com.tailf.dp.DpCallbackExtendedException e
)
    throws java.io.IOException
```

Types: [DpCallbackExtendedException](DpCallbackExtendedException.md#cls-DpCallbackExtendedException)

**Parameters**

- `String errStr`
- `com.tailf.dp.DpCallbackExtendedException e`

<a id="m-replyother-c2352ec6bb73"></a>
### replyOther(boolean, String, String)

```java
protected void replyOther(boolean retstr, String atom, String errStr) throws java.io.IOException
```

**Parameters**

- `boolean retstr`
- `String atom`
- `String errStr`

<a id="m-run-b6dbda048863"></a>
### run()

```java
public void run()
```

Runs the thread.

<a id="m-setsocket-183068848e4c"></a>
### setSocket(Socket)

```java
public void setSocket(java.net.Socket sock)
```

A possibility to give a specified worker socket
 for the transaction.
 The default worker socket is otherwise allocated by Dp when
 the transaction is created.
 Only use this method from within the DpTransCallback.init() method.

 If this option is used the Socket needs to be
 connected to ConfD/NCS.

**Parameters**

- `java.net.Socket sock` - A socket connected to ConfD/NCS.

<a id="m-settransactionuseropaque-ce392ad59d2e"></a>
### setTransactionUserOpaque(Object)

```java
public void setTransactionUserOpaque(Object opaque)
```

Set method for User owned opaque data.
 This field is meant to be used by the user so
 that we easily can pass data between our Data callbacks
 and our transaction callbacks. Typically in the Transaction
 init() callback, we open a database handle which is the later
 used by the various DataProvider callbacks such as getElem()
 and setElem()

**Parameters**

- `Object opaque`

<a id="m-transreplyok-92425e2f5c67"></a>
### transReplyOK()

```java
protected void transReplyOK() throws java.io.IOException, com.tailf.dp.DpException
```

Types: [DpException](DpException.md#cls-DpException)
