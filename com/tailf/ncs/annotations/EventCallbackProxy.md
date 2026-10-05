# EventCallbackProxy <a href="#eventcallbackproxy-638c43961f07" id="eventcallbackproxy-638c43961f07"></a>

```java
public class com.tailf.ncs.annotations.EventCallbackProxy
    implements com.tailf.ncs.NavuEventCallback
```

Types: [NavuEventCallback](../NavuEventCallback.md#navueventcallback-f83ce6fd0d42)

Callback proxy for annotated NavuEventCallback methods This class is used
 internally be the NavuEventHandler.registerAnnotatedCallbacks to be able to
 invoke (by reflection) the annotated callback method

## Members

**Constructors**:

- [EventCallbackProxy(Object, String, String)](#eventcallbackproxy-235200ec6bf0)

**Methods**:

- [addActionCapability(EventCBType)](#addactioncapability-471364e7872b)
- [addActionMethod(String, Method)](#addactionmethod-cf3e43a67fd9)
- [getBackupObject()](#getbackupobject-a6fb23c24524)
- [getDeviceName()](#getdevicename-95c72ec0cf27)
- [getEventCallbackProxys(Object)](#geteventcallbackproxys-76f551eae7e4)
- [getSubscriptionName()](#getsubscriptionname-b6fdef58df3d)
- [notifReceived(NavuContainer)](#notifreceived-df06be623526)

## Constructors

### EventCallbackProxy(Object, String, String) <a href="#eventcallbackproxy-235200ec6bf0" id="eventcallbackproxy-235200ec6bf0"></a>

```java
public EventCallbackProxy(Object backupObject, String deviceName, String subscriptionName)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String deviceName`
- `String subscriptionName`


## Methods

### addActionCapability(EventCBType) <a href="#addactioncapability-471364e7872b" id="addactioncapability-471364e7872b"></a>

```java
public void addActionCapability(com.tailf.ncs.proto.EventCBType eventCBType)
```

Types: [EventCBType](../proto/EventCBType.md#eventcbtype-2b91d6aed05c)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.ncs.proto.EventCBType eventCBType` - action type

### addActionMethod(String, Method) <a href="#addactionmethod-cf3e43a67fd9" id="addactionmethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### getBackupObject() <a href="#getbackupobject-a6fb23c24524" id="getbackupobject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getDeviceName() <a href="#getdevicename-95c72ec0cf27" id="getdevicename-95c72ec0cf27"></a>

```java
public String getDeviceName()
```

Retrieve the callback deviceName

**Returns:** deviceName string

### getEventCallbackProxys(Object) <a href="#geteventcallbackproxys-76f551eae7e4" id="geteventcallbackproxys-76f551eae7e4"></a>

```java
public static com.tailf.ncs.annotations.EventCallbackProxy[] getEventCallbackProxys(
    Object obj
)
    throws com.tailf.ncs.NcsException
```

Types: [EventCallbackProxy](EventCallbackProxy.md#eventcallbackproxy-638c43961f07), [NcsException](../NcsException.md#ncsexception-d2b40ca98ea5)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of EventCallbackProxy

**Throws**

- `NcsException`

### getSubscriptionName() <a href="#getsubscriptionname-b6fdef58df3d" id="getsubscriptionname-b6fdef58df3d"></a>

```java
public String getSubscriptionName()
```

Retrieve the callback deviceName

**Returns:** deviceName string

### notifReceived(NavuContainer) <a href="#notifreceived-df06be623526" id="notifreceived-df06be623526"></a>

```java
public void notifReceived(com.tailf.navu.NavuContainer event) throws com.tailf.ncs.NcsException
```

Types: [NavuContainer](../../navu/NavuContainer.md#navucontainer-8e321756755f), [NcsException](../NcsException.md#ncsexception-d2b40ca98ea5)

**Parameters**

- `com.tailf.navu.NavuContainer event`
