<a id="s-NotifHandlerInstance"></a>
# NotifHandlerInstance

```java
public class com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance
```

Helper class which holds handler and if applicable
 the corresponding opaque object for a registered handler

## Members

**Constructors**:

- [NotifHandlerInstance(NotificationHandler, Object)](#s-NotifHandlerInstance-1)

**Methods**:

- [getOpaque()](#s-getOpaque)
- [getSnmpNotificationHandler()](#s-getSnmpNotificationHandler)

## Constructors

<a id="s-NotifHandlerInstance-1"></a>
### NotifHandlerInstance(NotificationHandler, Object)

```java
public NotifHandlerInstance(com.tailf.ncs.snmp.snmp4j.NotificationHandler responder, Object opaque)
```

Types: [NotificationHandler](NotificationHandler.md#s-NotificationHandler)

Default constructor

**Parameters**

- `com.tailf.ncs.snmp.snmp4j.NotificationHandler responder` - a registered SnmpNotificationHandler
- `Object opaque` - object passed to the handler at call
               (or null if not applicable)


## Methods

<a id="s-getOpaque"></a>
### getOpaque()

```java
public Object getOpaque()
```

Retrieves the registered opaque object

**Returns:** the registered opaque object
 (or null if not applicable)

<a id="s-getSnmpNotificationHandler"></a>
### getSnmpNotificationHandler()

```java
public com.tailf.ncs.snmp.snmp4j.NotificationHandler getSnmpNotificationHandler()
```

Types: [NotificationHandler](NotificationHandler.md#s-NotificationHandler)

Retrieves the registered Snmp notification handler

**Returns:** the SnmpNotificationHandler
