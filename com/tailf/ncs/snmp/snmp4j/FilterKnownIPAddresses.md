<a id="cls-FilterKnownIPAddresses"></a>
# FilterKnownIPAddresses

```java
public class com.tailf.ncs.snmp.snmp4j.FilterKnownIPAddresses
    implements com.tailf.ncs.snmp.snmp4j.NotificationHandler
```

Types: [NotificationHandler](NotificationHandler.md#cls-NotificationHandler)

Standard filter for suppression of notifications
 emanating from ip addresses outside defined set of addresses
 The filter determines the source ip address first from the
 snmpTrapAddress 1.3.6.1.6.3.18.1.3 varbind if this is set,
 or otherwise from the emanating peer ip address.
 This filter is implemented as a handler in the same way as
 user defined handlers and the only difference is that it is always
 registered in the beginning of the handler chain.

## Members

**Constructors**:

- [FilterKnownIPAddresses(Map<InetAddress,ConfKey>)](#m-filterknownipaddresses-46bfae603127)

**Methods**:

- [processPdu(EventContext, CommandResponderEvent, Object)](#m-processpdu-6c9b32673c38)

## Constructors

<a id="m-filterknownipaddresses-46bfae603127"></a>
### FilterKnownIPAddresses(Map<InetAddress,ConfKey>)

```java
public FilterKnownIPAddresses(
    java.util.Map<java.net.InetAddress,com.tailf.conf.ConfKey> knownIPAddresses
)
```

Types: [ConfKey](../../../conf/ConfKey.md#cls-ConfKey)

Filter constructor

**Parameters**

- `java.util.Map<java.net.InetAddress,com.tailf.conf.ConfKey> knownIPAddresses` - set of ConfValues of type
 ConfIPv4 or ConfIPv6 representing known ip addresses


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

Standard filter method for suppressing unknown ipAddresses

**Parameters**

- `com.tailf.ncs.snmp.snmp4j.EventContext context`
- `org.snmp4j.CommandResponderEvent event` - Snmp4j CommandResponderEvent
- `Object opaque` - object supplied with this filter at registration
