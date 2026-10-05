# NotificationHandler <a href="#cls-NotificationHandler" id="cls-NotificationHandler"></a>

```java
public interface com.tailf.ncs.snmp.snmp4j.NotificationHandler
```

Interface that all Handlers must implement
 to be able to register for the NotificationReceiver

## Members

**Methods**:

- [processPdu(EventContext, CommandResponderEvent, Object)](#m-processPdu-6c9b32673c38)

## Methods

### processPdu(EventContext, CommandResponderEvent, Object) <a href="#m-processPdu-6c9b32673c38" id="m-processPdu-6c9b32673c38"></a>

```java
public abstract com.tailf.ncs.snmp.snmp4j.HandlerResponse processPdu(
    com.tailf.ncs.snmp.snmp4j.EventContext context,
    org.snmp4j.CommandResponderEvent event,
    Object opaque
)
    throws Exception
```

Types: [HandlerResponse](HandlerResponse.md#cls-HandlerResponse), [EventContext](EventContext.md#cls-EventContext)

Filter method

**Parameters**

- `com.tailf.ncs.snmp.snmp4j.EventContext context`
- `org.snmp4j.CommandResponderEvent event` - Snmp4j CommandResponderEvent
- `Object opaque` - object supplied with this Handler at registration
