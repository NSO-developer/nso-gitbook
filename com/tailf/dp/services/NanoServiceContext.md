<a id="cls-NanoServiceContext"></a>
# NanoServiceContext

```java
public interface com.tailf.dp.services.NanoServiceContext
    extends com.tailf.dp.services.ServiceContext
```

Types: [ServiceContext](ServiceContext.md#cls-ServiceContext)

The Nano service context object.
 Contains all methods same as the ServiceContext as well as some necessary
 for Nano Services.

## Members

**Methods**:

- [decodeComponentProperties()](#m-decodecomponentproperties-92dc7d27cfae)
- [getComponentName()](#m-getcomponentname-7c7a8acb1be7)
- [getComponentType()](#m-getcomponenttype-8cb31666621f)
- [getNedIdByDeviceName(String)](ServiceContext.md#m-getnedidbydevicename-11861342f251) from ServiceContext
- [getRootNode()](ServiceContext.md#m-getrootnode-eed9b3c70129) from ServiceContext
- [getServiceNode()](ServiceContext.md#m-getservicenode-ffc6dd44e182) from ServiceContext
- [getState()](#m-getstate-6661a5722798)
- [getStateNode()](#m-getstatenode-69968ad036f3)
- [setFailed()](#m-setfailed-87e27ea56b52)
- [setNotReached()](#m-setnotreached-82612c28e78a)
- [setReached()](#m-setreached-d006785646d0)
- [setTimeout(int)](ServiceContext.md#m-settimeout-cbe758ecb5d8) from ServiceContext

## Methods

<a id="m-decodecomponentproperties-92dc7d27cfae"></a>
### decodeComponentProperties()

```java
public abstract java.util.Properties decodeComponentProperties()
```

<a id="m-getcomponentname-7c7a8acb1be7"></a>
### getComponentName()

```java
public abstract String getComponentName()
```

<a id="m-getcomponenttype-8cb31666621f"></a>
### getComponentType()

```java
public abstract String getComponentType()
```

<a id="m-getstate-6661a5722798"></a>
### getState()

```java
public abstract String getState()
```

<a id="m-getstatenode-69968ad036f3"></a>
### getStateNode()

```java
public abstract com.tailf.navu.NavuNode getStateNode() throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [ConfException](../../conf/ConfException.md#cls-ConfException)

<a id="m-setfailed-87e27ea56b52"></a>
### setFailed()

```java
public abstract void setFailed() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

<a id="m-setnotreached-82612c28e78a"></a>
### setNotReached()

```java
public abstract void setNotReached() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

<a id="m-setreached-d006785646d0"></a>
### setReached()

```java
public abstract void setReached() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)
