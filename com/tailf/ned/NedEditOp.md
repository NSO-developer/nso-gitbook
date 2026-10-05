<a id="cls-NedEditOp"></a>
# NedEditOp

```java
public class com.tailf.ned.NedEditOp
```

NedEditOp represents the edit operations provided to a
 NedGeneric in the prepare, abort, and revert methods.

## Members

**Constructors**:

- [NedEditOp(ConfETuple)](#m-nededitop-fb5ea191f957)

**Fields**:

- [AFTER](#m-AFTER)
- [ATTR_DEL](#m-ATTR_DEL)
- [ATTR_SET](#m-ATTR_SET)
- [CREATED](#m-CREATED)
- [DEFAULT_SET](#m-DEFAULT_SET)
- [DELETED](#m-DELETED)
- [FIRST](#m-FIRST)
- [MODIFIED](#m-MODIFIED)
- [MOVED](#m-MOVED)
- [VALUE_SET](#m-VALUE_SET)

**Methods**:

- [getMoveDestination()](#m-getmovedestination-35c9f26a0b8a)
- [getOpDone()](#m-getopdone-6611ced4926a)
- [getOperation()](#m-getoperation-baf0e4738a2a)
- [getPath()](#m-getpath-88fb21895561)
- [getValue()](#m-getvalue-d93864668c40)
- [setOpDone()](#m-setopdone-2519596437b1)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-nededitop-fb5ea191f957"></a>
### NedEditOp(ConfETuple)

```java
public NedEditOp(com.tailf.proto.ConfETuple t)
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple)

**Parameters**

- `com.tailf.proto.ConfETuple t`


## Fields

<a id="m-AFTER"></a>
### AFTER

```java
public static final int AFTER = 2;
```

<a id="m-ATTR_DEL"></a>
### ATTR_DEL

```java
public static final int ATTR_DEL = 7;
```

<a id="m-ATTR_SET"></a>
### ATTR_SET

```java
public static final int ATTR_SET = 6;
```

<a id="m-CREATED"></a>
### CREATED

```java
public static final int CREATED = 0;
```

<a id="m-DEFAULT_SET"></a>
### DEFAULT_SET

```java
public static final int DEFAULT_SET = 5;
```

<a id="m-DELETED"></a>
### DELETED

```java
public static final int DELETED = 1;
```

<a id="m-FIRST"></a>
### FIRST

```java
public static final int FIRST = 1;
```

<a id="m-MODIFIED"></a>
### MODIFIED

```java
public static final int MODIFIED = 3;
```

<a id="m-MOVED"></a>
### MOVED

```java
public static final int MOVED = 2;
```

<a id="m-VALUE_SET"></a>
### VALUE_SET

```java
public static final int VALUE_SET = 4;
```


## Methods

<a id="m-getmovedestination-35c9f26a0b8a"></a>
### getMoveDestination()

```java
public int getMoveDestination() throws com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

Returns the absolute or relative destination of a move operation.
 For the relative destinations (before/after), the element which
 the move is relative to is given by `#getValue()`. The two
 possible return values are `#FIRST` and `#AFTER`.
 For a non-move operation, this method will always return -1.

**Returns:** the destination for this move operation

**Throws**

- `NedException`

<a id="m-getopdone-6611ced4926a"></a>
### getOpDone()

```java
public boolean getOpDone()
```

<a id="m-getoperation-baf0e4738a2a"></a>
### getOperation()

```java
public int getOperation()
```

<a id="m-getpath-88fb21895561"></a>
### getPath()

```java
public com.tailf.conf.ConfPath getPath()
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public com.tailf.conf.ConfObject getValue()
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

Returns the value used in this operation. Typically this is the value
 set by a set operation. For a relative move operation, this value, in
 combination with the constant returned by `#getMoveDestination()`,
 specifies the destination of the moved element.

**Returns:** the value used in the operation

<a id="m-setopdone-2519596437b1"></a>
### setOpDone()

```java
public void setOpDone()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
