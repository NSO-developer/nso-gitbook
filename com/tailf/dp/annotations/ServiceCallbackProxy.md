<a id="cls-ServiceCallbackProxy"></a>
# ServiceCallbackProxy

```java
public class com.tailf.dp.annotations.ServiceCallbackProxy
    implements com.tailf.dp.DpServiceCallback
```

Types: [DpServiceCallback](../DpServiceCallback.md#cls-DpServiceCallback)

Callback proxy for Service Callbacks.
 Implements the [`DpServiceCallback`](../DpServiceCallback.md#cls-DpServiceCallback)
 interface and delegates calls to the registered callback POJO with annotated
 methods

## Members

**Constructors**:

- [ServiceCallbackProxy(Object, String)](#m-servicecallbackproxy-91833aef468e)

**Fields**:

- [M_CREATE](../DpServiceCallback.md#m-M_CREATE) from DpServiceCallback
- [M_POST_MODIFICATION](../DpServiceCallback.md#m-M_POST_MODIFICATION) from DpServiceCallback
- [M_PRE_MODIFICATION](../DpServiceCallback.md#m-M_PRE_MODIFICATION) from DpServiceCallback

**Methods**:

- [addActionCapability(ServiceCBType)](#m-addactioncapability-8c211470558b)
- [addActionMethod(String, Method)](#m-addactionmethod-cf3e43a67fd9)
- [create(ServiceContext, NavuNode, NavuNode, Properties)](#m-create-4ddbd09c0e51)
- [delete(ServiceContext, NavuNode, Properties)](#m-delete-ec7143c7c683)
- [getBackupObject()](#m-getbackupobject-a6fb23c24524)
- [getServiceCallbackProxys(Object)](#m-getservicecallbackproxys-83af80ed35d3)
- [getServicePoint()](#m-getservicepoint-4b0d670b9506)
- [mask()](#m-mask-24c2fa29c6af)
- [postModification(ServiceContext, ServiceOperationType, ConfPath, Properties)](#m-postmodification-271e17afdb57)
- [preModification(ServiceContext, ServiceOperationType, ConfPath, Properties)](#m-premodification-92ab0a35864a)
- [servicepoint()](#m-servicepoint-33fbd1d46c70)
- [update(ServiceContext, NavuNode, NavuNode, Properties)](#m-update-8a22de5c1ca0)

## Constructors

<a id="m-servicecallbackproxy-91833aef468e"></a>
### ServiceCallbackProxy(Object, String)

```java
public ServiceCallbackProxy(Object backupObject, String servicePoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String servicePoint` - string describing the servicepoint for this callback


## Methods

<a id="m-addactioncapability-8c211470558b"></a>
### addActionCapability(ServiceCBType)

```java
public void addActionCapability(com.tailf.dp.proto.ServiceCBType serviceCBType)
```

Types: [ServiceCBType](../proto/ServiceCBType.md#cls-ServiceCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.ServiceCBType serviceCBType` - action type

<a id="m-addactionmethod-cf3e43a67fd9"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="m-create-4ddbd09c0e51"></a>
### create(ServiceContext, NavuNode, NavuNode, Properties)

```java
public java.util.Properties create(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.navu.NavuNode service,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](../services/ServiceContext.md#cls-ServiceContext), [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`

<a id="m-delete-ec7143c7c683"></a>
### delete(ServiceContext, NavuNode, Properties)

```java
public java.util.Properties delete(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](../services/ServiceContext.md#cls-ServiceContext), [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`

<a id="m-getbackupobject-a6fb23c24524"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="m-getservicecallbackproxys-83af80ed35d3"></a>
### getServiceCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.ServiceCallbackProxy[] getServiceCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceCallbackProxy](ServiceCallbackProxy.md#cls-ServiceCallbackProxy), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of ServCallbackProxy

**Throws**

- `DpCallbackException`

<a id="m-getservicepoint-4b0d670b9506"></a>
### getServicePoint()

```java
public String getServicePoint()
```

Retrieve the callback servicepoint

**Returns:** servicepoint string

<a id="m-mask-24c2fa29c6af"></a>
### mask()

```java
public int mask()
```

<a id="m-postmodification-271e17afdb57"></a>
### postModification(ServiceContext, ServiceOperationType, ConfPath, Properties)

```java
public java.util.Properties postModification(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.dp.services.ServiceOperationType operation,
    com.tailf.conf.ConfPath path,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](../services/ServiceContext.md#cls-ServiceContext), [ServiceOperationType](../services/ServiceOperationType.md#cls-ServiceOperationType), [ConfPath](../../conf/ConfPath.md#cls-ConfPath), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.dp.services.ServiceOperationType operation`
- `com.tailf.conf.ConfPath path`
- `java.util.Properties opaque`

<a id="m-premodification-92ab0a35864a"></a>
### preModification(ServiceContext, ServiceOperationType, ConfPath, Properties)

```java
public java.util.Properties preModification(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.dp.services.ServiceOperationType operation,
    com.tailf.conf.ConfPath path,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](../services/ServiceContext.md#cls-ServiceContext), [ServiceOperationType](../services/ServiceOperationType.md#cls-ServiceOperationType), [ConfPath](../../conf/ConfPath.md#cls-ConfPath), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.dp.services.ServiceOperationType operation`
- `com.tailf.conf.ConfPath path`
- `java.util.Properties opaque`

<a id="m-servicepoint-33fbd1d46c70"></a>
### servicepoint()

```java
public String servicepoint()
```

<a id="m-update-8a22de5c1ca0"></a>
### update(ServiceContext, NavuNode, NavuNode, Properties)

```java
public java.util.Properties update(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.navu.NavuNode service,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](../services/ServiceContext.md#cls-ServiceContext), [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
