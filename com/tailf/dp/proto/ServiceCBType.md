# ServiceCBType <a href="#servicecbtype-cf8844439319" id="servicecbtype-cf8844439319"></a>

```java
public enum com.tailf.dp.proto.ServiceCBType
```

Types: [ServiceCBType](ServiceCBType.md#servicecbtype-cf8844439319)

Enumeration of Service callback methods

## Members

**Enum Constants**:

- [CREATE](#create-146c3c7e4f65)
- [POST_MODIFICATION](#post_modification-9df86e7e6776)
- [PRE_MODIFICATION](#pre_modification-c5a7904084f0)

**Methods**:

- [getValue()](#getvalue-d93864668c40)
- [valueOf(String)](#valueof-ac61b3547613)
- [values()](#values-406dfe3ca270)

## Enum Constants

### CREATE <a href="#create-146c3c7e4f65" id="create-146c3c7e4f65"></a>

```java
public static final com.tailf.dp.proto.ServiceCBType CREATE;
```

Indicates service create callback.

 See `DpServiceCallback#create(ServiceContext context,
 NavuNode service, NavuNode root, Properties opaque)`

### POST_MODIFICATION <a href="#post_modification-9df86e7e6776" id="post_modification-9df86e7e6776"></a>

```java
public static final com.tailf.dp.proto.ServiceCBType POST_MODIFICATION;
```

Indicates post-modification service callback.

 See `DpServiceCallback#postModification(ServiceContext context,
 ServiceOperationType operation, ConfPath path, Properties opaque)`

### PRE_MODIFICATION <a href="#pre_modification-c5a7904084f0" id="pre_modification-c5a7904084f0"></a>

```java
public static final com.tailf.dp.proto.ServiceCBType PRE_MODIFICATION;
```

Indicates pre-modification service callback.

 See `DpServiceCallback#preModification(ServiceContext context,
 ServiceOperationType operation, ConfPath path, Properties opaque)`


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.dp.proto.ServiceCBType valueOf(String name)
```

Types: [ServiceCBType](ServiceCBType.md#servicecbtype-cf8844439319)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.dp.proto.ServiceCBType[] values()
```

Types: [ServiceCBType](ServiceCBType.md#servicecbtype-cf8844439319)
