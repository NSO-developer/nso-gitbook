# CommandResponderImpl <a href="#commandresponderimpl-14374724c6fc" id="commandresponderimpl-14374724c6fc"></a>

```java
public class com.tailf.ncs.snmp.snmp4j.CommandResponderImpl
    implements org.snmp4j.CommandResponder
```

Internal snmp4j callback class used by the SnmpNotificationReceiver

## Members

**Constructors**:

- [CommandResponderImpl\(SocketAddress, List\<NotifHandlerInstance\>\)](#commandresponderimpl-336dc0d55a04)

**Methods**:

- [processPdu\(CommandResponderEvent\)](#processpdu-9257ca95aa3e)

## Constructors

### CommandResponderImpl(SocketAddress, List&lt;NotifHandlerInstance&gt;) <a href="#commandresponderimpl-336dc0d55a04" id="commandresponderimpl-336dc0d55a04"></a>

```java
protected CommandResponderImpl(
    java.net.SocketAddress address,
    java.util.List<com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance> handlerChain
)
```

Types: [NotifHandlerInstance](NotifHandlerInstance.md#notifhandlerinstance-7fa13bf44d0b)

**Parameters**

- `java.net.SocketAddress address`
- `java.util.List<com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance> handlerChain`


## Methods

### processPdu(CommandResponderEvent) <a href="#processpdu-9257ca95aa3e" id="processpdu-9257ca95aa3e"></a>

```java
public synchronized void processPdu(org.snmp4j.CommandResponderEvent event)
```

**Parameters**

- `org.snmp4j.CommandResponderEvent event`
