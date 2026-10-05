<a id="cls-EventCallbackProxy"></a>
# EventCallbackProxy

```java
public class com.tailf.ncs.annotations.EventCallbackProxy
    implements com.tailf.ncs.NavuEventCallback
```

Types: [NavuEventCallback](../NavuEventCallback.md#cls-NavuEventCallback)

Callback proxy for annotated NavuEventCallback methods This class is used
 internally be the NavuEventHandler.registerAnnotatedCallbacks to be able to
 invoke (by reflection) the annotated callback method

## Members

**Constructors**:

- [EventCallbackProxy(Object, String, String)](#m-eventcallbackproxy-235200ec6bf0)

**Methods**:

- [addActionCapability(EventCBType)](#m-addactioncapability-471364e7872b)
- [addActionMethod(String, Method)](#m-addactionmethod-cf3e43a67fd9)
- [getBackupObject()](#m-getbackupobject-a6fb23c24524)
- [getDeviceName()](#m-getdevicename-95c72ec0cf27)
- [getEventCallbackProxys(Object)](#m-geteventcallbackproxys-76f551eae7e4)
- [getSubscriptionName()](#m-getsubscriptionname-b6fdef58df3d)
- [notifReceived(NavuContainer)](#m-notifreceived-df06be623526)

## Constructors

<a id="m-eventcallbackproxy-235200ec6bf0"></a>
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

<a id="m-addactioncapability-471364e7872b"></a>
### addActionCapability(EventCBType)

```java
public void addActionCapability(com.tailf.ncs.proto.EventCBType eventCBType)
```

Types: [EventCBType](../proto/EventCBType.md#cls-EventCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.ncs.proto.EventCBType eventCBType` - action type

<a id="m-addactionmethod-cf3e43a67fd9"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="m-getbackupobject-a6fb23c24524"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="m-getdevicename-95c72ec0cf27"></a>
### getDeviceName()

```java
public String getDeviceName()
```

Retrieve the callback deviceName

**Returns:** deviceName string

<a id="m-geteventcallbackproxys-76f551eae7e4"></a>
### getEventCallbackProxys(Object)

```java
public static com.tailf.ncs.annotations.EventCallbackProxy[] getEventCallbackProxys(
    Object obj
)
    throws com.tailf.ncs.NcsException
```

Types: [EventCallbackProxy](EventCallbackProxy.md#cls-EventCallbackProxy), [NcsException](../NcsException.md#cls-NcsException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of EventCallbackProxy

**Throws**

- `NcsException`

<a id="m-getsubscriptionname-b6fdef58df3d"></a>
### getSubscriptionName()

```java
public String getSubscriptionName()
```

Retrieve the callback deviceName

**Returns:** deviceName string

<a id="m-notifreceived-df06be623526"></a>
### notifReceived(NavuContainer)

```java
public void notifReceived(com.tailf.navu.NavuContainer event) throws com.tailf.ncs.NcsException
```

Types: [NavuContainer](../../navu/NavuContainer.md#cls-NavuContainer), [NcsException](../NcsException.md#cls-NcsException)

**Parameters**

- `com.tailf.navu.NavuContainer event`
