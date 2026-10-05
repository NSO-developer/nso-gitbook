<a id="cls-DpSnmpInformResponseCallback"></a>
# DpSnmpInformResponseCallback

```java
public interface com.tailf.dp.DpSnmpInformResponseCallback
```

This interface is used for the SNMP notifier callbacks.

**Since:** 3.2.0

**See also:** [`Dp#createSnmpNotifier(String, String, Object)`](Dp.md#m-createsnmpnotifier-89f0d186fc8f)

## Members

**Methods**:

- [id()](#m-id-1352448ec267)
- [mask()](#m-mask-24c2fa29c6af)
- [result(Integer, ConfETuple, Boolean)](#m-result-633f0f760c10)
- [targets(Integer, ConfETuple[])](#m-targets-aaa64a3aa8f3)

## Methods

<a id="m-id-1352448ec267"></a>
### id()

```java
public abstract String id()
```

The id of the SNMP inform callback.

<a id="m-mask-24c2fa29c6af"></a>
### mask()

```java
public abstract int mask()
```

<a id="m-result-633f0f760c10"></a>
### result(Integer, ConfETuple, Boolean)

```java
public abstract void result(
    Integer ref,
    com.tailf.proto.ConfETuple target,
    Boolean gotResponse
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback provides the application with possibility to to take
 actions based on the result of an inform request for a specific receiver.

**Parameters**

- `Integer ref` - A reference assigned by the caller of the SNMP inform request
            see [`DpSnmpNotifier#send(
            String, com.tailf.conf.SnmpVarbind[], Integer)`](DpSnmpNotifier.md#m-send-616c3e8b0825)
- `com.tailf.proto.ConfETuple target` - the receiver returning the result.
- `Boolean gotResponse` - if we got a response or not from the target.

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="m-targets-aaa64a3aa8f3"></a>
### targets(Integer, ConfETuple[])

```java
public abstract void targets(
    Integer ref,
    com.tailf.proto.ConfETuple[] targets
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

This callback provides the application with possibility to to take
 actions based on the intended targets of an inform request.

**Parameters**

- `Integer ref` - A reference assigned by the
- `com.tailf.proto.ConfETuple[] targets` - the intended receivers of the inform request.

**Throws**

- `DpCallbackException` - Callback method failed.
