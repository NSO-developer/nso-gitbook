# ActionCallbackProxy <a href="#actioncallbackproxy-ee0d5c554b8c" id="actioncallbackproxy-ee0d5c554b8c"></a>

```java
public class com.tailf.dp.annotations.ActionCallbackProxy
    implements com.tailf.dp.DpActionCallback
```

Types: [DpActionCallback](../DpActionCallback.md#dpactioncallback-62c4973947ec)

Callback proxy for Action Callbacks. Implements the [`DpActionCallback`](../DpActionCallback.md#dpactioncallback-62c4973947ec)
 interface and delegates calls to the registered callback POJO with annotated
 methods

**Since:** 3.2.0

## Members

**Constructors**:

- [ActionCallbackProxy\(Object, String\)](#actioncallbackproxy-78f40265dddb)

**Fields**:

- [M\_ABORT](../DpActionCallback.md#m_abort-7b4607723e90) from DpActionCallback
- [M\_ACTION](../DpActionCallback.md#m_action-7085cebe5b02) from DpActionCallback
- [M\_COMMAND](../DpActionCallback.md#m_command-7b1086f0f7fa) from DpActionCallback
- [M\_COMPLETION](../DpActionCallback.md#m_completion-25ac3cbe9876) from DpActionCallback
- [M\_INIT](../DpActionCallback.md#m_init-13cacf7e79fd) from DpActionCallback

**Methods**:

- [abort\(DpActionTrans\)](#abort-cd35d6a916f4)
- [action\(DpActionTrans, ConfTag, ConfObject\[\], ConfXMLParam\[\]\)](#action-80bbec157786)
- [actionpoint\(\)](#actionpoint-0569c173260f)
- [addActionCapability\(ActionCBType\)](#addactioncapability-4494e9279e5a)
- [addActionMethod\(String, Method\)](#addactionmethod-cf3e43a67fd9)
- [command\(DpActionTrans, String, String, String\[\]\)](#command-cea87613b5a2)
- [completion\(DpActionTrans, char, String, char, ConfObject\[\], String, String, ConfQname, String\)](#completion-2f4ed4ef651b)
- [getActionCallbackProxys\(Object\)](#getactioncallbackproxys-3c92883debd8)
- [getBackupObject\(\)](#getbackupobject-a6fb23c24524)
- [getCallPoint\(\)](#getcallpoint-f816d0a44b26)
- [init\(DpActionTrans\)](#init-ea24b0ff3f23)
- [mask\(\)](#mask-24c2fa29c6af)

## Constructors

### ActionCallbackProxy(Object, String) <a href="#actioncallbackproxy-78f40265dddb" id="actioncallbackproxy-78f40265dddb"></a>

```java
public ActionCallbackProxy(Object backupObject, String callPoint)
```

Constructor to Action Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

### abort(DpActionTrans) <a href="#abort-cd35d6a916f4" id="abort-cd35d6a916f4"></a>

```java
public void abort(com.tailf.dp.DpActionTrans actx) throws com.tailf.dp.DpCallbackException
```

Types: [DpActionTrans](../DpActionTrans.md#dpactiontrans-b975ce2c2d93), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`

### action(DpActionTrans, ConfTag, ConfObject[], ConfXMLParam[]) <a href="#action-80bbec157786" id="action-80bbec157786"></a>

```java
public com.tailf.conf.ConfXMLParam[] action(
    com.tailf.dp.DpActionTrans actx,
    com.tailf.conf.ConfTag name,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfXMLParam](../../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [DpActionTrans](../DpActionTrans.md#dpactiontrans-b975ce2c2d93), [ConfTag](../../conf/ConfTag.md#conftag-73757b87bc93), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`
- `com.tailf.conf.ConfTag name`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfXMLParam[] params`

### actionpoint() <a href="#actionpoint-0569c173260f" id="actionpoint-0569c173260f"></a>

```java
public String actionpoint()
```

### addActionCapability(ActionCBType) <a href="#addactioncapability-4494e9279e5a" id="addactioncapability-4494e9279e5a"></a>

```java
public void addActionCapability(com.tailf.dp.proto.ActionCBType actionCBType)
```

Types: [ActionCBType](../proto/ActionCBType.md#actioncbtype-10d0222e8e66)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.ActionCBType actionCBType` - action type

### addActionMethod(String, Method) <a href="#addactionmethod-cf3e43a67fd9" id="addactionmethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### command(DpActionTrans, String, String, String[]) <a href="#command-cea87613b5a2" id="command-cea87613b5a2"></a>

```java
public String[] command(
    com.tailf.dp.DpActionTrans actx,
    String cmdname,
    String cmdpath,
    String[] params
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpActionTrans](../DpActionTrans.md#dpactiontrans-b975ce2c2d93), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`
- `String cmdname`
- `String cmdpath`
- `String[] params`

### completion(DpActionTrans, char, String, char, ConfObject[], String, String, ConfQname, String) <a href="#completion-2f4ed4ef651b" id="completion-2f4ed4ef651b"></a>

```java
public com.tailf.dp.Completion completion(
    com.tailf.dp.DpActionTrans actx,
    char cliStyle,
    String token,
    char completionChar,
    com.tailf.conf.ConfObject[] kp,
    String cmdPath,
    String cmdParamId,
    com.tailf.conf.ConfQname simpleType,
    String extra
)
    throws com.tailf.dp.DpCallbackException
```

Types: [Completion](../Completion.md#completion-86b0b2e96c7f), [DpActionTrans](../DpActionTrans.md#dpactiontrans-b975ce2c2d93), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [ConfQname](../../conf/ConfQname.md#confqname-32a7566f68b5), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`
- `char cliStyle`
- `String token`
- `char completionChar`
- `com.tailf.conf.ConfObject[] kp`
- `String cmdPath`
- `String cmdParamId`
- `com.tailf.conf.ConfQname simpleType`
- `String extra`

### getActionCallbackProxys(Object) <a href="#getactioncallbackproxys-3c92883debd8" id="getactioncallbackproxys-3c92883debd8"></a>

```java
public static com.tailf.dp.annotations.ActionCallbackProxy[] getActionCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ActionCallbackProxy](ActionCallbackProxy.md#actioncallbackproxy-ee0d5c554b8c), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered callback POJO

**Returns:** array of ActionCallbackProxy

**Throws**

- `DpCallbackException`

### getBackupObject() <a href="#getbackupobject-a6fb23c24524" id="getbackupobject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getCallPoint() <a href="#getcallpoint-f816d0a44b26" id="getcallpoint-f816d0a44b26"></a>

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

### init(DpActionTrans) <a href="#init-ea24b0ff3f23" id="init-ea24b0ff3f23"></a>

```java
public void init(com.tailf.dp.DpActionTrans actx) throws com.tailf.dp.DpCallbackException
```

Types: [DpActionTrans](../DpActionTrans.md#dpactiontrans-b975ce2c2d93), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`

### mask() <a href="#mask-24c2fa29c6af" id="mask-24c2fa29c6af"></a>

```java
public int mask()
```
