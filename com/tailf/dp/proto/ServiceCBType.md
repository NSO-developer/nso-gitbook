<a id="s-ServiceCBType"></a>
# ServiceCBType

```java
public enum com.tailf.dp.proto.ServiceCBType
```

Types: [ServiceCBType](ServiceCBType.md#s-ServiceCBType)

Enumeration of Service callback methods

**Related classes**

- [ServiceCBType](ServiceCBType.md#s-ServiceCBType)

## Members

**Enum Constants**:

- [CREATE](#s-CREATE)
- [POST_MODIFICATION](#s-POST_MODIFICATION)
- [PRE_MODIFICATION](#s-PRE_MODIFICATION)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-CREATE"></a>
### CREATE

```java
public static final com.tailf.dp.proto.ServiceCBType CREATE;
```

Indicates service create callback.

 See [`DpServiceCallback`](../DpServiceCallback.md#s-DpServiceCallback)

<a id="s-POST_MODIFICATION"></a>
### POST_MODIFICATION

```java
public static final com.tailf.dp.proto.ServiceCBType POST_MODIFICATION;
```

Indicates post-modification service callback.

 See [`DpServiceCallback`](../DpServiceCallback.md#s-DpServiceCallback)

<a id="s-PRE_MODIFICATION"></a>
### PRE_MODIFICATION

```java
public static final com.tailf.dp.proto.ServiceCBType PRE_MODIFICATION;
```

Indicates pre-modification service callback.

 See [`DpServiceCallback`](../DpServiceCallback.md#s-DpServiceCallback)


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.dp.proto.ServiceCBType valueOf(String name)
```

Types: [ServiceCBType](ServiceCBType.md#s-ServiceCBType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.dp.proto.ServiceCBType[] values()
```

Types: [ServiceCBType](ServiceCBType.md#s-ServiceCBType)
