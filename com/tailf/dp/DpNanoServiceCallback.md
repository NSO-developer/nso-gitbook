<a id="s-DpNanoServiceCallback"></a>
# DpNanoServiceCallback

```java
public interface com.tailf.dp.DpNanoServiceCallback
```

This interface is used for the Nano Service callbacks.
 These callbacks are registered in conjuntion with the defined
 plan_components and plan_component_states of a Nano service plan

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#s-registerAnnotatedCallbacks)

## Members

**Fields**:

- [M_NANO_CREATE](#s-M_NANO_CREATE)
- [M_NANO_DELETE](#s-M_NANO_DELETE)

**Methods**:

- [componentType()](#s-componentType)
- [create(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)](#s-create)
- [delete(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)](#s-delete)
- [mask()](#s-mask)
- [servicepoint()](#s-servicepoint)
- [state()](#s-state)

## Fields

<a id="s-M_NANO_CREATE"></a>
### M_NANO_CREATE

```java
public static final int M_NANO_CREATE = 1;
```

Flags for the mask

<a id="s-M_NANO_DELETE"></a>
### M_NANO_DELETE

```java
public static final int M_NANO_DELETE = 2;
```


## Methods

<a id="s-componentType"></a>
### componentType()

```java
public abstract String componentType()
```

The name of the plan component

<a id="s-create"></a>
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

Types: [NanoServiceContext](services/NanoServiceContext.md#s-NanoServiceContext), [NavuNode](../navu/NavuNode.md#s-NavuNode), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

Nano Create callback method.

**Parameters**

- `com.tailf.dp.services.NanoServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
- `java.util.Properties componentProperties`

<a id="s-delete"></a>
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

Types: [NanoServiceContext](services/NanoServiceContext.md#s-NanoServiceContext), [NavuNode](../navu/NavuNode.md#s-NavuNode), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

Nano Delete callback method.

**Parameters**

- `com.tailf.dp.services.NanoServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
- `java.util.Properties componentProperties`

<a id="s-mask"></a>
### mask()

```java
public abstract int mask()
```

Mask of flags for each method that is supported by this callback:


- `#M_NANO_CREATE`
   - `#M_NANO_DELETE`

<a id="s-servicepoint"></a>
### servicepoint()

```java
public abstract String servicepoint()
```

The name of the servicepoint

<a id="s-state"></a>
### state()

```java
public abstract String state()
```

The name of the a certain plan component state
