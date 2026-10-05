# NanoServiceCBType <a href="#cls-NanoServiceCBType" id="cls-NanoServiceCBType"></a>

```java
public enum com.tailf.dp.proto.NanoServiceCBType
```

Types: [NanoServiceCBType](NanoServiceCBType.md#cls-NanoServiceCBType)

Enumeration of Nano Service callback methods

## Members

**Enum Constants**:

- [CREATE](#m-CREATE)
- [DELETE](#m-DELETE)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CREATE <a href="#m-CREATE" id="m-CREATE"></a>

```java
public static final com.tailf.dp.proto.NanoServiceCBType CREATE;
```

Indicates nano service create callback.

 See [`DpNanoServiceCallback#create(NanoServiceContext, NavuNode,
 NavuNode, Properties, Properties)`](../DpNanoServiceCallback.md#m-create-45a9e9003e1d)

### DELETE <a href="#m-DELETE" id="m-DELETE"></a>

```java
public static final com.tailf.dp.proto.NanoServiceCBType DELETE;
```

Indicates nano service delete callback.

 See [`DpNanoServiceCallback#delete(NanoServiceContext, NavuNode,
 NavuNode, Properties, Properties)`](../DpNanoServiceCallback.md#m-delete-4ba929210861)


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.dp.proto.NanoServiceCBType valueOf(String name)
```

Types: [NanoServiceCBType](NanoServiceCBType.md#cls-NanoServiceCBType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.dp.proto.NanoServiceCBType[] values()
```

Types: [NanoServiceCBType](NanoServiceCBType.md#cls-NanoServiceCBType)
