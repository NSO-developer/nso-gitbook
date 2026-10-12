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

*Description from* [`DpActionCallback.abort(com.tailf.dp.DpActionTrans)`](../DpActionCallback.md#abort-cd35d6a916f4)

The abort() callback will be called for user initiated abort of an
  action. The abort() callback will be called in a separate thread from
  the thread that is executing the action() callback.
  It is the responsibility of the abort() call to stop the action thread
  execution.

  There are two ways that the action() execution could be terminated.
  The simple solution is that the action() implementation itself checks
  the action transaction state by a call to
  [`DpActionTrans#getActionState()`](../DpActionTrans.md#getactionstate-f64b645d471e). In this case the abort() can
  have an empty implementation since the state will implicitly be set to
  [`DpActionTrans#STATE_ABORTED`](../DpActionTrans.md#state_aborted-f267bf6c0021).

  However the above scenario is often not sufficient because the action()
  execution thread is busy and not able to check the state. In this case,
  the abort() callback needs to get hold of the execution action() thread
  and intervene to stop the execution.
  To be able to do this there need to be some information carried in
  DpActionTrans instance that makes this possible. Here using the
  [`DpTrans#getTransactionUserOpaque()`](../DpTrans.md#gettransactionuseropaque-87a9bf7a20e1) is recommended.

  For instance the action() callback can initially call
  [`DpTrans#setTransactionUserOpaque(Object)`](../DpTrans.md#settransactionuseropaque-ce392ad59d2e) with the object
  being the current thread using Thread.currentThread(). The abort()
  can then retrieve that Thread using
  [`DpTrans#getTransactionUserOpaque()`](../DpTrans.md#gettransactionuseropaque-87a9bf7a20e1)
  and make a `Thread#interrupt()` call, under the assumption that
  the action() implementation is sensitive to interrupts and handles
  InterruptedException.

**Parameters**

- `com.tailf.dp.DpActionTrans actx` - The DpActionTrans instance, same as for the running action.

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

*Description from* [`DpActionCallback.action(com.tailf.dp.DpActionTrans, com.tailf.conf.ConfTag, com.tailf.conf.ConfObject[], com.tailf.conf.ConfXMLParam[])`](../DpActionCallback.md#action-80bbec157786)

The action() callback receives all the parameters pertaining to the
 action: The name argument is a pointer to the action name as defined in
 YANG model, the kp argument gives the path through the XML
 tree, and finally the params argument is a representation of the
 params element of the XML instance document provided with the invocation.

**Parameters**

- `com.tailf.dp.DpActionTrans actx` - Action transaction context
- `com.tailf.conf.ConfTag name` - Action name
- `com.tailf.conf.ConfObject[] kp` - Keypath array. kp\[0\] is the leaf.
- `com.tailf.conf.ConfXMLParam[] params` - Action parameters

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

### actionpoint() <a href="#actionpoint-0569c173260f" id="actionpoint-0569c173260f"></a>

```java
public String actionpoint()
```

*Description from* [`DpActionCallback.actionpoint()`](../DpActionCallback.md#actionpoint-0569c173260f)

Return the name of the action point.

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

*Description from* [`DpActionCallback.command(com.tailf.dp.DpActionTrans, String, String, String[])`](../DpActionCallback.md#command-cea87613b5a2)

The command() callback is invoked for CLI callback commands. As the
 parameters in this case are all in string form, they are passed as an
 array of strings.

**Parameters**

- `com.tailf.dp.DpActionTrans actx` - Action transaction context
- `String cmdname` - Command name
- `String cmdpath` - Command path
- `String[] params` - Command parameters

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed

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

*Description from* [`DpActionCallback.completion(com.tailf.dp.DpActionTrans, char, String, char, com.tailf.conf.ConfObject[], String, String, com.tailf.conf.ConfQname, String)`](../DpActionCallback.md#completion-2f4ed4ef651b)

The completion() callback is invoked for CLI completion
 and information. It must result in a [`Completion`](../Completion.md#completion-86b0b2e96c7f) class instance.
 It is invoked for yang model elements with the directive
 tailf:cli-completion-actionpoint as well as model list elements with
 directives tailf:cli-custom-range-actionpoint or
 tailf:cli-custom-range-enumerator. Also for the corresponding directives
 in a clispec.

**Parameters**

- `com.tailf.dp.DpActionTrans actx` - Action transaction context
- `char cliStyle` - One of J, C or I for juniper, cisco-xr or cisco-ios
- `String token` - Parameter of the CLI command line that the callback
invocation pertains to
- `char completionChar` - The char the user typed on of '\\t', '?' or ' '
- `com.tailf.conf.ConfObject[] kp` - Identifies model element path that the callback pertains
to or null if not applicable
- `String cmdPath` - String giving the full path of the command
- `String cmdParamId` - The cli-completion-id if such is given in yang model
or clispec.
- `com.tailf.conf.ConfQname simpleType` - If the invocation pertains to an element that has a
type definition, the simpleType identifies the type
- `String extra` - The extra argument is currently unused (always null).

**Returns:** Completion object with the relevant completion structure.

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

- `com.tailf.dp.DpCallbackException`

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

*Description from* [`DpActionCallback.init(com.tailf.dp.DpActionTrans)`](../DpActionCallback.md#init-ea24b0ff3f23)

Similar to the init() callback for external data bases. This socket will
 be used for the invocation of the action() callback, which implements the
 actual action. However note that unlike the callbacks for external data
 bases and validation, both callbacks are registered for each action point
 (i.e. different action points can have different init() callbacks), and
 there is no finish() callback - the action is completed when the action()
 callback returns.

**Parameters**

- `com.tailf.dp.DpActionTrans actx` - Action transaction context

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

### mask() <a href="#mask-24c2fa29c6af" id="mask-24c2fa29c6af"></a>

```java
public int mask()
```

*Description from* [`DpActionCallback.mask()`](../DpActionCallback.md#mask-24c2fa29c6af)

Mask of flags for each method that is supported by this callback
