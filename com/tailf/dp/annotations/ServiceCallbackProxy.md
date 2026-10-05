<a id="s-ServiceCallbackProxy"></a>
# ServiceCallbackProxy

```java
public class com.tailf.dp.annotations.ServiceCallbackProxy
    implements com.tailf.dp.DpServiceCallback
```

Types: [DpServiceCallback](../DpServiceCallback.md#s-DpServiceCallback)

Callback proxy for Service Callbacks.
 Implements the [`DpServiceCallback`](../DpServiceCallback.md#s-DpServiceCallback)
 interface and delegates calls to the registered callback POJO with annotated
 methods

## Members

**Constructors**:

- [ServiceCallbackProxy(Object, String)](#s-ServiceCallbackProxy-1)

**Fields**:

- [M_CREATE](../DpServiceCallback.md#s-M_CREATE) from DpServiceCallback
- [M_POST_MODIFICATION](../DpServiceCallback.md#s-M_POST_MODIFICATION) from DpServiceCallback
- [M_PRE_MODIFICATION](../DpServiceCallback.md#s-M_PRE_MODIFICATION) from DpServiceCallback

**Methods**:

- [addActionCapability(ServiceCBType)](#s-addActionCapability)
- [addActionMethod(String, Method)](#s-addActionMethod)
- [create(ServiceContext, NavuNode, NavuNode, Properties)](#s-create)
- [delete(ServiceContext, NavuNode, Properties)](#s-delete)
- [getBackupObject()](#s-getBackupObject)
- [getServiceCallbackProxys(Object)](#s-getServiceCallbackProxys)
- [getServicePoint()](#s-getServicePoint)
- [mask()](#s-mask)
- [postModification(ServiceContext, ServiceOperationType, ConfPath, Properties)](#s-postModification)
- [preModification(ServiceContext, ServiceOperationType, ConfPath, Properties)](#s-preModification)
- [servicepoint()](#s-servicepoint)
- [update(ServiceContext, NavuNode, NavuNode, Properties)](#s-update)

## Constructors

<a id="s-ServiceCallbackProxy-1"></a>
### ServiceCallbackProxy(Object, String)

```java
public ServiceCallbackProxy(Object backupObject, String servicePoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String servicePoint` - string describing the servicepoint for this callback


## Methods

<a id="s-addActionCapability"></a>
### addActionCapability(ServiceCBType)

```java
public void addActionCapability(com.tailf.dp.proto.ServiceCBType serviceCBType)
```

Types: [ServiceCBType](../proto/ServiceCBType.md#s-ServiceCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.ServiceCBType serviceCBType` - action type

<a id="s-addActionMethod"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="s-create"></a>
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

Types: [ServiceContext](../services/ServiceContext.md#s-ServiceContext), [NavuNode](../../navu/NavuNode.md#s-NavuNode), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`

<a id="s-delete"></a>
### delete(ServiceContext, NavuNode, Properties)

```java
public java.util.Properties delete(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](../services/ServiceContext.md#s-ServiceContext), [NavuNode](../../navu/NavuNode.md#s-NavuNode), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`

<a id="s-getBackupObject"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="s-getServiceCallbackProxys"></a>
### getServiceCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.ServiceCallbackProxy[] getServiceCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceCallbackProxy](ServiceCallbackProxy.md#s-ServiceCallbackProxy), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of ServCallbackProxy

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

<a id="s-postModification"></a>
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

Types: [ServiceContext](../services/ServiceContext.md#s-ServiceContext), [ServiceOperationType](../services/ServiceOperationType.md#s-ServiceOperationType), [ConfPath](../../conf/ConfPath.md#s-ConfPath), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.dp.services.ServiceOperationType operation`
- `com.tailf.conf.ConfPath path`
- `java.util.Properties opaque`

<a id="s-preModification"></a>
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

Types: [ServiceContext](../services/ServiceContext.md#s-ServiceContext), [ServiceOperationType](../services/ServiceOperationType.md#s-ServiceOperationType), [ConfPath](../../conf/ConfPath.md#s-ConfPath), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.dp.services.ServiceOperationType operation`
- `com.tailf.conf.ConfPath path`
- `java.util.Properties opaque`

<a id="s-servicepoint"></a>
### servicepoint()

```java
public String servicepoint()
```

<a id="s-update"></a>
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

Types: [ServiceContext](../services/ServiceContext.md#s-ServiceContext), [NavuNode](../../navu/NavuNode.md#s-NavuNode), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.ServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
