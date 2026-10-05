# ActionCallbackProxy <a href="#cls-ActionCallbackProxy" id="cls-ActionCallbackProxy"></a>

```java
public class com.tailf.dp.annotations.ActionCallbackProxy
    implements com.tailf.dp.DpActionCallback
```

Types: [DpActionCallback](../DpActionCallback.md#cls-DpActionCallback)

Callback proxy for Action Callbacks. Implements the [`DpActionCallback`](../DpActionCallback.md#cls-DpActionCallback)
 interface and delegates calls to the registered callback POJO with annotated
 methods

**Since:** 3.2.0

## Members

**Constructors**:

- [ActionCallbackProxy(Object, String)](#m-ActionCallbackProxy-78f40265dddb)

**Fields**:

- [M_ABORT](../DpActionCallback.md#m-M_ABORT) from DpActionCallback
- [M_ACTION](../DpActionCallback.md#m-M_ACTION) from DpActionCallback
- [M_COMMAND](../DpActionCallback.md#m-M_COMMAND) from DpActionCallback
- [M_COMPLETION](../DpActionCallback.md#m-M_COMPLETION) from DpActionCallback
- [M_INIT](../DpActionCallback.md#m-M_INIT) from DpActionCallback

**Methods**:

- [abort(DpActionTrans)](#m-abort-cd35d6a916f4)
- [action(DpActionTrans, ConfTag, ConfObject[], ConfXMLParam[])](#m-action-80bbec157786)
- [actionpoint()](#m-actionpoint-0569c173260f)
- [addActionCapability(ActionCBType)](#m-addActionCapability-4494e9279e5a)
- [addActionMethod(String, Method)](#m-addActionMethod-cf3e43a67fd9)
- [command(DpActionTrans, String, String, String[])](#m-command-cea87613b5a2)
- [completion(DpActionTrans, char, String, char, ConfObject[], String, String, ConfQname, String)](#m-completion-2f4ed4ef651b)
- [getActionCallbackProxys(Object)](#m-getActionCallbackProxys-3c92883debd8)
- [getBackupObject()](#m-getBackupObject-a6fb23c24524)
- [getCallPoint()](#m-getCallPoint-f816d0a44b26)
- [init(DpActionTrans)](#m-init-ea24b0ff3f23)
- [mask()](#m-mask-24c2fa29c6af)

## Constructors

### ActionCallbackProxy(Object, String) <a href="#m-ActionCallbackProxy-78f40265dddb" id="m-ActionCallbackProxy-78f40265dddb"></a>

```java
public ActionCallbackProxy(Object backupObject, String callPoint)
```

Constructor to Action Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

### abort(DpActionTrans) <a href="#m-abort-cd35d6a916f4" id="m-abort-cd35d6a916f4"></a>

```java
public void abort(com.tailf.dp.DpActionTrans actx) throws com.tailf.dp.DpCallbackException
```

Types: [DpActionTrans](../DpActionTrans.md#cls-DpActionTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`

### action(DpActionTrans, ConfTag, ConfObject[], ConfXMLParam[]) <a href="#m-action-80bbec157786" id="m-action-80bbec157786"></a>

```java
public com.tailf.conf.ConfXMLParam[] action(
    com.tailf.dp.DpActionTrans actx,
    com.tailf.conf.ConfTag name,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfXMLParam](../../conf/ConfXMLParam.md#cls-ConfXMLParam), [DpActionTrans](../DpActionTrans.md#cls-DpActionTrans), [ConfTag](../../conf/ConfTag.md#cls-ConfTag), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`
- `com.tailf.conf.ConfTag name`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfXMLParam[] params`

### actionpoint() <a href="#m-actionpoint-0569c173260f" id="m-actionpoint-0569c173260f"></a>

```java
public String actionpoint()
```

### addActionCapability(ActionCBType) <a href="#m-addActionCapability-4494e9279e5a" id="m-addActionCapability-4494e9279e5a"></a>

```java
public void addActionCapability(com.tailf.dp.proto.ActionCBType actionCBType)
```

Types: [ActionCBType](../proto/ActionCBType.md#cls-ActionCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.ActionCBType actionCBType` - action type

### addActionMethod(String, Method) <a href="#m-addActionMethod-cf3e43a67fd9" id="m-addActionMethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### command(DpActionTrans, String, String, String[]) <a href="#m-command-cea87613b5a2" id="m-command-cea87613b5a2"></a>

```java
public String[] command(
    com.tailf.dp.DpActionTrans actx,
    String cmdname,
    String cmdpath,
    String[] params
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpActionTrans](../DpActionTrans.md#cls-DpActionTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`
- `String cmdname`
- `String cmdpath`
- `String[] params`

### completion(DpActionTrans, char, String, char, ConfObject[], String, String, ConfQname, String) <a href="#m-completion-2f4ed4ef651b" id="m-completion-2f4ed4ef651b"></a>

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

Types: [Completion](../Completion.md#cls-Completion), [DpActionTrans](../DpActionTrans.md#cls-DpActionTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [ConfQname](../../conf/ConfQname.md#cls-ConfQname), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

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

### getActionCallbackProxys(Object) <a href="#m-getActionCallbackProxys-3c92883debd8" id="m-getActionCallbackProxys-3c92883debd8"></a>

```java
public static com.tailf.dp.annotations.ActionCallbackProxy[] getActionCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ActionCallbackProxy](ActionCallbackProxy.md#cls-ActionCallbackProxy), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered callback POJO

**Returns:** array of ActionCallbackProxy

**Throws**

- `DpCallbackException`

### getBackupObject() <a href="#m-getBackupObject-a6fb23c24524" id="m-getBackupObject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getCallPoint() <a href="#m-getCallPoint-f816d0a44b26" id="m-getCallPoint-f816d0a44b26"></a>

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

### init(DpActionTrans) <a href="#m-init-ea24b0ff3f23" id="m-init-ea24b0ff3f23"></a>

```java
public void init(com.tailf.dp.DpActionTrans actx) throws com.tailf.dp.DpCallbackException
```

Types: [DpActionTrans](../DpActionTrans.md#cls-DpActionTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`

### mask() <a href="#m-mask-24c2fa29c6af" id="m-mask-24c2fa29c6af"></a>

```java
public int mask()
```
