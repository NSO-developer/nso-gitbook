<a id="cls-AuthorizationOperCheck"></a>
# AuthorizationOperCheck

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

- [getType(int)](#m-gettype-ea5f2e669127)
- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-CREATE"></a>
### CREATE

```java
public static final com.tailf.dp.AuthorizationOperCheck CREATE;
```

Create access

<a id="m-DELETE"></a>
### DELETE

```java
public static final com.tailf.dp.AuthorizationOperCheck DELETE;
```

Delete access

<a id="m-EXECUTE"></a>
### EXECUTE

```java
public static final com.tailf.dp.AuthorizationOperCheck EXECUTE;
```

Execute access

<a id="m-FINAL"></a>
### FINAL

```java
public static final com.tailf.dp.AuthorizationOperCheck FINAL;
```

"How" parameter, Access to the specific data node is requested.

<a id="m-INTERMEDIATE"></a>
### INTERMEDIATE

```java
public static final com.tailf.dp.AuthorizationOperCheck INTERMEDIATE;
```

"How" parameter,
 Access to the given data node or its descendants is requested.
 This is used e.g. in CLI command completion or processing of a
 NETCONF edit-config

<a id="m-READ"></a>
### READ

```java
public static final com.tailf.dp.AuthorizationOperCheck READ;
```

Read access.

<a id="m-UPDATE"></a>
### UPDATE

```java
public static final com.tailf.dp.AuthorizationOperCheck UPDATE;
```

Update access

<a id="m-WRITE"></a>
### WRITE

```java
public static final com.tailf.dp.AuthorizationOperCheck WRITE;
```

Write access. This is used when the specific write operation
 (create/update/delete) isn´t known yet, e.g. in CLI command
 completion or processing of a NETCONF edit-config


## Methods

<a id="m-gettype-ea5f2e669127"></a>
### getType(int)

```java
public static com.tailf.dp.AuthorizationOperCheck getType(int l)
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#cls-AuthorizationOperCheck)

Get a AuthorizationOperationCheck for given int value or
 null if the int value does not represent a enum.

**Parameters**

- `int l` - int value for this enum

**Returns:** AuthorizationOperationCheck for this int value

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

Get the int value representation of this authorization operation check

**Returns:** int value

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.dp.AuthorizationOperCheck valueOf(String name)
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#cls-AuthorizationOperCheck)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.dp.AuthorizationOperCheck[] values()
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#cls-AuthorizationOperCheck)
