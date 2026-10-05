<a id="cls-CommandResponderImpl"></a>
# CommandResponderImpl

```java
public class com.tailf.ncs.snmp.snmp4j.CommandResponderImpl
    implements org.snmp4j.CommandResponder
```

Internal snmp4j callback class used by the SnmpNotificationReceiver

## Members

**Constructors**:

- [CommandResponderImpl(SocketAddress, List<NotifHandlerInstance>)](#m-commandresponderimpl-336dc0d55a04)

**Methods**:

- [processPdu(CommandResponderEvent)](#m-processpdu-9257ca95aa3e)

## Constructors

<a id="m-commandresponderimpl-336dc0d55a04"></a>
### CommandResponderImpl(SocketAddress, List<NotifHandlerInstance>)

```java
protected CommandResponderImpl(
    java.net.SocketAddress address,
    java.util.List<com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance> handlerChain
)
```

Types: [NotifHandlerInstance](NotifHandlerInstance.md#cls-NotifHandlerInstance)

**Parameters**

- `java.net.SocketAddress address`
- `java.util.List<com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance> handlerChain`


## Methods

<a id="m-processpdu-9257ca95aa3e"></a>
### processPdu(CommandResponderEvent)

```java
public synchronized void processPdu(org.snmp4j.CommandResponderEvent event)
```

**Parameters**

- `org.snmp4j.CommandResponderEvent event`
