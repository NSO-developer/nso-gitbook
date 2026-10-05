<a id="s-Alarm"></a>
# Alarm

```java
public class com.tailf.ncs.alarmman.common.Alarm
```

This class is used to represent an alarm instance of an entry in
 `/al:alarms/alarm-list/alarm` list.
 New alarm objects can be created and submitted to NCS using the
 [`AlarmSink`](../producer/AlarmSink.md#s-AlarmSink) methods.


 Instances of this class could also be returned from
 [`AlarmSource`](../consumer/AlarmSource.md#s-AlarmSource),
 [`AlarmSource`](../consumer/AlarmSource.md#s-AlarmSource).


 When submitting a new alarm to NCS, NCS matches the new alarm against
 the existing Alarms in the alarm list. If the new Alarm matches an entry
 in the alarm list, that entry is simply updated with the new information
 provided. The full history of alarms submitted for the same event is kept
 and can be inspected through the NCS interfaces.

 Therefore it is a desired pattern to submit alarms, even though it already
 exist in NCS.


  A unique `Alarm` instance is the combination of the following:


- *** Managed Device***
 - [`ManagedDevice`](ManagedDevice.md#s-ManagedDevice) 
 This is the device on which the alarm started. It may have come as an event
 from the device, or through detection on the manager side. The YANG type
 is a string.
- *** Managed Object***
 - [`ManagedObject`](ManagedObject.md#s-ManagedObject) 
 This is a reference to the 'alarming object' that
 caused the alarm to be raised. In YANG it can be an instance-identifier, an
 object-identifier or a string.
- *** Alarm type ***
 - [`ConfIdentityRef`](../../../conf/ConfIdentityRef.md#s-ConfIdentityRef) 
 The Alarm type is a YANG identityref. I.e. a reference to a YANG identity.
 These are extensible and defined in the YANG files.
 It is recommended to have very specific types as possible, and if it is
 not possible, use also Specific Problem. The motivation is that as far as
 possible avoid surprises for the operator with alarms that are not defined
 beforehand.
- *** Specific Problem ***
 - [`ConfBuf`](../../../conf/ConfBuf.md#s-ConfBuf) 
 This is used when the 'Alarm type' cannot uniquely identify the problem.
 It is recommended to specify the alarm in a presentable text for the user
 here.


  The `Managed Device`, ` Managed object `
 `Alarm Type` and ` Specific Problem `
 constitutes a [`AlarmId`](AlarmId.md#s-AlarmId).


 There are other various information that an alarm has.



- *** Perceived Severity ***
 - [`PerceivedSeverity`](PerceivedSeverity.md#s-PerceivedSeverity) 
 This is the typical classification of how severe the problem is from
 the device's or objects point of view.
- *** Impacted Objects ***
 - [`ManagedObject`](ManagedObject.md#s-ManagedObject) 
 In NCS it is possible to correlate the ManagedObject that caused the alarm
 with ManagedObjects in Services using the alarming object. These are called
 Impacted Objects. It is up to the implementor to decide if impacted objects
 shall be used and how deep they should dig in the structure to claim
 relations.
 From NCS 2.3 a "Backpointer" attribute is available on objects that have been
 set by services. This can be used here to determine Impacted Objects.
- *** Related Alarms ***
 - [`AlarmId`](AlarmId.md#s-AlarmId) 
 Other alarms caused by this alarm, or with some other relation to this alarm
 can be listed here. The YANG Alarm model uses "device", "type", and
 "managed-object" as indexing keys for alarms. Thus AlarmId contains these and
 provide a reference to the YANG list entry.
- *** Root cause objects ***
 - [`ManagedObject`](ManagedObject.md#s-ManagedObject) 
 Objects that are candidates for raising the alarm. This is different from
 the "Managed Object" parameter which only indicates the object that raised
 the alarm. If the raising object is in a service, it may have raised the
 alarm based on the fact that interface eth0 on device c0 had to high
 packet loss. 'eth0' on 'c0' should then be presented in this list of
 possible candidates.


 The instance of this class is usually submitted in the
 [`AlarmSink`](../producer/AlarmSink.md#s-AlarmSink)
 method to store the alarm representation in NCS.


  It is also the returned from:


- [`AlarmSource`](../consumer/AlarmSource.md#s-AlarmSource)
- [`AlarmSource`](../consumer/AlarmSource.md#s-AlarmSource)
 on the consumer side

## Members

**Constructors**:

- [Alarm()](#s-Alarm-1)
- [Alarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, ConfBuf, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[])](#s-Alarm-2)
- [Alarm(ManagedDevice, ManagedObject, ConfIdentityRef, PerceivedSeverity, ConfBuf, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[])](#s-Alarm-3)

**Methods**:

- [alarmText()](#s-alarmText)
- [equals(Object)](#s-equals)
- [getAlarmType()](#s-getAlarmType)
- [getCustomAttributes()](#s-getCustomAttributes)
- [getImpactedObjects()](#s-getImpactedObjects)
- [getManagedDevice()](#s-getManagedDevice)
- [getManagedObject()](#s-getManagedObject)
- [getPerceivedSeverity()](#s-getPerceivedSeverity)
- [getRelatedAlarms()](#s-getRelatedAlarms)
- [getRootCauseObjects()](#s-getRootCauseObjects)
- [getSpecificProblem()](#s-getSpecificProblem)
- [getTimeStamp()](#s-getTimeStamp)
- [hashCode()](#s-hashCode)
- [isCleared()](#s-isCleared)
- [isCleared(boolean)](#s-isCleared-1)
- [isLastAlarm()](#s-isLastAlarm)
- [lastAlarm()](#s-lastAlarm)
- [toString()](#s-toString)

## Constructors

<a id="s-Alarm-1"></a>
### Alarm()

```java
protected Alarm()
```

<a id="s-Alarm-2"></a>
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

Types: [ManagedDevice](ManagedDevice.md#s-ManagedDevice), [ManagedObject](ManagedObject.md#s-ManagedObject), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#s-ConfIdentityRef), [ConfBuf](../../../conf/ConfBuf.md#s-ConfBuf), [PerceivedSeverity](PerceivedSeverity.md#s-PerceivedSeverity), [AlarmId](AlarmId.md#s-AlarmId), [ConfDatetime](../../../conf/ConfDatetime.md#s-ConfDatetime), [Attribute](Attribute.md#s-Attribute)

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

<a id="s-Alarm-3"></a>
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

Types: [ManagedDevice](ManagedDevice.md#s-ManagedDevice), [ManagedObject](ManagedObject.md#s-ManagedObject), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#s-ConfIdentityRef), [PerceivedSeverity](PerceivedSeverity.md#s-PerceivedSeverity), [ConfBuf](../../../conf/ConfBuf.md#s-ConfBuf), [AlarmId](AlarmId.md#s-AlarmId), [ConfDatetime](../../../conf/ConfDatetime.md#s-ConfDatetime), [Attribute](Attribute.md#s-Attribute)

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

<a id="s-alarmText"></a>
### alarmText()

```java
public com.tailf.conf.ConfBuf alarmText()
```

Types: [ConfBuf](../../../conf/ConfBuf.md#s-ConfBuf)

**Returns:** alarm text.

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

A unique Alarm instance is the combination of [`ManagedDevice`](ManagedDevice.md#s-ManagedDevice),
 [`ManagedObject`](ManagedObject.md#s-ManagedObject), (alarmtype)
 [`ConfIdentityRef`](../../../conf/ConfIdentityRef.md#s-ConfIdentityRef) and
 (specific problem)[`ConfBuf`](../../../conf/ConfBuf.md#s-ConfBuf)

**Parameters**

- `Object o`

<a id="s-getAlarmType"></a>
### getAlarmType()

```java
public com.tailf.conf.ConfIdentityRef getAlarmType()
```

Types: [ConfIdentityRef](../../../conf/ConfIdentityRef.md#s-ConfIdentityRef)

**Returns:** alarm type

<a id="s-getCustomAttributes"></a>
### getCustomAttributes()

```java
public com.tailf.ncs.alarmman.common.Attribute[] getCustomAttributes()
```

Types: [Attribute](Attribute.md#s-Attribute)

**Returns:** custom attributes.

<a id="s-getImpactedObjects"></a>
### getImpactedObjects()

```java
public java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> getImpactedObjects()
```

Types: [ManagedObject](ManagedObject.md#s-ManagedObject)

**Returns:** impacted objects.

<a id="s-getManagedDevice"></a>
### getManagedDevice()

```java
public com.tailf.ncs.alarmman.common.ManagedDevice getManagedDevice()
```

Types: [ManagedDevice](ManagedDevice.md#s-ManagedDevice)

**Returns:** managed device.

<a id="s-getManagedObject"></a>
### getManagedObject()

```java
public com.tailf.ncs.alarmman.common.ManagedObject getManagedObject()
```

Types: [ManagedObject](ManagedObject.md#s-ManagedObject)

**Returns:** managed object.

<a id="s-getPerceivedSeverity"></a>
### getPerceivedSeverity()

```java
public com.tailf.ncs.alarmman.common.PerceivedSeverity getPerceivedSeverity()
```

Types: [PerceivedSeverity](PerceivedSeverity.md#s-PerceivedSeverity)

**Returns:** perceived severity.

<a id="s-getRelatedAlarms"></a>
### getRelatedAlarms()

```java
public java.util.List<com.tailf.ncs.alarmman.common.AlarmId> getRelatedAlarms()
```

Types: [AlarmId](AlarmId.md#s-AlarmId)

**Returns:** related alarms.

<a id="s-getRootCauseObjects"></a>
### getRootCauseObjects()

```java
public java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> getRootCauseObjects()
```

Types: [ManagedObject](ManagedObject.md#s-ManagedObject)

**Returns:** root cause objects.

<a id="s-getSpecificProblem"></a>
### getSpecificProblem()

```java
public com.tailf.conf.ConfBuf getSpecificProblem()
```

Types: [ConfBuf](../../../conf/ConfBuf.md#s-ConfBuf)

<a id="s-getTimeStamp"></a>
### getTimeStamp()

```java
public com.tailf.conf.ConfDatetime getTimeStamp()
```

Types: [ConfDatetime](../../../conf/ConfDatetime.md#s-ConfDatetime)

**Returns:** timestamp of the alarm.

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-isCleared"></a>
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

<a id="s-isCleared-1"></a>
### isCleared(boolean)

```java
public void isCleared(boolean isCleared)
```

**Parameters**

- `boolean isCleared`

<a id="s-isLastAlarm"></a>
### isLastAlarm()

```java
public boolean isLastAlarm()
```

<a id="s-lastAlarm"></a>
### lastAlarm()

```java
public static com.tailf.ncs.alarmman.common.Alarm lastAlarm()
```

Types: [Alarm](Alarm.md#s-Alarm)

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
