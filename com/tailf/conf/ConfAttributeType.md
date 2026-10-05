# ConfAttributeType <a href="#cls-ConfAttributeType" id="cls-ConfAttributeType"></a>

```java
public enum com.tailf.conf.ConfAttributeType
```

Types: [ConfAttributeType](ConfAttributeType.md#cls-ConfAttributeType)

Enumeration of attribute types

## Members

**Enum Constants**:

- [ANNOTATION](#m-ANNOTATION)
- [BACKPOINTER](#m-BACKPOINTER)
- [INACTIVE](#m-INACTIVE)
- [ORIGIN](#m-ORIGIN)
- [ORIGINAL_VALUE](#m-ORIGINAL_VALUE)
- [OUT_OF_BAND](#m-OUT_OF_BAND)
- [REFCOUNT](#m-REFCOUNT)
- [TAGS](#m-TAGS)
- [WHEN](#m-WHEN)

**Methods**:

- [getType(long)](#m-getType-362221ab6f0b)
- [getValue()](#m-getValue-d93864668c40)
- [toString()](#m-toString-e9d48c5503ef)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### ANNOTATION <a href="#m-ANNOTATION" id="m-ANNOTATION"></a>

```java
public static final com.tailf.conf.ConfAttributeType ANNOTATION;
```

CONFD_ATTR_ANNOTATION: value is ConfBuf/C_STR

### BACKPOINTER <a href="#m-BACKPOINTER" id="m-BACKPOINTER"></a>

```java
public static final com.tailf.conf.ConfAttributeType BACKPOINTER;
```

CONFD_ATTR_BACKPOINTER: value is ConfObjectRef'

### INACTIVE <a href="#m-INACTIVE" id="m-INACTIVE"></a>

```java
public static final com.tailf.conf.ConfAttributeType INACTIVE;
```

CONFD_ATTR_INACTIVE: value is ConfBool 'true'

### ORIGIN <a href="#m-ORIGIN" id="m-ORIGIN"></a>

```java
public static final com.tailf.conf.ConfAttributeType ORIGIN;
```

CONFD_ATTR_ORIGIN: value is ConfIdentityRef

### ORIGINAL_VALUE <a href="#m-ORIGINAL_VALUE" id="m-ORIGINAL_VALUE"></a>

```java
public static final com.tailf.conf.ConfAttributeType ORIGINAL_VALUE;
```

### OUT_OF_BAND <a href="#m-OUT_OF_BAND" id="m-OUT_OF_BAND"></a>

```java
public static final com.tailf.conf.ConfAttributeType OUT_OF_BAND;
```

CONFD_ATTR_OUT_OF_BAND: value is ConfObjectRef'

### REFCOUNT <a href="#m-REFCOUNT" id="m-REFCOUNT"></a>

```java
public static final com.tailf.conf.ConfAttributeType REFCOUNT;
```

CONFD_ATTR_REFCOUNT: value is ConfInt32

### TAGS <a href="#m-TAGS" id="m-TAGS"></a>

```java
public static final com.tailf.conf.ConfAttributeType TAGS;
```

CONFD_ATTR_TAGS: value is ConfList of ConfBuf/C_STR

### WHEN <a href="#m-WHEN" id="m-WHEN"></a>

```java
public static final com.tailf.conf.ConfAttributeType WHEN;
```


## Methods

### getType(long) <a href="#m-getType-362221ab6f0b" id="m-getType-362221ab6f0b"></a>

```java
public static com.tailf.conf.ConfAttributeType getType(long l)
```

Types: [ConfAttributeType](ConfAttributeType.md#cls-ConfAttributeType)

Get a ConfAttributeType for given long value or
 null if the long value does not represent an attribute type.

**Parameters**

- `long l` - long value for this attribute

**Returns:** ConfAttributeType for this long value

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public long getValue()
```

Get the long value representation of this attribute type

**Returns:** long value

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string label for this attribute type

**Returns:** String label

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.conf.ConfAttributeType valueOf(String name)
```

Types: [ConfAttributeType](ConfAttributeType.md#cls-ConfAttributeType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.conf.ConfAttributeType[] values()
```

Types: [ConfAttributeType](ConfAttributeType.md#cls-ConfAttributeType)
