<a id="cls-DpAuthorizationCallback"></a>
# DpAuthorizationCallback

```java
public interface com.tailf.dp.DpAuthorizationCallback
```

We can register two authorization callbacks with ConfD´s AAA subsystem.
 These will be invoked when the northbound agents check that a command
 or a data access is allowed by the AAA access rules. The callbacks can
 partially or completely replace the access checks done within the AAA
 subsystem, and they may accept or reject the access. Typically many
 access checks are done during the processing of commands etc, and using
 these callbacks can thus have a significant performance impact. Unless
 it is a requirement to query an external authorization mechanism, it is
 far better to only configure access rules in the AAA data model (see
 the AAA chapter in the User Guide).

 The callbacks will only be invoked if it is
 registered using Dp.registerAnnotatedCallbacks() and enabled
 via /confdConfig/aaa/authenticationCallback/enabled in confd.conf
 or /ncs-config/aaa/authentication-callback/enabled in ncs.conf respectively.

## Members

**Fields**:

- [M_CHECK_CMD_ACCESS](#m-M_CHECK_CMD_ACCESS)
- [M_CHECK_DATA_ACCESS](#m-M_CHECK_DATA_ACCESS)

**Methods**:

- [checkCommandAccess(DpAuthorizationContext, String[], AuthorizationOperCheck)](#m-checkcommandaccess-db6891a729e3)
- [checkDataAccess(DpAuthorizationContext, ConfObject[], AuthorizationOperCheck, AuthorizationOperCheck)](#m-checkdataaccess-e7c6a7d5a565)
- [commandFilter()](#m-commandfilter-75902bf3c954)
- [dataFilter()](#m-datafilter-5e19142fe25a)
- [mask()](#m-mask-24c2fa29c6af)

## Fields

<a id="m-M_CHECK_CMD_ACCESS"></a>
### M_CHECK_CMD_ACCESS

```java
public static final int M_CHECK_CMD_ACCESS = 1;
```

Mask for the command access authorization callback.

<a id="m-M_CHECK_DATA_ACCESS"></a>
### M_CHECK_DATA_ACCESS

```java
public static final int M_CHECK_DATA_ACCESS = 2;
```

Mask for the data access authorization callback.


## Methods

<a id="m-checkcommandaccess-db6891a729e3"></a>
### checkCommandAccess(DpAuthorizationContext, String[], AuthorizationOperCheck)

```java
public abstract com.tailf.dp.AuthorizationResult checkCommandAccess(
    com.tailf.dp.DpAuthorizationContext context,
    String[] commandTokens,
    com.tailf.dp.AuthorizationOperCheck operation
)
    throws com.tailf.dp.DpCallbackException
```

Types: [AuthorizationResult](AuthorizationResult.md#cls-AuthorizationResult), [DpAuthorizationContext](DpAuthorizationContext.md#cls-DpAuthorizationContext), [AuthorizationOperCheck](AuthorizationOperCheck.md#cls-AuthorizationOperCheck), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback is invoked for command authorization, i.e. it
 corresponds to the rules under /nacm/rule-list in the
 NACM data model. commandTokens is an String array of tokens
 representing the command to be checked, corresponding to
 the command leaf in the cmdrule list. If
 The operation parameter gives the operation, corresponding to
 the ops leaf in the cmdrule list.

**Parameters**

- `com.tailf.dp.DpAuthorizationContext context` - the authorization context
- `String[] commandTokens` - command represented as a string of tokens
- `com.tailf.dp.AuthorizationOperCheck operation` - AuthorizationOperCheck describing the operatopn type

**Returns:** AuthorizationResult the command access result

**Throws**

- `DpCallbackException` - if an error occurs during the callback

<a id="m-checkdataaccess-e7c6a7d5a565"></a>
### checkDataAccess(DpAuthorizationContext, ConfObject[], AuthorizationOperCheck, AuthorizationOperCheck)

```java
public abstract com.tailf.dp.AuthorizationResult checkDataAccess(
    com.tailf.dp.DpAuthorizationContext context,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.dp.AuthorizationOperCheck operation,
    com.tailf.dp.AuthorizationOperCheck how
)
    throws com.tailf.dp.DpCallbackException
```

Types: [AuthorizationResult](AuthorizationResult.md#cls-AuthorizationResult), [DpAuthorizationContext](DpAuthorizationContext.md#cls-DpAuthorizationContext), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [AuthorizationOperCheck](AuthorizationOperCheck.md#cls-AuthorizationOperCheck), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback is invoked for data authorization, i.e. it
 corresponds to the rules under /nacm/rule-list in the
 NACM data model. The keypath parameter gives the data element path
 corresponding to the keypath leaf in the datarule list, and the
 operation parameter gives the operation type. The how parameter
 indicates whether the check is an intermediate or final check.

**Parameters**

- `com.tailf.dp.DpAuthorizationContext context` - the authorization context
- `com.tailf.conf.ConfObject[] kp` - the data element represented by an array of ConfObject
- `com.tailf.dp.AuthorizationOperCheck operation` - AuthorizationOperCheck describing the operation type
- `com.tailf.dp.AuthorizationOperCheck how` - checking state INTERMEDIATE or FINAL

**Returns:** AuthorizationResult the data access result

**Throws**

- `DpCallbackException` - if an error occurs during the callback

<a id="m-commandfilter-75902bf3c954"></a>
### commandFilter()

```java
public abstract java.util.EnumSet<com.tailf.dp.AuthorizationOperCheck> commandFilter()
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#cls-AuthorizationOperCheck)

Thus method can be used to prevent access checks from causing invocation
 of a checkCommandAccess callback even though it is registered.
 If we do not want any filtering this method should not be registered or
 return null. For checkCommandAccess callback values INTERMEDIATE and
 FINAL does not contain any meaning.

**Returns:** EnumSet of AuthorizationOperCheck values

<a id="m-datafilter-5e19142fe25a"></a>
### dataFilter()

```java
public abstract java.util.EnumSet<com.tailf.dp.AuthorizationOperCheck> dataFilter()
```

Types: [AuthorizationOperCheck](AuthorizationOperCheck.md#cls-AuthorizationOperCheck)

Thus method can be used to prevent access checks from causing invocation
 of a checkDataAccess callback even though it is registered.
 If we do not want any filtering this method should not be registered or
 return null.

**Returns:** EnumSet of AuthorizationOperCheck values

<a id="m-mask-24c2fa29c6af"></a>
### mask()

```java
public abstract int mask()
```

Mask of flags for each method that is supported by this callback:


- `#M_CHECK_CMD_ACCESS`
   - `#M_CHECK_DATA_ACCESS`

**Returns:** bitmask indicating which callback methods are supported
