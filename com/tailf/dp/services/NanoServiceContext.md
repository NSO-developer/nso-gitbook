# NanoServiceContext <a href="#cls-NanoServiceContext" id="cls-NanoServiceContext"></a>

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

- [decodeComponentProperties()](#m-decodeComponentProperties-92dc7d27cfae)
- [getComponentName()](#m-getComponentName-7c7a8acb1be7)
- [getComponentType()](#m-getComponentType-8cb31666621f)
- [getNedIdByDeviceName(String)](ServiceContext.md#m-getNedIdByDeviceName-11861342f251) from ServiceContext
- [getRootNode()](ServiceContext.md#m-getRootNode-eed9b3c70129) from ServiceContext
- [getServiceNode()](ServiceContext.md#m-getServiceNode-ffc6dd44e182) from ServiceContext
- [getState()](#m-getState-6661a5722798)
- [getStateNode()](#m-getStateNode-69968ad036f3)
- [setFailed()](#m-setFailed-87e27ea56b52)
- [setNotReached()](#m-setNotReached-82612c28e78a)
- [setReached()](#m-setReached-d006785646d0)
- [setTimeout(int)](ServiceContext.md#m-setTimeout-cbe758ecb5d8) from ServiceContext

## Methods

### decodeComponentProperties() <a href="#m-decodeComponentProperties-92dc7d27cfae" id="m-decodeComponentProperties-92dc7d27cfae"></a>

```java
public abstract java.util.Properties decodeComponentProperties()
```

### getComponentName() <a href="#m-getComponentName-7c7a8acb1be7" id="m-getComponentName-7c7a8acb1be7"></a>

```java
public abstract String getComponentName()
```

### getComponentType() <a href="#m-getComponentType-8cb31666621f" id="m-getComponentType-8cb31666621f"></a>

```java
public abstract String getComponentType()
```

### getState() <a href="#m-getState-6661a5722798" id="m-getState-6661a5722798"></a>

```java
public abstract String getState()
```

### getStateNode() <a href="#m-getStateNode-69968ad036f3" id="m-getStateNode-69968ad036f3"></a>

```java
public abstract com.tailf.navu.NavuNode getStateNode() throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [ConfException](../../conf/ConfException.md#cls-ConfException)

### setFailed() <a href="#m-setFailed-87e27ea56b52" id="m-setFailed-87e27ea56b52"></a>

```java
public abstract void setFailed() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

### setNotReached() <a href="#m-setNotReached-82612c28e78a" id="m-setNotReached-82612c28e78a"></a>

```java
public abstract void setNotReached() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

### setReached() <a href="#m-setReached-d006785646d0" id="m-setReached-d006785646d0"></a>

```java
public abstract void setReached() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)
