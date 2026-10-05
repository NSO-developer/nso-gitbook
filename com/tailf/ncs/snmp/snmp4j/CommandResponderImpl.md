<a id="s-CommandResponderImpl"></a>
# CommandResponderImpl

```java
public class com.tailf.ncs.snmp.snmp4j.CommandResponderImpl
    implements org.snmp4j.CommandResponder
```

Internal snmp4j callback class used by the SnmpNotificationReceiver

## Members

**Constructors**:

- [CommandResponderImpl(SocketAddress, List<NotifHandlerInstance>)](#s-CommandResponderImpl-1)

**Methods**:

- [processPdu(CommandResponderEvent)](#s-processPdu)

## Constructors

<a id="s-CommandResponderImpl-1"></a>
### CommandResponderImpl(SocketAddress, List<NotifHandlerInstance>)

```java
protected CommandResponderImpl(
    java.net.SocketAddress address,
    java.util.List<com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance> handlerChain
)
```

Types: [NotifHandlerInstance](NotifHandlerInstance.md#s-NotifHandlerInstance)

**Parameters**

- `java.net.SocketAddress address`
- `java.util.List<com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance> handlerChain`


## Methods

<a id="s-processPdu"></a>
### processPdu(CommandResponderEvent)

```java
public synchronized void processPdu(org.snmp4j.CommandResponderEvent event)
```

**Parameters**

- `org.snmp4j.CommandResponderEvent event`
