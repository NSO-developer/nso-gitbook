<a id="cls-ServiceCBType"></a>
# ServiceCBType

```java
public enum com.tailf.dp.proto.ServiceCBType
```

Types: [ServiceCBType](ServiceCBType.md#cls-ServiceCBType)

Enumeration of Service callback methods

## Members

**Enum Constants**:

- [CREATE](#m-CREATE)
- [POST_MODIFICATION](#m-POST_MODIFICATION)
- [PRE_MODIFICATION](#m-PRE_MODIFICATION)

**Methods**:

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-CREATE"></a>
### CREATE

```java
public static final com.tailf.dp.proto.ServiceCBType CREATE;
```

Indicates service create callback.

 See `DpServiceCallback#create(ServiceContext context,
 NavuNode service, NavuNode root, Properties opaque)`

<a id="m-POST_MODIFICATION"></a>
### POST_MODIFICATION

```java
public static final com.tailf.dp.proto.ServiceCBType POST_MODIFICATION;
```

Indicates post-modification service callback.

 See `DpServiceCallback#postModification(ServiceContext context,
 ServiceOperationType operation, ConfPath path, Properties opaque)`

<a id="m-PRE_MODIFICATION"></a>
### PRE_MODIFICATION

```java
public static final com.tailf.dp.proto.ServiceCBType PRE_MODIFICATION;
```

Indicates pre-modification service callback.

 See `DpServiceCallback#preModification(ServiceContext context,
 ServiceOperationType operation, ConfPath path, Properties opaque)`


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
public static com.tailf.dp.proto.ServiceCBType valueOf(String name)
```

Types: [ServiceCBType](ServiceCBType.md#cls-ServiceCBType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.dp.proto.ServiceCBType[] values()
```

Types: [ServiceCBType](ServiceCBType.md#cls-ServiceCBType)
