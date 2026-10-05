<a id="s-NotificationHandler"></a>
# NotificationHandler

```java
public interface com.tailf.ncs.snmp.snmp4j.NotificationHandler
```

Interface that all Handlers must implement
 to be able to register for the NotificationReceiver

## Members

**Methods**:

- [processPdu(EventContext, CommandResponderEvent, Object)](#s-processPdu)

## Methods

<a id="s-processPdu"></a>
### processPdu(EventContext, CommandResponderEvent, Object)

```java
public abstract com.tailf.ncs.snmp.snmp4j.HandlerResponse processPdu(
    com.tailf.ncs.snmp.snmp4j.EventContext context,
    org.snmp4j.CommandResponderEvent event,
    Object opaque
)
    throws Exception
```

Types: [HandlerResponse](HandlerResponse.md#s-HandlerResponse), [EventContext](EventContext.md#s-EventContext)

Filter method

**Parameters**

- `com.tailf.ncs.snmp.snmp4j.EventContext context`
- `org.snmp4j.CommandResponderEvent event` - Snmp4j CommandResponderEvent
- `Object opaque` - object supplied with this Handler at registration
