# NotificationHandler <a href="#notificationhandler-49960afdd747" id="notificationhandler-49960afdd747"></a>

```java
public interface com.tailf.ncs.snmp.snmp4j.NotificationHandler
```

Interface that all Handlers must implement
 to be able to register for the NotificationReceiver

## Members

**Methods**:

- [processPdu(EventContext, CommandResponderEvent, Object)](#processpdu-6c9b32673c38)

## Methods

### processPdu(EventContext, CommandResponderEvent, Object) <a href="#processpdu-6c9b32673c38" id="processpdu-6c9b32673c38"></a>

```java
public abstract com.tailf.ncs.snmp.snmp4j.HandlerResponse processPdu(
    com.tailf.ncs.snmp.snmp4j.EventContext context,
    org.snmp4j.CommandResponderEvent event,
    Object opaque
)
    throws Exception
```

Types: [HandlerResponse](HandlerResponse.md#handlerresponse-651c4aa97197), [EventContext](EventContext.md#eventcontext-9f1cd876683b)

Filter method

**Parameters**

- `com.tailf.ncs.snmp.snmp4j.EventContext context`
- `org.snmp4j.CommandResponderEvent event` - Snmp4j CommandResponderEvent
- `Object opaque` - object supplied with this Handler at registration
