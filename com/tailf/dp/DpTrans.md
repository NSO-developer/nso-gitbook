<a id="s-DpTrans"></a>
# DpTrans

```java
public class com.tailf.dp.DpTrans
    extends Thread
```

The transaction context.
 Each transaction is running in separate thread.

**Related classes**

- [DpActionTrans](DpActionTrans.md#s-DpActionTrans)
- [DpValidateTrans](DpValidateTrans.md#s-DpValidateTrans)

**See also:** [`DpTransCallback`](DpTransCallback.md#s-DpTransCallback), [`DpDataCallback`](DpDataCallback.md#s-DpDataCallback)

## Members

**Constructors**:

- [DpTrans()](#s-DpTrans-1)
- [DpTrans(Dp, int, int, int, int, int, DpUserInfo)](#s-DpTrans-2)
- [DpTrans(Dp, int, int, int, int, int, DpUserInfo, boolean)](#s-DpTrans-3)

**Fields**:

- [dp](#s-dp)
- [index](#s-index)
- [lastDid](#s-lastDid)
- [lastOp](#s-lastOp)
- [lastProtoOp](#s-lastProtoOp)
- [lastQref](#s-lastQref)
- [opaque](#s-opaque)
- [socket](#s-socket)
- [stop](#s-stop)
- [thandle](#s-thandle)
- [uinfo](#s-uinfo)

**Methods**:

- [accumulated()](#s-accumulated)
- [dataSetTimeout(int)](#s-dataSetTimeout)
- [getDBName()](#s-getDBName)
- [getDeviceType()](#s-getDeviceType)
- [getDevNo()](#s-getDevNo)
- [getDp()](#s-getDp)
- [getMode()](#s-getMode)
- [getNsList()](#s-getNsList)
- [getOpaque()](#s-getOpaque)
- [getSecondaryIndex()](#s-getSecondaryIndex)
- [getSocket()](#s-getSocket)
- [getTransaction()](#s-getTransaction)
- [getTransactionUserOpaque()](#s-getTransactionUserOpaque)
- [getUserInfo()](#s-getUserInfo)
- [getWorkerSocket()](#s-getWorkerSocket)
- [honorFilter(boolean)](#s-honorFilter)
- [isHideInactive()](#s-isHideInactive)
- [protoReply(boolean)](#s-protoReply)
- [protoReply(ConfEObject)](#s-protoReply-1)
- [protoReply(ConfObject)](#s-protoReply-2)
- [protoReply(ConfObject[])](#s-protoReply-3)
- [protoReplyXMLParam(ConfXMLParam[])](#s-protoReplyXMLParam)
- [replyError(ConfEObject)](#s-replyError)
- [replyError(String)](#s-replyError-1)
- [replyError(String, Throwable)](#s-replyError-2)
- [replyError(Throwable)](#s-replyError-3)
- [replyExtendedError(String, DpCallbackExtendedException)](#s-replyExtendedError)
- [replyOther(boolean, String, String)](#s-replyOther)
- [run()](#s-run)
- [setSocket(Socket)](#s-setSocket)
- [setTransactionUserOpaque(Object)](#s-setTransactionUserOpaque)
- [transReplyOK()](#s-transReplyOK)

## Constructors

<a id="s-DpTrans-1"></a>
### DpTrans()

**Package-private**

```java
DpTrans()
```

Constructor.

<a id="s-DpTrans-2"></a>
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

Types: [Dp](Dp.md#s-Dp), [DpUserInfo](DpUserInfo.md#s-DpUserInfo)

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

<a id="s-DpTrans-3"></a>
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

Types: [Dp](Dp.md#s-Dp), [DpUserInfo](DpUserInfo.md#s-DpUserInfo)

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

<a id="s-dp"></a>
### dp

```java
protected com.tailf.dp.Dp dp = null;
```

Types: [Dp](Dp.md#s-Dp)

<a id="s-index"></a>
### index

```java
protected int index = null;
```

<a id="s-lastDid"></a>
### lastDid

```java
protected int lastDid = null;
```

<a id="s-lastOp"></a>
### lastOp

```java
protected int lastOp = null;
```

<a id="s-lastProtoOp"></a>
### lastProtoOp

```java
protected int lastProtoOp = null;
```

<a id="s-lastQref"></a>
### lastQref

```java
protected int lastQref = null;
```

<a id="s-opaque"></a>
### opaque

```java
protected String opaque = null;
```

<a id="s-socket"></a>
### socket

```java
protected java.net.Socket socket = null;
```

<a id="s-stop"></a>
### stop

```java
protected boolean stop = null;
```

<a id="s-thandle"></a>
### thandle

```java
protected int thandle = null;
```

<a id="s-uinfo"></a>
### uinfo

```java
protected com.tailf.dp.DpUserInfo uinfo = null;
```

Types: [DpUserInfo](DpUserInfo.md#s-DpUserInfo)


## Methods

<a id="s-accumulated"></a>
### accumulated()

```java
public java.util.Iterator<com.tailf.dp.DpAccumulate> accumulated()
```

Types: [DpAccumulate](DpAccumulate.md#s-DpAccumulate)

Returns an iterator for the accumulated
 objects.

<a id="s-dataSetTimeout"></a>
### dataSetTimeout(int)

```java
public void dataSetTimeout(
    int timeoutSeconds
)
    throws java.io.IOException, com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

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

<a id="s-getDBName"></a>
### getDBName()

```java
public int getDBName()
```

The database name.

 Is always either of:


- [`Conf`](../conf/Conf.md#s-Conf) -
    - [`Conf`](../conf/Conf.md#s-Conf) -
      - [`Conf`](../conf/Conf.md#s-Conf) -
        - [`Conf`](../conf/Conf.md#s-Conf) -

<a id="s-getDeviceType"></a>
### getDeviceType()

```java
public int getDeviceType()
```

for ConfM
 The device type
 (needs to be public since access from Maapi package)

<a id="s-getDevNo"></a>
### getDevNo()

```java
public int getDevNo()
```

for ConfM
 The device number
 (needs to be public since access from Maapi package)

<a id="s-getDp"></a>
### getDp()

```java
public com.tailf.dp.Dp getDp()
```

Types: [Dp](Dp.md#s-Dp)

Return the data provider (DP) instance that this transaction
 belongs to.

**Returns:** Data provider instance

<a id="s-getMode"></a>
### getMode()

```java
public int getMode()
```

The mode.  Is always either Conf.MODE_READ or
  Conf.MODE_READ_WRITE

<a id="s-getNsList"></a>
### getNsList()

```java
public java.util.ArrayList<com.tailf.conf.ConfNamespace> getNsList()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace)

Returns the namespace list stored by the data provider.

<a id="s-getOpaque"></a>
### getOpaque()

```java
public String getOpaque()
```

If the tailf:opaque substatement has been used with the tailf:callpoint
 statement in the data model, the argument string is made available to
 the callbacks via this method

<a id="s-getSecondaryIndex"></a>
### getSecondaryIndex()

```java
public long getSecondaryIndex()
```

Secondary index.
 When specified in get-next operations the provider needs to
 sort objects on this named secondary-index.

<a id="s-getSocket"></a>
### getSocket()

```java
public java.net.Socket getSocket()
```

Return the worker socket `socket`.

 A default is allocated by `Dp`, but
  this can be changed with setSocket from
  the init callback (e.g before the socket is connected to Conf)

<a id="s-getTransaction"></a>
### getTransaction()

```java
public int getTransaction()
```

Return the current transaction handle.

**Returns:** transaction handle

<a id="s-getTransactionUserOpaque"></a>
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

<a id="s-getUserInfo"></a>
### getUserInfo()

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](DpUserInfo.md#s-DpUserInfo)

The user information.

<a id="s-getWorkerSocket"></a>
### getWorkerSocket()

```java
public java.net.Socket getWorkerSocket()
```

<a id="s-honorFilter"></a>
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

<a id="s-isHideInactive"></a>
### isHideInactive()

```java
public boolean isHideInactive()
```

hideInactive flag.
 Set to true if inactive element is not present.

<a id="s-protoReply"></a>
### protoReply(boolean)

```java
protected void protoReply(boolean val) throws java.io.IOException
```

**Parameters**

- `boolean val`

<a id="s-protoReply-1"></a>
### protoReply(ConfEObject)

```java
protected void protoReply(com.tailf.proto.ConfEObject term) throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

**Parameters**

- `com.tailf.proto.ConfEObject term`

<a id="s-protoReply-2"></a>
### protoReply(ConfObject)

```java
protected void protoReply(com.tailf.conf.ConfObject val) throws java.io.IOException
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject)

Send back a valid reply to ConfD/NCS.

**Parameters**

- `com.tailf.conf.ConfObject val`

<a id="s-protoReply-3"></a>
### protoReply(ConfObject[])

```java
protected void protoReply(com.tailf.conf.ConfObject[] vals) throws java.io.IOException
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject[] vals`

<a id="s-protoReplyXMLParam"></a>
### protoReplyXMLParam(ConfXMLParam[])

```java
protected void protoReplyXMLParam(com.tailf.conf.ConfXMLParam[] params) throws java.io.IOException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

<a id="s-replyError"></a>
### replyError(ConfEObject)

```java
protected void replyError(com.tailf.proto.ConfEObject errEObj) throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

**Parameters**

- `com.tailf.proto.ConfEObject errEObj`

<a id="s-replyError-1"></a>
### replyError(String)

```java
protected void replyError(String errStr) throws java.io.IOException
```

**Parameters**

- `String errStr`

<a id="s-replyError-2"></a>
### replyError(String, Throwable)

```java
protected void replyError(String errStr, Throwable e) throws java.io.IOException
```

**Parameters**

- `String errStr`
- `Throwable e`

<a id="s-replyError-3"></a>
### replyError(Throwable)

```java
protected void replyError(Throwable e) throws java.io.IOException
```

Send back an error to ConfD/NCS.

**Parameters**

- `Throwable e`

<a id="s-replyExtendedError"></a>
### replyExtendedError(String, DpCallbackExtendedException)

```java
protected void replyExtendedError(
    String errStr,
    com.tailf.dp.DpCallbackExtendedException e
)
    throws java.io.IOException
```

Types: [DpCallbackExtendedException](DpCallbackExtendedException.md#s-DpCallbackExtendedException)

**Parameters**

- `String errStr`
- `com.tailf.dp.DpCallbackExtendedException e`

<a id="s-replyOther"></a>
### replyOther(boolean, String, String)

```java
protected void replyOther(boolean retstr, String atom, String errStr) throws java.io.IOException
```

**Parameters**

- `boolean retstr`
- `String atom`
- `String errStr`

<a id="s-run"></a>
### run()

```java
public void run()
```

Runs the thread.

<a id="s-setSocket"></a>
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

<a id="s-setTransactionUserOpaque"></a>
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

<a id="s-transReplyOK"></a>
### transReplyOK()

```java
protected void transReplyOK() throws java.io.IOException, com.tailf.dp.DpException
```

Types: [DpException](DpException.md#s-DpException)
