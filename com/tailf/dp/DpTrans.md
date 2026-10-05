# DpTrans <a href="#cls-DpTrans" id="cls-DpTrans"></a>

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

- [DpTrans()](#m-DpTrans-e828adde331b)
- [DpTrans(Dp, int, int, int, int, int, DpUserInfo)](#m-DpTrans-d3592aa18486)
- [DpTrans(Dp, int, int, int, int, int, DpUserInfo, boolean)](#m-DpTrans-f65e37999f51)

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
- [dataSetTimeout(int)](#m-dataSetTimeout-8ad3068e3a46)
- [getDBName()](#m-getDBName-65ff0bdb2339)
- [getDeviceType()](#m-getDeviceType-c8eec3b01523)
- [getDevNo()](#m-getDevNo-b1169ef876ed)
- [getDp()](#m-getDp-b1462199cc2e)
- [getMode()](#m-getMode-c3dc73476e30)
- [getNsList()](#m-getNsList-0345f486e876)
- [getOpaque()](#m-getOpaque-92e4945ec92d)
- [getSecondaryIndex()](#m-getSecondaryIndex-8efa1ee57e9c)
- [getSocket()](#m-getSocket-d7da2de81b81)
- [getTransaction()](#m-getTransaction-4f1c72a828a1)
- [getTransactionUserOpaque()](#m-getTransactionUserOpaque-87a9bf7a20e1)
- [getUserInfo()](#m-getUserInfo-3ecef1f24d3d)
- [getWorkerSocket()](#m-getWorkerSocket-ba1472e0f5a7)
- [honorFilter(boolean)](#m-honorFilter-5ff04bbbf2d0)
- [isHideInactive()](#m-isHideInactive-1d32c2838395)
- [protoReply(boolean)](#m-protoReply-e8de0386a2d0)
- [protoReply(ConfEObject)](#m-protoReply-47f22a8227a5)
- [protoReply(ConfObject)](#m-protoReply-3ecaf76eaab8)
- [protoReply(ConfObject[])](#m-protoReply-cee1bb25672e)
- [protoReplyXMLParam(ConfXMLParam[])](#m-protoReplyXMLParam-9dcf8f14a8dc)
- [replyError(ConfEObject)](#m-replyError-3184cd2ad634)
- [replyError(String)](#m-replyError-48c78d28e991)
- [replyError(String, Throwable)](#m-replyError-c4e21f52074d)
- [replyError(Throwable)](#m-replyError-26f4ce830453)
- [replyExtendedError(String, DpCallbackExtendedException)](#m-replyExtendedError-b54351b1555f)
- [replyOther(boolean, String, String)](#m-replyOther-c2352ec6bb73)
- [run()](#m-run-b6dbda048863)
- [setSocket(Socket)](#m-setSocket-183068848e4c)
- [setTransactionUserOpaque(Object)](#m-setTransactionUserOpaque-ce392ad59d2e)
- [transReplyOK()](#m-transReplyOK-92425e2f5c67)

## Constructors

### DpTrans() <a href="#m-DpTrans-e828adde331b" id="m-DpTrans-e828adde331b"></a>

**Package-private**

```java
DpTrans()
```

Constructor.

### DpTrans(Dp, int, int, int, int, int, DpUserInfo) <a href="#m-DpTrans-d3592aa18486" id="m-DpTrans-d3592aa18486"></a>

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

### DpTrans(Dp, int, int, int, int, int, DpUserInfo, boolean) <a href="#m-DpTrans-f65e37999f51" id="m-DpTrans-f65e37999f51"></a>

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

### dp <a href="#m-dp" id="m-dp"></a>

```java
protected com.tailf.dp.Dp dp = null;
```

Types: [Dp](Dp.md#cls-Dp)

### index <a href="#m-index" id="m-index"></a>

```java
protected int index = null;
```

### lastDid <a href="#m-lastDid" id="m-lastDid"></a>

```java
protected int lastDid = null;
```

### lastOp <a href="#m-lastOp" id="m-lastOp"></a>

```java
protected int lastOp = null;
```

### lastProtoOp <a href="#m-lastProtoOp" id="m-lastProtoOp"></a>

```java
protected int lastProtoOp = null;
```

### lastQref <a href="#m-lastQref" id="m-lastQref"></a>

```java
protected int lastQref = null;
```

### opaque <a href="#m-opaque" id="m-opaque"></a>

```java
protected String opaque = null;
```

### socket <a href="#m-socket" id="m-socket"></a>

```java
protected java.net.Socket socket = null;
```

### stop <a href="#m-stop" id="m-stop"></a>

```java
protected boolean stop = null;
```

### thandle <a href="#m-thandle" id="m-thandle"></a>

```java
protected int thandle = null;
```

### uinfo <a href="#m-uinfo" id="m-uinfo"></a>

```java
protected com.tailf.dp.DpUserInfo uinfo = null;
```

Types: [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)


## Methods

### accumulated() <a href="#m-accumulated-2f58da3048dd" id="m-accumulated-2f58da3048dd"></a>

```java
public java.util.Iterator<com.tailf.dp.DpAccumulate> accumulated()
```

Types: [DpAccumulate](DpAccumulate.md#cls-DpAccumulate)

Returns an iterator for the accumulated
 objects.

### dataSetTimeout(int) <a href="#m-dataSetTimeout-8ad3068e3a46" id="m-dataSetTimeout-8ad3068e3a46"></a>

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

### getDBName() <a href="#m-getDBName-65ff0bdb2339" id="m-getDBName-65ff0bdb2339"></a>

```java
public int getDBName()
```

The database name.

 Is always either of:


- [`Conf#DB_RUNNING`](../conf/Conf.md#m-DB_RUNNING) -
    - [`Conf#DB_STARTUP`](../conf/Conf.md#m-DB_STARTUP) -
      - [`Conf#DB_CANDIDATE`](../conf/Conf.md#m-DB_CANDIDATE) -
        - [`Conf#DB_NONE`](../conf/Conf.md#m-DB_NONE) -

### getDeviceType() <a href="#m-getDeviceType-c8eec3b01523" id="m-getDeviceType-c8eec3b01523"></a>

```java
public int getDeviceType()
```

for ConfM
 The device type
 (needs to be public since access from Maapi package)

### getDevNo() <a href="#m-getDevNo-b1169ef876ed" id="m-getDevNo-b1169ef876ed"></a>

```java
public int getDevNo()
```

for ConfM
 The device number
 (needs to be public since access from Maapi package)

### getDp() <a href="#m-getDp-b1462199cc2e" id="m-getDp-b1462199cc2e"></a>

```java
public com.tailf.dp.Dp getDp()
```

Types: [Dp](Dp.md#cls-Dp)

Return the data provider (DP) instance that this transaction
 belongs to.

**Returns:** Data provider instance

### getMode() <a href="#m-getMode-c3dc73476e30" id="m-getMode-c3dc73476e30"></a>

```java
public int getMode()
```

The mode.  Is always either Conf.MODE_READ or
  Conf.MODE_READ_WRITE

### getNsList() <a href="#m-getNsList-0345f486e876" id="m-getNsList-0345f486e876"></a>

```java
public java.util.ArrayList<com.tailf.conf.ConfNamespace> getNsList()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

Returns the namespace list stored by the data provider.

### getOpaque() <a href="#m-getOpaque-92e4945ec92d" id="m-getOpaque-92e4945ec92d"></a>

```java
public String getOpaque()
```

If the tailf:opaque substatement has been used with the tailf:callpoint
 statement in the data model, the argument string is made available to
 the callbacks via this method

### getSecondaryIndex() <a href="#m-getSecondaryIndex-8efa1ee57e9c" id="m-getSecondaryIndex-8efa1ee57e9c"></a>

```java
public long getSecondaryIndex()
```

Secondary index.
 When specified in get-next operations the provider needs to
 sort objects on this named secondary-index.

### getSocket() <a href="#m-getSocket-d7da2de81b81" id="m-getSocket-d7da2de81b81"></a>

```java
public java.net.Socket getSocket()
```

Return the worker socket `socket`.

 A default is allocated by `Dp`, but
  this can be changed with setSocket from
  the init callback (e.g before the socket is connected to Conf)

### getTransaction() <a href="#m-getTransaction-4f1c72a828a1" id="m-getTransaction-4f1c72a828a1"></a>

```java
public int getTransaction()
```

Return the current transaction handle.

**Returns:** transaction handle

### getTransactionUserOpaque() <a href="#m-getTransactionUserOpaque-87a9bf7a20e1" id="m-getTransactionUserOpaque-87a9bf7a20e1"></a>

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

### getUserInfo() <a href="#m-getUserInfo-3ecef1f24d3d" id="m-getUserInfo-3ecef1f24d3d"></a>

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)

The user information.

### getWorkerSocket() <a href="#m-getWorkerSocket-ba1472e0f5a7" id="m-getWorkerSocket-ba1472e0f5a7"></a>

```java
public java.net.Socket getWorkerSocket()
```

### honorFilter(boolean) <a href="#m-honorFilter-5ff04bbbf2d0" id="m-honorFilter-5ff04bbbf2d0"></a>

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

### isHideInactive() <a href="#m-isHideInactive-1d32c2838395" id="m-isHideInactive-1d32c2838395"></a>

```java
public boolean isHideInactive()
```

hideInactive flag.
 Set to true if inactive element is not present.

### protoReply(boolean) <a href="#m-protoReply-e8de0386a2d0" id="m-protoReply-e8de0386a2d0"></a>

```java
protected void protoReply(boolean val) throws java.io.IOException
```

**Parameters**

- `boolean val`

### protoReply(ConfEObject) <a href="#m-protoReply-47f22a8227a5" id="m-protoReply-47f22a8227a5"></a>

```java
protected void protoReply(com.tailf.proto.ConfEObject term) throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

**Parameters**

- `com.tailf.proto.ConfEObject term`

### protoReply(ConfObject) <a href="#m-protoReply-3ecaf76eaab8" id="m-protoReply-3ecaf76eaab8"></a>

```java
protected void protoReply(com.tailf.conf.ConfObject val) throws java.io.IOException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

Send back a valid reply to ConfD/NCS.

**Parameters**

- `com.tailf.conf.ConfObject val`

### protoReply(ConfObject[]) <a href="#m-protoReply-cee1bb25672e" id="m-protoReply-cee1bb25672e"></a>

```java
protected void protoReply(com.tailf.conf.ConfObject[] vals) throws java.io.IOException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject[] vals`

### protoReplyXMLParam(ConfXMLParam[]) <a href="#m-protoReplyXMLParam-9dcf8f14a8dc" id="m-protoReplyXMLParam-9dcf8f14a8dc"></a>

```java
protected void protoReplyXMLParam(com.tailf.conf.ConfXMLParam[] params) throws java.io.IOException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

### replyError(ConfEObject) <a href="#m-replyError-3184cd2ad634" id="m-replyError-3184cd2ad634"></a>

```java
protected void replyError(com.tailf.proto.ConfEObject errEObj) throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

**Parameters**

- `com.tailf.proto.ConfEObject errEObj`

### replyError(String) <a href="#m-replyError-48c78d28e991" id="m-replyError-48c78d28e991"></a>

```java
protected void replyError(String errStr) throws java.io.IOException
```

**Parameters**

- `String errStr`

### replyError(String, Throwable) <a href="#m-replyError-c4e21f52074d" id="m-replyError-c4e21f52074d"></a>

```java
protected void replyError(String errStr, Throwable e) throws java.io.IOException
```

**Parameters**

- `String errStr`
- `Throwable e`

### replyError(Throwable) <a href="#m-replyError-26f4ce830453" id="m-replyError-26f4ce830453"></a>

```java
protected void replyError(Throwable e) throws java.io.IOException
```

Send back an error to ConfD/NCS.

**Parameters**

- `Throwable e`

### replyExtendedError(String, DpCallbackExtendedException) <a href="#m-replyExtendedError-b54351b1555f" id="m-replyExtendedError-b54351b1555f"></a>

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

### replyOther(boolean, String, String) <a href="#m-replyOther-c2352ec6bb73" id="m-replyOther-c2352ec6bb73"></a>

```java
protected void replyOther(boolean retstr, String atom, String errStr) throws java.io.IOException
```

**Parameters**

- `boolean retstr`
- `String atom`
- `String errStr`

### run() <a href="#m-run-b6dbda048863" id="m-run-b6dbda048863"></a>

```java
public void run()
```

Runs the thread.

### setSocket(Socket) <a href="#m-setSocket-183068848e4c" id="m-setSocket-183068848e4c"></a>

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

### setTransactionUserOpaque(Object) <a href="#m-setTransactionUserOpaque-ce392ad59d2e" id="m-setTransactionUserOpaque-ce392ad59d2e"></a>

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

### transReplyOK() <a href="#m-transReplyOK-92425e2f5c67" id="m-transReplyOK-92425e2f5c67"></a>

```java
protected void transReplyOK() throws java.io.IOException, com.tailf.dp.DpException
```

Types: [DpException](DpException.md#cls-DpException)
