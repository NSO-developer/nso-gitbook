<a id="s-DpServiceCallback"></a>
# DpServiceCallback

```java
public interface com.tailf.dp.DpServiceCallback
```

This interface is used for the service callbacks.

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#s-registerAnnotatedCallbacks)

## Members

**Fields**:

- [M_CREATE](#s-M_CREATE)
- [M_POST_MODIFICATION](#s-M_POST_MODIFICATION)
- [M_PRE_MODIFICATION](#s-M_PRE_MODIFICATION)

**Methods**:

- [create(ServiceContext, NavuNode, NavuNode, Properties)](#s-create)
- [mask()](#s-mask)
- [postModification(ServiceContext, ServiceOperationType, ConfPath, Properties)](#s-postModification)
- [preModification(ServiceContext, ServiceOperationType, ConfPath, Properties)](#s-preModification)
- [servicepoint()](#s-servicepoint)

## Fields

<a id="s-M_CREATE"></a>
### M_CREATE

```java
public static final int M_CREATE = 4;
```

Flags for the mask

<a id="s-M_POST_MODIFICATION"></a>
### M_POST_MODIFICATION

```java
public static final int M_POST_MODIFICATION = 2;
```

<a id="s-M_PRE_MODIFICATION"></a>
### M_PRE_MODIFICATION

```java
public static final int M_PRE_MODIFICATION = 1;
```


## Methods

<a id="s-create"></a>
### create(ServiceContext, NavuNode, NavuNode, Properties)

```java
public abstract java.util.Properties create(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.navu.NavuNode service,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](services/ServiceContext.md#s-ServiceContext), [NavuNode](../navu/NavuNode.md#s-NavuNode), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

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

<a id="s-mask"></a>
### mask()

```java
public abstract int mask()
```

Mask of flags for each method that is supported by this callback:


- `#M_CREATE`
   - `#M_PRE_MODIFICATION`
     - `#M_POST_MODIFICATION`

<a id="s-postModification"></a>
### postModification(ServiceContext, ServiceOperationType, ConfPath, Properties)

```java
public abstract java.util.Properties postModification(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.dp.services.ServiceOperationType operation,
    com.tailf.conf.ConfPath path,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](services/ServiceContext.md#s-ServiceContext), [ServiceOperationType](services/ServiceOperationType.md#s-ServiceOperationType), [ConfPath](../conf/ConfPath.md#s-ConfPath), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

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

<a id="s-preModification"></a>
### preModification(ServiceContext, ServiceOperationType, ConfPath, Properties)

```java
public abstract java.util.Properties preModification(
    com.tailf.dp.services.ServiceContext context,
    com.tailf.dp.services.ServiceOperationType operation,
    com.tailf.conf.ConfPath path,
    java.util.Properties opaque
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ServiceContext](services/ServiceContext.md#s-ServiceContext), [ServiceOperationType](services/ServiceOperationType.md#s-ServiceOperationType), [ConfPath](../conf/ConfPath.md#s-ConfPath), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

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

<a id="s-servicepoint"></a>
### servicepoint()

```java
public abstract String servicepoint()
```

The name of the servicepoint
