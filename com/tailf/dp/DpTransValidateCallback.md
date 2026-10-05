# DpTransValidateCallback <a href="#dptransvalidatecallback-377cc1867a16" id="dptransvalidatecallback-377cc1867a16"></a>

```java
public interface com.tailf.dp.DpTransValidateCallback
```

This interface is used for the user validation callbacks.

 This library also support the registration of callbacks on validation points
 in the YANG model. A validation point is a point in the XML tree where
 ConfD/NCS will invoke a Java method to validate the configuration. The
 validation occurs before a transaction is committed.



```
 dp.registerTransValidateCallback( DpTransValidateCallback cb)
```



 This method installs two callback methods. One method that gets called when
 the validation phase starts in a transaction and one when the validation
 phase stops in a transaction. In the init() callback we can use the MAAPI api
 to attach to the running transaction, this way we can later on, freely
 traverse the XML data tree and read data. The data we will be reading through
 MAAPI will be read from the shadow storage containing the not-yet-committed
 data.

 Similar to the init() callback for data providers, validators get invoked in
 an init() method. It usually makes sense to attach a Maapi socket there.



```
 TransValidateCallback(callType = TransValidateCBType.INIT)
 public void init(DpTrans trans) {
     Maapi.attach(maapi_socket, mtest__ns, trans.uinfo.usid);
 }
```



 We must also install an actual validation function for each validation point
 which is defined in the YANG model.

**See also:** [`DpValpointCallback`](DpValpointCallback.md#dpvalpointcallback-ee36356695e1), [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#registerannotatedcallbacks-ffaebadbfc42)

## Members

**Methods**:

- [init\(DpTrans\)](#init-16fe8657859c)
- [stop\(DpTrans\)](#stop-1dfe2eb96fb9)

## Methods

### init(DpTrans) <a href="#init-16fe8657859c" id="init-16fe8657859c"></a>

```java
public abstract void init(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`

### stop(DpTrans) <a href="#stop-1dfe2eb96fb9" id="stop-1dfe2eb96fb9"></a>

```java
public abstract void stop(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
