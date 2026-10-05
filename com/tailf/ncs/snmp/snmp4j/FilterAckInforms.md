<a id="cls-FilterAckInforms"></a>
# FilterAckInforms

```java
public class com.tailf.ncs.snmp.snmp4j.FilterAckInforms
    implements com.tailf.ncs.snmp.snmp4j.NotificationHandler
```

Types: [NotificationHandler](NotificationHandler.md#cls-NotificationHandler)

Standard filter for sending Acknowledge response to
 Snmp INFORMs
 This filter is implemented as a handler in the same way as
 user defined handlers and the only difference is that it is always
 registered in the beginning of the handler chain.

## Members

**Constructors**:

- [FilterAckInforms()](#m-filterackinforms-432b72b87a44)

**Methods**:

- [processPdu(EventContext, CommandResponderEvent, Object)](#m-processpdu-6c9b32673c38)

## Constructors

<a id="m-filterackinforms-432b72b87a44"></a>
### FilterAckInforms()

```java
public FilterAckInforms()
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

Standard filter method for acknowledge of INFORM.

**Parameters**

- `com.tailf.ncs.snmp.snmp4j.EventContext context`
- `org.snmp4j.CommandResponderEvent event` - Snmp4j CommandResponderEvent
- `Object opaque` - object supplied with this filter at registration
