# NotifHandlerInstance <a href="#notifhandlerinstance-7fa13bf44d0b" id="notifhandlerinstance-7fa13bf44d0b"></a>

```java
public class com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance
```

Helper class which holds handler and if applicable
 the corresponding opaque object for a registered handler

## Members

**Constructors**:

- [NotifHandlerInstance(NotificationHandler, Object)](#notifhandlerinstance-b39819cfd174)

**Methods**:

- [getOpaque()](#getopaque-92e4945ec92d)
- [getSnmpNotificationHandler()](#getsnmpnotificationhandler-b29e570de0bc)

## Constructors

### NotifHandlerInstance(NotificationHandler, Object) <a href="#notifhandlerinstance-b39819cfd174" id="notifhandlerinstance-b39819cfd174"></a>

```java
public NotifHandlerInstance(com.tailf.ncs.snmp.snmp4j.NotificationHandler responder, Object opaque)
```

Types: [NotificationHandler](NotificationHandler.md#notificationhandler-49960afdd747)

Default constructor

**Parameters**

- `com.tailf.ncs.snmp.snmp4j.NotificationHandler responder` - a registered SnmpNotificationHandler
- `Object opaque` - object passed to the handler at call
               (or null if not applicable)


## Methods

### getOpaque() <a href="#getopaque-92e4945ec92d" id="getopaque-92e4945ec92d"></a>

```java
public Object getOpaque()
```

Retrieves the registered opaque object

**Returns:** the registered opaque object
 (or null if not applicable)

### getSnmpNotificationHandler() <a href="#getsnmpnotificationhandler-b29e570de0bc" id="getsnmpnotificationhandler-b29e570de0bc"></a>

```java
public com.tailf.ncs.snmp.snmp4j.NotificationHandler getSnmpNotificationHandler()
```

Types: [NotificationHandler](NotificationHandler.md#notificationhandler-49960afdd747)

Retrieves the registered Snmp notification handler

**Returns:** the SnmpNotificationHandler
