# ConfAttributeType <a href="#confattributetype-292ad441835a" id="confattributetype-292ad441835a"></a>

```java
public enum com.tailf.conf.ConfAttributeType
```

Types: [ConfAttributeType](ConfAttributeType.md#confattributetype-292ad441835a)

Enumeration of attribute types

## Members

**Enum Constants**:

- [ANNOTATION](#annotation-031796bc0642)
- [BACKPOINTER](#backpointer-d19810a6ed25)
- [INACTIVE](#inactive-e05983904557)
- [ORIGIN](#origin-ba5b8252647b)
- [ORIGINAL_VALUE](#original_value-a4542e5c6326)
- [OUT_OF_BAND](#out_of_band-9f01185dffb9)
- [REFCOUNT](#refcount-a55a58985f6e)
- [TAGS](#tags-827c8f7775e3)
- [WHEN](#when-330c898295c5)

**Methods**:

- [getType(long)](#gettype-362221ab6f0b)
- [getValue()](#getvalue-d93864668c40)
- [toString()](#tostring-e9d48c5503ef)
- [valueOf(String)](#valueof-ac61b3547613)
- [values()](#values-406dfe3ca270)

## Enum Constants

### ANNOTATION <a href="#annotation-031796bc0642" id="annotation-031796bc0642"></a>

```java
public static final com.tailf.conf.ConfAttributeType ANNOTATION;
```

CONFD_ATTR_ANNOTATION: value is ConfBuf/C_STR

### BACKPOINTER <a href="#backpointer-d19810a6ed25" id="backpointer-d19810a6ed25"></a>

```java
public static final com.tailf.conf.ConfAttributeType BACKPOINTER;
```

CONFD_ATTR_BACKPOINTER: value is ConfObjectRef'

### INACTIVE <a href="#inactive-e05983904557" id="inactive-e05983904557"></a>

```java
public static final com.tailf.conf.ConfAttributeType INACTIVE;
```

CONFD_ATTR_INACTIVE: value is ConfBool 'true'

### ORIGIN <a href="#origin-ba5b8252647b" id="origin-ba5b8252647b"></a>

```java
public static final com.tailf.conf.ConfAttributeType ORIGIN;
```

CONFD_ATTR_ORIGIN: value is ConfIdentityRef

### ORIGINAL_VALUE <a href="#original_value-a4542e5c6326" id="original_value-a4542e5c6326"></a>

```java
public static final com.tailf.conf.ConfAttributeType ORIGINAL_VALUE;
```

### OUT_OF_BAND <a href="#out_of_band-9f01185dffb9" id="out_of_band-9f01185dffb9"></a>

```java
public static final com.tailf.conf.ConfAttributeType OUT_OF_BAND;
```

CONFD_ATTR_OUT_OF_BAND: value is ConfObjectRef'

### REFCOUNT <a href="#refcount-a55a58985f6e" id="refcount-a55a58985f6e"></a>

```java
public static final com.tailf.conf.ConfAttributeType REFCOUNT;
```

CONFD_ATTR_REFCOUNT: value is ConfInt32

### TAGS <a href="#tags-827c8f7775e3" id="tags-827c8f7775e3"></a>

```java
public static final com.tailf.conf.ConfAttributeType TAGS;
```

CONFD_ATTR_TAGS: value is ConfList of ConfBuf/C_STR

### WHEN <a href="#when-330c898295c5" id="when-330c898295c5"></a>

```java
public static final com.tailf.conf.ConfAttributeType WHEN;
```


## Methods

### getType(long) <a href="#gettype-362221ab6f0b" id="gettype-362221ab6f0b"></a>

```java
public static com.tailf.conf.ConfAttributeType getType(long l)
```

Types: [ConfAttributeType](ConfAttributeType.md#confattributetype-292ad441835a)

Get a ConfAttributeType for given long value or
 null if the long value does not represent an attribute type.

**Parameters**

- `long l` - long value for this attribute

**Returns:** ConfAttributeType for this long value

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public long getValue()
```

Get the long value representation of this attribute type

**Returns:** long value

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string label for this attribute type

**Returns:** String label

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.conf.ConfAttributeType valueOf(String name)
```

Types: [ConfAttributeType](ConfAttributeType.md#confattributetype-292ad441835a)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.conf.ConfAttributeType[] values()
```

Types: [ConfAttributeType](ConfAttributeType.md#confattributetype-292ad441835a)
