# EventContextImpl <a href="#cls-EventContextImpl" id="cls-EventContextImpl"></a>

```java
public class com.tailf.ncs.snmp.snmp4j.EventContextImpl
    implements com.tailf.ncs.snmp.snmp4j.EventContext
```

Types: [EventContext](EventContext.md#cls-EventContext)

EventContext implementation class

## Members

**Constructors**:

- [EventContextImpl()](#m-EventContextImpl-f0979f02a693)

**Methods**:

- [getDeviceName()](#m-getDeviceName-95c72ec0cf27)
- [setDeviceKey(ConfKey)](#m-setDeviceKey-f51d3171cb37)

## Constructors

### EventContextImpl() <a href="#m-EventContextImpl-f0979f02a693" id="m-EventContextImpl-f0979f02a693"></a>

```java
protected EventContextImpl()
```


## Methods

### getDeviceName() <a href="#m-getDeviceName-95c72ec0cf27" id="m-getDeviceName-95c72ec0cf27"></a>

```java
public String getDeviceName()
```

Get the deviceName for a snmp notification

### setDeviceKey(ConfKey) <a href="#m-setDeviceKey-f51d3171cb37" id="m-setDeviceKey-f51d3171cb37"></a>

```java
protected void setDeviceKey(com.tailf.conf.ConfKey deviceKey)
```

Types: [ConfKey](../../../conf/ConfKey.md#cls-ConfKey)

**Parameters**

- `com.tailf.conf.ConfKey deviceKey`
