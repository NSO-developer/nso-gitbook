<a id="cls-ConfFindNextType"></a>
# ConfFindNextType

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

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(int)](#m-valueof-c0d46d25fc67)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-FIND_NEXT"></a>
### FIND_NEXT

```java
public static final com.tailf.conf.ConfFindNextType FIND_NEXT;
```

Find should start after the indicated element

<a id="m-FIND_SAME_OR_NEXT"></a>
### FIND_SAME_OR_NEXT

```java
public static final com.tailf.conf.ConfFindNextType FIND_SAME_OR_NEXT;
```

Find should start with indicated element or the
 next element if the indicated element does not exist


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

get the ordinal value for the enumeration

**Returns:** ordinal value

<a id="m-valueof-c0d46d25fc67"></a>
### valueOf(int)

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

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.conf.ConfFindNextType valueOf(String name)
```

Types: [ConfFindNextType](ConfFindNextType.md#cls-ConfFindNextType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.conf.ConfFindNextType[] values()
```

Types: [ConfFindNextType](ConfFindNextType.md#cls-ConfFindNextType)
