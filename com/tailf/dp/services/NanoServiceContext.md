<a id="s-NanoServiceContext"></a>
# NanoServiceContext

```java
public interface com.tailf.dp.services.NanoServiceContext
    extends com.tailf.dp.services.ServiceContext
```

Types: [ServiceContext](ServiceContext.md#s-ServiceContext)

The Nano service context object.
 Contains all methods same as the ServiceContext as well as some necessary
 for Nano Services.

## Members

**Methods**:

- [decodeComponentProperties()](#s-decodeComponentProperties)
- [getComponentName()](#s-getComponentName)
- [getComponentType()](#s-getComponentType)
- [getNedIdByDeviceName(String)](ServiceContext.md#s-getNedIdByDeviceName) from ServiceContext
- [getRootNode()](ServiceContext.md#s-getRootNode) from ServiceContext
- [getServiceNode()](ServiceContext.md#s-getServiceNode) from ServiceContext
- [getState()](#s-getState)
- [getStateNode()](#s-getStateNode)
- [setFailed()](#s-setFailed)
- [setNotReached()](#s-setNotReached)
- [setReached()](#s-setReached)
- [setTimeout(int)](ServiceContext.md#s-setTimeout) from ServiceContext

## Methods

<a id="s-decodeComponentProperties"></a>
### decodeComponentProperties()

```java
public abstract java.util.Properties decodeComponentProperties()
```

<a id="s-getComponentName"></a>
### getComponentName()

```java
public abstract String getComponentName()
```

<a id="s-getComponentType"></a>
### getComponentType()

```java
public abstract String getComponentType()
```

<a id="s-getState"></a>
### getState()

```java
public abstract String getState()
```

<a id="s-getStateNode"></a>
### getStateNode()

```java
public abstract com.tailf.navu.NavuNode getStateNode() throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#s-NavuNode), [ConfException](../../conf/ConfException.md#s-ConfException)

<a id="s-setFailed"></a>
### setFailed()

```java
public abstract void setFailed() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

<a id="s-setNotReached"></a>
### setNotReached()

```java
public abstract void setNotReached() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

<a id="s-setReached"></a>
### setReached()

```java
public abstract void setReached() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)
