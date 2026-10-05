<a id="s-NanoServiceCallbackProxy"></a>
# NanoServiceCallbackProxy

```java
public class com.tailf.dp.annotations.NanoServiceCallbackProxy
    implements com.tailf.dp.DpNanoServiceCallback
```

Types: [DpNanoServiceCallback](../DpNanoServiceCallback.md#s-DpNanoServiceCallback)

Callback proxy for Nano Service Callbacks.
 Implements the [`DpServiceCallback`](../DpServiceCallback.md#s-DpServiceCallback)
 interface and delegates calls to the registered callback POJO with annotated
 methods

## Members

**Constructors**:

- [NanoServiceCallbackProxy(Object, String, String, String)](#s-NanoServiceCallbackProxy-1)

**Fields**:

- [M_NANO_CREATE](../DpNanoServiceCallback.md#s-M_NANO_CREATE) from DpNanoServiceCallback
- [M_NANO_DELETE](../DpNanoServiceCallback.md#s-M_NANO_DELETE) from DpNanoServiceCallback

**Methods**:

- [addActionCapability(NanoServiceCBType)](#s-addActionCapability)
- [addActionMethod(String, Method)](#s-addActionMethod)
- [componentType()](#s-componentType)
- [create(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)](#s-create)
- [delete(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)](#s-delete)
- [getBackupObject()](#s-getBackupObject)
- [getNanoServiceCallbackProxys(Object)](#s-getNanoServiceCallbackProxys)
- [getServicePoint()](#s-getServicePoint)
- [mask()](#s-mask)
- [servicepoint()](#s-servicepoint)
- [state()](#s-state)

## Constructors

<a id="s-NanoServiceCallbackProxy-1"></a>
### NanoServiceCallbackProxy(Object, String, String, String)

```java
public NanoServiceCallbackProxy(
    Object backupObject,
    String servicePoint,
    String componentType,
    String state
)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String servicePoint` - string describing the servicepoint for this callback
- `String componentType`
- `String state`


## Methods

<a id="s-addActionCapability"></a>
### addActionCapability(NanoServiceCBType)

```java
public void addActionCapability(com.tailf.dp.proto.NanoServiceCBType nanoServiceCBType)
```

Types: [NanoServiceCBType](../proto/NanoServiceCBType.md#s-NanoServiceCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.NanoServiceCBType nanoServiceCBType` - action type

<a id="s-addActionMethod"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="s-componentType"></a>
### componentType()

```java
public String componentType()
```

<a id="s-create"></a>
### create(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)

```java
public java.util.Properties create(
    com.tailf.dp.services.NanoServiceContext context,
    com.tailf.navu.NavuNode service,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque,
    java.util.Properties componentProperties
)
    throws com.tailf.dp.DpCallbackException
```

Types: [NanoServiceContext](../services/NanoServiceContext.md#s-NanoServiceContext), [NavuNode](../../navu/NavuNode.md#s-NavuNode), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.NanoServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
- `java.util.Properties componentProperties`

<a id="s-delete"></a>
### delete(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)

```java
public java.util.Properties delete(
    com.tailf.dp.services.NanoServiceContext context,
    com.tailf.navu.NavuNode service,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque,
    java.util.Properties componentProperties
)
    throws com.tailf.dp.DpCallbackException
```

Types: [NanoServiceContext](../services/NanoServiceContext.md#s-NanoServiceContext), [NavuNode](../../navu/NavuNode.md#s-NavuNode), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.NanoServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
- `java.util.Properties componentProperties`

<a id="s-getBackupObject"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="s-getNanoServiceCallbackProxys"></a>
### getNanoServiceCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.NanoServiceCallbackProxy[] getNanoServiceCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [NanoServiceCallbackProxy](NanoServiceCallbackProxy.md#s-NanoServiceCallbackProxy), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of NanoServCallbackProxy

**Throws**

- `DpCallbackException`

<a id="s-getServicePoint"></a>
### getServicePoint()

```java
public String getServicePoint()
```

Retrieve the callback servicepoint

**Returns:** servicepoint string

<a id="s-mask"></a>
### mask()

```java
public int mask()
```

<a id="s-servicepoint"></a>
### servicepoint()

```java
public String servicepoint()
```

<a id="s-state"></a>
### state()

```java
public String state()
```
