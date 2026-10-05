# ConfFindNextType <a href="#cls-ConfFindNextType" id="cls-ConfFindNextType"></a>

```java
public enum com.tailf.conf.ConfFindNextType
```

Types: [ConfFindNextType](ConfFindNextType.md#cls-ConfFindNextType)

Enum used in findNext calls to determine if the element extraction
 should start at indicated element or the element after that

## Members

**Enum Constants**:

- [FIND_NEXT](#m-FIND_NEXT)
- [FIND_SAME_OR_NEXT](#m-FIND_SAME_OR_NEXT)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(int)](#m-valueOf-c0d46d25fc67)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### FIND_NEXT <a href="#m-FIND_NEXT" id="m-FIND_NEXT"></a>

```java
public static final com.tailf.conf.ConfFindNextType FIND_NEXT;
```

Find should start after the indicated element

### FIND_SAME_OR_NEXT <a href="#m-FIND_SAME_OR_NEXT" id="m-FIND_SAME_OR_NEXT"></a>

```java
public static final com.tailf.conf.ConfFindNextType FIND_SAME_OR_NEXT;
```

Find should start with indicated element or the
 next element if the indicated element does not exist


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

get the ordinal value for the enumeration

**Returns:** ordinal value

### valueOf(int) <a href="#m-valueOf-c0d46d25fc67" id="m-valueOf-c0d46d25fc67"></a>

```java
public static com.tailf.conf.ConfFindNextType valueOf(int i)
```

Types: [ConfFindNextType](ConfFindNextType.md#cls-ConfFindNextType)

Static method that creates an enum from an integer
 ordinal value. Should be 0 or 1 for FIND_NEXT or
 FIND_SAME_OR_NEXT respectively

**Parameters**

- `int i` - ordinal value

**Returns:** ConfFindNextType enumeration

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.conf.ConfFindNextType valueOf(String name)
```

Types: [ConfFindNextType](ConfFindNextType.md#cls-ConfFindNextType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.conf.ConfFindNextType[] values()
```

Types: [ConfFindNextType](ConfFindNextType.md#cls-ConfFindNextType)
