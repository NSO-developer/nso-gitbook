<a id="cls-NanoServiceCBType"></a>
# NanoServiceCBType

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

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-CREATE"></a>
### CREATE

```java
public static final com.tailf.dp.proto.NanoServiceCBType CREATE;
```

Indicates nano service create callback.

 See [`DpNanoServiceCallback#create(NanoServiceContext, NavuNode,
 NavuNode, Properties, Properties)`](../DpNanoServiceCallback.md#m-create-45a9e9003e1d)

<a id="m-DELETE"></a>
### DELETE

```java
public static final com.tailf.dp.proto.NanoServiceCBType DELETE;
```

Indicates nano service delete callback.

 See [`DpNanoServiceCallback#delete(NanoServiceContext, NavuNode,
 NavuNode, Properties, Properties)`](../DpNanoServiceCallback.md#m-delete-4ba929210861)


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.dp.proto.NanoServiceCBType valueOf(String name)
```

Types: [NanoServiceCBType](NanoServiceCBType.md#cls-NanoServiceCBType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.dp.proto.NanoServiceCBType[] values()
```

Types: [NanoServiceCBType](NanoServiceCBType.md#cls-NanoServiceCBType)
