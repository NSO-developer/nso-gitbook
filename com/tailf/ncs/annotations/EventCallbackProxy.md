<a id="s-EventCallbackProxy"></a>
# EventCallbackProxy

```java
public class com.tailf.ncs.annotations.EventCallbackProxy
    implements com.tailf.ncs.NavuEventCallback
```

Types: [NavuEventCallback](../NavuEventCallback.md#s-NavuEventCallback)

Callback proxy for annotated NavuEventCallback methods This class is used
 internally be the NavuEventHandler.registerAnnotatedCallbacks to be able to
 invoke (by reflection) the annotated callback method

## Members

**Constructors**:

- [EventCallbackProxy(Object, String, String)](#s-EventCallbackProxy-1)

**Methods**:

- [addActionCapability(EventCBType)](#s-addActionCapability)
- [addActionMethod(String, Method)](#s-addActionMethod)
- [getBackupObject()](#s-getBackupObject)
- [getDeviceName()](#s-getDeviceName)
- [getEventCallbackProxys(Object)](#s-getEventCallbackProxys)
- [getSubscriptionName()](#s-getSubscriptionName)
- [notifReceived(NavuContainer)](#s-notifReceived)

## Constructors

<a id="s-EventCallbackProxy-1"></a>
### EventCallbackProxy(Object, String, String)

```java
public EventCallbackProxy(Object backupObject, String deviceName, String subscriptionName)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String deviceName`
- `String subscriptionName`


## Methods

<a id="s-addActionCapability"></a>
### addActionCapability(EventCBType)

```java
public void addActionCapability(com.tailf.ncs.proto.EventCBType eventCBType)
```

Types: [EventCBType](../proto/EventCBType.md#s-EventCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.ncs.proto.EventCBType eventCBType` - action type

<a id="s-addActionMethod"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="s-getBackupObject"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="s-getDeviceName"></a>
### getDeviceName()

```java
public String getDeviceName()
```

Retrieve the callback deviceName

**Returns:** deviceName string

<a id="s-getEventCallbackProxys"></a>
### getEventCallbackProxys(Object)

```java
public static com.tailf.ncs.annotations.EventCallbackProxy[] getEventCallbackProxys(
    Object obj
)
    throws com.tailf.ncs.NcsException
```

Types: [EventCallbackProxy](EventCallbackProxy.md#s-EventCallbackProxy), [NcsException](../NcsException.md#s-NcsException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of EventCallbackProxy

**Throws**

- `NcsException`

<a id="s-getSubscriptionName"></a>
### getSubscriptionName()

```java
public String getSubscriptionName()
```

Retrieve the callback deviceName

**Returns:** deviceName string

<a id="s-notifReceived"></a>
### notifReceived(NavuContainer)

```java
public void notifReceived(com.tailf.navu.NavuContainer event) throws com.tailf.ncs.NcsException
```

Types: [NavuContainer](../../navu/NavuContainer.md#s-NavuContainer), [NcsException](../NcsException.md#s-NcsException)

**Parameters**

- `com.tailf.navu.NavuContainer event`
