# FilterAckInforms <a href="#filterackinforms-cd47a176f4bd" id="filterackinforms-cd47a176f4bd"></a>

```java
public class com.tailf.ncs.snmp.snmp4j.FilterAckInforms
    implements com.tailf.ncs.snmp.snmp4j.NotificationHandler
```

Types: [NotificationHandler](NotificationHandler.md#notificationhandler-49960afdd747)

Standard filter for sending Acknowledge response to
 Snmp INFORMs
 This filter is implemented as a handler in the same way as
 user defined handlers and the only difference is that it is always
 registered in the beginning of the handler chain.

## Members

**Constructors**:

- [FilterAckInforms()](#filterackinforms-432b72b87a44)

**Methods**:

- [processPdu(EventContext, CommandResponderEvent, Object)](#processpdu-6c9b32673c38)

## Constructors

### FilterAckInforms() <a href="#filterackinforms-432b72b87a44" id="filterackinforms-432b72b87a44"></a>

```java
public FilterAckInforms()
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

Standard filter method for acknowledge of INFORM.

**Parameters**

- `com.tailf.ncs.snmp.snmp4j.EventContext context`
- `org.snmp4j.CommandResponderEvent event` - Snmp4j CommandResponderEvent
- `Object opaque` - object supplied with this filter at registration
