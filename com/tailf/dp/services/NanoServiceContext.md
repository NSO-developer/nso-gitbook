# NanoServiceContext <a href="#nanoservicecontext-10c84a5701dd" id="nanoservicecontext-10c84a5701dd"></a>

```java
public interface com.tailf.dp.services.NanoServiceContext
    extends com.tailf.dp.services.ServiceContext
```

Types: [ServiceContext](ServiceContext.md#servicecontext-f7734df4f22b)

The Nano service context object.
 Contains all methods same as the ServiceContext as well as some necessary
 for Nano Services.

## Members

**Methods**:

- [decodeComponentProperties\(\)](#decodecomponentproperties-92dc7d27cfae)
- [getComponentName\(\)](#getcomponentname-7c7a8acb1be7)
- [getComponentType\(\)](#getcomponenttype-8cb31666621f)
- [getNedIdByDeviceName\(String\)](ServiceContext.md#getnedidbydevicename-11861342f251) from ServiceContext
- [getRootNode\(\)](ServiceContext.md#getrootnode-eed9b3c70129) from ServiceContext
- [getServiceNode\(\)](ServiceContext.md#getservicenode-ffc6dd44e182) from ServiceContext
- [getState\(\)](#getstate-6661a5722798)
- [getStateNode\(\)](#getstatenode-69968ad036f3)
- [setFailed\(\)](#setfailed-87e27ea56b52)
- [setNotReached\(\)](#setnotreached-82612c28e78a)
- [setReached\(\)](#setreached-d006785646d0)
- [setTimeout\(int\)](ServiceContext.md#settimeout-cbe758ecb5d8) from ServiceContext

## Methods

### decodeComponentProperties() <a href="#decodecomponentproperties-92dc7d27cfae" id="decodecomponentproperties-92dc7d27cfae"></a>

```java
public abstract java.util.Properties decodeComponentProperties()
```

### getComponentName() <a href="#getcomponentname-7c7a8acb1be7" id="getcomponentname-7c7a8acb1be7"></a>

```java
public abstract String getComponentName()
```

### getComponentType() <a href="#getcomponenttype-8cb31666621f" id="getcomponenttype-8cb31666621f"></a>

```java
public abstract String getComponentType()
```

### getState() <a href="#getstate-6661a5722798" id="getstate-6661a5722798"></a>

```java
public abstract String getState()
```

### getStateNode() <a href="#getstatenode-69968ad036f3" id="getstatenode-69968ad036f3"></a>

```java
public abstract com.tailf.navu.NavuNode getStateNode() throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

### setFailed() <a href="#setfailed-87e27ea56b52" id="setfailed-87e27ea56b52"></a>

```java
public abstract void setFailed() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

### setNotReached() <a href="#setnotreached-82612c28e78a" id="setnotreached-82612c28e78a"></a>

```java
public abstract void setNotReached() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

### setReached() <a href="#setreached-d006785646d0" id="setreached-d006785646d0"></a>

```java
public abstract void setReached() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)
