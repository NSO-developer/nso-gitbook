# AlarmSink <a href="#alarmsink-acdd67050779" id="alarmsink-acdd67050779"></a>

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

- [AlarmSink\(\)](#alarmsink-bfafeb8b3d91)
- [AlarmSink\(AlarmSinkCentral\)](#alarmsink-b39f3967d739)
- [AlarmSink\(Maapi\)](#alarmsink-bec483a98b11)

**Methods**:

- [submitAlarm\(Alarm\)](#submitalarm-aff190c46329)
- [submitAlarm\(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, ConfBuf, List\<ManagedObject\>, List\<AlarmId\>, List\<ManagedObject\>, ConfDatetime, Attribute\[\]\)](#submitalarm-00b8df4003d0)
- [submitAlarm\(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, String, List\<ManagedObject\>, List\<AlarmId\>, List\<ManagedObject\>, ConfDatetime, Attribute\[\]\)](#submitalarm-99f8171f0795)
- [submitAlarmList\(List\<Alarm\>\)](#submitalarmlist-a59c291d1268)

## Constructors

### AlarmSink() <a href="#alarmsink-bfafeb8b3d91" id="alarmsink-bfafeb8b3d91"></a>

```java
public AlarmSink()
```

Constructs an `AlarmSink`. This sink
 writes alarms to NCS indirectly using the thread local NcsMain
 instance `AlarmSinkCentral` object.


 **Note:** This constructor shall be the preferred constructor
 used if you are writing alarms inside the NCS JVM i.e
 in a package component.

### AlarmSink(AlarmSinkCentral) <a href="#alarmsink-b39f3967d739" id="alarmsink-b39f3967d739"></a>

```java
public AlarmSink(com.tailf.ncs.alarmman.producer.AlarmSinkCentral central)
```

Types: [AlarmSinkCentral](AlarmSinkCentral.md#alarmsinkcentral-a7b03cb7fde1)

Construct an `AlarmSink` using the given
 `AlarmSinkCentral` object for writing alarms
 indirectly to the alarm list.

 The `AlarmSink` is standalone and does not
 use the `AlarmSinkCentral`.

**Parameters**

- `com.tailf.ncs.alarmman.producer.AlarmSinkCentral central` - object to be used for writing alarms

### AlarmSink(Maapi) <a href="#alarmsink-bec483a98b11" id="alarmsink-bec483a98b11"></a>

```java
public AlarmSink(com.tailf.maapi.Maapi maapi) throws com.tailf.navu.NavuException
```

Types: [Maapi](../../../maapi/Maapi.md#maapi-67bcbe89c42e), [NavuException](../../../navu/NavuException.md#navuexception-d80fa0cb4f3f)

Construct an `AlarmSink` using the given `Maapi`
 object for writing alarms directly to the alarm list.

 The `AlarmSink` is standalone and does not
 use the `AlarmSinkCentral`.

**Parameters**

- `com.tailf.maapi.Maapi maapi` - object to be used for writing alarms


## Methods

### submitAlarm(Alarm) <a href="#submitalarm-aff190c46329" id="submitalarm-aff190c46329"></a>

```java
public void submitAlarm(
    com.tailf.ncs.alarmman.common.Alarm alarm
)
    throws com.tailf.navu.NavuException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Alarm](../common/Alarm.md#alarm-e07586c3430f), [NavuException](../../../navu/NavuException.md#navuexception-d80fa0cb4f3f), [ConfException](../../../conf/ConfException.md#confexception-baeaab99f7f9)

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

### submitAlarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, ConfBuf, List&lt;ManagedObject&gt;, List&lt;AlarmId&gt;, List&lt;ManagedObject&gt;, ConfDatetime, Attribute[]) <a href="#submitalarm-00b8df4003d0" id="submitalarm-00b8df4003d0"></a>

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

Types: [ManagedDevice](../common/ManagedDevice.md#manageddevice-8da1cfb0571b), [ManagedObject](../common/ManagedObject.md#managedobject-fef83f36bfab), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [ConfBuf](../../../conf/ConfBuf.md#confbuf-c460585d9115), [PerceivedSeverity](../common/PerceivedSeverity.md#perceivedseverity-80ffc24a94f2), [AlarmId](../common/AlarmId.md#alarmid-8dc3862f7d0c), [ConfDatetime](../../../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8), [Attribute](../common/Attribute.md#attribute-cb42ffd9bcdd), [NavuException](../../../navu/NavuException.md#navuexception-d80fa0cb4f3f), [ConfException](../../../conf/ConfException.md#confexception-baeaab99f7f9)

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

### submitAlarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, String, List&lt;ManagedObject&gt;, List&lt;AlarmId&gt;, List&lt;ManagedObject&gt;, ConfDatetime, Attribute[]) <a href="#submitalarm-99f8171f0795" id="submitalarm-99f8171f0795"></a>

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

Types: [ManagedDevice](../common/ManagedDevice.md#manageddevice-8da1cfb0571b), [ManagedObject](../common/ManagedObject.md#managedobject-fef83f36bfab), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [ConfBuf](../../../conf/ConfBuf.md#confbuf-c460585d9115), [PerceivedSeverity](../common/PerceivedSeverity.md#perceivedseverity-80ffc24a94f2), [AlarmId](../common/AlarmId.md#alarmid-8dc3862f7d0c), [ConfDatetime](../../../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8), [Attribute](../common/Attribute.md#attribute-cb42ffd9bcdd), [NavuException](../../../navu/NavuException.md#navuexception-d80fa0cb4f3f), [ConfException](../../../conf/ConfException.md#confexception-baeaab99f7f9)

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

### submitAlarmList(List&lt;Alarm&gt;) <a href="#submitalarmlist-a59c291d1268" id="submitalarmlist-a59c291d1268"></a>

```java
protected boolean submitAlarmList(
    java.util.List<com.tailf.ncs.alarmman.common.Alarm> alarms
)
    throws com.tailf.conf.ConfException
```

Types: [Alarm](../common/Alarm.md#alarm-e07586c3430f), [ConfException](../../../conf/ConfException.md#confexception-baeaab99f7f9)

Submits a list of alarms

**Parameters**

- `java.util.List<com.tailf.ncs.alarmman.common.Alarm> alarms` - a list of alarms

**Throws**

- `ConfException`
- `IOException`
- `NavuException`
