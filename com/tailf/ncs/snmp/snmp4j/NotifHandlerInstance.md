# NotifHandlerInstance <a href="#cls-NotifHandlerInstance" id="cls-NotifHandlerInstance"></a>

```java
public class com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance
```

Helper class which holds handler and if applicable
 the corresponding opaque object for a registered handler

## Members

**Constructors**:

- [NotifHandlerInstance(NotificationHandler, Object)](#m-NotifHandlerInstance-b39819cfd174)

**Methods**:

- [getOpaque()](#m-getOpaque-92e4945ec92d)
- [getSnmpNotificationHandler()](#m-getSnmpNotificationHandler-b29e570de0bc)

## Constructors

### NotifHandlerInstance(NotificationHandler, Object) <a href="#m-NotifHandlerInstance-b39819cfd174" id="m-NotifHandlerInstance-b39819cfd174"></a>

```java
public NotifHandlerInstance(com.tailf.ncs.snmp.snmp4j.NotificationHandler responder, Object opaque)
```

Types: [NotificationHandler](NotificationHandler.md#cls-NotificationHandler)

Default constructor

**Parameters**

- `com.tailf.ncs.snmp.snmp4j.NotificationHandler responder` - a registered SnmpNotificationHandler
- `Object opaque` - object passed to the handler at call
               (or null if not applicable)


## Methods

### getOpaque() <a href="#m-getOpaque-92e4945ec92d" id="m-getOpaque-92e4945ec92d"></a>

```java
public Object getOpaque()
```

Retrieves the registered opaque object

**Returns:** the registered opaque object
 (or null if not applicable)

### getSnmpNotificationHandler() <a href="#m-getSnmpNotificationHandler-b29e570de0bc" id="m-getSnmpNotificationHandler-b29e570de0bc"></a>

```java
public com.tailf.ncs.snmp.snmp4j.NotificationHandler getSnmpNotificationHandler()
```

Types: [NotificationHandler](NotificationHandler.md#cls-NotificationHandler)

Retrieves the registered Snmp notification handler

**Returns:** the SnmpNotificationHandler
