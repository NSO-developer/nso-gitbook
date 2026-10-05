# CommandResponderImpl <a href="#cls-CommandResponderImpl" id="cls-CommandResponderImpl"></a>

```java
public class com.tailf.ncs.snmp.snmp4j.CommandResponderImpl
    implements org.snmp4j.CommandResponder
```

Internal snmp4j callback class used by the SnmpNotificationReceiver

## Members

**Constructors**:

- [CommandResponderImpl(SocketAddress, List<NotifHandlerInstance>)](#m-CommandResponderImpl-336dc0d55a04)

**Methods**:

- [processPdu(CommandResponderEvent)](#m-processPdu-9257ca95aa3e)

## Constructors

### CommandResponderImpl(SocketAddress, List<NotifHandlerInstance>) <a href="#m-CommandResponderImpl-336dc0d55a04" id="m-CommandResponderImpl-336dc0d55a04"></a>

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

### processPdu(CommandResponderEvent) <a href="#m-processPdu-9257ca95aa3e" id="m-processPdu-9257ca95aa3e"></a>

```java
public synchronized void processPdu(org.snmp4j.CommandResponderEvent event)
```

**Parameters**

- `org.snmp4j.CommandResponderEvent event`
