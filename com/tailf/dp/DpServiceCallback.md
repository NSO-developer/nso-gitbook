# DpServiceCallback <a href="#cls-DpServiceCallback" id="cls-DpServiceCallback"></a>

```java
public interface com.tailf.dp.DpServiceCallback
```

This interface is used for the service callbacks.

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#m-registerAnnotatedCallbacks-ffaebadbfc42)

## Members

**Fields**:

- [M_CREATE](#m-M_CREATE)
- [M_POST_MODIFICATION](#m-M_POST_MODIFICATION)
- [M_PRE_MODIFICATION](#m-M_PRE_MODIFICATION)

**Methods**:

- [create(ServiceContext, NavuNode, NavuNode, Properties)](#m-create-4ddbd09c0e51)
- [mask()](#m-mask-24c2fa29c6af)
- [postModification(ServiceContext, ServiceOperationType, ConfPath, Properties)](#m-postModification-271e17afdb57)
- [preModification(ServiceContext, ServiceOperationType, ConfPath, Properties)](#m-preModification-92ab0a35864a)
- [servicepoint()](#m-servicepoint-33fbd1d46c70)

## Fields

### M_CREATE <a href="#m-M_CREATE" id="m-M_CREATE"></a>

```java
public static final int M_CREATE = 4;
```

Flags for the mask

### M_POST_MODIFICATION <a href="#m-M_POST_MODIFICATION" id="m-M_POST_MODIFICATION"></a>

```java
public static final int M_POST_MODIFICATION = 2;
```

### M_PRE_MODIFICATION <a href="#m-M_PRE_MODIFICATION" id="m-M_PRE_MODIFICATION"></a>

```java
public static final int M_PRE_MODIFICATION = 1;
```


## Methods

### create(ServiceContext, NavuNode, NavuNode, Properties) <a href="#m-create-4ddbd09c0e51" id="m-create-4ddbd09c0e51"></a>

```java
public abstract java.util.Properties create(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.navu.NavuNode service,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](services/ServiceContext.md#cls-ServiceContext), [NavuNode](../navu/NavuNode.md#cls-NavuNode), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

Create callback method.
 This method is called when a service instance committed due to a create
 or update event.

 This method returns a opaque as a Properties object that can be null.
 If not null it is stored persistently by Ncs.
 This object is then delivered as argument to new calls of the create
 method for this service (fastmap algorithm).
 This way the user can store and later modify persistent data outside
 the service model that might be needed.

**Parameters**

- `com.tailf.dp.services.ServiceContext context` - - The current ServiceContext object
- `com.tailf.navu.NavuNode service` - - The NavuNode references the service node.
- `com.tailf.navu.NavuNode root` - - This NavuNode references the ncs root.
- `java.util.Properties opaque` - - Parameter contains a Properties object.
                  This object may be used to transfer
                  additional information between consecutive
                  calls to the create callback.  It is always
                  null in the first call. I.e. when the service
                  is first created.

**Returns:** Properties the returning opaque instance

**Throws**

- `DpCallbackException`

### mask() <a href="#m-mask-24c2fa29c6af" id="m-mask-24c2fa29c6af"></a>

```java
public abstract int mask()
```

Mask of flags for each method that is supported by this callback:


- [`M_CREATE`](DpServiceCallback.md#m-M_CREATE)
   - [`M_PRE_MODIFICATION`](DpServiceCallback.md#m-M_PRE_MODIFICATION)
     - [`M_POST_MODIFICATION`](DpServiceCallback.md#m-M_POST_MODIFICATION)

### postModification(ServiceContext, ServiceOperationType, ConfPath, Properties) <a href="#m-postModification-271e17afdb57" id="m-postModification-271e17afdb57"></a>

```java
public abstract java.util.Properties postModification(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.dp.services.ServiceOperationType operation,
    com.tailf.conf.ConfPath path,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](services/ServiceContext.md#cls-ServiceContext), [ServiceOperationType](services/ServiceOperationType.md#cls-ServiceOperationType), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

Post modification callback
 If registered this method will be called after a CREATE, UPDATE or
 DELETE of the service. This is also called with a service context that
 is of the original transaction. This implies that changes written into
 this transaction will stay persistent outside of the fastmap algorithm.
 I.e. will be left untouched by the fastmap algorithm.

 This can be useful e.g. for allocations that should be stored and
 existing also when the service instance is removed.

**Parameters**

- `com.tailf.dp.services.ServiceContext context` - - The current ServiceContext object
- `com.tailf.dp.services.ServiceOperationType operation` - - Type of operation (CREATE,UPDATE,DELETE)
- `com.tailf.conf.ConfPath path` - - ConfPath object referring to the services path
- `java.util.Properties opaque` - - Parameter contains a Properties object.
                      This object may be used to transfer
                      additional information between consecutive
                      calls to the create callback.  It is always
                      null in the first call. I.e. when the service
                      is first created.

**Returns:** Properties - the returning opaque instance

**Throws**

- `DpCallbackException`

### preModification(ServiceContext, ServiceOperationType, ConfPath, Properties) <a href="#m-preModification-92ab0a35864a" id="m-preModification-92ab0a35864a"></a>

```java
public abstract java.util.Properties preModification(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.dp.services.ServiceOperationType operation,
    com.tailf.conf.ConfPath path,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](services/ServiceContext.md#cls-ServiceContext), [ServiceOperationType](services/ServiceOperationType.md#cls-ServiceOperationType), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

Pre modification callback
 If registered this method will be called before a CREATE, UPDATE or
 DELETE of the service. This is also called with a service context that
 is of the original transaction. This implies that changes written into
 this transaction will stay persistent outside of the fastmap algorithm.
 I.e. will be left untouched by the fastmap algorithm.

 This can be useful e.g. for allocations that should be stored and
 existing also when the service instance is removed.

**Parameters**

- `com.tailf.dp.services.ServiceContext context` - - The current ServiceContext object
- `com.tailf.dp.services.ServiceOperationType operation` - - Type of operation (CREATE,UPDATE,DELETE)
- `com.tailf.conf.ConfPath path` - - ConfPath object referring to the services path
- `java.util.Properties opaque` - - Parameter contains a Properties object.
                      This object may be used to transfer
                      additional information between consecutive
                      calls to the create callback.  It is always
                      null in the first call. I.e. when the service
                      is first created.

**Returns:** Properties - the returning opaque instance

**Throws**

- `DpCallbackException`

### servicepoint() <a href="#m-servicepoint-33fbd1d46c70" id="m-servicepoint-33fbd1d46c70"></a>

```java
public abstract String servicepoint()
```

The name of the servicepoint
