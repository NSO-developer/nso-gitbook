# DpTrans <a href="#dptrans-bf19458d92ec" id="dptrans-bf19458d92ec"></a>

```java
public class com.tailf.dp.DpTrans
    extends Thread
```

The transaction context.
 Each transaction is running in separate thread.

**Related classes**

- [DpActionTrans](DpActionTrans.md#dpactiontrans-b975ce2c2d93)
- [DpValidateTrans](DpValidateTrans.md#dpvalidatetrans-a10fccde2ed1)

**See also:** [`DpTransCallback`](DpTransCallback.md#dptranscallback-20e03cd7123b), [`DpDataCallback`](DpDataCallback.md#dpdatacallback-79de01fc87fa)

## Members

**Constructors**:

- [DpTrans()](#dptrans-e828adde331b)
- [DpTrans(Dp, int, int, int, int, int, DpUserInfo)](#dptrans-d3592aa18486)
- [DpTrans(Dp, int, int, int, int, int, DpUserInfo, boolean)](#dptrans-f65e37999f51)

**Fields**:

- [dp](#dp-08e185dd74a1)
- [index](#index-686aa5fc2ebe)
- [lastDid](#lastdid-6917f8e438c1)
- [lastOp](#lastop-060a1e1a3a08)
- [lastProtoOp](#lastprotoop-7ea33fd79285)
- [lastQref](#lastqref-3c8dd4583e23)
- [opaque](#opaque-3dfa88ab46e3)
- [socket](#socket-64a86aac790a)
- [stop](#stop-4f9f43a7ef4c)
- [thandle](#thandle-4150943e9d30)
- [uinfo](#uinfo-ed78ce702727)

**Methods**:

- [accumulated()](#accumulated-2f58da3048dd)
- [dataSetTimeout(int)](#datasettimeout-8ad3068e3a46)
- [getDBName()](#getdbname-65ff0bdb2339)
- [getDeviceType()](#getdevicetype-c8eec3b01523)
- [getDevNo()](#getdevno-b1169ef876ed)
- [getDp()](#getdp-b1462199cc2e)
- [getMode()](#getmode-c3dc73476e30)
- [getNsList()](#getnslist-0345f486e876)
- [getOpaque()](#getopaque-92e4945ec92d)
- [getSecondaryIndex()](#getsecondaryindex-8efa1ee57e9c)
- [getSocket()](#getsocket-d7da2de81b81)
- [getTransaction()](#gettransaction-4f1c72a828a1)
- [getTransactionUserOpaque()](#gettransactionuseropaque-87a9bf7a20e1)
- [getUserInfo()](#getuserinfo-3ecef1f24d3d)
- [getWorkerSocket()](#getworkersocket-ba1472e0f5a7)
- [honorFilter(boolean)](#honorfilter-5ff04bbbf2d0)
- [isHideInactive()](#ishideinactive-1d32c2838395)
- [protoReply(boolean)](#protoreply-e8de0386a2d0)
- [protoReply(ConfEObject)](#protoreply-47f22a8227a5)
- [protoReply(ConfObject)](#protoreply-3ecaf76eaab8)
- [protoReply(ConfObject[])](#protoreply-cee1bb25672e)
- [protoReplyXMLParam(ConfXMLParam[])](#protoreplyxmlparam-9dcf8f14a8dc)
- [replyError(ConfEObject)](#replyerror-3184cd2ad634)
- [replyError(String)](#replyerror-48c78d28e991)
- [replyError(String, Throwable)](#replyerror-c4e21f52074d)
- [replyError(Throwable)](#replyerror-26f4ce830453)
- [replyExtendedError(String, DpCallbackExtendedException)](#replyextendederror-b54351b1555f)
- [replyOther(boolean, String, String)](#replyother-c2352ec6bb73)
- [run()](#run-b6dbda048863)
- [setSocket(Socket)](#setsocket-183068848e4c)
- [setTransactionUserOpaque(Object)](#settransactionuseropaque-ce392ad59d2e)
- [transReplyOK()](#transreplyok-92425e2f5c67)

## Constructors

### DpTrans() <a href="#dptrans-e828adde331b" id="dptrans-e828adde331b"></a>

**Package-private**

```java
DpTrans()
```

Constructor.

### DpTrans(Dp, int, int, int, int, int, DpUserInfo) <a href="#dptrans-d3592aa18486" id="dptrans-d3592aa18486"></a>

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

Types: [Dp](Dp.md#dp-64c27347820e), [DpUserInfo](DpUserInfo.md#dpuserinfo-c59746285a6e)

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

### DpTrans(Dp, int, int, int, int, int, DpUserInfo, boolean) <a href="#dptrans-f65e37999f51" id="dptrans-f65e37999f51"></a>

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

Types: [Dp](Dp.md#dp-64c27347820e), [DpUserInfo](DpUserInfo.md#dpuserinfo-c59746285a6e)

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

### dp <a href="#dp-08e185dd74a1" id="dp-08e185dd74a1"></a>

```java
protected com.tailf.dp.Dp dp = null;
```

Types: [Dp](Dp.md#dp-64c27347820e)

### index <a href="#index-686aa5fc2ebe" id="index-686aa5fc2ebe"></a>

```java
protected int index = null;
```

### lastDid <a href="#lastdid-6917f8e438c1" id="lastdid-6917f8e438c1"></a>

```java
protected int lastDid = null;
```

### lastOp <a href="#lastop-060a1e1a3a08" id="lastop-060a1e1a3a08"></a>

```java
protected int lastOp = null;
```

### lastProtoOp <a href="#lastprotoop-7ea33fd79285" id="lastprotoop-7ea33fd79285"></a>

```java
protected int lastProtoOp = null;
```

### lastQref <a href="#lastqref-3c8dd4583e23" id="lastqref-3c8dd4583e23"></a>

```java
protected int lastQref = null;
```

### opaque <a href="#opaque-3dfa88ab46e3" id="opaque-3dfa88ab46e3"></a>

```java
protected String opaque = null;
```

### socket <a href="#socket-64a86aac790a" id="socket-64a86aac790a"></a>

```java
protected java.net.Socket socket = null;
```

### stop <a href="#stop-4f9f43a7ef4c" id="stop-4f9f43a7ef4c"></a>

```java
protected boolean stop = null;
```

### thandle <a href="#thandle-4150943e9d30" id="thandle-4150943e9d30"></a>

```java
protected int thandle = null;
```

### uinfo <a href="#uinfo-ed78ce702727" id="uinfo-ed78ce702727"></a>

```java
protected com.tailf.dp.DpUserInfo uinfo = null;
```

Types: [DpUserInfo](DpUserInfo.md#dpuserinfo-c59746285a6e)


## Methods

### accumulated() <a href="#accumulated-2f58da3048dd" id="accumulated-2f58da3048dd"></a>

```java
public java.util.Iterator<com.tailf.dp.DpAccumulate> accumulated()
```

Types: [DpAccumulate](DpAccumulate.md#dpaccumulate-2c3e1c3779d8)

Returns an iterator for the accumulated
 objects.

### dataSetTimeout(int) <a href="#datasettimeout-8ad3068e3a46" id="datasettimeout-8ad3068e3a46"></a>

```java
public void dataSetTimeout(
    int timeoutSeconds
)
    throws java.io.IOException, com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

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

### getDBName() <a href="#getdbname-65ff0bdb2339" id="getdbname-65ff0bdb2339"></a>

```java
public int getDBName()
```

The database name.

 Is always either of:


- [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28) -
    - [`Conf#DB_STARTUP`](../conf/Conf.md#db_startup-2ce085259486) -
      - [`Conf#DB_CANDIDATE`](../conf/Conf.md#db_candidate-8b43a337ac93) -
        - [`Conf#DB_NONE`](../conf/Conf.md#db_none-5069c3fe4466) -

### getDeviceType() <a href="#getdevicetype-c8eec3b01523" id="getdevicetype-c8eec3b01523"></a>

```java
public int getDeviceType()
```

for ConfM
 The device type
 (needs to be public since access from Maapi package)

### getDevNo() <a href="#getdevno-b1169ef876ed" id="getdevno-b1169ef876ed"></a>

```java
public int getDevNo()
```

for ConfM
 The device number
 (needs to be public since access from Maapi package)

### getDp() <a href="#getdp-b1462199cc2e" id="getdp-b1462199cc2e"></a>

```java
public com.tailf.dp.Dp getDp()
```

Types: [Dp](Dp.md#dp-64c27347820e)

Return the data provider (DP) instance that this transaction
 belongs to.

**Returns:** Data provider instance

### getMode() <a href="#getmode-c3dc73476e30" id="getmode-c3dc73476e30"></a>

```java
public int getMode()
```

The mode.  Is always either Conf.MODE_READ or
  Conf.MODE_READ_WRITE

### getNsList() <a href="#getnslist-0345f486e876" id="getnslist-0345f486e876"></a>

```java
public java.util.ArrayList<com.tailf.conf.ConfNamespace> getNsList()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

Returns the namespace list stored by the data provider.

### getOpaque() <a href="#getopaque-92e4945ec92d" id="getopaque-92e4945ec92d"></a>

```java
public String getOpaque()
```

If the tailf:opaque substatement has been used with the tailf:callpoint
 statement in the data model, the argument string is made available to
 the callbacks via this method

### getSecondaryIndex() <a href="#getsecondaryindex-8efa1ee57e9c" id="getsecondaryindex-8efa1ee57e9c"></a>

```java
public long getSecondaryIndex()
```

Secondary index.
 When specified in get-next operations the provider needs to
 sort objects on this named secondary-index.

### getSocket() <a href="#getsocket-d7da2de81b81" id="getsocket-d7da2de81b81"></a>

```java
public java.net.Socket getSocket()
```

Return the worker socket `socket`.

 A default is allocated by `Dp`, but
  this can be changed with setSocket from
  the init callback (e.g before the socket is connected to Conf)

### getTransaction() <a href="#gettransaction-4f1c72a828a1" id="gettransaction-4f1c72a828a1"></a>

```java
public int getTransaction()
```

Return the current transaction handle.

**Returns:** transaction handle

### getTransactionUserOpaque() <a href="#gettransactionuseropaque-87a9bf7a20e1" id="gettransactionuseropaque-87a9bf7a20e1"></a>

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

### getUserInfo() <a href="#getuserinfo-3ecef1f24d3d" id="getuserinfo-3ecef1f24d3d"></a>

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](DpUserInfo.md#dpuserinfo-c59746285a6e)

The user information.

### getWorkerSocket() <a href="#getworkersocket-ba1472e0f5a7" id="getworkersocket-ba1472e0f5a7"></a>

```java
public java.net.Socket getWorkerSocket()
```

### honorFilter(boolean) <a href="#honorfilter-5ff04bbbf2d0" id="honorfilter-5ff04bbbf2d0"></a>

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

### isHideInactive() <a href="#ishideinactive-1d32c2838395" id="ishideinactive-1d32c2838395"></a>

```java
public boolean isHideInactive()
```

hideInactive flag.
 Set to true if inactive element is not present.

### protoReply(boolean) <a href="#protoreply-e8de0386a2d0" id="protoreply-e8de0386a2d0"></a>

```java
protected void protoReply(boolean val) throws java.io.IOException
```

**Parameters**

- `boolean val`

### protoReply(ConfEObject) <a href="#protoreply-47f22a8227a5" id="protoreply-47f22a8227a5"></a>

```java
protected void protoReply(com.tailf.proto.ConfEObject term) throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

**Parameters**

- `com.tailf.proto.ConfEObject term`

### protoReply(ConfObject) <a href="#protoreply-3ecaf76eaab8" id="protoreply-3ecaf76eaab8"></a>

```java
protected void protoReply(com.tailf.conf.ConfObject val) throws java.io.IOException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

Send back a valid reply to ConfD/NCS.

**Parameters**

- `com.tailf.conf.ConfObject val`

### protoReply(ConfObject[]) <a href="#protoreply-cee1bb25672e" id="protoreply-cee1bb25672e"></a>

```java
protected void protoReply(com.tailf.conf.ConfObject[] vals) throws java.io.IOException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

**Parameters**

- `com.tailf.conf.ConfObject[] vals`

### protoReplyXMLParam(ConfXMLParam[]) <a href="#protoreplyxmlparam-9dcf8f14a8dc" id="protoreplyxmlparam-9dcf8f14a8dc"></a>

```java
protected void protoReplyXMLParam(com.tailf.conf.ConfXMLParam[] params) throws java.io.IOException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

### replyError(ConfEObject) <a href="#replyerror-3184cd2ad634" id="replyerror-3184cd2ad634"></a>

```java
protected void replyError(com.tailf.proto.ConfEObject errEObj) throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

**Parameters**

- `com.tailf.proto.ConfEObject errEObj`

### replyError(String) <a href="#replyerror-48c78d28e991" id="replyerror-48c78d28e991"></a>

```java
protected void replyError(String errStr) throws java.io.IOException
```

**Parameters**

- `String errStr`

### replyError(String, Throwable) <a href="#replyerror-c4e21f52074d" id="replyerror-c4e21f52074d"></a>

```java
protected void replyError(String errStr, Throwable e) throws java.io.IOException
```

**Parameters**

- `String errStr`
- `Throwable e`

### replyError(Throwable) <a href="#replyerror-26f4ce830453" id="replyerror-26f4ce830453"></a>

```java
protected void replyError(Throwable e) throws java.io.IOException
```

Send back an error to ConfD/NCS.

**Parameters**

- `Throwable e`

### replyExtendedError(String, DpCallbackExtendedException) <a href="#replyextendederror-b54351b1555f" id="replyextendederror-b54351b1555f"></a>

```java
protected void replyExtendedError(
    String errStr,
    com.tailf.dp.DpCallbackExtendedException e
)
    throws java.io.IOException
```

Types: [DpCallbackExtendedException](DpCallbackExtendedException.md#dpcallbackextendedexception-56110945bf17)

**Parameters**

- `String errStr`
- `com.tailf.dp.DpCallbackExtendedException e`

### replyOther(boolean, String, String) <a href="#replyother-c2352ec6bb73" id="replyother-c2352ec6bb73"></a>

```java
protected void replyOther(boolean retstr, String atom, String errStr) throws java.io.IOException
```

**Parameters**

- `boolean retstr`
- `String atom`
- `String errStr`

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```

Runs the thread.

### setSocket(Socket) <a href="#setsocket-183068848e4c" id="setsocket-183068848e4c"></a>

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

### setTransactionUserOpaque(Object) <a href="#settransactionuseropaque-ce392ad59d2e" id="settransactionuseropaque-ce392ad59d2e"></a>

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

### transReplyOK() <a href="#transreplyok-92425e2f5c67" id="transreplyok-92425e2f5c67"></a>

```java
protected void transReplyOK() throws java.io.IOException, com.tailf.dp.DpException
```

Types: [DpException](DpException.md#dpexception-79c01c670be8)
