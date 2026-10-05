<a id="s-ActionCallbackProxy"></a>
# ActionCallbackProxy

```java
public class com.tailf.dp.annotations.ActionCallbackProxy
    implements com.tailf.dp.DpActionCallback
```

Types: [DpActionCallback](../DpActionCallback.md#s-DpActionCallback)

Callback proxy for Action Callbacks. Implements the [`DpActionCallback`](../DpActionCallback.md#s-DpActionCallback)
 interface and delegates calls to the registered callback POJO with annotated
 methods

**Since:** 3.2.0

## Members

**Constructors**:

- [ActionCallbackProxy(Object, String)](#s-ActionCallbackProxy-1)

**Fields**:

- [M_ABORT](../DpActionCallback.md#s-M_ABORT) from DpActionCallback
- [M_ACTION](../DpActionCallback.md#s-M_ACTION) from DpActionCallback
- [M_COMMAND](../DpActionCallback.md#s-M_COMMAND) from DpActionCallback
- [M_COMPLETION](../DpActionCallback.md#s-M_COMPLETION) from DpActionCallback
- [M_INIT](../DpActionCallback.md#s-M_INIT) from DpActionCallback

**Methods**:

- [abort(DpActionTrans)](#s-abort)
- [action(DpActionTrans, ConfTag, ConfObject[], ConfXMLParam[])](#s-action)
- [actionpoint()](#s-actionpoint)
- [addActionCapability(ActionCBType)](#s-addActionCapability)
- [addActionMethod(String, Method)](#s-addActionMethod)
- [command(DpActionTrans, String, String, String[])](#s-command)
- [completion(DpActionTrans, char, String, char, ConfObject[], String, String, ConfQname, String)](#s-completion)
- [getActionCallbackProxys(Object)](#s-getActionCallbackProxys)
- [getBackupObject()](#s-getBackupObject)
- [getCallPoint()](#s-getCallPoint)
- [init(DpActionTrans)](#s-init)
- [mask()](#s-mask)

## Constructors

<a id="s-ActionCallbackProxy-1"></a>
### ActionCallbackProxy(Object, String)

```java
public ActionCallbackProxy(Object backupObject, String callPoint)
```

Constructor to Action Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

<a id="s-abort"></a>
### abort(DpActionTrans)

```java
public void abort(com.tailf.dp.DpActionTrans actx) throws com.tailf.dp.DpCallbackException
```

Types: [DpActionTrans](../DpActionTrans.md#s-DpActionTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`

<a id="s-action"></a>
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

Types: [ConfXMLParam](../../conf/ConfXMLParam.md#s-ConfXMLParam), [DpActionTrans](../DpActionTrans.md#s-DpActionTrans), [ConfTag](../../conf/ConfTag.md#s-ConfTag), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`
- `com.tailf.conf.ConfTag name`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfXMLParam[] params`

<a id="s-actionpoint"></a>
### actionpoint()

```java
public String actionpoint()
```

<a id="s-addActionCapability"></a>
### addActionCapability(ActionCBType)

```java
public void addActionCapability(com.tailf.dp.proto.ActionCBType actionCBType)
```

Types: [ActionCBType](../proto/ActionCBType.md#s-ActionCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.ActionCBType actionCBType` - action type

<a id="s-addActionMethod"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="s-command"></a>
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

Types: [DpActionTrans](../DpActionTrans.md#s-DpActionTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`
- `String cmdname`
- `String cmdpath`
- `String[] params`

<a id="s-completion"></a>
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

Types: [Completion](../Completion.md#s-Completion), [DpActionTrans](../DpActionTrans.md#s-DpActionTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [ConfQname](../../conf/ConfQname.md#s-ConfQname), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

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

<a id="s-getActionCallbackProxys"></a>
### getActionCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.ActionCallbackProxy[] getActionCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ActionCallbackProxy](ActionCallbackProxy.md#s-ActionCallbackProxy), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered callback POJO

**Returns:** array of ActionCallbackProxy

**Throws**

- `DpCallbackException`

<a id="s-getBackupObject"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="s-getCallPoint"></a>
### getCallPoint()

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

<a id="s-init"></a>
### init(DpActionTrans)

```java
public void init(com.tailf.dp.DpActionTrans actx) throws com.tailf.dp.DpCallbackException
```

Types: [DpActionTrans](../DpActionTrans.md#s-DpActionTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpActionTrans actx`

<a id="s-mask"></a>
### mask()

```java
public int mask()
```
