<a id="s-EventContextImpl"></a>
# EventContextImpl

```java
public class com.tailf.ncs.snmp.snmp4j.EventContextImpl
    implements com.tailf.ncs.snmp.snmp4j.EventContext
```

Types: [EventContext](EventContext.md#s-EventContext)

EventContext implementation class

## Members

**Constructors**:

- [EventContextImpl()](#s-EventContextImpl-1)

**Methods**:

- [getDeviceName()](#s-getDeviceName)
- [setDeviceKey(ConfKey)](#s-setDeviceKey)

## Constructors

<a id="s-EventContextImpl-1"></a>
### EventContextImpl()

```java
protected EventContextImpl()
```


## Methods

<a id="s-getDeviceName"></a>
### getDeviceName()

```java
public String getDeviceName()
```

Get the deviceName for a snmp notification

<a id="s-setDeviceKey"></a>
### setDeviceKey(ConfKey)

```java
protected void setDeviceKey(com.tailf.conf.ConfKey deviceKey)
```

Types: [ConfKey](../../../conf/ConfKey.md#s-ConfKey)

**Parameters**

- `com.tailf.conf.ConfKey deviceKey`
