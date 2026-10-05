<a id="s-DpActionCallback"></a>
# DpActionCallback

```java
public interface com.tailf.dp.DpActionCallback
```

This interface is used for the user actions callbacks.

 Actions are specified in the data model (see tailf_yang_extensions(5)).
 The actionpoint specifies that the action is implemented as a callback
 function.

 Unlike the callbacks for data and validation, there is no transaction
 associated with an action callback. However an action is always associated
 with a user session (NETCONF, CLI, etc), and only one action at a time can be
 invoked from a given user session. Hence the associated DpUserInfo is passed
 to the callbacks.

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#s-registerAnnotatedCallbacks)

## Members

**Fields**:

- [M_ABORT](#s-M_ABORT)
- [M_ACTION](#s-M_ACTION)
- [M_COMMAND](#s-M_COMMAND)
- [M_COMPLETION](#s-M_COMPLETION)
- [M_INIT](#s-M_INIT)

**Methods**:

- [abort(DpActionTrans)](#s-abort)
- [action(DpActionTrans, ConfTag, ConfObject[], ConfXMLParam[])](#s-action)
- [actionpoint()](#s-actionpoint)
- [command(DpActionTrans, String, String, String[])](#s-command)
- [completion(DpActionTrans, char, String, char, ConfObject[], String, String, ConfQname, String)](#s-completion)
- [init(DpActionTrans)](#s-init)
- [mask()](#s-mask)

## Fields

<a id="s-M_ABORT"></a>
### M_ABORT

```java
public static final int M_ABORT = 2;
```

<a id="s-M_ACTION"></a>
### M_ACTION

```java
public static final int M_ACTION = 4;
```

<a id="s-M_COMMAND"></a>
### M_COMMAND

```java
public static final int M_COMMAND = 8;
```

<a id="s-M_COMPLETION"></a>
### M_COMPLETION

```java
public static final int M_COMPLETION = 16;
```

<a id="s-M_INIT"></a>
### M_INIT

```java
public static final int M_INIT = 1;
```


## Methods

<a id="s-abort"></a>
### abort(DpActionTrans)

```java
public abstract void abort(com.tailf.dp.DpActionTrans actx) throws com.tailf.dp.DpCallbackException
```

Types: [DpActionTrans](DpActionTrans.md#s-DpActionTrans), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

The abort() callback will be called for user initiated abort of an
  action. The abort() callback will be called in a separate thread from
  the thread that is executing the action() callback.
  It is the responsibility of the abort() call to stop the action thread
  execution.

  There are two ways that the action() execution could be terminated.
  The simple solution is that the action() implementation itself checks
  the action transaction state by a call to
  [`DpActionTrans`](DpActionTrans.md#s-DpActionTrans). In this case the abort() can
  have an empty implementation since the state will implicitly be set to
  [`DpActionTrans`](DpActionTrans.md#s-DpActionTrans).

  However the above scenario is often not sufficient because the action()
  execution thread is busy and not able to check the state. In this case,
  the abort() callback needs to get hold of the execution action() thread
  and intervene to stop the execution.
  To be able to do this there need to be some information carried in
  DpActionTrans instance that makes this possible. Here using the
  [`DpActionTrans`](DpActionTrans.md#s-DpActionTrans) is recommended.

  For instance the action() callback can initially call
  [`DpActionTrans`](DpActionTrans.md#s-DpActionTrans) with the object
  being the current thread using Thread.currentThread(). The abort()
  can then retrieve that Thread using
  [`DpActionTrans`](DpActionTrans.md#s-DpActionTrans)
  and make a `Thread#interrupt()` call, under the assumption that
  the action() implementation is sensitive to interrupts and handles
  InterruptedException.

**Parameters**

- `com.tailf.dp.DpActionTrans actx` - The DpActionTrans instance, same as for the running action.

**Throws**

- `DpCallbackException`

<a id="s-action"></a>
### action(DpActionTrans, ConfTag, ConfObject[], ConfXMLParam[])

```java
public abstract com.tailf.conf.ConfXMLParam[] action(
    com.tailf.dp.DpActionTrans actx,
    com.tailf.conf.ConfTag name,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [DpActionTrans](DpActionTrans.md#s-DpActionTrans), [ConfTag](../conf/ConfTag.md#s-ConfTag), [ConfObject](../conf/ConfObject.md#s-ConfObject), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

The action() callback receives all the parameters pertaining to the
 action: The name argument is a pointer to the action name as defined in
 YANG model, the kp argument gives the path through the XML
 tree, and finally the params argument is a representation of the
 params element of the XML instance document provided with the invocation.

**Parameters**

- `com.tailf.dp.DpActionTrans actx` - Action transaction context
- `com.tailf.conf.ConfTag name` - Action name
- `com.tailf.conf.ConfObject[] kp` - Keypath array. kp[0] is the leaf.
- `com.tailf.conf.ConfXMLParam[] params` - Action parameters

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-actionpoint"></a>
### actionpoint()

```java
public abstract String actionpoint()
```

Return the name of the action point.

<a id="s-command"></a>
### command(DpActionTrans, String, String, String[])

```java
public abstract String[] command(
    com.tailf.dp.DpActionTrans actx,
    String cmdname,
    String cmdpath,
    String[] params
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpActionTrans](DpActionTrans.md#s-DpActionTrans), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

The command() callback is invoked for CLI callback commands. As the
 parameters in this case are all in string form, they are passed as an
 array of strings.

**Parameters**

- `com.tailf.dp.DpActionTrans actx` - Action transaction context
- `String cmdname` - Command name
- `String cmdpath` - Command path
- `String[] params` - Command parameters

**Throws**

- `DpCallbackException` - Callback method failed

<a id="s-completion"></a>
### completion(DpActionTrans, char, String, char, ConfObject[], String, String, ConfQname, String)

```java
public abstract com.tailf.dp.Completion completion(
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

Types: [Completion](Completion.md#s-Completion), [DpActionTrans](DpActionTrans.md#s-DpActionTrans), [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfQname](../conf/ConfQname.md#s-ConfQname), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

The completion() callback is invoked for CLI completion
 and information. It must result in a [`Completion`](Completion.md#s-Completion) class instance.
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
- `char completionChar` - The char the user typed on of '\t', '?' or ' '
- `com.tailf.conf.ConfObject[] kp` - Identifies model element path that the callback pertains
                 to or null if not applicable
- `String cmdPath` - String giving the full path of the command
- `String cmdParamId` - The cli-completion-id if such is given in yang model
                   or clispec.
- `com.tailf.conf.ConfQname simpleType` - If the invocation pertains to an element that has a
                   type definition, the simpleType identifies the type
- `String extra` - The extra argument is currently unused (always null).

**Returns:** Completion object with the relevant completion structure.

**Throws**

- `DpCallbackException`

<a id="s-init"></a>
### init(DpActionTrans)

```java
public abstract void init(com.tailf.dp.DpActionTrans actx) throws com.tailf.dp.DpCallbackException
```

Types: [DpActionTrans](DpActionTrans.md#s-DpActionTrans), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

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

- `DpCallbackException` - Callback method failed.

<a id="s-mask"></a>
### mask()

```java
public abstract int mask()
```

Mask of flags for each method that is supported by this callback
