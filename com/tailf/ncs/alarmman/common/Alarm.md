<a id="cls-Alarm"></a>
# Alarm

```java
public class com.tailf.ncs.alarmman.common.Alarm
```

This class is used to represent an alarm instance of an entry in
 `/al:alarms/alarm-list/alarm` list.
 New alarm objects can be created and submitted to NCS using the
 [`AlarmSink#submitAlarm(Alarm)`](../producer/AlarmSink.md#m-submitalarm-aff190c46329) methods.


 Instances of this class could also be returned from
 [`AlarmSource#pollAlarm(int,
 java.util.concurrent.TimeUnit)`](../consumer/AlarmSource.md#m-pollalarm-d491d8607d37),
 [`AlarmSource#takeAlarm()`](../consumer/AlarmSource.md#m-takealarm-58b71d3346fe).


 When submitting a new alarm to NCS, NCS matches the new alarm against
 the existing Alarms in the alarm list. If the new Alarm matches an entry
 in the alarm list, that entry is simply updated with the new information
 provided. The full history of alarms submitted for the same event is kept
 and can be inspected through the NCS interfaces.

 Therefore it is a desired pattern to submit alarms, even though it already
 exist in NCS.


  A unique `Alarm` instance is the combination of the following:


- *** Managed Device***
 - [`ManagedDevice`](ManagedDevice.md#cls-ManagedDevice) 
 This is the device on which the alarm started. It may have come as an event
 from the device, or through detection on the manager side. The YANG type
 is a string.
- *** Managed Object***
 - [`ManagedObject`](ManagedObject.md#cls-ManagedObject) 
 This is a reference to the 'alarming object' that
 caused the alarm to be raised. In YANG it can be an instance-identifier, an
 object-identifier or a string.
- *** Alarm type ***
 - [`ConfIdentityRef`](../../../conf/ConfIdentityRef.md#cls-ConfIdentityRef) 
 The Alarm type is a YANG identityref. I.e. a reference to a YANG identity.
 These are extensible and defined in the YANG files.
 It is recommended to have very specific types as possible, and if it is
 not possible, use also Specific Problem. The motivation is that as far as
 possible avoid surprises for the operator with alarms that are not defined
 beforehand.
- *** Specific Problem ***
 - [`ConfBuf`](../../../conf/ConfBuf.md#cls-ConfBuf) 
 This is used when the 'Alarm type' cannot uniquely identify the problem.
 It is recommended to specify the alarm in a presentable text for the user
 here.


  The `Managed Device`, ` Managed object `
 `Alarm Type` and ` Specific Problem `
 constitutes a [`AlarmId`](AlarmId.md#cls-AlarmId).


 There are other various information that an alarm has.



- *** Perceived Severity ***
 - [`PerceivedSeverity`](PerceivedSeverity.md#cls-PerceivedSeverity) 
 This is the typical classification of how severe the problem is from
 the device's or objects point of view.
- *** Impacted Objects ***
 - [`ManagedObject`](ManagedObject.md#cls-ManagedObject) 
 In NCS it is possible to correlate the ManagedObject that caused the alarm
 with ManagedObjects in Services using the alarming object. These are called
 Impacted Objects. It is up to the implementor to decide if impacted objects
 shall be used and how deep they should dig in the structure to claim
 relations.
 From NCS 2.3 a "Backpointer" attribute is available on objects that have been
 set by services. This can be used here to determine Impacted Objects.
- *** Related Alarms ***
 - [`AlarmId`](AlarmId.md#cls-AlarmId) 
 Other alarms caused by this alarm, or with some other relation to this alarm
 can be listed here. The YANG Alarm model uses "device", "type", and
 "managed-object" as indexing keys for alarms. Thus AlarmId contains these and
 provide a reference to the YANG list entry.
- *** Root cause objects ***
 - [`ManagedObject`](ManagedObject.md#cls-ManagedObject) 
 Objects that are candidates for raising the alarm. This is different from
 the "Managed Object" parameter which only indicates the object that raised
 the alarm. If the raising object is in a service, it may have raised the
 alarm based on the fact that interface eth0 on device c0 had to high
 packet loss. 'eth0' on 'c0' should then be presented in this list of
 possible candidates.


 The instance of this class is usually submitted in the
 [`AlarmSink#submitAlarm(Alarm)`](../producer/AlarmSink.md#m-submitalarm-aff190c46329)
 method to store the alarm representation in NCS.


  It is also the returned from:


- [`AlarmSource#pollAlarm(int,TimeUnit)`](../consumer/AlarmSource.md#m-pollalarm-d491d8607d37)
- [`AlarmSource#takeAlarm()`](../consumer/AlarmSource.md#m-takealarm-58b71d3346fe)
 on the consumer side

## Members

**Constructors**:

- [Alarm()](#m-alarm-85f095f88654)
- [Alarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, ConfBuf, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[])](#m-alarm-81c1058677fc)
- [Alarm(ManagedDevice, ManagedObject, ConfIdentityRef, PerceivedSeverity, ConfBuf, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[])](#m-alarm-35d516f7889e)

**Methods**:

- [alarmText()](#m-alarmtext-efe8fe4bc726)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getAlarmType()](#m-getalarmtype-80d08d07e5c6)
- [getCustomAttributes()](#m-getcustomattributes-47a1386413e6)
- [getImpactedObjects()](#m-getimpactedobjects-5bad4ce10c30)
- [getManagedDevice()](#m-getmanageddevice-a92f8741d02f)
- [getManagedObject()](#m-getmanagedobject-2257610c0381)
- [getPerceivedSeverity()](#m-getperceivedseverity-45b453ff90f8)
- [getRelatedAlarms()](#m-getrelatedalarms-caad0a60b2e2)
- [getRootCauseObjects()](#m-getrootcauseobjects-73835daf51d9)
- [getSpecificProblem()](#m-getspecificproblem-236478d10663)
- [getTimeStamp()](#m-gettimestamp-f6129b80c824)
- [hashCode()](#m-hashcode-ef797a217903)
- [isCleared()](#m-iscleared-94f487388947)
- [isLastAlarm()](#m-islastalarm-45ec5733b904)
- [lastAlarm()](#m-lastalarm-b867c9cc4a2f)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-alarm-85f095f88654"></a>
### Alarm()

```java
protected Alarm()
```

<a id="m-alarm-81c1058677fc"></a>
### Alarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, ConfBuf, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[])

```java
public Alarm(
    com.tailf.ncs.alarmman.common.ManagedDevice managedDevice,
    com.tailf.ncs.alarmman.common.ManagedObject managedObject,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.conf.ConfBuf specificProblem,
    com.tailf.ncs.alarmman.common.PerceivedSeverity severity,
    com.tailf.conf.ConfBuf alarmText,
    java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> impactedObjects,
    java.util.List<com.tailf.ncs.alarmman.common.AlarmId> relatedAlarms,
    java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> rootCauseObjects,
    com.tailf.conf.ConfDatetime timeStamp,
    com.tailf.ncs.alarmman.common.Attribute[] customAttributes
)
```

Types: [ManagedDevice](ManagedDevice.md#cls-ManagedDevice), [ManagedObject](ManagedObject.md#cls-ManagedObject), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [ConfBuf](../../../conf/ConfBuf.md#cls-ConfBuf), [PerceivedSeverity](PerceivedSeverity.md#cls-PerceivedSeverity), [AlarmId](AlarmId.md#cls-AlarmId), [ConfDatetime](../../../conf/ConfDatetime.md#cls-ConfDatetime), [Attribute](Attribute.md#cls-Attribute)

Creates an alarm

**Parameters**

- `com.tailf.ncs.alarmman.common.ManagedDevice managedDevice` - The managed device for which this
 alarm is associated with, plain string which identifies the device
 (usually the key string in /ncs:devices/device{dev1}). I.e. dev1
- `com.tailf.ncs.alarmman.common.ManagedObject managedObject` - The managed object for which this
 alarm is associated with. Also referred to as the "Alarming Object".
 This may not be the same as the rootCause object, which is set in
 the rootCauseObjects parameter.
 If an NCS Service generates an alarm based on an error state in a device
 used by this service, the managedObject is the service Id and the object
 on the device the rootCauseObjects.
- `com.tailf.conf.ConfIdentityRef alarmType` - The AlarmType this alarm is associated with. This is a YANG identity.
 Alarm types are defined by the YANG developer and should be designed
 to be as specific as possible.
- `com.tailf.conf.ConfBuf specificProblem` - If the AlarmType isn't enough to describe the Alarm, this field can
 be used in combination. Keep in mind that when dynamically adding a
 specific problem, there is no way for the operator to know in beforehand
 which alarms that can be raised on the network.
- `com.tailf.ncs.alarmman.common.PerceivedSeverity severity` - What state this alarm is in. Cleared, Indeterminate, Minor, Warning,
 Major, Critical
- `com.tailf.conf.ConfBuf alarmText`
- `java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> impactedObjects` - A list of ManagedObjects that may no longer function due to this alarm.
 Typically these point to NCS Services that are dependent on the objects
 on the device that reported the problem.
 In NCS 2.3 and later there is a backpointer attribute available on
 objects in the device tree that has been created by a Service. These
 backpointers are instance reference pointer that should be used as
 impactedObjects.
- `java.util.List<com.tailf.ncs.alarmman.common.AlarmId> relatedAlarms` - References to other alarms that have been generated as a consequence of
 this alarm, or that has a relation to this alarm.
- `java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> rootCauseObjects` - ManagedObjects that are likely to be the root cause of this alarm. This
 is different from the "alarming object". See managedObject above for
 details.
- `com.tailf.conf.ConfDatetime timeStamp` - A date-and-time when this alarm was generated
- `com.tailf.ncs.alarmman.common.Attribute[] customAttributes`

<a id="m-alarm-35d516f7889e"></a>
### Alarm(ManagedDevice, ManagedObject, ConfIdentityRef, PerceivedSeverity, ConfBuf, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[])

```java
public Alarm(
    com.tailf.ncs.alarmman.common.ManagedDevice managedDevice,
    com.tailf.ncs.alarmman.common.ManagedObject managedObject,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.PerceivedSeverity severity,
    com.tailf.conf.ConfBuf alarmText,
    java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> impactedObjects,
    java.util.List<com.tailf.ncs.alarmman.common.AlarmId> relatedAlarms,
    java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> rootCauseObjects,
    com.tailf.conf.ConfDatetime timeStamp,
    com.tailf.ncs.alarmman.common.Attribute[] customAttributes
)
```

Types: [ManagedDevice](ManagedDevice.md#cls-ManagedDevice), [ManagedObject](ManagedObject.md#cls-ManagedObject), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [PerceivedSeverity](PerceivedSeverity.md#cls-PerceivedSeverity), [ConfBuf](../../../conf/ConfBuf.md#cls-ConfBuf), [AlarmId](AlarmId.md#cls-AlarmId), [ConfDatetime](../../../conf/ConfDatetime.md#cls-ConfDatetime), [Attribute](Attribute.md#cls-Attribute)

Creates an alarm

**Parameters**

- `com.tailf.ncs.alarmman.common.ManagedDevice managedDevice` - The managed device for which this
 alarm is associated with, plain string which identifies the device
 (usually the key string in /ncs:devices/device{dev1}). I.e. dev1
- `com.tailf.ncs.alarmman.common.ManagedObject managedObject` - The managed object for which this
 alarm is associated with. Also referred to as the "Alarming Object".
 This may not be the same as the rootCause object, which is set in
 the rootCauseObjects parameter.
 If an NCS Service generates an alarm based on an error state in a device
 used by this service, the managedObject is the service Id and the object
 on the device the rootCauseObjects.
- `com.tailf.conf.ConfIdentityRef alarmType` - The AlarmType this alarm is associated with. This is a YANG identity.
 Alarm types are defined by the YANG developer and should be designed
 to be as specific as possible.
- `com.tailf.ncs.alarmman.common.PerceivedSeverity severity` - What state this alarm is in. Cleared, Indeterminate, Minor, Warning,
 Major, Critical
- `com.tailf.conf.ConfBuf alarmText` - A human readable description of this problem.
- `java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> impactedObjects` - A list of ManagedObjects that may no longer function due to this alarm.
 Typically these point to NCS Services that are dependent on the objects
 on the device that reported the problem.
 In NCS 2.3 and later there is a backpointer attribute available on
 objects in the device tree that has been created by a Service. These
 backpointers are instance reference pointer that should be used as
 impactedObjects.
- `java.util.List<com.tailf.ncs.alarmman.common.AlarmId> relatedAlarms` - References to other alarms that have been generated as a consequence of
 this alarm, or that has a relation to this alarm.
- `java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> rootCauseObjects` - ManagedObjects that are likely to be the root cause of this alarm. This
 is different from the "alarming object". See managedObject above for
 details.
- `com.tailf.conf.ConfDatetime timeStamp` - A date-and-time when this alarm was generated
- `com.tailf.ncs.alarmman.common.Attribute[] customAttributes`


## Methods

<a id="m-alarmtext-efe8fe4bc726"></a>
### alarmText()

```java
public com.tailf.conf.ConfBuf alarmText()
```

Types: [ConfBuf](../../../conf/ConfBuf.md#cls-ConfBuf)

**Returns:** alarm text.

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

A unique Alarm instance is the combination of [`ManagedDevice`](ManagedDevice.md#cls-ManagedDevice),
 [`ManagedObject`](ManagedObject.md#cls-ManagedObject), (alarmtype)
 [`ConfIdentityRef`](../../../conf/ConfIdentityRef.md#cls-ConfIdentityRef) and
 (specific problem)[`ConfBuf`](../../../conf/ConfBuf.md#cls-ConfBuf)

**Parameters**

- `Object o`

<a id="m-getalarmtype-80d08d07e5c6"></a>
### getAlarmType()

```java
public com.tailf.conf.ConfIdentityRef getAlarmType()
```

Types: [ConfIdentityRef](../../../conf/ConfIdentityRef.md#cls-ConfIdentityRef)

**Returns:** alarm type

<a id="m-getcustomattributes-47a1386413e6"></a>
### getCustomAttributes()

```java
public com.tailf.ncs.alarmman.common.Attribute[] getCustomAttributes()
```

Types: [Attribute](Attribute.md#cls-Attribute)

**Returns:** custom attributes.

<a id="m-getimpactedobjects-5bad4ce10c30"></a>
### getImpactedObjects()

```java
public java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> getImpactedObjects()
```

Types: [ManagedObject](ManagedObject.md#cls-ManagedObject)

**Returns:** impacted objects.

<a id="m-getmanageddevice-a92f8741d02f"></a>
### getManagedDevice()

```java
public com.tailf.ncs.alarmman.common.ManagedDevice getManagedDevice()
```

Types: [ManagedDevice](ManagedDevice.md#cls-ManagedDevice)

**Returns:** managed device.

<a id="m-getmanagedobject-2257610c0381"></a>
### getManagedObject()

```java
public com.tailf.ncs.alarmman.common.ManagedObject getManagedObject()
```

Types: [ManagedObject](ManagedObject.md#cls-ManagedObject)

**Returns:** managed object.

<a id="m-getperceivedseverity-45b453ff90f8"></a>
### getPerceivedSeverity()

```java
public com.tailf.ncs.alarmman.common.PerceivedSeverity getPerceivedSeverity()
```

Types: [PerceivedSeverity](PerceivedSeverity.md#cls-PerceivedSeverity)

**Returns:** perceived severity.

<a id="m-getrelatedalarms-caad0a60b2e2"></a>
### getRelatedAlarms()

```java
public java.util.List<com.tailf.ncs.alarmman.common.AlarmId> getRelatedAlarms()
```

Types: [AlarmId](AlarmId.md#cls-AlarmId)

**Returns:** related alarms.

<a id="m-getrootcauseobjects-73835daf51d9"></a>
### getRootCauseObjects()

```java
public java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> getRootCauseObjects()
```

Types: [ManagedObject](ManagedObject.md#cls-ManagedObject)

**Returns:** root cause objects.

<a id="m-getspecificproblem-236478d10663"></a>
### getSpecificProblem()

```java
public com.tailf.conf.ConfBuf getSpecificProblem()
```

Types: [ConfBuf](../../../conf/ConfBuf.md#cls-ConfBuf)

<a id="m-gettimestamp-f6129b80c824"></a>
### getTimeStamp()

```java
public com.tailf.conf.ConfDatetime getTimeStamp()
```

Types: [ConfDatetime](../../../conf/ConfDatetime.md#cls-ConfDatetime)

**Returns:** timestamp of the alarm.

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-iscleared-94f487388947"></a>
### isCleared()

```java
public boolean isCleared()
```

Return `true` if this alarm has been cleared by
 the underlying resource.

 Idicates the clearance state of this alarm.
 An alarm might toggle from active alarm to cleared alarm and back to
 active again.

**Returns:** true if this alarm has been cleared.

<a id="m-islastalarm-45ec5733b904"></a>
### isLastAlarm()

```java
public boolean isLastAlarm()
```

<a id="m-lastalarm-b867c9cc4a2f"></a>
### lastAlarm()

```java
public static com.tailf.ncs.alarmman.common.Alarm lastAlarm()
```

Types: [Alarm](Alarm.md#cls-Alarm)

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
