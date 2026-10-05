# AuthorizationOperCheck <a href="#cls-AuthorizationOperCheck" id="cls-AuthorizationOperCheck"></a>

```java
public enum com.tailf.dp.AuthorizationOperCheck
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#cls-AuthorizationOperCheck)

AuthorizationOperCheck used as argument to authorization callbacks.
 They are also used defined as access filters

## Members

**Enum Constants**:

- [CREATE](#m-CREATE)
- [DELETE](#m-DELETE)
- [EXECUTE](#m-EXECUTE)
- [FINAL](#m-FINAL)
- [INTERMEDIATE](#m-INTERMEDIATE)
- [READ](#m-READ)
- [UPDATE](#m-UPDATE)
- [WRITE](#m-WRITE)

**Methods**:

- [getType(int)](#m-getType-ea5f2e669127)
- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CREATE <a href="#m-CREATE" id="m-CREATE"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck CREATE;
```

Create access

### DELETE <a href="#m-DELETE" id="m-DELETE"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck DELETE;
```

Delete access

### EXECUTE <a href="#m-EXECUTE" id="m-EXECUTE"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck EXECUTE;
```

Execute access

### FINAL <a href="#m-FINAL" id="m-FINAL"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck FINAL;
```

"How" parameter, Access to the specific data node is requested.

### INTERMEDIATE <a href="#m-INTERMEDIATE" id="m-INTERMEDIATE"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck INTERMEDIATE;
```

"How" parameter,
 Access to the given data node or its descendants is requested.
 This is used e.g. in CLI command completion or processing of a
 NETCONF edit-config

### READ <a href="#m-READ" id="m-READ"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck READ;
```

Read access.

### UPDATE <a href="#m-UPDATE" id="m-UPDATE"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck UPDATE;
```

Update access

### WRITE <a href="#m-WRITE" id="m-WRITE"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck WRITE;
```

Write access. This is used when the specific write operation
 (create/update/delete) isn´t known yet, e.g. in CLI command
 completion or processing of a NETCONF edit-config


## Methods

### getType(int) <a href="#m-getType-ea5f2e669127" id="m-getType-ea5f2e669127"></a>

```java
public static com.tailf.dp.AuthorizationOperCheck getType(int l)
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#cls-AuthorizationOperCheck)

Get a AuthorizationOperationCheck for given int value or
 null if the int value does not represent a enum.

**Parameters**

- `int l` - int value for this enum

**Returns:** AuthorizationOperationCheck for this int value

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

Get the int value representation of this authorization operation check

**Returns:** int value

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.dp.AuthorizationOperCheck valueOf(String name)
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#cls-AuthorizationOperCheck)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.dp.AuthorizationOperCheck[] values()
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#cls-AuthorizationOperCheck)
