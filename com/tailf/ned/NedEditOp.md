# NedEditOp <a href="#cls-NedEditOp" id="cls-NedEditOp"></a>

```java
public class com.tailf.ned.NedEditOp
```

NedEditOp represents the edit operations provided to a
 NedGeneric in the prepare, abort, and revert methods.

## Members

**Constructors**:

- [NedEditOp(ConfETuple)](#m-NedEditOp-fb5ea191f957)

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

- [getMoveDestination()](#m-getMoveDestination-35c9f26a0b8a)
- [getOpDone()](#m-getOpDone-6611ced4926a)
- [getOperation()](#m-getOperation-baf0e4738a2a)
- [getPath()](#m-getPath-88fb21895561)
- [getValue()](#m-getValue-d93864668c40)
- [setOpDone()](#m-setOpDone-2519596437b1)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### NedEditOp(ConfETuple) <a href="#m-NedEditOp-fb5ea191f957" id="m-NedEditOp-fb5ea191f957"></a>

```java
public NedEditOp(com.tailf.proto.ConfETuple t)
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple)

**Parameters**

- `com.tailf.proto.ConfETuple t`


## Fields

### AFTER <a href="#m-AFTER" id="m-AFTER"></a>

```java
public static final int AFTER = 2;
```

### ATTR_DEL <a href="#m-ATTR_DEL" id="m-ATTR_DEL"></a>

```java
public static final int ATTR_DEL = 7;
```

### ATTR_SET <a href="#m-ATTR_SET" id="m-ATTR_SET"></a>

```java
public static final int ATTR_SET = 6;
```

### CREATED <a href="#m-CREATED" id="m-CREATED"></a>

```java
public static final int CREATED = 0;
```

### DEFAULT_SET <a href="#m-DEFAULT_SET" id="m-DEFAULT_SET"></a>

```java
public static final int DEFAULT_SET = 5;
```

### DELETED <a href="#m-DELETED" id="m-DELETED"></a>

```java
public static final int DELETED = 1;
```

### FIRST <a href="#m-FIRST" id="m-FIRST"></a>

```java
public static final int FIRST = 1;
```

### MODIFIED <a href="#m-MODIFIED" id="m-MODIFIED"></a>

```java
public static final int MODIFIED = 3;
```

### MOVED <a href="#m-MOVED" id="m-MOVED"></a>

```java
public static final int MOVED = 2;
```

### VALUE_SET <a href="#m-VALUE_SET" id="m-VALUE_SET"></a>

```java
public static final int VALUE_SET = 4;
```


## Methods

### getMoveDestination() <a href="#m-getMoveDestination-35c9f26a0b8a" id="m-getMoveDestination-35c9f26a0b8a"></a>

```java
public int getMoveDestination() throws com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

Returns the absolute or relative destination of a move operation.
 For the relative destinations (before/after), the element which
 the move is relative to is given by [`getValue()`](NedEditOp.md#m-getValue-d93864668c40). The two
 possible return values are [`FIRST`](NedEditOp.md#m-FIRST) and [`AFTER`](NedEditOp.md#m-AFTER).
 For a non-move operation, this method will always return -1.

**Returns:** the destination for this move operation

**Throws**

- `NedException`

### getOpDone() <a href="#m-getOpDone-6611ced4926a" id="m-getOpDone-6611ced4926a"></a>

```java
public boolean getOpDone()
```

### getOperation() <a href="#m-getOperation-baf0e4738a2a" id="m-getOperation-baf0e4738a2a"></a>

```java
public int getOperation()
```

### getPath() <a href="#m-getPath-88fb21895561" id="m-getPath-88fb21895561"></a>

```java
public com.tailf.conf.ConfPath getPath()
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public com.tailf.conf.ConfObject getValue()
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

Returns the value used in this operation. Typically this is the value
 set by a set operation. For a relative move operation, this value, in
 combination with the constant returned by [`getMoveDestination()`](NedEditOp.md#m-getMoveDestination-35c9f26a0b8a),
 specifies the destination of the moved element.

**Returns:** the value used in the operation

### setOpDone() <a href="#m-setOpDone-2519596437b1" id="m-setOpDone-2519596437b1"></a>

```java
public void setOpDone()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
