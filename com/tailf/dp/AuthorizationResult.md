<a id="s-AuthorizationResult"></a>
# AuthorizationResult

```java
public enum com.tailf.dp.AuthorizationResult
```

Types: [AuthorizationResult](AuthorizationResult.md#s-AuthorizationResult)

Enum for returning authorization result from authorization callbacks

**Related classes**

- [AuthorizationResult](AuthorizationResult.md#s-AuthorizationResult)

## Members

**Enum Constants**:

- [ACCEPT](#s-ACCEPT)
- [CONTINUE](#s-CONTINUE)
- [DEFAULT](#s-DEFAULT)
- [REJECT](#s-REJECT)

**Methods**:

- [getType(int)](#s-getType)
- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-ACCEPT"></a>
### ACCEPT

```java
public static final com.tailf.dp.AuthorizationResult ACCEPT;
```

The access is allowed. This is a "final verdict", analogous to a
 "full match" when the AAA rules are used.

<a id="s-CONTINUE"></a>
### CONTINUE

```java
public static final com.tailf.dp.AuthorizationResult CONTINUE;
```

The access is allowed "so far". I.e. access to sub-elements is not
 necessarily allowed. This result is mainly useful when
 a checkCommandAccess() callback is called with operation == READ or
 a checkDataAccess() callback is called with how == INTERMEDIATE.

<a id="s-DEFAULT"></a>
### DEFAULT

```java
public static final com.tailf.dp.AuthorizationResult DEFAULT;
```

The request should be handled according to the rules configured in
 the AAA data model.

<a id="s-REJECT"></a>
### REJECT

```java
public static final com.tailf.dp.AuthorizationResult REJECT;
```

The access is denied.


## Methods

<a id="s-getType"></a>
### getType(int)

```java
public static com.tailf.dp.AuthorizationResult getType(int l)
```

Types: [AuthorizationResult](AuthorizationResult.md#s-AuthorizationResult)

Get a DpAuthorizationResult for given int value or
 null if the int value does not represent a enum.

**Parameters**

- `int l` - int value for this enum

**Returns:** AuthorizationResult for this int value

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

Get the int value representation of this authorization result

**Returns:** int value

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.dp.AuthorizationResult valueOf(String name)
```

Types: [AuthorizationResult](AuthorizationResult.md#s-AuthorizationResult)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.dp.AuthorizationResult[] values()
```

Types: [AuthorizationResult](AuthorizationResult.md#s-AuthorizationResult)
