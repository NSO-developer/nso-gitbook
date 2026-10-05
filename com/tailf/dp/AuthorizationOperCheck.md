<a id="s-AuthorizationOperCheck"></a>
# AuthorizationOperCheck

```java
public enum com.tailf.dp.AuthorizationOperCheck
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#s-AuthorizationOperCheck)

AuthorizationOperCheck used as argument to authorization callbacks.
 They are also used defined as access filters

**Related classes**

- [AuthorizationOperCheck](AuthorizationOperCheck.md#s-AuthorizationOperCheck)

## Members

**Enum Constants**:

- [CREATE](#s-CREATE)
- [DELETE](#s-DELETE)
- [EXECUTE](#s-EXECUTE)
- [FINAL](#s-FINAL)
- [INTERMEDIATE](#s-INTERMEDIATE)
- [READ](#s-READ)
- [UPDATE](#s-UPDATE)
- [WRITE](#s-WRITE)

**Methods**:

- [getType(int)](#s-getType)
- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-CREATE"></a>
### CREATE

```java
public static final com.tailf.dp.AuthorizationOperCheck CREATE;
```

Create access

<a id="s-DELETE"></a>
### DELETE

```java
public static final com.tailf.dp.AuthorizationOperCheck DELETE;
```

Delete access

<a id="s-EXECUTE"></a>
### EXECUTE

```java
public static final com.tailf.dp.AuthorizationOperCheck EXECUTE;
```

Execute access

<a id="s-FINAL"></a>
### FINAL

```java
public static final com.tailf.dp.AuthorizationOperCheck FINAL;
```

"How" parameter, Access to the specific data node is requested.

<a id="s-INTERMEDIATE"></a>
### INTERMEDIATE

```java
public static final com.tailf.dp.AuthorizationOperCheck INTERMEDIATE;
```

"How" parameter,
 Access to the given data node or its descendants is requested.
 This is used e.g. in CLI command completion or processing of a
 NETCONF edit-config

<a id="s-READ"></a>
### READ

```java
public static final com.tailf.dp.AuthorizationOperCheck READ;
```

Read access.

<a id="s-UPDATE"></a>
### UPDATE

```java
public static final com.tailf.dp.AuthorizationOperCheck UPDATE;
```

Update access

<a id="s-WRITE"></a>
### WRITE

```java
public static final com.tailf.dp.AuthorizationOperCheck WRITE;
```

Write access. This is used when the specific write operation
 (create/update/delete) isn´t known yet, e.g. in CLI command
 completion or processing of a NETCONF edit-config


## Methods

<a id="s-getType"></a>
### getType(int)

```java
public static com.tailf.dp.AuthorizationOperCheck getType(int l)
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#s-AuthorizationOperCheck)

Get a AuthorizationOperationCheck for given int value or
 null if the int value does not represent a enum.

**Parameters**

- `int l` - int value for this enum

**Returns:** AuthorizationOperationCheck for this int value

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

Get the int value representation of this authorization operation check

**Returns:** int value

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.dp.AuthorizationOperCheck valueOf(String name)
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#s-AuthorizationOperCheck)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.dp.AuthorizationOperCheck[] values()
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#s-AuthorizationOperCheck)
