<a id="s-DpSnmpInformResponseCallback"></a>
# DpSnmpInformResponseCallback

```java
public interface com.tailf.dp.DpSnmpInformResponseCallback
```

This interface is used for the SNMP notifier callbacks.

**Since:** 3.2.0

**See also:** [`Dp#createSnmpNotifier(String, String, Object)`](Dp.md#s-createSnmpNotifier-1)

## Members

**Methods**:

- [id()](#s-id)
- [mask()](#s-mask)
- [result(Integer, ConfETuple, Boolean)](#s-result)
- [targets(Integer, ConfETuple[])](#s-targets)

## Methods

<a id="s-id"></a>
### id()

```java
public abstract String id()
```

The id of the SNMP inform callback.

<a id="s-mask"></a>
### mask()

```java
public abstract int mask()
```

<a id="s-result"></a>
### result(Integer, ConfETuple, Boolean)

```java
public abstract void result(
    Integer ref,
    com.tailf.proto.ConfETuple target,
    Boolean gotResponse
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfETuple](../proto/ConfETuple.md#s-ConfETuple), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This callback provides the application with possibility to to take
 actions based on the result of an inform request for a specific receiver.

**Parameters**

- `Integer ref` - A reference assigned by the caller of the SNMP inform request
            see [`DpSnmpNotifier`](DpSnmpNotifier.md#s-DpSnmpNotifier)
- `com.tailf.proto.ConfETuple target` - the receiver returning the result.
- `Boolean gotResponse` - if we got a response or not from the target.

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-targets"></a>
### targets(Integer, ConfETuple[])

```java
public abstract void targets(
    Integer ref,
    com.tailf.proto.ConfETuple[] targets
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfETuple](../proto/ConfETuple.md#s-ConfETuple), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This callback provides the application with possibility to to take
 actions based on the intended targets of an inform request.

**Parameters**

- `Integer ref` - A reference assigned by the
- `com.tailf.proto.ConfETuple[] targets` - the intended receivers of the inform request.

**Throws**

- `DpCallbackException` - Callback method failed.
