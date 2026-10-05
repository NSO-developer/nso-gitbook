# NanoServiceCBType <a href="#nanoservicecbtype-16a84eed865a" id="nanoservicecbtype-16a84eed865a"></a>

```java
public enum com.tailf.dp.proto.NanoServiceCBType
```

Types: [NanoServiceCBType](NanoServiceCBType.md#nanoservicecbtype-16a84eed865a)

Enumeration of Nano Service callback methods

## Members

**Enum Constants**:

- [CREATE](#create-146c3c7e4f65)
- [DELETE](#delete-17bb47048092)

**Methods**:

- [getValue()](#getvalue-d93864668c40)
- [valueOf(String)](#valueof-ac61b3547613)
- [values()](#values-406dfe3ca270)

## Enum Constants

### CREATE <a href="#create-146c3c7e4f65" id="create-146c3c7e4f65"></a>

```java
public static final com.tailf.dp.proto.NanoServiceCBType CREATE;
```

Indicates nano service create callback.

 See [`DpNanoServiceCallback#create(NanoServiceContext, NavuNode,
 NavuNode, Properties, Properties)`](../DpNanoServiceCallback.md#create-45a9e9003e1d)

### DELETE <a href="#delete-17bb47048092" id="delete-17bb47048092"></a>

```java
public static final com.tailf.dp.proto.NanoServiceCBType DELETE;
```

Indicates nano service delete callback.

 See [`DpNanoServiceCallback#delete(NanoServiceContext, NavuNode,
 NavuNode, Properties, Properties)`](../DpNanoServiceCallback.md#delete-4ba929210861)


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.dp.proto.NanoServiceCBType valueOf(String name)
```

Types: [NanoServiceCBType](NanoServiceCBType.md#nanoservicecbtype-16a84eed865a)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.dp.proto.NanoServiceCBType[] values()
```

Types: [NanoServiceCBType](NanoServiceCBType.md#nanoservicecbtype-16a84eed865a)
