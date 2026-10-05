# EventCallbackProxy <a href="#cls-EventCallbackProxy" id="cls-EventCallbackProxy"></a>

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

- [EventCallbackProxy(Object, String, String)](#m-EventCallbackProxy-235200ec6bf0)

**Methods**:

- [addActionCapability(EventCBType)](#m-addActionCapability-471364e7872b)
- [addActionMethod(String, Method)](#m-addActionMethod-cf3e43a67fd9)
- [getBackupObject()](#m-getBackupObject-a6fb23c24524)
- [getDeviceName()](#m-getDeviceName-95c72ec0cf27)
- [getEventCallbackProxys(Object)](#m-getEventCallbackProxys-76f551eae7e4)
- [getSubscriptionName()](#m-getSubscriptionName-b6fdef58df3d)
- [notifReceived(NavuContainer)](#m-notifReceived-df06be623526)

## Constructors

### EventCallbackProxy(Object, String, String) <a href="#m-EventCallbackProxy-235200ec6bf0" id="m-EventCallbackProxy-235200ec6bf0"></a>

```java
public EventCallbackProxy(Object backupObject, String deviceName, String subscriptionName)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String deviceName`
- `String subscriptionName`


## Methods

### addActionCapability(EventCBType) <a href="#m-addActionCapability-471364e7872b" id="m-addActionCapability-471364e7872b"></a>

```java
public void addActionCapability(com.tailf.ncs.proto.EventCBType eventCBType)
```

Types: [EventCBType](../proto/EventCBType.md#cls-EventCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.ncs.proto.EventCBType eventCBType` - action type

### addActionMethod(String, Method) <a href="#m-addActionMethod-cf3e43a67fd9" id="m-addActionMethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### getBackupObject() <a href="#m-getBackupObject-a6fb23c24524" id="m-getBackupObject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getDeviceName() <a href="#m-getDeviceName-95c72ec0cf27" id="m-getDeviceName-95c72ec0cf27"></a>

```java
public String getDeviceName()
```

Retrieve the callback deviceName

**Returns:** deviceName string

### getEventCallbackProxys(Object) <a href="#m-getEventCallbackProxys-76f551eae7e4" id="m-getEventCallbackProxys-76f551eae7e4"></a>

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

### getSubscriptionName() <a href="#m-getSubscriptionName-b6fdef58df3d" id="m-getSubscriptionName-b6fdef58df3d"></a>

```java
public String getSubscriptionName()
```

Retrieve the callback deviceName

**Returns:** deviceName string

### notifReceived(NavuContainer) <a href="#m-notifReceived-df06be623526" id="m-notifReceived-df06be623526"></a>

```java
public void notifReceived(com.tailf.navu.NavuContainer event) throws com.tailf.ncs.NcsException
```

Types: [NavuContainer](../../navu/NavuContainer.md#cls-NavuContainer), [NcsException](../NcsException.md#cls-NcsException)

**Parameters**

- `com.tailf.navu.NavuContainer event`
