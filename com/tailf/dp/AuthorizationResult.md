# AuthorizationResult <a href="#authorizationresult-118ce0a72969" id="authorizationresult-118ce0a72969"></a>

```java
public enum com.tailf.dp.AuthorizationResult
```

Types: [AuthorizationResult](AuthorizationResult.md#authorizationresult-118ce0a72969)

Enum for returning authorization result from authorization callbacks

## Members

**Enum Constants**:

- [ACCEPT](#accept-36909b32fd5f)
- [CONTINUE](#continue-5e783bfcaf54)
- [DEFAULT](#default-260e1d6ccdf3)
- [REJECT](#reject-0ae9cb4d8a71)

**Methods**:

- [getType\(int\)](#gettype-ea5f2e669127)
- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### ACCEPT <a href="#accept-36909b32fd5f" id="accept-36909b32fd5f"></a>

```java
public static final com.tailf.dp.AuthorizationResult ACCEPT;
```

The access is allowed. This is a "final verdict", analogous to a
 "full match" when the AAA rules are used.

### CONTINUE <a href="#continue-5e783bfcaf54" id="continue-5e783bfcaf54"></a>

```java
public static final com.tailf.dp.AuthorizationResult CONTINUE;
```

The access is allowed "so far". I.e. access to sub-elements is not
 necessarily allowed. This result is mainly useful when
 a checkCommandAccess() callback is called with operation == READ or
 a checkDataAccess() callback is called with how == INTERMEDIATE.

### DEFAULT <a href="#default-260e1d6ccdf3" id="default-260e1d6ccdf3"></a>

```java
public static final com.tailf.dp.AuthorizationResult DEFAULT;
```

The request should be handled according to the rules configured in
 the AAA data model.

### REJECT <a href="#reject-0ae9cb4d8a71" id="reject-0ae9cb4d8a71"></a>

```java
public static final com.tailf.dp.AuthorizationResult REJECT;
```

The access is denied.


## Methods

### getType(int) <a href="#gettype-ea5f2e669127" id="gettype-ea5f2e669127"></a>

```java
public static com.tailf.dp.AuthorizationResult getType(int l)
```

Types: [AuthorizationResult](AuthorizationResult.md#authorizationresult-118ce0a72969)

Get a DpAuthorizationResult for given int value or
 null if the int value does not represent a enum.

**Parameters**

- `int l` - int value for this enum

**Returns:** AuthorizationResult for this int value

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

Get the int value representation of this authorization result

**Returns:** int value

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.dp.AuthorizationResult valueOf(String name)
```

Types: [AuthorizationResult](AuthorizationResult.md#authorizationresult-118ce0a72969)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.dp.AuthorizationResult[] values()
```

Types: [AuthorizationResult](AuthorizationResult.md#authorizationresult-118ce0a72969)
