# ServiceCallbackProxy <a href="#servicecallbackproxy-45fef1425737" id="servicecallbackproxy-45fef1425737"></a>

```java
public class com.tailf.dp.annotations.ServiceCallbackProxy
    implements com.tailf.dp.DpServiceCallback
```

Types: [DpServiceCallback](../DpServiceCallback.md#dpservicecallback-181d65969781)

Callback proxy for Service Callbacks.
 Implements the [`DpServiceCallback`](../DpServiceCallback.md#dpservicecallback-181d65969781)
 interface and delegates calls to the registered callback POJO with annotated
 methods

## Members

**Constructors**:

- [ServiceCallbackProxy(Object, String)](#servicecallbackproxy-91833aef468e)

**Fields**:

- [M_CREATE](../DpServiceCallback.md#m_create-741f9c6b07dc) from DpServiceCallback
- [M_POST_MODIFICATION](../DpServiceCallback.md#m_post_modification-94386bb8ea4a) from DpServiceCallback
- [M_PRE_MODIFICATION](../DpServiceCallback.md#m_pre_modification-f78525f61907) from DpServiceCallback

**Methods**:

- [addActionCapability(ServiceCBType)](#addactioncapability-8c211470558b)
- [addActionMethod(String, Method)](#addactionmethod-cf3e43a67fd9)
- [create(ServiceContext, NavuNode, NavuNode, Properties)](#create-4ddbd09c0e51)
- [delete(ServiceContext, NavuNode, Properties)](#delete-ec7143c7c683)
- [getBackupObject()](#getbackupobject-a6fb23c24524)
- [getServiceCallbackProxys(Object)](#getservicecallbackproxys-83af80ed35d3)
- [getServicePoint()](#getservicepoint-4b0d670b9506)
- [mask()](#mask-24c2fa29c6af)
- [postModification(ServiceContext, ServiceOperationType, ConfPath, Properties)](#postmodification-271e17afdb57)
- [preModification(ServiceContext, ServiceOperationType, ConfPath, Properties)](#premodification-92ab0a35864a)
- [servicepoint()](#servicepoint-33fbd1d46c70)
- [update(ServiceContext, NavuNode, NavuNode, Properties)](#update-8a22de5c1ca0)

## Constructors

### ServiceCallbackProxy(Object, String) <a href="#servicecallbackproxy-91833aef468e" id="servicecallbackproxy-91833aef468e"></a>

```java
public ServiceCallbackProxy(Object backupObject, String servicePoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String servicePoint` - string describing the servicepoint for this callback


## Methods

### addActionCapability(ServiceCBType) <a href="#addactioncapability-8c211470558b" id="addactioncapability-8c211470558b"></a>

```java
public void addActionCapability(com.tailf.dp.proto.ServiceCBType serviceCBType)
```

Types: [ServiceCBType](../proto/ServiceCBType.md#servicecbtype-cf8844439319)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.ServiceCBType serviceCBType` - action type

### addActionMethod(String, Method) <a href="#addactionmethod-cf3e43a67fd9" id="addactionmethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### create(ServiceContext, NavuNode, NavuNode, Properties) <a href="#create-4ddbd09c0e51" id="create-4ddbd09c0e51"></a>

```java
public java.util.Properties create(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.navu.NavuNode service,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](../services/ServiceContext.md#servicecontext-f7734df4f22b), [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`

### delete(ServiceContext, NavuNode, Properties) <a href="#delete-ec7143c7c683" id="delete-ec7143c7c683"></a>

```java
public java.util.Properties delete(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](../services/ServiceContext.md#servicecontext-f7734df4f22b), [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`

### getBackupObject() <a href="#getbackupobject-a6fb23c24524" id="getbackupobject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getServiceCallbackProxys(Object) <a href="#getservicecallbackproxys-83af80ed35d3" id="getservicecallbackproxys-83af80ed35d3"></a>

```java
public static com.tailf.dp.annotations.ServiceCallbackProxy[] getServiceCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceCallbackProxy](ServiceCallbackProxy.md#servicecallbackproxy-45fef1425737), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of ServCallbackProxy

**Throws**

- `DpCallbackException`

### getServicePoint() <a href="#getservicepoint-4b0d670b9506" id="getservicepoint-4b0d670b9506"></a>

```java
public String getServicePoint()
```

Retrieve the callback servicepoint

**Returns:** servicepoint string

### mask() <a href="#mask-24c2fa29c6af" id="mask-24c2fa29c6af"></a>

```java
public int mask()
```

### postModification(ServiceContext, ServiceOperationType, ConfPath, Properties) <a href="#postmodification-271e17afdb57" id="postmodification-271e17afdb57"></a>

```java
public java.util.Properties postModification(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.dp.services.ServiceOperationType operation,
    com.tailf.conf.ConfPath path,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](../services/ServiceContext.md#servicecontext-f7734df4f22b), [ServiceOperationType](../services/ServiceOperationType.md#serviceoperationtype-76755b5b3de9), [ConfPath](../../conf/ConfPath.md#confpath-327831c6fc7d), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.dp.services.ServiceOperationType operation`
- `com.tailf.conf.ConfPath path`
- `java.util.Properties opaque`

### preModification(ServiceContext, ServiceOperationType, ConfPath, Properties) <a href="#premodification-92ab0a35864a" id="premodification-92ab0a35864a"></a>

```java
public java.util.Properties preModification(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.dp.services.ServiceOperationType operation,
    com.tailf.conf.ConfPath path,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](../services/ServiceContext.md#servicecontext-f7734df4f22b), [ServiceOperationType](../services/ServiceOperationType.md#serviceoperationtype-76755b5b3de9), [ConfPath](../../conf/ConfPath.md#confpath-327831c6fc7d), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.dp.services.ServiceOperationType operation`
- `com.tailf.conf.ConfPath path`
- `java.util.Properties opaque`

### servicepoint() <a href="#servicepoint-33fbd1d46c70" id="servicepoint-33fbd1d46c70"></a>

```java
public String servicepoint()
```

### update(ServiceContext, NavuNode, NavuNode, Properties) <a href="#update-8a22de5c1ca0" id="update-8a22de5c1ca0"></a>

```java
public java.util.Properties update(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.navu.NavuNode service,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](../services/ServiceContext.md#servicecontext-f7734df4f22b), [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
