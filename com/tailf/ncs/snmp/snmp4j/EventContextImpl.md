# EventContextImpl <a href="#eventcontextimpl-b15973d3b2cd" id="eventcontextimpl-b15973d3b2cd"></a>

```java
public class com.tailf.ncs.snmp.snmp4j.EventContextImpl
    implements com.tailf.ncs.snmp.snmp4j.EventContext
```

Types: [EventContext](EventContext.md#eventcontext-9f1cd876683b)

EventContext implementation class

## Members

**Constructors**:

- [EventContextImpl\(\)](#eventcontextimpl-f0979f02a693)

**Methods**:

- [getDeviceName\(\)](#getdevicename-95c72ec0cf27)
- [setDeviceKey\(ConfKey\)](#setdevicekey-f51d3171cb37)

## Constructors

### EventContextImpl() <a href="#eventcontextimpl-f0979f02a693" id="eventcontextimpl-f0979f02a693"></a>

```java
protected EventContextImpl()
```


## Methods

### getDeviceName() <a href="#getdevicename-95c72ec0cf27" id="getdevicename-95c72ec0cf27"></a>

```java
public String getDeviceName()
```

Get the deviceName for a snmp notification

### setDeviceKey(ConfKey) <a href="#setdevicekey-f51d3171cb37" id="setdevicekey-f51d3171cb37"></a>

```java
protected void setDeviceKey(com.tailf.conf.ConfKey deviceKey)
```

Types: [ConfKey](../../../conf/ConfKey.md#confkey-e4e1ca98e867)

**Parameters**

- `com.tailf.conf.ConfKey deviceKey`
