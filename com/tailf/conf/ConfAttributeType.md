<a id="cls-ConfAttributeType"></a>
# ConfAttributeType

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

- [getType(long)](#m-gettype-362221ab6f0b)
- [getValue()](#m-getvalue-d93864668c40)
- [toString()](#m-tostring-e9d48c5503ef)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-ANNOTATION"></a>
### ANNOTATION

```java
public static final com.tailf.conf.ConfAttributeType ANNOTATION;
```

CONFD_ATTR_ANNOTATION: value is ConfBuf/C_STR

<a id="m-BACKPOINTER"></a>
### BACKPOINTER

```java
public static final com.tailf.conf.ConfAttributeType BACKPOINTER;
```

CONFD_ATTR_BACKPOINTER: value is ConfObjectRef'

<a id="m-INACTIVE"></a>
### INACTIVE

```java
public static final com.tailf.conf.ConfAttributeType INACTIVE;
```

CONFD_ATTR_INACTIVE: value is ConfBool 'true'

<a id="m-ORIGIN"></a>
### ORIGIN

```java
public static final com.tailf.conf.ConfAttributeType ORIGIN;
```

CONFD_ATTR_ORIGIN: value is ConfIdentityRef

<a id="m-ORIGINAL_VALUE"></a>
### ORIGINAL_VALUE

```java
public static final com.tailf.conf.ConfAttributeType ORIGINAL_VALUE;
```

<a id="m-OUT_OF_BAND"></a>
### OUT_OF_BAND

```java
public static final com.tailf.conf.ConfAttributeType OUT_OF_BAND;
```

CONFD_ATTR_OUT_OF_BAND: value is ConfObjectRef'

<a id="m-REFCOUNT"></a>
### REFCOUNT

```java
public static final com.tailf.conf.ConfAttributeType REFCOUNT;
```

CONFD_ATTR_REFCOUNT: value is ConfInt32

<a id="m-TAGS"></a>
### TAGS

```java
public static final com.tailf.conf.ConfAttributeType TAGS;
```

CONFD_ATTR_TAGS: value is ConfList of ConfBuf/C_STR

<a id="m-WHEN"></a>
### WHEN

```java
public static final com.tailf.conf.ConfAttributeType WHEN;
```


## Methods

<a id="m-gettype-362221ab6f0b"></a>
### getType(long)

```java
public static com.tailf.conf.ConfAttributeType getType(long l)
```

Types: [ConfAttributeType](ConfAttributeType.md#cls-ConfAttributeType)

Get a ConfAttributeType for given long value or
 null if the long value does not represent an attribute type.

**Parameters**

- `long l` - long value for this attribute

**Returns:** ConfAttributeType for this long value

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public long getValue()
```

Get the long value representation of this attribute type

**Returns:** long value

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Get the string label for this attribute type

**Returns:** String label

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.conf.ConfAttributeType valueOf(String name)
```

Types: [ConfAttributeType](ConfAttributeType.md#cls-ConfAttributeType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.conf.ConfAttributeType[] values()
```

Types: [ConfAttributeType](ConfAttributeType.md#cls-ConfAttributeType)
