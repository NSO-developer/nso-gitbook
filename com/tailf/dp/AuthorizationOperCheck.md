# AuthorizationOperCheck <a href="#authorizationopercheck-7342d1a011a5" id="authorizationopercheck-7342d1a011a5"></a>

```java
public enum com.tailf.dp.AuthorizationOperCheck
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#authorizationopercheck-7342d1a011a5)

AuthorizationOperCheck used as argument to authorization callbacks.
 They are also used defined as access filters

## Members

**Enum Constants**:

- [CREATE](#create-146c3c7e4f65)
- [DELETE](#delete-17bb47048092)
- [EXECUTE](#execute-52024d3f616a)
- [FINAL](#final-5a6aacb2d147)
- [INTERMEDIATE](#intermediate-9af98bb5e4a7)
- [READ](#read-a581bbb3f39f)
- [UPDATE](#update-39b73b15811d)
- [WRITE](#write-e622810b08da)

**Methods**:

- [getType(int)](#gettype-ea5f2e669127)
- [getValue()](#getvalue-d93864668c40)
- [valueOf(String)](#valueof-ac61b3547613)
- [values()](#values-406dfe3ca270)

## Enum Constants

### CREATE <a href="#create-146c3c7e4f65" id="create-146c3c7e4f65"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck CREATE;
```

Create access

### DELETE <a href="#delete-17bb47048092" id="delete-17bb47048092"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck DELETE;
```

Delete access

### EXECUTE <a href="#execute-52024d3f616a" id="execute-52024d3f616a"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck EXECUTE;
```

Execute access

### FINAL <a href="#final-5a6aacb2d147" id="final-5a6aacb2d147"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck FINAL;
```

"How" parameter, Access to the specific data node is requested.

### INTERMEDIATE <a href="#intermediate-9af98bb5e4a7" id="intermediate-9af98bb5e4a7"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck INTERMEDIATE;
```

"How" parameter,
 Access to the given data node or its descendants is requested.
 This is used e.g. in CLI command completion or processing of a
 NETCONF edit-config

### READ <a href="#read-a581bbb3f39f" id="read-a581bbb3f39f"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck READ;
```

Read access.

### UPDATE <a href="#update-39b73b15811d" id="update-39b73b15811d"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck UPDATE;
```

Update access

### WRITE <a href="#write-e622810b08da" id="write-e622810b08da"></a>

```java
public static final com.tailf.dp.AuthorizationOperCheck WRITE;
```

Write access. This is used when the specific write operation
 (create/update/delete) isn´t known yet, e.g. in CLI command
 completion or processing of a NETCONF edit-config


## Methods

### getType(int) <a href="#gettype-ea5f2e669127" id="gettype-ea5f2e669127"></a>

```java
public static com.tailf.dp.AuthorizationOperCheck getType(int l)
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#authorizationopercheck-7342d1a011a5)

Get a AuthorizationOperationCheck for given int value or
 null if the int value does not represent a enum.

**Parameters**

- `int l` - int value for this enum

**Returns:** AuthorizationOperationCheck for this int value

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

Get the int value representation of this authorization operation check

**Returns:** int value

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.dp.AuthorizationOperCheck valueOf(String name)
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#authorizationopercheck-7342d1a011a5)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.dp.AuthorizationOperCheck[] values()
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#authorizationopercheck-7342d1a011a5)
