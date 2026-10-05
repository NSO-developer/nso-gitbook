<a id="cls-DpNanoServiceCallback"></a>
# DpNanoServiceCallback

```java
public interface com.tailf.dp.DpNanoServiceCallback
```

This interface is used for the Nano Service callbacks.
 These callbacks are registered in conjuntion with the defined
 plan_components and plan_component_states of a Nano service plan

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#m-registerannotatedcallbacks-ffaebadbfc42)

## Members

**Fields**:

- [M_NANO_CREATE](#m-M_NANO_CREATE)
- [M_NANO_DELETE](#m-M_NANO_DELETE)

**Methods**:

- [componentType()](#m-componenttype-59add484020d)
- [create(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)](#m-create-45a9e9003e1d)
- [delete(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)](#m-delete-4ba929210861)
- [mask()](#m-mask-24c2fa29c6af)
- [servicepoint()](#m-servicepoint-33fbd1d46c70)
- [state()](#m-state-54117dea2388)

## Fields

<a id="m-M_NANO_CREATE"></a>
### M_NANO_CREATE

```java
public static final int M_NANO_CREATE = 1;
```

Flags for the mask

<a id="m-M_NANO_DELETE"></a>
### M_NANO_DELETE

```java
public static final int M_NANO_DELETE = 2;
```


## Methods

<a id="m-componenttype-59add484020d"></a>
### componentType()

```java
public abstract String componentType()
```

The name of the plan component

<a id="m-create-45a9e9003e1d"></a>
### create(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)

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

<a id="m-delete-4ba929210861"></a>
### delete(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)

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

<a id="m-mask-24c2fa29c6af"></a>
### mask()

```java
public abstract int mask()
```

Mask of flags for each method that is supported by this callback:


- `#M_NANO_CREATE`
   - `#M_NANO_DELETE`

<a id="m-servicepoint-33fbd1d46c70"></a>
### servicepoint()

```java
public abstract String servicepoint()
```

The name of the servicepoint

<a id="m-state-54117dea2388"></a>
### state()

```java
public abstract String state()
```

The name of the a certain plan component state
