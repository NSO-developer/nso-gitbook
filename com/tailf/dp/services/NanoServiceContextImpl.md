<a id="s-NanoServiceContextImpl"></a>
# NanoServiceContextImpl

```java
public class com.tailf.dp.services.NanoServiceContextImpl
    extends com.tailf.dp.services.ServiceContextImpl
    implements com.tailf.dp.services.NanoServiceContext
```

Types: [ServiceContextImpl](ServiceContextImpl.md#s-ServiceContextImpl), [NanoServiceContext](NanoServiceContext.md#s-NanoServiceContext)

## Members

**Constructors**:

- [NanoServiceContextImpl()](#s-NanoServiceContextImpl-1)
- [NanoServiceContextImpl(DpTrans, Dp, ConfEObject, ServiceOperationType)](#s-NanoServiceContextImpl-2)

**Fields**:

- [attachedServiceMaapi](ServiceContextImpl.md#s-attachedServiceMaapi) from ServiceContextImpl
- [componentKey](#s-componentKey)
- [currentDp](ServiceContextImpl.md#s-currentDp) from ServiceContextImpl
- [currentDpTrans](ServiceContextImpl.md#s-currentDpTrans) from ServiceContextImpl
- [currentPath](ServiceContextImpl.md#s-currentPath) from ServiceContextImpl
- [eComponentProperties](#s-eComponentProperties)
- [eOpaque](ServiceContextImpl.md#s-eOpaque) from ServiceContextImpl
- [nbase](ServiceContextImpl.md#s-nbase) from ServiceContextImpl
- [nContext](ServiceContextImpl.md#s-nContext) from ServiceContextImpl
- [ncsHash](ServiceContextImpl.md#s-ncsHash) from ServiceContextImpl
- [operation](ServiceContextImpl.md#s-operation) from ServiceContextImpl
- [stateKey](#s-stateKey)
- [statePath](#s-statePath)
- [transInTrans](ServiceContextImpl.md#s-transInTrans) from ServiceContextImpl

**Methods**:

- [decodeComponentProperties()](#s-decodeComponentProperties)
- [decodeOpaque()](ServiceContextImpl.md#s-decodeOpaque) from ServiceContextImpl
- [decodeProperties(ConfEObject)](ServiceContextImpl.md#s-decodeProperties) from ServiceContextImpl
- [detachServiceTrans()](ServiceContextImpl.md#s-detachServiceTrans) from ServiceContextImpl
- [encodeOpaque(Properties)](ServiceContextImpl.md#s-encodeOpaque) from ServiceContextImpl
- [getAttachedServiceMaapi()](ServiceContextImpl.md#s-getAttachedServiceMaapi) from ServiceContextImpl
- [getComponentName()](#s-getComponentName)
- [getComponentType()](#s-getComponentType)
- [getCurrentDpTrans()](ServiceContextImpl.md#s-getCurrentDpTrans) from ServiceContextImpl
- [getNedIdByDeviceName(String)](ServiceContextImpl.md#s-getNedIdByDeviceName) from ServiceContextImpl
- [getOperation()](ServiceContextImpl.md#s-getOperation) from ServiceContextImpl
- [getRootNode()](ServiceContextImpl.md#s-getRootNode) from ServiceContextImpl
- [getServiceNode()](#s-getServiceNode)
- [getServicePath()](ServiceContextImpl.md#s-getServicePath) from ServiceContextImpl
- [getState()](#s-getState)
- [getStateNode()](#s-getStateNode)
- [setFailed()](#s-setFailed)
- [setNotReached()](#s-setNotReached)
- [setReached()](#s-setReached)
- [setTimeout(int)](ServiceContextImpl.md#s-setTimeout) from ServiceContextImpl

## Constructors

<a id="s-NanoServiceContextImpl-1"></a>
### NanoServiceContextImpl()

```java
protected NanoServiceContextImpl()
```

Internal constructor

<a id="s-NanoServiceContextImpl-2"></a>
### NanoServiceContextImpl(DpTrans, Dp, ConfEObject, ServiceOperationType)

```java
public NanoServiceContextImpl(
    com.tailf.dp.DpTrans dpTrans,
    com.tailf.dp.Dp dp,
    com.tailf.proto.ConfEObject eObject,
    com.tailf.dp.services.ServiceOperationType operation
)
    throws com.tailf.conf.ConfException, com.tailf.proto.ConfERangeException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [Dp](../Dp.md#s-Dp), [ConfEObject](../../proto/ConfEObject.md#s-ConfEObject), [ServiceOperationType](ServiceOperationType.md#s-ServiceOperationType), [ConfException](../../conf/ConfException.md#s-ConfException), [ConfERangeException](../../proto/ConfERangeException.md#s-ConfERangeException)

Internally called constructor to create a ServiceContext

**Parameters**

- `com.tailf.dp.DpTrans dpTrans` - The current dp transaction
- `com.tailf.dp.Dp dp` - The current dp daemon
- `com.tailf.proto.ConfEObject eObject` - Erlang tuple received over the Dp protocol
- `com.tailf.dp.services.ServiceOperationType operation`

**Throws**

- `ConfException`
- `ConfERangeException`


## Fields

<a id="s-componentKey"></a>
### componentKey

```java
protected com.tailf.conf.ConfKey componentKey = null;
```

Types: [ConfKey](../../conf/ConfKey.md#s-ConfKey)

<a id="s-eComponentProperties"></a>
### eComponentProperties

```java
protected com.tailf.proto.ConfEObject eComponentProperties = null;
```

Types: [ConfEObject](../../proto/ConfEObject.md#s-ConfEObject)

<a id="s-stateKey"></a>
### stateKey

```java
protected com.tailf.conf.ConfKey stateKey = null;
```

Types: [ConfKey](../../conf/ConfKey.md#s-ConfKey)

<a id="s-statePath"></a>
### statePath

```java
protected com.tailf.conf.ConfPath statePath = null;
```

Types: [ConfPath](../../conf/ConfPath.md#s-ConfPath)


## Methods

<a id="s-decodeComponentProperties"></a>
### decodeComponentProperties()

```java
public java.util.Properties decodeComponentProperties()
```

<a id="s-getComponentName"></a>
### getComponentName()

```java
public String getComponentName()
```

<a id="s-getComponentType"></a>
### getComponentType()

```java
public String getComponentType()
```

<a id="s-getServiceNode"></a>
### getServiceNode()

```java
public com.tailf.navu.NavuNode getServiceNode() throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#s-NavuNode), [ConfException](../../conf/ConfException.md#s-ConfException)

<a id="s-getState"></a>
### getState()

```java
public String getState()
```

<a id="s-getStateNode"></a>
### getStateNode()

```java
public com.tailf.navu.NavuNode getStateNode() throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#s-NavuNode), [ConfException](../../conf/ConfException.md#s-ConfException)

<a id="s-setFailed"></a>
### setFailed()

```java
public void setFailed() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

<a id="s-setNotReached"></a>
### setNotReached()

```java
public void setNotReached() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

<a id="s-setReached"></a>
### setReached()

```java
public void setReached() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)
