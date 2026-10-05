<a id="s-NedEditOp"></a>
# NedEditOp

```java
public class com.tailf.ned.NedEditOp
```

NedEditOp represents the edit operations provided to a
 NedGeneric in the prepare, abort, and revert methods.

## Members

**Constructors**:

- [NedEditOp(ConfETuple)](#s-NedEditOp-1)

**Fields**:

- [AFTER](#s-AFTER)
- [ATTR_DEL](#s-ATTR_DEL)
- [ATTR_SET](#s-ATTR_SET)
- [CREATED](#s-CREATED)
- [DEFAULT_SET](#s-DEFAULT_SET)
- [DELETED](#s-DELETED)
- [FIRST](#s-FIRST)
- [MODIFIED](#s-MODIFIED)
- [MOVED](#s-MOVED)
- [VALUE_SET](#s-VALUE_SET)

**Methods**:

- [getMoveDestination()](#s-getMoveDestination)
- [getOpDone()](#s-getOpDone)
- [getOperation()](#s-getOperation)
- [getPath()](#s-getPath)
- [getValue()](#s-getValue)
- [setOpDone()](#s-setOpDone)
- [toString()](#s-toString)

## Constructors

<a id="s-NedEditOp-1"></a>
### NedEditOp(ConfETuple)

```java
public NedEditOp(com.tailf.proto.ConfETuple t)
```

Types: [ConfETuple](../proto/ConfETuple.md#s-ConfETuple)

**Parameters**

- `com.tailf.proto.ConfETuple t`


## Fields

<a id="s-AFTER"></a>
### AFTER

```java
public static final int AFTER = 2;
```

<a id="s-ATTR_DEL"></a>
### ATTR_DEL

```java
public static final int ATTR_DEL = 7;
```

<a id="s-ATTR_SET"></a>
### ATTR_SET

```java
public static final int ATTR_SET = 6;
```

<a id="s-CREATED"></a>
### CREATED

```java
public static final int CREATED = 0;
```

<a id="s-DEFAULT_SET"></a>
### DEFAULT_SET

```java
public static final int DEFAULT_SET = 5;
```

<a id="s-DELETED"></a>
### DELETED

```java
public static final int DELETED = 1;
```

<a id="s-FIRST"></a>
### FIRST

```java
public static final int FIRST = 1;
```

<a id="s-MODIFIED"></a>
### MODIFIED

```java
public static final int MODIFIED = 3;
```

<a id="s-MOVED"></a>
### MOVED

```java
public static final int MOVED = 2;
```

<a id="s-VALUE_SET"></a>
### VALUE_SET

```java
public static final int VALUE_SET = 4;
```


## Methods

<a id="s-getMoveDestination"></a>
### getMoveDestination()

```java
public int getMoveDestination() throws com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

Returns the absolute or relative destination of a move operation.
 For the relative destinations (before/after), the element which
 the move is relative to is given by `#getValue()`. The two
 possible return values are `#FIRST` and `#AFTER`.
 For a non-move operation, this method will always return -1.

**Returns:** the destination for this move operation

**Throws**

- `NedException`

<a id="s-getOpDone"></a>
### getOpDone()

```java
public boolean getOpDone()
```

<a id="s-getOperation"></a>
### getOperation()

```java
public int getOperation()
```

<a id="s-getPath"></a>
### getPath()

```java
public com.tailf.conf.ConfPath getPath()
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath)

<a id="s-getValue"></a>
### getValue()

```java
public com.tailf.conf.ConfObject getValue()
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject)

Returns the value used in this operation. Typically this is the value
 set by a set operation. For a relative move operation, this value, in
 combination with the constant returned by `#getMoveDestination()`,
 specifies the destination of the moved element.

**Returns:** the value used in the operation

<a id="s-setOpDone"></a>
### setOpDone()

```java
public void setOpDone()
```

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
