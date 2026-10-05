# DpNanoServiceCallback <a href="#cls-DpNanoServiceCallback" id="cls-DpNanoServiceCallback"></a>

```java
public interface com.tailf.dp.DpNanoServiceCallback
```

This interface is used for the Nano Service callbacks.
 These callbacks are registered in conjuntion with the defined
 plan_components and plan_component_states of a Nano service plan

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#m-registerAnnotatedCallbacks-ffaebadbfc42)

## Members

**Fields**:

- [M_NANO_CREATE](#m-M_NANO_CREATE)
- [M_NANO_DELETE](#m-M_NANO_DELETE)

**Methods**:

- [componentType()](#m-componentType-59add484020d)
- [create(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)](#m-create-45a9e9003e1d)
- [delete(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)](#m-delete-4ba929210861)
- [mask()](#m-mask-24c2fa29c6af)
- [servicepoint()](#m-servicepoint-33fbd1d46c70)
- [state()](#m-state-54117dea2388)

## Fields

### M_NANO_CREATE <a href="#m-M_NANO_CREATE" id="m-M_NANO_CREATE"></a>

```java
public static final int M_NANO_CREATE = 1;
```

Flags for the mask

### M_NANO_DELETE <a href="#m-M_NANO_DELETE" id="m-M_NANO_DELETE"></a>

```java
public static final int M_NANO_DELETE = 2;
```


## Methods

### componentType() <a href="#m-componentType-59add484020d" id="m-componentType-59add484020d"></a>

```java
public abstract String componentType()
```

The name of the plan component

### create(NanoServiceContext, NavuNode, NavuNode, Properties, Properties) <a href="#m-create-45a9e9003e1d" id="m-create-45a9e9003e1d"></a>

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

Types: [NanoServiceContext](services/NanoServiceContext.md#cls-NanoServiceContext), [NavuNode](../navu/NavuNode.md#cls-NavuNode), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

Nano Create callback method.

**Parameters**

- `com.tailf.dp.services.NanoServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
- `java.util.Properties componentProperties`

### delete(NanoServiceContext, NavuNode, NavuNode, Properties, Properties) <a href="#m-delete-4ba929210861" id="m-delete-4ba929210861"></a>

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

Types: [NanoServiceContext](services/NanoServiceContext.md#cls-NanoServiceContext), [NavuNode](../navu/NavuNode.md#cls-NavuNode), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

Nano Delete callback method.

**Parameters**

- `com.tailf.dp.services.NanoServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
- `java.util.Properties componentProperties`

### mask() <a href="#m-mask-24c2fa29c6af" id="m-mask-24c2fa29c6af"></a>

```java
public abstract int mask()
```

Mask of flags for each method that is supported by this callback:


- [`M_NANO_CREATE`](DpNanoServiceCallback.md#m-M_NANO_CREATE)
   - [`M_NANO_DELETE`](DpNanoServiceCallback.md#m-M_NANO_DELETE)

### servicepoint() <a href="#m-servicepoint-33fbd1d46c70" id="m-servicepoint-33fbd1d46c70"></a>

```java
public abstract String servicepoint()
```

The name of the servicepoint

### state() <a href="#m-state-54117dea2388" id="m-state-54117dea2388"></a>

```java
public abstract String state()
```

The name of the a certain plan component state
