<a id="cls-NotifHandlerInstance"></a>
# NotifHandlerInstance

```java
public class com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance
```

Helper class which holds handler and if applicable
 the corresponding opaque object for a registered handler

## Members

**Constructors**:

- [NotifHandlerInstance(NotificationHandler, Object)](#m-notifhandlerinstance-b39819cfd174)

**Methods**:

- [getOpaque()](#m-getopaque-92e4945ec92d)
- [getSnmpNotificationHandler()](#m-getsnmpnotificationhandler-b29e570de0bc)

## Constructors

<a id="m-notifhandlerinstance-b39819cfd174"></a>
### NotifHandlerInstance(NotificationHandler, Object)

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

<a id="m-getopaque-92e4945ec92d"></a>
### getOpaque()

```java
public Object getOpaque()
```

Retrieves the registered opaque object

**Returns:** the registered opaque object
 (or null if not applicable)

<a id="m-getsnmpnotificationhandler-b29e570de0bc"></a>
### getSnmpNotificationHandler()

```java
public com.tailf.ncs.snmp.snmp4j.NotificationHandler getSnmpNotificationHandler()
```

Types: [NotificationHandler](NotificationHandler.md#cls-NotificationHandler)

Retrieves the registered Snmp notification handler

**Returns:** the SnmpNotificationHandler
