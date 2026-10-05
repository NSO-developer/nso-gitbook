# FilterOutNonNotifications <a href="#filteroutnonnotifications-f53d7df96e64" id="filteroutnonnotifications-f53d7df96e64"></a>

```java
public class com.tailf.ncs.snmp.snmp4j.FilterOutNonNotifications
    implements com.tailf.ncs.snmp.snmp4j.NotificationHandler
```

Types: [NotificationHandler](NotificationHandler.md#notificationhandler-49960afdd747)

Standard filter for suppression of received snmp events
 which are not TRAP, NOTIFICATION or INFORM
 This filter is implemented as a handler in the same way as
 user defined handlers and the only difference is that it is always
 registered in the beginning of the handler chain.

## Members

**Constructors**:

- [FilterOutNonNotifications()](#filteroutnonnotifications-fdfb3a2ec6cb)

**Methods**:

- [processPdu(EventContext, CommandResponderEvent, Object)](#processpdu-6c9b32673c38)

## Constructors

### FilterOutNonNotifications() <a href="#filteroutnonnotifications-fdfb3a2ec6cb" id="filteroutnonnotifications-fdfb3a2ec6cb"></a>

```java
public FilterOutNonNotifications()
```

Filter constructor


## Methods

### processPdu(EventContext, CommandResponderEvent, Object) <a href="#processpdu-6c9b32673c38" id="processpdu-6c9b32673c38"></a>

```java
public com.tailf.ncs.snmp.snmp4j.HandlerResponse processPdu(
    com.tailf.ncs.snmp.snmp4j.EventContext context,
    org.snmp4j.CommandResponderEvent event,
    Object opaque
)
    throws Exception
```

Types: [HandlerResponse](HandlerResponse.md#handlerresponse-651c4aa97197), [EventContext](EventContext.md#eventcontext-9f1cd876683b)

Standard filter method for suppressing received snmp
 event which are not of type TRAP, NOTIFICATION or INFORM.

**Parameters**

- `com.tailf.ncs.snmp.snmp4j.EventContext context`
- `org.snmp4j.CommandResponderEvent event` - Snmp4j CommandResponderEvent
- `Object opaque` - object supplied with this filter at registration
