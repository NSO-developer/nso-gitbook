<a id="cls-EventContextImpl"></a>
# EventContextImpl

```java
public class com.tailf.ncs.snmp.snmp4j.EventContextImpl
    implements com.tailf.ncs.snmp.snmp4j.EventContext
```

Types: [EventContext](EventContext.md#cls-EventContext)

EventContext implementation class

## Members

**Constructors**:

- [EventContextImpl()](#m-eventcontextimpl-f0979f02a693)

**Methods**:

- [getDeviceName()](#m-getdevicename-95c72ec0cf27)
- [setDeviceKey(ConfKey)](#m-setdevicekey-f51d3171cb37)

## Constructors

<a id="m-eventcontextimpl-f0979f02a693"></a>
### EventContextImpl()

```java
protected EventContextImpl()
```


## Methods

<a id="m-getdevicename-95c72ec0cf27"></a>
### getDeviceName()

```java
public String getDeviceName()
```

Get the deviceName for a snmp notification

<a id="m-setdevicekey-f51d3171cb37"></a>
### setDeviceKey(ConfKey)

```java
protected void setDeviceKey(com.tailf.conf.ConfKey deviceKey)
```

Types: [ConfKey](../../../conf/ConfKey.md#cls-ConfKey)

**Parameters**

- `com.tailf.conf.ConfKey deviceKey`
