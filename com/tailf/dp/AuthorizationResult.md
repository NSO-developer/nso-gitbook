<a id="cls-AuthorizationResult"></a>
# AuthorizationResult

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

- [getType(int)](#m-gettype-ea5f2e669127)
- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-ACCEPT"></a>
### ACCEPT

```java
public static final com.tailf.dp.AuthorizationResult ACCEPT;
```

The access is allowed. This is a "final verdict", analogous to a
 "full match" when the AAA rules are used.

<a id="m-CONTINUE"></a>
### CONTINUE

```java
public static final com.tailf.dp.AuthorizationResult CONTINUE;
```

The access is allowed "so far". I.e. access to sub-elements is not
 necessarily allowed. This result is mainly useful when
 a checkCommandAccess() callback is called with operation == READ or
 a checkDataAccess() callback is called with how == INTERMEDIATE.

<a id="m-DEFAULT"></a>
### DEFAULT

```java
public static final com.tailf.dp.AuthorizationResult DEFAULT;
```

The request should be handled according to the rules configured in
 the AAA data model.

<a id="m-REJECT"></a>
### REJECT

```java
public static final com.tailf.dp.AuthorizationResult REJECT;
```

The access is denied.


## Methods

<a id="m-gettype-ea5f2e669127"></a>
### getType(int)

```java
public static com.tailf.dp.AuthorizationResult getType(int l)
```

Types: [AuthorizationResult](AuthorizationResult.md#cls-AuthorizationResult)

Get a DpAuthorizationResult for given int value or
 null if the int value does not represent a enum.

**Parameters**

- `int l` - int value for this enum

**Returns:** AuthorizationResult for this int value

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

Get the int value representation of this authorization result

**Returns:** int value

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.dp.AuthorizationResult valueOf(String name)
```

Types: [AuthorizationResult](AuthorizationResult.md#cls-AuthorizationResult)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.dp.AuthorizationResult[] values()
```

Types: [AuthorizationResult](AuthorizationResult.md#cls-AuthorizationResult)
