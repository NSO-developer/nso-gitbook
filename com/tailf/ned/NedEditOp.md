# NedEditOp <a href="#nededitop-b7874a11393d" id="nededitop-b7874a11393d"></a>

```java
public class com.tailf.ned.NedEditOp
```

NedEditOp represents the edit operations provided to a
 NedGeneric in the prepare, abort, and revert methods.

## Members

**Constructors**:

- [NedEditOp\(ConfETuple\)](#nededitop-fb5ea191f957)

**Fields**:

- [AFTER](#after-22d3951db1ad)
- [ATTR\_DEL](#attr_del-4a1cc8e2643f)
- [ATTR\_SET](#attr_set-0ae457aadd97)
- [CREATED](#created-fb73349d7fe1)
- [DEFAULT\_SET](#default_set-62669637559e)
- [DELETED](#deleted-c1cbfd27938b)
- [FIRST](#first-9a16e3379a19)
- [MODIFIED](#modified-9434b1a4ec58)
- [MOVED](#moved-4aea31177742)
- [VALUE\_SET](#value_set-04a6e7720356)

**Methods**:

- [getMoveDestination\(\)](#getmovedestination-35c9f26a0b8a)
- [getOpDone\(\)](#getopdone-6611ced4926a)
- [getOperation\(\)](#getoperation-baf0e4738a2a)
- [getPath\(\)](#getpath-88fb21895561)
- [getValue\(\)](#getvalue-d93864668c40)
- [setOpDone\(\)](#setopdone-2519596437b1)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### NedEditOp(ConfETuple) <a href="#nededitop-fb5ea191f957" id="nededitop-fb5ea191f957"></a>

```java
public NedEditOp(com.tailf.proto.ConfETuple t)
```

Types: [ConfETuple](../proto/ConfETuple.md#confetuple-b1f9702a82a1)

**Parameters**

- `com.tailf.proto.ConfETuple t`


## Fields

### AFTER <a href="#after-22d3951db1ad" id="after-22d3951db1ad"></a>

```java
public static final int AFTER = 2;
```

### ATTR_DEL <a href="#attr_del-4a1cc8e2643f" id="attr_del-4a1cc8e2643f"></a>

```java
public static final int ATTR_DEL = 7;
```

### ATTR_SET <a href="#attr_set-0ae457aadd97" id="attr_set-0ae457aadd97"></a>

```java
public static final int ATTR_SET = 6;
```

### CREATED <a href="#created-fb73349d7fe1" id="created-fb73349d7fe1"></a>

```java
public static final int CREATED = 0;
```

### DEFAULT_SET <a href="#default_set-62669637559e" id="default_set-62669637559e"></a>

```java
public static final int DEFAULT_SET = 5;
```

### DELETED <a href="#deleted-c1cbfd27938b" id="deleted-c1cbfd27938b"></a>

```java
public static final int DELETED = 1;
```

### FIRST <a href="#first-9a16e3379a19" id="first-9a16e3379a19"></a>

```java
public static final int FIRST = 1;
```

### MODIFIED <a href="#modified-9434b1a4ec58" id="modified-9434b1a4ec58"></a>

```java
public static final int MODIFIED = 3;
```

### MOVED <a href="#moved-4aea31177742" id="moved-4aea31177742"></a>

```java
public static final int MOVED = 2;
```

### VALUE_SET <a href="#value_set-04a6e7720356" id="value_set-04a6e7720356"></a>

```java
public static final int VALUE_SET = 4;
```


## Methods

### getMoveDestination() <a href="#getmovedestination-35c9f26a0b8a" id="getmovedestination-35c9f26a0b8a"></a>

```java
public int getMoveDestination() throws com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

Returns the absolute or relative destination of a move operation.
 For the relative destinations (before/after), the element which
 the move is relative to is given by [`getValue()`](NedEditOp.md#getvalue-d93864668c40). The two
 possible return values are [`FIRST`](NedEditOp.md#first-9a16e3379a19) and [`AFTER`](NedEditOp.md#after-22d3951db1ad).
 For a non-move operation, this method will always return -1.

**Returns:** the destination for this move operation

**Throws**

- `NedException`

### getOpDone() <a href="#getopdone-6611ced4926a" id="getopdone-6611ced4926a"></a>

```java
public boolean getOpDone()
```

### getOperation() <a href="#getoperation-baf0e4738a2a" id="getoperation-baf0e4738a2a"></a>

```java
public int getOperation()
```

### getPath() <a href="#getpath-88fb21895561" id="getpath-88fb21895561"></a>

```java
public com.tailf.conf.ConfPath getPath()
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public com.tailf.conf.ConfObject getValue()
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

Returns the value used in this operation. Typically this is the value
 set by a set operation. For a relative move operation, this value, in
 combination with the constant returned by [`getMoveDestination()`](NedEditOp.md#getmovedestination-35c9f26a0b8a),
 specifies the destination of the moved element.

**Returns:** the value used in the operation

### setOpDone() <a href="#setopdone-2519596437b1" id="setopdone-2519596437b1"></a>

```java
public void setOpDone()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
