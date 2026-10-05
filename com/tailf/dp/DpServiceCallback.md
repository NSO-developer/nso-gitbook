# DpServiceCallback <a href="#dpservicecallback-181d65969781" id="dpservicecallback-181d65969781"></a>

```java
public interface com.tailf.dp.DpServiceCallback
```

This interface is used for the service callbacks.

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#registerannotatedcallbacks-ffaebadbfc42)

## Members

**Fields**:

- [M_CREATE](#m_create-741f9c6b07dc)
- [M_POST_MODIFICATION](#m_post_modification-94386bb8ea4a)
- [M_PRE_MODIFICATION](#m_pre_modification-f78525f61907)

**Methods**:

- [create(ServiceContext, NavuNode, NavuNode, Properties)](#create-4ddbd09c0e51)
- [mask()](#mask-24c2fa29c6af)
- [postModification(ServiceContext, ServiceOperationType, ConfPath, Properties)](#postmodification-271e17afdb57)
- [preModification(ServiceContext, ServiceOperationType, ConfPath, Properties)](#premodification-92ab0a35864a)
- [servicepoint()](#servicepoint-33fbd1d46c70)

## Fields

### M_CREATE <a href="#m_create-741f9c6b07dc" id="m_create-741f9c6b07dc"></a>

```java
public static final int M_CREATE = 4;
```

Flags for the mask

### M_POST_MODIFICATION <a href="#m_post_modification-94386bb8ea4a" id="m_post_modification-94386bb8ea4a"></a>

```java
public static final int M_POST_MODIFICATION = 2;
```

### M_PRE_MODIFICATION <a href="#m_pre_modification-f78525f61907" id="m_pre_modification-f78525f61907"></a>

```java
public static final int M_PRE_MODIFICATION = 1;
```


## Methods

### create(ServiceContext, NavuNode, NavuNode, Properties) <a href="#create-4ddbd09c0e51" id="create-4ddbd09c0e51"></a>

```java
public abstract java.util.Properties create(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.navu.NavuNode service,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](services/ServiceContext.md#servicecontext-f7734df4f22b), [NavuNode](../navu/NavuNode.md#navunode-73944820c8db), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

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

### mask() <a href="#mask-24c2fa29c6af" id="mask-24c2fa29c6af"></a>

```java
public abstract int mask()
```

Mask of flags for each method that is supported by this callback:


- [`M_CREATE`](DpServiceCallback.md#m_create-741f9c6b07dc)
   - [`M_PRE_MODIFICATION`](DpServiceCallback.md#m_pre_modification-f78525f61907)
     - [`M_POST_MODIFICATION`](DpServiceCallback.md#m_post_modification-94386bb8ea4a)

### postModification(ServiceContext, ServiceOperationType, ConfPath, Properties) <a href="#postmodification-271e17afdb57" id="postmodification-271e17afdb57"></a>

```java
public abstract java.util.Properties postModification(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.dp.services.ServiceOperationType operation,
    com.tailf.conf.ConfPath path,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](services/ServiceContext.md#servicecontext-f7734df4f22b), [ServiceOperationType](services/ServiceOperationType.md#serviceoperationtype-76755b5b3de9), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

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

### preModification(ServiceContext, ServiceOperationType, ConfPath, Properties) <a href="#premodification-92ab0a35864a" id="premodification-92ab0a35864a"></a>

```java
public abstract java.util.Properties preModification(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.dp.services.ServiceOperationType operation,
    com.tailf.conf.ConfPath path,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](services/ServiceContext.md#servicecontext-f7734df4f22b), [ServiceOperationType](services/ServiceOperationType.md#serviceoperationtype-76755b5b3de9), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

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

### servicepoint() <a href="#servicepoint-33fbd1d46c70" id="servicepoint-33fbd1d46c70"></a>

```java
public abstract String servicepoint()
```

The name of the servicepoint
