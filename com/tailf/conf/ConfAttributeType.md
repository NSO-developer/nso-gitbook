<a id="s-ConfAttributeType"></a>
# ConfAttributeType

```java
public enum com.tailf.conf.ConfAttributeType
```

Types: [ConfAttributeType](ConfAttributeType.md#s-ConfAttributeType)

Enumeration of attribute types

**Related classes**

- [ConfAttributeType](ConfAttributeType.md#s-ConfAttributeType)

## Members

**Enum Constants**:

- [ANNOTATION](#s-ANNOTATION)
- [BACKPOINTER](#s-BACKPOINTER)
- [INACTIVE](#s-INACTIVE)
- [ORIGIN](#s-ORIGIN)
- [ORIGINAL_VALUE](#s-ORIGINAL_VALUE)
- [OUT_OF_BAND](#s-OUT_OF_BAND)
- [REFCOUNT](#s-REFCOUNT)
- [TAGS](#s-TAGS)
- [WHEN](#s-WHEN)

**Methods**:

- [getType(long)](#s-getType)
- [getValue()](#s-getValue)
- [toString()](#s-toString)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-ANNOTATION"></a>
### ANNOTATION

```java
public static final com.tailf.conf.ConfAttributeType ANNOTATION;
```

CONFD_ATTR_ANNOTATION: value is ConfBuf/C_STR

<a id="s-BACKPOINTER"></a>
### BACKPOINTER

```java
public static final com.tailf.conf.ConfAttributeType BACKPOINTER;
```

CONFD_ATTR_BACKPOINTER: value is ConfObjectRef'

<a id="s-INACTIVE"></a>
### INACTIVE

```java
public static final com.tailf.conf.ConfAttributeType INACTIVE;
```

CONFD_ATTR_INACTIVE: value is ConfBool 'true'

<a id="s-ORIGIN"></a>
### ORIGIN

```java
public static final com.tailf.conf.ConfAttributeType ORIGIN;
```

CONFD_ATTR_ORIGIN: value is ConfIdentityRef

<a id="s-ORIGINAL_VALUE"></a>
### ORIGINAL_VALUE

```java
public static final com.tailf.conf.ConfAttributeType ORIGINAL_VALUE;
```

<a id="s-OUT_OF_BAND"></a>
### OUT_OF_BAND

```java
public static final com.tailf.conf.ConfAttributeType OUT_OF_BAND;
```

CONFD_ATTR_OUT_OF_BAND: value is ConfObjectRef'

<a id="s-REFCOUNT"></a>
### REFCOUNT

```java
public static final com.tailf.conf.ConfAttributeType REFCOUNT;
```

CONFD_ATTR_REFCOUNT: value is ConfInt32

<a id="s-TAGS"></a>
### TAGS

```java
public static final com.tailf.conf.ConfAttributeType TAGS;
```

CONFD_ATTR_TAGS: value is ConfList of ConfBuf/C_STR

<a id="s-WHEN"></a>
### WHEN

```java
public static final com.tailf.conf.ConfAttributeType WHEN;
```


## Methods

<a id="s-getType"></a>
### getType(long)

```java
public static com.tailf.conf.ConfAttributeType getType(long l)
```

Types: [ConfAttributeType](ConfAttributeType.md#s-ConfAttributeType)

Get a ConfAttributeType for given long value or
 null if the long value does not represent an attribute type.

**Parameters**

- `long l` - long value for this attribute

**Returns:** ConfAttributeType for this long value

<a id="s-getValue"></a>
### getValue()

```java
public long getValue()
```

Get the long value representation of this attribute type

**Returns:** long value

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Get the string label for this attribute type

**Returns:** String label

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.conf.ConfAttributeType valueOf(String name)
```

Types: [ConfAttributeType](ConfAttributeType.md#s-ConfAttributeType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.conf.ConfAttributeType[] values()
```

Types: [ConfAttributeType](ConfAttributeType.md#s-ConfAttributeType)
