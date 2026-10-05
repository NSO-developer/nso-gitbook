# Alarm <a href="#alarm-e07586c3430f" id="alarm-e07586c3430f"></a>

```java
public class com.tailf.ncs.alarmman.common.Alarm
```

This class is used to represent an alarm instance of an entry in
 `/al:alarms/alarm-list/alarm` list.
 New alarm objects can be created and submitted to NCS using the
 [`AlarmSink#submitAlarm(Alarm)`](../producer/AlarmSink.md#submitalarm-aff190c46329) methods.


 Instances of this class could also be returned from
 [`AlarmSource#pollAlarm(int,
 java.util.concurrent.TimeUnit)`](../consumer/AlarmSource.md#pollalarm-d491d8607d37),
 [`AlarmSource#takeAlarm()`](../consumer/AlarmSource.md#takealarm-58b71d3346fe).


 When submitting a new alarm to NCS, NCS matches the new alarm against
 the existing Alarms in the alarm list. If the new Alarm matches an entry
 in the alarm list, that entry is simply updated with the new information
 provided. The full history of alarms submitted for the same event is kept
 and can be inspected through the NCS interfaces.

 Therefore it is a desired pattern to submit alarms, even though it already
 exist in NCS.


  A unique `Alarm` instance is the combination of the following:


- *** Managed Device***
 - [`ManagedDevice`](ManagedDevice.md#manageddevice-8da1cfb0571b) 
 This is the device on which the alarm started. It may have come as an event
 from the device, or through detection on the manager side. The YANG type
 is a string.
- *** Managed Object***
 - [`ManagedObject`](ManagedObject.md#managedobject-fef83f36bfab) 
 This is a reference to the 'alarming object' that
 caused the alarm to be raised. In YANG it can be an instance-identifier, an
 object-identifier or a string.
- *** Alarm type ***
 - [`ConfIdentityRef`](../../../conf/ConfIdentityRef.md#confidentityref-1a367056e764) 
 The Alarm type is a YANG identityref. I.e. a reference to a YANG identity.
 These are extensible and defined in the YANG files.
 It is recommended to have very specific types as possible, and if it is
 not possible, use also Specific Problem. The motivation is that as far as
 possible avoid surprises for the operator with alarms that are not defined
 beforehand.
- *** Specific Problem ***
 - [`ConfBuf`](../../../conf/ConfBuf.md#confbuf-c460585d9115) 
 This is used when the 'Alarm type' cannot uniquely identify the problem.
 It is recommended to specify the alarm in a presentable text for the user
 here.


  The `Managed Device`, ` Managed object `
 `Alarm Type` and ` Specific Problem `
 constitutes a [`AlarmId`](AlarmId.md#alarmid-8dc3862f7d0c).


 There are other various information that an alarm has.



- *** Perceived Severity ***
 - [`PerceivedSeverity`](PerceivedSeverity.md#perceivedseverity-80ffc24a94f2) 
 This is the typical classification of how severe the problem is from
 the device's or objects point of view.
- *** Impacted Objects ***
 - [`ManagedObject`](ManagedObject.md#managedobject-fef83f36bfab) 
 In NCS it is possible to correlate the ManagedObject that caused the alarm
 with ManagedObjects in Services using the alarming object. These are called
 Impacted Objects. It is up to the implementor to decide if impacted objects
 shall be used and how deep they should dig in the structure to claim
 relations.
 From NCS 2.3 a "Backpointer" attribute is available on objects that have been
 set by services. This can be used here to determine Impacted Objects.
- *** Related Alarms ***
 - [`AlarmId`](AlarmId.md#alarmid-8dc3862f7d0c) 
 Other alarms caused by this alarm, or with some other relation to this alarm
 can be listed here. The YANG Alarm model uses "device", "type", and
 "managed-object" as indexing keys for alarms. Thus AlarmId contains these and
 provide a reference to the YANG list entry.
- *** Root cause objects ***
 - [`ManagedObject`](ManagedObject.md#managedobject-fef83f36bfab) 
 Objects that are candidates for raising the alarm. This is different from
 the "Managed Object" parameter which only indicates the object that raised
 the alarm. If the raising object is in a service, it may have raised the
 alarm based on the fact that interface eth0 on device c0 had to high
 packet loss. 'eth0' on 'c0' should then be presented in this list of
 possible candidates.


 The instance of this class is usually submitted in the
 [`AlarmSink#submitAlarm(Alarm)`](../producer/AlarmSink.md#submitalarm-aff190c46329)
 method to store the alarm representation in NCS.


  It is also the returned from:


- [`AlarmSource#pollAlarm(int,TimeUnit)`](../consumer/AlarmSource.md#pollalarm-d491d8607d37)
- [`AlarmSource#takeAlarm()`](../consumer/AlarmSource.md#takealarm-58b71d3346fe)
 on the consumer side

## Members

**Constructors**:

- [Alarm()](#alarm-85f095f88654)
- [Alarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, ConfBuf, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[])](#alarm-81c1058677fc)
- [Alarm(ManagedDevice, ManagedObject, ConfIdentityRef, PerceivedSeverity, ConfBuf, List<ManagedObject>, List<AlarmId>, List<ManagedObject>, ConfDatetime, Attribute[])](#alarm-35d516f7889e)

**Methods**:

- [alarmText()](#alarmtext-efe8fe4bc726)
- [equals(Object)](#equals-fcd6492e0d6c)
- [getAlarmType()](#getalarmtype-80d08d07e5c6)
- [getCustomAttributes()](#getcustomattributes-47a1386413e6)
- [getImpactedObjects()](#getimpactedobjects-5bad4ce10c30)
- [getManagedDevice()](#getmanageddevice-a92f8741d02f)
- [getManagedObject()](#getmanagedobject-2257610c0381)
- [getPerceivedSeverity()](#getperceivedseverity-45b453ff90f8)
- [getRelatedAlarms()](#getrelatedalarms-caad0a60b2e2)
- [getRootCauseObjects()](#getrootcauseobjects-73835daf51d9)
- [getSpecificProblem()](#getspecificproblem-236478d10663)
- [getTimeStamp()](#gettimestamp-f6129b80c824)
- [hashCode()](#hashcode-ef797a217903)
- [isCleared()](#iscleared-94f487388947)
- [isLastAlarm()](#islastalarm-45ec5733b904)
- [lastAlarm()](#lastalarm-b867c9cc4a2f)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### Alarm() <a href="#alarm-85f095f88654" id="alarm-85f095f88654"></a>

```java
protected Alarm()
```

### Alarm(ManagedDevice, ManagedObject, ConfIdentityRef, ConfBuf, PerceivedSeverity, ConfBuf, List&lt;ManagedObject&gt;, List&lt;AlarmId&gt;, List&lt;ManagedObject&gt;, ConfDatetime, Attribute[]) <a href="#alarm-81c1058677fc" id="alarm-81c1058677fc"></a>

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

Types: [ManagedDevice](ManagedDevice.md#manageddevice-8da1cfb0571b), [ManagedObject](ManagedObject.md#managedobject-fef83f36bfab), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [ConfBuf](../../../conf/ConfBuf.md#confbuf-c460585d9115), [PerceivedSeverity](PerceivedSeverity.md#perceivedseverity-80ffc24a94f2), [AlarmId](AlarmId.md#alarmid-8dc3862f7d0c), [ConfDatetime](../../../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8), [Attribute](Attribute.md#attribute-cb42ffd9bcdd)

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

### Alarm(ManagedDevice, ManagedObject, ConfIdentityRef, PerceivedSeverity, ConfBuf, List&lt;ManagedObject&gt;, List&lt;AlarmId&gt;, List&lt;ManagedObject&gt;, ConfDatetime, Attribute[]) <a href="#alarm-35d516f7889e" id="alarm-35d516f7889e"></a>

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

Types: [ManagedDevice](ManagedDevice.md#manageddevice-8da1cfb0571b), [ManagedObject](ManagedObject.md#managedobject-fef83f36bfab), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [PerceivedSeverity](PerceivedSeverity.md#perceivedseverity-80ffc24a94f2), [ConfBuf](../../../conf/ConfBuf.md#confbuf-c460585d9115), [AlarmId](AlarmId.md#alarmid-8dc3862f7d0c), [ConfDatetime](../../../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8), [Attribute](Attribute.md#attribute-cb42ffd9bcdd)

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

### alarmText() <a href="#alarmtext-efe8fe4bc726" id="alarmtext-efe8fe4bc726"></a>

```java
public com.tailf.conf.ConfBuf alarmText()
```

Types: [ConfBuf](../../../conf/ConfBuf.md#confbuf-c460585d9115)

**Returns:** alarm text.

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

A unique Alarm instance is the combination of [`ManagedDevice`](ManagedDevice.md#manageddevice-8da1cfb0571b),
 [`ManagedObject`](ManagedObject.md#managedobject-fef83f36bfab), (alarmtype)
 [`ConfIdentityRef`](../../../conf/ConfIdentityRef.md#confidentityref-1a367056e764) and
 (specific problem)[`ConfBuf`](../../../conf/ConfBuf.md#confbuf-c460585d9115)

**Parameters**

- `Object o`

### getAlarmType() <a href="#getalarmtype-80d08d07e5c6" id="getalarmtype-80d08d07e5c6"></a>

```java
public com.tailf.conf.ConfIdentityRef getAlarmType()
```

Types: [ConfIdentityRef](../../../conf/ConfIdentityRef.md#confidentityref-1a367056e764)

**Returns:** alarm type

### getCustomAttributes() <a href="#getcustomattributes-47a1386413e6" id="getcustomattributes-47a1386413e6"></a>

```java
public com.tailf.ncs.alarmman.common.Attribute[] getCustomAttributes()
```

Types: [Attribute](Attribute.md#attribute-cb42ffd9bcdd)

**Returns:** custom attributes.

### getImpactedObjects() <a href="#getimpactedobjects-5bad4ce10c30" id="getimpactedobjects-5bad4ce10c30"></a>

```java
public java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> getImpactedObjects()
```

Types: [ManagedObject](ManagedObject.md#managedobject-fef83f36bfab)

**Returns:** impacted objects.

### getManagedDevice() <a href="#getmanageddevice-a92f8741d02f" id="getmanageddevice-a92f8741d02f"></a>

```java
public com.tailf.ncs.alarmman.common.ManagedDevice getManagedDevice()
```

Types: [ManagedDevice](ManagedDevice.md#manageddevice-8da1cfb0571b)

**Returns:** managed device.

### getManagedObject() <a href="#getmanagedobject-2257610c0381" id="getmanagedobject-2257610c0381"></a>

```java
public com.tailf.ncs.alarmman.common.ManagedObject getManagedObject()
```

Types: [ManagedObject](ManagedObject.md#managedobject-fef83f36bfab)

**Returns:** managed object.

### getPerceivedSeverity() <a href="#getperceivedseverity-45b453ff90f8" id="getperceivedseverity-45b453ff90f8"></a>

```java
public com.tailf.ncs.alarmman.common.PerceivedSeverity getPerceivedSeverity()
```

Types: [PerceivedSeverity](PerceivedSeverity.md#perceivedseverity-80ffc24a94f2)

**Returns:** perceived severity.

### getRelatedAlarms() <a href="#getrelatedalarms-caad0a60b2e2" id="getrelatedalarms-caad0a60b2e2"></a>

```java
public java.util.List<com.tailf.ncs.alarmman.common.AlarmId> getRelatedAlarms()
```

Types: [AlarmId](AlarmId.md#alarmid-8dc3862f7d0c)

**Returns:** related alarms.

### getRootCauseObjects() <a href="#getrootcauseobjects-73835daf51d9" id="getrootcauseobjects-73835daf51d9"></a>

```java
public java.util.List<com.tailf.ncs.alarmman.common.ManagedObject> getRootCauseObjects()
```

Types: [ManagedObject](ManagedObject.md#managedobject-fef83f36bfab)

**Returns:** root cause objects.

### getSpecificProblem() <a href="#getspecificproblem-236478d10663" id="getspecificproblem-236478d10663"></a>

```java
public com.tailf.conf.ConfBuf getSpecificProblem()
```

Types: [ConfBuf](../../../conf/ConfBuf.md#confbuf-c460585d9115)

### getTimeStamp() <a href="#gettimestamp-f6129b80c824" id="gettimestamp-f6129b80c824"></a>

```java
public com.tailf.conf.ConfDatetime getTimeStamp()
```

Types: [ConfDatetime](../../../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8)

**Returns:** timestamp of the alarm.

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### isCleared() <a href="#iscleared-94f487388947" id="iscleared-94f487388947"></a>

```java
public boolean isCleared()
```

Return `true` if this alarm has been cleared by
 the underlying resource.

 Idicates the clearance state of this alarm.
 An alarm might toggle from active alarm to cleared alarm and back to
 active again.

**Returns:** true if this alarm has been cleared.

### isLastAlarm() <a href="#islastalarm-45ec5733b904" id="islastalarm-45ec5733b904"></a>

```java
public boolean isLastAlarm()
```

### lastAlarm() <a href="#lastalarm-b867c9cc4a2f" id="lastalarm-b867c9cc4a2f"></a>

```java
public static com.tailf.ncs.alarmman.common.Alarm lastAlarm()
```

Types: [Alarm](Alarm.md#alarm-e07586c3430f)

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
