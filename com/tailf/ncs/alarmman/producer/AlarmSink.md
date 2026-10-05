# AlarmSink <a href="#cls-AlarmSink" id="cls-AlarmSink"></a>

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

- [AlarmSink()](#m-AlarmSink-bfafeb8b3d91)
- [AlarmSink(AlarmSinkCentral)](#m-AlarmSink-b39f3967d739)
- [AlarmSink(Maapi)](#m-AlarmSink-bec483a98b11)

**Methods**:

- [submitAlarm(Alarm)](#m-submitAlarm-aff190c46329)
- [submitAlarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, ConfBuf, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[])](#m-submitAlarm-00b8df4003d0)
- [submitAlarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, String, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[])](#m-submitAlarm-99f8171f0795)
- [submitAlarmList(List<Alarm>)](#m-submitAlarmList-a59c291d1268)

## Constructors

### AlarmSink() <a href="#m-AlarmSink-bfafeb8b3d91" id="m-AlarmSink-bfafeb8b3d91"></a>

```java
public AlarmSink()
```

Constructs an `AlarmSink`. This sink
 writes alarms to NCS indirectly using the thread local NcsMain
 instance `AlarmSinkCentral` object.


 **Note:** This constructor shall be the preferred constructor
 used if you are writing alarms inside the NCS JVM i.e
 in a package component.

### AlarmSink(AlarmSinkCentral) <a href="#m-AlarmSink-b39f3967d739" id="m-AlarmSink-b39f3967d739"></a>

```java
public AlarmSink(com.tailf.ncs.alarmman.producer.AlarmSinkCentral central)
```

Types: [AlarmSinkCentral](AlarmSinkCentral.md#cls-AlarmSinkCentral)

Construct an `AlarmSink` using the given
 `AlarmSinkCentral` object for writing alarms
 indirectly to the alarm list.

 The `AlarmSink` is standalone and does not
 use the `AlarmSinkCentral`.

**Parameters**

- `com.tailf.ncs.alarmman.producer.AlarmSinkCentral central` - object to be used for writing alarms

### AlarmSink(Maapi) <a href="#m-AlarmSink-bec483a98b11" id="m-AlarmSink-bec483a98b11"></a>

```java
public AlarmSink(com.tailf.maapi.Maapi maapi) throws com.tailf.navu.NavuException
```

Types: [Maapi](../../../maapi/Maapi.md#cls-Maapi), [NavuException](../../../navu/NavuException.md#cls-NavuException)

Construct an `AlarmSink` using the given `Maapi`
 object for writing alarms directly to the alarm list.

 The `AlarmSink` is standalone and does not
 use the `AlarmSinkCentral`.

**Parameters**

- `com.tailf.maapi.Maapi maapi` - object to be used for writing alarms


## Methods

### submitAlarm(Alarm) <a href="#m-submitAlarm-aff190c46329" id="m-submitAlarm-aff190c46329"></a>

```java
public void submitAlarm(
    com.tailf.ncs.alarmman.common.Alarm alarm
)
    throws com.tailf.navu.NavuException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Alarm](../common/Alarm.md#cls-Alarm), [NavuException](../../../navu/NavuException.md#cls-NavuException), [ConfException](../../../conf/ConfException.md#cls-ConfException)

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

### submitAlarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, ConfBuf, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[]) <a href="#m-submitAlarm-00b8df4003d0" id="m-submitAlarm-00b8df4003d0"></a>

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

Types: [ManagedDevice](../common/ManagedDevice.md#cls-ManagedDevice), [ManagedObject](../common/ManagedObject.md#cls-ManagedObject), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [ConfBuf](../../../conf/ConfBuf.md#cls-ConfBuf), [PerceivedSeverity](../common/PerceivedSeverity.md#cls-PerceivedSeverity), [AlarmId](../common/AlarmId.md#cls-AlarmId), [ConfDatetime](../../../conf/ConfDatetime.md#cls-ConfDatetime), [Attribute](../common/Attribute.md#cls-Attribute), [NavuException](../../../navu/NavuException.md#cls-NavuException), [ConfException](../../../conf/ConfException.md#cls-ConfException)

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

### submitAlarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, String, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[]) <a href="#m-submitAlarm-99f8171f0795" id="m-submitAlarm-99f8171f0795"></a>

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

Types: [ManagedDevice](../common/ManagedDevice.md#cls-ManagedDevice), [ManagedObject](../common/ManagedObject.md#cls-ManagedObject), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [ConfBuf](../../../conf/ConfBuf.md#cls-ConfBuf), [PerceivedSeverity](../common/PerceivedSeverity.md#cls-PerceivedSeverity), [AlarmId](../common/AlarmId.md#cls-AlarmId), [ConfDatetime](../../../conf/ConfDatetime.md#cls-ConfDatetime), [Attribute](../common/Attribute.md#cls-Attribute), [NavuException](../../../navu/NavuException.md#cls-NavuException), [ConfException](../../../conf/ConfException.md#cls-ConfException)

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

### submitAlarmList(List<Alarm>) <a href="#m-submitAlarmList-a59c291d1268" id="m-submitAlarmList-a59c291d1268"></a>

```java
protected boolean submitAlarmList(
    java.util.List<com.tailf.ncs.alarmman.common.Alarm> alarms
)
    throws com.tailf.conf.ConfException
```

Types: [Alarm](../common/Alarm.md#cls-Alarm), [ConfException](../../../conf/ConfException.md#cls-ConfException)

Submits a list of alarms

**Parameters**

- `java.util.List<com.tailf.ncs.alarmman.common.Alarm> alarms` - a list of alarms

**Throws**

- `ConfException`
- `IOException`
- `NavuException`
