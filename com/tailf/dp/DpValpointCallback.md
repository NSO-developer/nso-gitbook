<a id="s-DpValpointCallback"></a>
# DpValpointCallback

```java
public interface com.tailf.dp.DpValpointCallback
```

This interface is used for the user valpoint callbacks.

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#s-registerAnnotatedCallbacks)

## Members

**Methods**:

- [validate(DpTrans, ConfObject[], ConfValue)](#s-validate)
- [valpoint()](#s-valpoint)

## Methods

<a id="s-validate"></a>
### validate(DpTrans, ConfObject[], ConfValue)

```java
public abstract void validate(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue newval
)
    throws com.tailf.dp.DpCallbackException, com.tailf.dp.DpCallbackWarningException
```

Types: [DpTrans](DpTrans.md#s-DpTrans), [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfValue](../conf/ConfValue.md#s-ConfValue), [DpCallbackException](DpCallbackException.md#s-DpCallbackException), [DpCallbackWarningException](DpCallbackWarningException.md#s-DpCallbackWarningException)

The validate() callback should validate the values and throw a
 `DpCallbackException` if the validation fails. There is also a
 possibility to throw a `DpCallbackWarningException` with
 message set to a string describing the warning. The warnings will get
 propagated to the transaction engine, and depending on where the
 transaction originates, ConfD/NCS may or may not act on the warnings. If
 the transaction originates from the CLI or the Web UI, ConfD/NCS will
 interactively present the user with a choice - whereby the transaction
 can be aborted.

 If the transaction originates from NETCONF - which does not have any
 interactive capabilities, the warnings are ignored. The warnings are
 primarily intended to alert inexperienced users that attempt to make -
 dangerous - configuration changes. There can be multiple warnings from
 multiple validation points in the same transaction.

**Parameters**

- `com.tailf.dp.DpTrans trans` - The transaction
- `com.tailf.conf.ConfObject[] kp` - The keypath
- `com.tailf.conf.ConfValue newval` - The new value to validate

**Throws**

- `DpCallbackException` - If the validation fails
- `DpCallbackWarningException` - If a warning should be propagated to the originator of the
             transaction.

<a id="s-valpoint"></a>
### valpoint()

```java
public abstract String valpoint()
```

The name of the valpoint.
