# DpValpointCallback <a href="#dpvalpointcallback-ee36356695e1" id="dpvalpointcallback-ee36356695e1"></a>

```java
public interface com.tailf.dp.DpValpointCallback
```

This interface is used for the user valpoint callbacks.

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#registerannotatedcallbacks-ffaebadbfc42)

## Members

**Methods**:

- [validate(DpTrans, ConfObject[], ConfValue)](#validate-1a546d06dca5)
- [valpoint()](#valpoint-a064c4954648)

## Methods

### validate(DpTrans, ConfObject[], ConfValue) <a href="#validate-1a546d06dca5" id="validate-1a546d06dca5"></a>

```java
public abstract void validate(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue newval
)
    throws com.tailf.dp.DpCallbackException, com.tailf.dp.DpCallbackWarningException
```

Types: [DpTrans](DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb), [DpCallbackWarningException](DpCallbackWarningException.md#dpcallbackwarningexception-82a350729169)

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

### valpoint() <a href="#valpoint-a064c4954648" id="valpoint-a064c4954648"></a>

```java
public abstract String valpoint()
```

The name of the valpoint.
