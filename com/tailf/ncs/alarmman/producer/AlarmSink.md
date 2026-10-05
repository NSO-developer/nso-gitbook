<a id="s-AlarmSink"></a>
# AlarmSink

```java
public class com.tailf.ncs.alarmman.producer.AlarmSink
```

The class `AlarmSink` represents a "sink" where
 `Alarm` objects are added in order to be written to the
 alarm table.

 The `AlarmSink`relieves the user of writing directly into
 the alarm table.

 An `AlarmSink` can be created in two ways: stand alone
 or through `AlarmSinkCentral`.


- **Stand alone**
 In this mode `AlarmSink` is created with a `Maapi`
 object which is used when writing to the alarm list.
- **Through `AlarmSinkCentral`**
 In this mode, writing is handled by a proxy before it is written to
 the alarm list. The `AlarmSink` is created with its
 default constructor and submitting is always done indirectly through
 the `AlarmSinkCentral` which is always started in an
 NCS JVM.

## Members

**Constructors**:

- [AlarmSink()](#s-AlarmSink-1)
- [AlarmSink(AlarmSinkCentral)](#s-AlarmSink-2)
- [AlarmSink(Maapi)](#s-AlarmSink-3)

**Methods**:

- [submitAlarm(Alarm)](#s-submitAlarm)
- [submitAlarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, ConfBuf, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[])](#s-submitAlarm-1)
- [submitAlarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, String, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[])](#s-submitAlarm-2)
- [submitAlarmList(List<Alarm>)](#s-submitAlarmList)

## Constructors

<a id="s-AlarmSink-1"></a>
### AlarmSink()

```java
public AlarmSink()
```

Constructs an `AlarmSink`. This sink
 writes alarms to NCS indirectly using the thread local NcsMain
 instance `AlarmSinkCentral` object.


 **Note:** This constructor shall be the preferred constructor
 used if you are writing alarms inside the NCS JVM i.e
 in a package component.

<a id="s-AlarmSink-2"></a>
### AlarmSink(AlarmSinkCentral)

```java
public AlarmSink(com.tailf.ncs.alarmman.producer.AlarmSinkCentral central)
```

Types: [AlarmSinkCentral](AlarmSinkCentral.md#s-AlarmSinkCentral)

Construct an `AlarmSink` using the given
 `AlarmSinkCentral` object for writing alarms
 indirectly to the alarm list.

 The `AlarmSink` is standalone and does not
 use the `AlarmSinkCentral`.

**Parameters**

- `com.tailf.ncs.alarmman.producer.AlarmSinkCentral central` - object to be used for writing alarms

<a id="s-AlarmSink-3"></a>
### AlarmSink(Maapi)

```java
public AlarmSink(com.tailf.maapi.Maapi maapi) throws com.tailf.navu.NavuException
```

Types: [Maapi](../../../maapi/Maapi.md#s-Maapi), [NavuException](../../../navu/NavuException.md#s-NavuException)

Construct an `AlarmSink` using the given `Maapi`
 object for writing alarms directly to the alarm list.

 The `AlarmSink` is standalone and does not
 use the `AlarmSinkCentral`.

**Parameters**

- `com.tailf.maapi.Maapi maapi` - object to be used for writing alarms


## Methods

<a id="s-submitAlarm"></a>
### submitAlarm(Alarm)

```java
public void submitAlarm(
    com.tailf.ncs.alarmman.common.Alarm alarm
)
    throws com.tailf.navu.NavuException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Alarm](../common/Alarm.md#s-Alarm), [NavuException](../../../navu/NavuException.md#s-NavuException), [ConfException](../../../conf/ConfException.md#s-ConfException)

Submits the specified `Alarm` into the alarm list.
 If the alarm's key
 "managedDevice, managedObject, alarmType, specificProblem" already
 exists, the existing alarm will be updated with a
 new status change entry.

**Parameters**

- `com.tailf.ncs.alarmman.common.Alarm alarm` - The alarm to be written to the alarm list

**Throws**

- `NavuException`
- `ConfException`
- `IOException`

<a id="s-submitAlarm-1"></a>
### submitAlarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, ConfBuf, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[])

```java
public synchronized boolean submitAlarm(
    com.tailf.ncs.alarmman.common.ManagedDevice managedDevice,
    com.tailf.ncs.alarmman.common.ManagedObject managedObject,
    com.tailf.conf.ConfIdentityRef alarmtype,
    com.tailf.conf.ConfBuf specificProblem,
    com.tailf.ncs.alarmman.common.PerceivedSeverity severity,
    com.tailf.conf.ConfBuf alarmText,
    java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> impactedObjects,
    java.util.List<com.tailf.ncs.alarmman.common.AlarmId> relatedAlarms,
    java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> rootCauseObjects,
    com.tailf.conf.ConfDatetime timeStamp,
    com.tailf.ncs.alarmman.common.Attribute[] customAttributes
)
    throws com.tailf.navu.NavuException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ManagedDevice](../common/ManagedDevice.md#s-ManagedDevice), [ManagedObject](../common/ManagedObject.md#s-ManagedObject), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#s-ConfIdentityRef), [ConfBuf](../../../conf/ConfBuf.md#s-ConfBuf), [PerceivedSeverity](../common/PerceivedSeverity.md#s-PerceivedSeverity), [AlarmId](../common/AlarmId.md#s-AlarmId), [ConfDatetime](../../../conf/ConfDatetime.md#s-ConfDatetime), [Attribute](../common/Attribute.md#s-Attribute), [NavuException](../../../navu/NavuException.md#s-NavuException), [ConfException](../../../conf/ConfException.md#s-ConfException)

Submits the specified `Alarm` into the alarm list.
 If the alarms key
 "managedDevice, managedObject, alarmType, specificProblem" already
 exists, the existing alarm will be updated with a
 new status change entry.

 Alarm identity:

**Parameters**

- `com.tailf.ncs.alarmman.common.ManagedDevice managedDevice` - the managed device which emits the alarm.
- `com.tailf.ncs.alarmman.common.ManagedObject managedObject` - the managed object emitting the alarm.
- `com.tailf.conf.ConfIdentityRef alarmtype` - the alarm type of the alarm.
- `com.tailf.conf.ConfBuf specificProblem` - is used when the alarmtype cannot uniquely
        identify the alarm type.  Normally, this is not the case,
        and this leaf is the empty string.

 Status change within the alarm:
- `com.tailf.ncs.alarmman.common.PerceivedSeverity severity` - the severity of the alarm.
- `com.tailf.conf.ConfBuf alarmText` - the alarm text
- `java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> impactedObjects` - Objects that might be affected by this alarm
- `java.util.List<com.tailf.ncs.alarmman.common.AlarmId> relatedAlarms` - Alarms related to this alarm
- `java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> rootCauseObjects` - Objects that are candidates for causing the
                         alarm.
- `com.tailf.conf.ConfDatetime timeStamp` - The time the status of the alarm changed,
                         as reported by the device
- `com.tailf.ncs.alarmman.common.Attribute[] customAttributes` - Custom attributes

**Returns:** boolean true/false wheather the submitting the specified
       alarm was successful

**Throws**

- `IOException`
- `ConfException`
- `NavuException`

<a id="s-submitAlarm-2"></a>
### submitAlarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, String, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[])

```java
public synchronized boolean submitAlarm(
    com.tailf.ncs.alarmman.common.ManagedDevice managedDevice,
    com.tailf.ncs.alarmman.common.ManagedObject managedObject,
    com.tailf.conf.ConfIdentityRef alarmtype,
    com.tailf.conf.ConfBuf specificProblem,
    com.tailf.ncs.alarmman.common.PerceivedSeverity severity,
    String alarmText,
    java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> impactedObjects,
    java.util.List<com.tailf.ncs.alarmman.common.AlarmId> relatedAlarms,
    java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> rootCauseObjects,
    com.tailf.conf.ConfDatetime timeStamp,
    com.tailf.ncs.alarmman.common.Attribute[] customAttributes
)
    throws com.tailf.navu.NavuException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ManagedDevice](../common/ManagedDevice.md#s-ManagedDevice), [ManagedObject](../common/ManagedObject.md#s-ManagedObject), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#s-ConfIdentityRef), [ConfBuf](../../../conf/ConfBuf.md#s-ConfBuf), [PerceivedSeverity](../common/PerceivedSeverity.md#s-PerceivedSeverity), [AlarmId](../common/AlarmId.md#s-AlarmId), [ConfDatetime](../../../conf/ConfDatetime.md#s-ConfDatetime), [Attribute](../common/Attribute.md#s-Attribute), [NavuException](../../../navu/NavuException.md#s-NavuException), [ConfException](../../../conf/ConfException.md#s-ConfException)

Submits the specified `Alarm` into the alarm list.
 If the alarm's key
 "managedDevice, managedObject, alarmType, specificProblem" already
 exists, the existing alarm will be updated with a
 new status change entry.

 Alarm identity:

**Parameters**

- `com.tailf.ncs.alarmman.common.ManagedDevice managedDevice` - the managed device which emits the alarm.
- `com.tailf.ncs.alarmman.common.ManagedObject managedObject` - the managed object emitting the alarm.
- `com.tailf.conf.ConfIdentityRef alarmtype` - the alarm type of the alarm.
- `com.tailf.conf.ConfBuf specificProblem` - is used when the alarmtype cannot uniquely
        identify the alarm type.  Normally, this is not the case,
        and this leaf is the empty string.

 Status change within the alarm:
- `com.tailf.ncs.alarmman.common.PerceivedSeverity severity` - the severity of the alarm.
- `String alarmText` - the alarm text
- `java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> impactedObjects` - Objects that might be affected by this alarm
- `java.util.List<com.tailf.ncs.alarmman.common.AlarmId> relatedAlarms` - Alarms related to this alarm
- `java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> rootCauseObjects` - Objects that are candidates for causing the
                         alarm.
- `com.tailf.conf.ConfDatetime timeStamp` - The time the status of the alarm changed,
                         as reported by the device
- `com.tailf.ncs.alarmman.common.Attribute[] customAttributes` - Custom attributes

**Returns:** boolean true/false wheather the submitting the specified
       alarm was successful

**Throws**

- `IOException`
- `ConfException`
- `NavuException`

<a id="s-submitAlarmList"></a>
### submitAlarmList(List<Alarm>)

```java
protected boolean submitAlarmList(
    java.util.List<com.tailf.ncs.alarmman.common.Alarm> alarms
)
    throws com.tailf.conf.ConfException
```

Types: [Alarm](../common/Alarm.md#s-Alarm), [ConfException](../../../conf/ConfException.md#s-ConfException)

Submits a list of alarms

**Parameters**

- `java.util.List<com.tailf.ncs.alarmman.common.Alarm> alarms` - a list of alarms

**Throws**

- `ConfException`
- `IOException`
- `NavuException`
