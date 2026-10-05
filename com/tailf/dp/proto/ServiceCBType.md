# ServiceCBType <a href="#cls-ServiceCBType" id="cls-ServiceCBType"></a>

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

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CREATE <a href="#m-CREATE" id="m-CREATE"></a>

```java
public static final com.tailf.dp.proto.ServiceCBType CREATE;
```

Indicates service create callback.

 See `DpServiceCallback#create(ServiceContext context,
 NavuNode service, NavuNode root, Properties opaque)`

### POST_MODIFICATION <a href="#m-POST_MODIFICATION" id="m-POST_MODIFICATION"></a>

```java
public static final com.tailf.dp.proto.ServiceCBType POST_MODIFICATION;
```

Indicates post-modification service callback.

 See `DpServiceCallback#postModification(ServiceContext context,
 ServiceOperationType operation, ConfPath path, Properties opaque)`

### PRE_MODIFICATION <a href="#m-PRE_MODIFICATION" id="m-PRE_MODIFICATION"></a>

```java
public static final com.tailf.dp.proto.ServiceCBType PRE_MODIFICATION;
```

Indicates pre-modification service callback.

 See `DpServiceCallback#preModification(ServiceContext context,
 ServiceOperationType operation, ConfPath path, Properties opaque)`


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.dp.proto.ServiceCBType valueOf(String name)
```

Types: [ServiceCBType](ServiceCBType.md#cls-ServiceCBType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.dp.proto.ServiceCBType[] values()
```

Types: [ServiceCBType](ServiceCBType.md#cls-ServiceCBType)
