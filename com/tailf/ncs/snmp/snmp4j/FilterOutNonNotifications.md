<a id="cls-FilterOutNonNotifications"></a>
# FilterOutNonNotifications

```java
public class com.tailf.ncs.snmp.snmp4j.FilterOutNonNotifications
    implements com.tailf.ncs.snmp.snmp4j.NotificationHandler
```

Types: [NotificationHandler](NotificationHandler.md#cls-NotificationHandler)

Standard filter for suppression of received snmp events
 which are not TRAP, NOTIFICATION or INFORM
 This filter is implemented as a handler in the same way as
 user defined handlers and the only difference is that it is always
 registered in the beginning of the handler chain.

## Members

**Constructors**:

- [FilterOutNonNotifications()](#m-filteroutnonnotifications-fdfb3a2ec6cb)

**Methods**:

- [processPdu(EventContext, CommandResponderEvent, Object)](#m-processpdu-6c9b32673c38)

## Constructors

<a id="m-filteroutnonnotifications-fdfb3a2ec6cb"></a>
### FilterOutNonNotifications()

```java
public FilterOutNonNotifications()
```

Filter constructor


## Methods

<a id="m-processpdu-6c9b32673c38"></a>
### processPdu(EventContext, CommandResponderEvent, Object)

```java
public com.tailf.ncs.snmp.snmp4j.HandlerResponse processPdu(
    com.tailf.ncs.snmp.snmp4j.EventContext context,
    org.snmp4j.CommandResponderEvent event,
    Object opaque
)
    throws Exception
```

Types: [HandlerResponse](HandlerResponse.md#cls-HandlerResponse), [EventContext](EventContext.md#cls-EventContext)

Standard filter method for suppressing received snmp
 event which are not of type TRAP, NOTIFICATION or INFORM.

**Parameters**

- `com.tailf.ncs.snmp.snmp4j.EventContext context`
- `org.snmp4j.CommandResponderEvent event` - Snmp4j CommandResponderEvent
- `Object opaque` - object supplied with this filter at registration
