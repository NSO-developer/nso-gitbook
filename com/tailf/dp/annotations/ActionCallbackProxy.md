<a id="cls-ActionCallbackProxy"></a>
# ActionCallbackProxy

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

- [ActionCallbackProxy(Object, String)](#m-actioncallbackproxy-78f40265dddb)

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
- [addActionCapability(ActionCBType)](#m-addactioncapability-4494e9279e5a)
- [addActionMethod(String, Method)](#m-addactionmethod-cf3e43a67fd9)
- [command(DpActionTrans, String, String, String[])](#m-command-cea87613b5a2)
- [completion(DpActionTrans, char, String, char, ConfObject[], String, String, ConfQname, String)](#m-completion-2f4ed4ef651b)
- [getActionCallbackProxys(Object)](#m-getactioncallbackproxys-3c92883debd8)
- [getBackupObject()](#m-getbackupobject-a6fb23c24524)
- [getCallPoint()](#m-getcallpoint-f816d0a44b26)
- [init(DpActionTrans)](#m-init-ea24b0ff3f23)
- [mask()](#m-mask-24c2fa29c6af)

## Constructors

<a id="m-actioncallbackproxy-78f40265dddb"></a>
### ActionCallbackProxy(Object, String)

```java
public ActionCallbackProxy(Object backupObject, String callPoint)
```

Constructor to Action Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

<a id="m-abort-cd35d6a916f4"></a>
### abort(DpActionTrans)

```java
public void abort(com.tailf.dp.DpActionTrans actx) throws com.tailf.dp.DpCallbackException
```

Types: [DpActionTrans](../DpActionTrans.md#cls-DpActionTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`

<a id="m-action-80bbec157786"></a>
### action(DpActionTrans, ConfTag, ConfObject[], ConfXMLParam[])

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

<a id="m-actionpoint-0569c173260f"></a>
### actionpoint()

```java
public String actionpoint()
```

<a id="m-addactioncapability-4494e9279e5a"></a>
### addActionCapability(ActionCBType)

```java
public void addActionCapability(com.tailf.dp.proto.ActionCBType actionCBType)
```

Types: [ActionCBType](../proto/ActionCBType.md#cls-ActionCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.ActionCBType actionCBType` - action type

<a id="m-addactionmethod-cf3e43a67fd9"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="m-command-cea87613b5a2"></a>
### command(DpActionTrans, String, String, String[])

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

<a id="m-completion-2f4ed4ef651b"></a>
### completion(DpActionTrans, char, String, char, ConfObject[], String, String, ConfQname, String)

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

<a id="m-getactioncallbackproxys-3c92883debd8"></a>
### getActionCallbackProxys(Object)

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

<a id="m-getbackupobject-a6fb23c24524"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="m-getcallpoint-f816d0a44b26"></a>
### getCallPoint()

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

<a id="m-init-ea24b0ff3f23"></a>
### init(DpActionTrans)

```java
public void init(com.tailf.dp.DpActionTrans actx) throws com.tailf.dp.DpCallbackException
```

Types: [DpActionTrans](../DpActionTrans.md#cls-DpActionTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`

<a id="m-mask-24c2fa29c6af"></a>
### mask()

```java
public int mask()
```
