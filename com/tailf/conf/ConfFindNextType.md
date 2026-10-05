<a id="s-ConfFindNextType"></a>
# ConfFindNextType

```java
public enum com.tailf.conf.ConfFindNextType
```

Types: [ConfFindNextType](ConfFindNextType.md#s-ConfFindNextType)

Enum used in findNext calls to determine if the element extraction
 should start at indicated element or the element after that

**Related classes**

- [ConfFindNextType](ConfFindNextType.md#s-ConfFindNextType)

## Members

**Enum Constants**:

- [FIND_NEXT](#s-FIND_NEXT)
- [FIND_SAME_OR_NEXT](#s-FIND_SAME_OR_NEXT)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-FIND_NEXT"></a>
### FIND_NEXT

```java
public static final com.tailf.conf.ConfFindNextType FIND_NEXT;
```

Find should start after the indicated element

<a id="s-FIND_SAME_OR_NEXT"></a>
### FIND_SAME_OR_NEXT

```java
public static final com.tailf.conf.ConfFindNextType FIND_SAME_OR_NEXT;
```

Find should start with indicated element or the
 next element if the indicated element does not exist


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

get the ordinal value for the enumeration

**Returns:** ordinal value

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.conf.ConfFindNextType valueOf(int i)
```

Types: [ConfFindNextType](ConfFindNextType.md#s-ConfFindNextType)

Static method that creates an enum from an integer
 ordinal value. Should be 0 or 1 for FIND_NEXT or
 FIND_SAME_OR_NEXT respectively

**Parameters**

- `int i` - ordinal value

**Returns:** ConfFindNextType enumeration

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.conf.ConfFindNextType valueOf(String name)
```

Types: [ConfFindNextType](ConfFindNextType.md#s-ConfFindNextType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.conf.ConfFindNextType[] values()
```

Types: [ConfFindNextType](ConfFindNextType.md#s-ConfFindNextType)
