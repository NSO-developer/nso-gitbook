<a id="s-TransCallbackProxy"></a>
# TransCallbackProxy

```java
public class com.tailf.dp.annotations.TransCallbackProxy
    implements com.tailf.dp.DpTransCallback
```

Types: [DpTransCallback](../DpTransCallback.md#s-DpTransCallback)

Callback proxy for Trans Callbacks. Implements the [`DpTransCallback`](../DpTransCallback.md#s-DpTransCallback)
 interface and delegates calls to the registered callback POJO with annotated
 methods

**Since:** 3.2.0

## Members

**Constructors**:

- [TransCallbackProxy(Object)](#s-TransCallbackProxy-1)

**Fields**:

- [M_ABORT](../DpTransCallback.md#s-M_ABORT) from DpTransCallback
- [M_ALL](../DpTransCallback.md#s-M_ALL) from DpTransCallback
- [M_COMMIT](../DpTransCallback.md#s-M_COMMIT) from DpTransCallback
- [M_FINISH](../DpTransCallback.md#s-M_FINISH) from DpTransCallback
- [M_INIT](../DpTransCallback.md#s-M_INIT) from DpTransCallback
- [M_PREPARE](../DpTransCallback.md#s-M_PREPARE) from DpTransCallback
- [M_TRANS_LOCK](../DpTransCallback.md#s-M_TRANS_LOCK) from DpTransCallback
- [M_TRANS_UNLOCK](../DpTransCallback.md#s-M_TRANS_UNLOCK) from DpTransCallback
- [M_WRITE_START](../DpTransCallback.md#s-M_WRITE_START) from DpTransCallback

**Methods**:

- [abort(DpTrans)](#s-abort)
- [addActionCapability(TransCBType)](#s-addActionCapability)
- [addActionMethod(String, Method)](#s-addActionMethod)
- [commit(DpTrans)](#s-commit)
- [finish(DpTrans)](#s-finish)
- [getBackupObject()](#s-getBackupObject)
- [getTransCallbackProxys(Object)](#s-getTransCallbackProxys)
- [init(DpTrans)](#s-init)
- [mask()](#s-mask)
- [prepare(DpTrans)](#s-prepare)
- [transLock(DpTrans)](#s-transLock)
- [transUnlock(DpTrans)](#s-transUnlock)
- [writeStart(DpTrans)](#s-writeStart)

## Constructors

<a id="s-TransCallbackProxy-1"></a>
### TransCallbackProxy(Object)

```java
public TransCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

<a id="s-abort"></a>
### abort(DpTrans)

```java
public void abort(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="s-addActionCapability"></a>
### addActionCapability(TransCBType)

```java
public void addActionCapability(com.tailf.dp.proto.TransCBType transCBType)
```

Types: [TransCBType](../proto/TransCBType.md#s-TransCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.TransCBType transCBType` - action type

<a id="s-addActionMethod"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="s-commit"></a>
### commit(DpTrans)

```java
public void commit(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="s-finish"></a>
### finish(DpTrans)

```java
public void finish(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="s-getBackupObject"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="s-getTransCallbackProxys"></a>
### getTransCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.TransCallbackProxy[] getTransCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [TransCallbackProxy](TransCallbackProxy.md#s-TransCallbackProxy), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of TransCallbackProxy

**Throws**

- `DpCallbackException`

<a id="s-init"></a>
### init(DpTrans)

```java
public void init(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="s-mask"></a>
### mask()

```java
public int mask()
```

<a id="s-prepare"></a>
### prepare(DpTrans)

```java
public void prepare(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="s-transLock"></a>
### transLock(DpTrans)

```java
public void transLock(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="s-transUnlock"></a>
### transUnlock(DpTrans)

```java
public void transUnlock(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="s-writeStart"></a>
### writeStart(DpTrans)

```java
public void writeStart(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
