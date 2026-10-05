# ConfFindNextType <a href="#conffindnexttype-c34c1027a581" id="conffindnexttype-c34c1027a581"></a>

```java
public enum com.tailf.conf.ConfFindNextType
```

Types: [ConfFindNextType](ConfFindNextType.md#conffindnexttype-c34c1027a581)

Enum used in findNext calls to determine if the element extraction
 should start at indicated element or the element after that

## Members

**Enum Constants**:

- [FIND_NEXT](#find_next-1cc7540f85fd)
- [FIND_SAME_OR_NEXT](#find_same_or_next-759812451f0a)

**Methods**:

- [getValue()](#getvalue-d93864668c40)
- [valueOf(int)](#valueof-c0d46d25fc67)
- [valueOf(String)](#valueof-ac61b3547613)
- [values()](#values-406dfe3ca270)

## Enum Constants

### FIND_NEXT <a href="#find_next-1cc7540f85fd" id="find_next-1cc7540f85fd"></a>

```java
public static final com.tailf.conf.ConfFindNextType FIND_NEXT;
```

Find should start after the indicated element

### FIND_SAME_OR_NEXT <a href="#find_same_or_next-759812451f0a" id="find_same_or_next-759812451f0a"></a>

```java
public static final com.tailf.conf.ConfFindNextType FIND_SAME_OR_NEXT;
```

Find should start with indicated element or the
 next element if the indicated element does not exist


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

get the ordinal value for the enumeration

**Returns:** ordinal value

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.conf.ConfFindNextType valueOf(int i)
```

Types: [ConfFindNextType](ConfFindNextType.md#conffindnexttype-c34c1027a581)

Static method that creates an enum from an integer
 ordinal value. Should be 0 or 1 for FIND_NEXT or
 FIND_SAME_OR_NEXT respectively

**Parameters**

- `int i` - ordinal value

**Returns:** ConfFindNextType enumeration

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.conf.ConfFindNextType valueOf(String name)
```

Types: [ConfFindNextType](ConfFindNextType.md#conffindnexttype-c34c1027a581)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.conf.ConfFindNextType[] values()
```

Types: [ConfFindNextType](ConfFindNextType.md#conffindnexttype-c34c1027a581)
