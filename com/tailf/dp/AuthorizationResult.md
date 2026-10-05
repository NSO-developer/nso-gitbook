# AuthorizationResult <a href="#cls-AuthorizationResult" id="cls-AuthorizationResult"></a>

```java
public enum com.tailf.dp.AuthorizationResult
```

Types: [AuthorizationResult](AuthorizationResult.md#cls-AuthorizationResult)

Enum for returning authorization result from authorization callbacks

## Members

**Enum Constants**:

- [ACCEPT](#m-ACCEPT)
- [CONTINUE](#m-CONTINUE)
- [DEFAULT](#m-DEFAULT)
- [REJECT](#m-REJECT)

**Methods**:

- [getType(int)](#m-getType-ea5f2e669127)
- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### ACCEPT <a href="#m-ACCEPT" id="m-ACCEPT"></a>

```java
public static final com.tailf.dp.AuthorizationResult ACCEPT;
```

The access is allowed. This is a "final verdict", analogous to a
 "full match" when the AAA rules are used.

### CONTINUE <a href="#m-CONTINUE" id="m-CONTINUE"></a>

```java
public static final com.tailf.dp.AuthorizationResult CONTINUE;
```

The access is allowed "so far". I.e. access to sub-elements is not
 necessarily allowed. This result is mainly useful when
 a checkCommandAccess() callback is called with operation == READ or
 a checkDataAccess() callback is called with how == INTERMEDIATE.

### DEFAULT <a href="#m-DEFAULT" id="m-DEFAULT"></a>

```java
public static final com.tailf.dp.AuthorizationResult DEFAULT;
```

The request should be handled according to the rules configured in
 the AAA data model.

### REJECT <a href="#m-REJECT" id="m-REJECT"></a>

```java
public static final com.tailf.dp.AuthorizationResult REJECT;
```

The access is denied.


## Methods

### getType(int) <a href="#m-getType-ea5f2e669127" id="m-getType-ea5f2e669127"></a>

```java
public static com.tailf.dp.AuthorizationResult getType(int l)
```

Types: [AuthorizationResult](AuthorizationResult.md#cls-AuthorizationResult)

Get a DpAuthorizationResult for given int value or
 null if the int value does not represent a enum.

**Parameters**

- `int l` - int value for this enum

**Returns:** AuthorizationResult for this int value

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

Get the int value representation of this authorization result

**Returns:** int value

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.dp.AuthorizationResult valueOf(String name)
```

Types: [AuthorizationResult](AuthorizationResult.md#cls-AuthorizationResult)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.dp.AuthorizationResult[] values()
```

Types: [AuthorizationResult](AuthorizationResult.md#cls-AuthorizationResult)
