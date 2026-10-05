# NanoServiceCallbackProxy <a href="#cls-NanoServiceCallbackProxy" id="cls-NanoServiceCallbackProxy"></a>

```java
public class com.tailf.dp.annotations.NanoServiceCallbackProxy
    implements com.tailf.dp.DpNanoServiceCallback
```

Types: [DpNanoServiceCallback](../DpNanoServiceCallback.md#cls-DpNanoServiceCallback)

Callback proxy for Nano Service Callbacks.
 Implements the [`DpServiceCallback`](../DpServiceCallback.md#cls-DpServiceCallback)
 interface and delegates calls to the registered callback POJO with annotated
 methods

## Members

**Constructors**:

- [NanoServiceCallbackProxy(Object, String, String, String)](#m-NanoServiceCallbackProxy-97d281c4d63b)

**Fields**:

- [M_NANO_CREATE](../DpNanoServiceCallback.md#m-M_NANO_CREATE) from DpNanoServiceCallback
- [M_NANO_DELETE](../DpNanoServiceCallback.md#m-M_NANO_DELETE) from DpNanoServiceCallback

**Methods**:

- [addActionCapability(NanoServiceCBType)](#m-addActionCapability-1cb3659d509e)
- [addActionMethod(String, Method)](#m-addActionMethod-cf3e43a67fd9)
- [componentType()](#m-componentType-59add484020d)
- [create(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)](#m-create-45a9e9003e1d)
- [delete(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)](#m-delete-4ba929210861)
- [getBackupObject()](#m-getBackupObject-a6fb23c24524)
- [getNanoServiceCallbackProxys(Object)](#m-getNanoServiceCallbackProxys-774a1b856b31)
- [getServicePoint()](#m-getServicePoint-4b0d670b9506)
- [mask()](#m-mask-24c2fa29c6af)
- [servicepoint()](#m-servicepoint-33fbd1d46c70)
- [state()](#m-state-54117dea2388)

## Constructors

### NanoServiceCallbackProxy(Object, String, String, String) <a href="#m-NanoServiceCallbackProxy-97d281c4d63b" id="m-NanoServiceCallbackProxy-97d281c4d63b"></a>

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

### addActionCapability(NanoServiceCBType) <a href="#m-addActionCapability-1cb3659d509e" id="m-addActionCapability-1cb3659d509e"></a>

```java
public void addActionCapability(com.tailf.dp.proto.NanoServiceCBType nanoServiceCBType)
```

Types: [NanoServiceCBType](../proto/NanoServiceCBType.md#cls-NanoServiceCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.NanoServiceCBType nanoServiceCBType` - action type

### addActionMethod(String, Method) <a href="#m-addActionMethod-cf3e43a67fd9" id="m-addActionMethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### componentType() <a href="#m-componentType-59add484020d" id="m-componentType-59add484020d"></a>

```java
public String componentType()
```

### create(NanoServiceContext, NavuNode, NavuNode, Properties, Properties) <a href="#m-create-45a9e9003e1d" id="m-create-45a9e9003e1d"></a>

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

Types: [NanoServiceContext](../services/NanoServiceContext.md#cls-NanoServiceContext), [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.NanoServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
- `java.util.Properties componentProperties`

### delete(NanoServiceContext, NavuNode, NavuNode, Properties, Properties) <a href="#m-delete-4ba929210861" id="m-delete-4ba929210861"></a>

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

Types: [NanoServiceContext](../services/NanoServiceContext.md#cls-NanoServiceContext), [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.NanoServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
- `java.util.Properties componentProperties`

### getBackupObject() <a href="#m-getBackupObject-a6fb23c24524" id="m-getBackupObject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getNanoServiceCallbackProxys(Object) <a href="#m-getNanoServiceCallbackProxys-774a1b856b31" id="m-getNanoServiceCallbackProxys-774a1b856b31"></a>

```java
public static com.tailf.dp.annotations.NanoServiceCallbackProxy[] getNanoServiceCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [NanoServiceCallbackProxy](NanoServiceCallbackProxy.md#cls-NanoServiceCallbackProxy), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of NanoServCallbackProxy

**Throws**

- `DpCallbackException`

### getServicePoint() <a href="#m-getServicePoint-4b0d670b9506" id="m-getServicePoint-4b0d670b9506"></a>

```java
public String getServicePoint()
```

Retrieve the callback servicepoint

**Returns:** servicepoint string

### mask() <a href="#m-mask-24c2fa29c6af" id="m-mask-24c2fa29c6af"></a>

```java
public int mask()
```

### servicepoint() <a href="#m-servicepoint-33fbd1d46c70" id="m-servicepoint-33fbd1d46c70"></a>

```java
public String servicepoint()
```

### state() <a href="#m-state-54117dea2388" id="m-state-54117dea2388"></a>

```java
public String state()
```
