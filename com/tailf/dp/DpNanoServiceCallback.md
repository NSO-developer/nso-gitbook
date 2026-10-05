# DpNanoServiceCallback <a href="#dpnanoservicecallback-a88529d129ff" id="dpnanoservicecallback-a88529d129ff"></a>

```java
public interface com.tailf.dp.DpNanoServiceCallback
```

This interface is used for the Nano Service callbacks.
 These callbacks are registered in conjuntion with the defined
 plan_components and plan_component_states of a Nano service plan

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#registerannotatedcallbacks-ffaebadbfc42)

## Members

**Fields**:

- [M_NANO_CREATE](#m_nano_create-f69a2979f8b0)
- [M_NANO_DELETE](#m_nano_delete-d890c83a3d57)

**Methods**:

- [componentType()](#componenttype-59add484020d)
- [create(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)](#create-45a9e9003e1d)
- [delete(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)](#delete-4ba929210861)
- [mask()](#mask-24c2fa29c6af)
- [servicepoint()](#servicepoint-33fbd1d46c70)
- [state()](#state-54117dea2388)

## Fields

### M_NANO_CREATE <a href="#m_nano_create-f69a2979f8b0" id="m_nano_create-f69a2979f8b0"></a>

```java
public static final int M_NANO_CREATE = 1;
```

Flags for the mask

### M_NANO_DELETE <a href="#m_nano_delete-d890c83a3d57" id="m_nano_delete-d890c83a3d57"></a>

```java
public static final int M_NANO_DELETE = 2;
```


## Methods

### componentType() <a href="#componenttype-59add484020d" id="componenttype-59add484020d"></a>

```java
public abstract String componentType()
```

The name of the plan component

### create(NanoServiceContext, NavuNode, NavuNode, Properties, Properties) <a href="#create-45a9e9003e1d" id="create-45a9e9003e1d"></a>

```java
public abstract java.util.Properties create(
    com.tailf.dp.services.NanoServiceContext context,
    com.tailf.navu.NavuNode service,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque,
    java.util.Properties componentProperties
)
    throws com.tailf.dp.DpCallbackException
```

Types: [NanoServiceContext](services/NanoServiceContext.md#nanoservicecontext-10c84a5701dd), [NavuNode](../navu/NavuNode.md#navunode-73944820c8db), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Nano Create callback method.

**Parameters**

- `com.tailf.dp.services.NanoServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
- `java.util.Properties componentProperties`

### delete(NanoServiceContext, NavuNode, NavuNode, Properties, Properties) <a href="#delete-4ba929210861" id="delete-4ba929210861"></a>

```java
public abstract java.util.Properties delete(
    com.tailf.dp.services.NanoServiceContext context,
    com.tailf.navu.NavuNode service,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque,
    java.util.Properties componentProperties
)
    throws com.tailf.dp.DpCallbackException
```

Types: [NanoServiceContext](services/NanoServiceContext.md#nanoservicecontext-10c84a5701dd), [NavuNode](../navu/NavuNode.md#navunode-73944820c8db), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Nano Delete callback method.

**Parameters**

- `com.tailf.dp.services.NanoServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
- `java.util.Properties componentProperties`

### mask() <a href="#mask-24c2fa29c6af" id="mask-24c2fa29c6af"></a>

```java
public abstract int mask()
```

Mask of flags for each method that is supported by this callback:


- [`M_NANO_CREATE`](DpNanoServiceCallback.md#m_nano_create-f69a2979f8b0)
   - [`M_NANO_DELETE`](DpNanoServiceCallback.md#m_nano_delete-d890c83a3d57)

### servicepoint() <a href="#servicepoint-33fbd1d46c70" id="servicepoint-33fbd1d46c70"></a>

```java
public abstract String servicepoint()
```

The name of the servicepoint

### state() <a href="#state-54117dea2388" id="state-54117dea2388"></a>

```java
public abstract String state()
```

The name of the a certain plan component state
