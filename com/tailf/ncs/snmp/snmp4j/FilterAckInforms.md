<a id="s-FilterAckInforms"></a>
# FilterAckInforms

```java
public class com.tailf.ncs.snmp.snmp4j.FilterAckInforms
    implements com.tailf.ncs.snmp.snmp4j.NotificationHandler
```

Types: [NotificationHandler](NotificationHandler.md#s-NotificationHandler)

Standard filter for sending Acknowledge response to
 Snmp INFORMs
 This filter is implemented as a handler in the same way as
 user defined handlers and the only difference is that it is always
 registered in the beginning of the handler chain.

## Members

**Constructors**:

- [FilterAckInforms()](#s-FilterAckInforms-1)

**Methods**:

- [processPdu(EventContext, CommandResponderEvent, Object)](#s-processPdu)

## Constructors

<a id="s-FilterAckInforms-1"></a>
### FilterAckInforms()

```java
public FilterAckInforms()
```

Filter constructor


## Methods

<a id="s-processPdu"></a>
### processPdu(EventContext, CommandResponderEvent, Object)

```java
public com.tailf.ncs.snmp.snmp4j.HandlerResponse processPdu(
    com.tailf.ncs.snmp.snmp4j.EventContext context,
    org.snmp4j.CommandResponderEvent event,
    Object opaque
)
    throws Exception
```

Types: [HandlerResponse](HandlerResponse.md#s-HandlerResponse), [EventContext](EventContext.md#s-EventContext)

Standard filter method for acknowledge of INFORM.

**Parameters**

- `com.tailf.ncs.snmp.snmp4j.EventContext context`
- `org.snmp4j.CommandResponderEvent event` - Snmp4j CommandResponderEvent
- `Object opaque` - object supplied with this filter at registration
