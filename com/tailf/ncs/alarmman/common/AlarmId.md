<a id="cls-AlarmId"></a>
# AlarmId

```java
public class com.tailf.ncs.alarmman.common.AlarmId
```

Represents the unique identity of an NCS alarm. An NCS alarm is uniquely
 identified by the following properties:



- managed-device
- alarm-type
- managed-object
- specific-problem

## Members

**Constructors**:

- [AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject)](#m-alarmid-f411e7ef5feb)
- [AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject, ConfBuf)](#m-alarmid-ad5c8bdf2045)
- [AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject, String)](#m-alarmid-76778f74e5e5)

**Methods**:

- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getAlarmType()](#m-getalarmtype-80d08d07e5c6)
- [getManagedDevice()](#m-getmanageddevice-a92f8741d02f)
- [getManagedObject()](#m-getmanagedobject-2257610c0381)
- [getSpecificProblem()](#m-getspecificproblem-236478d10663)
- [hashCode()](#m-hashcode-ef797a217903)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-alarmid-f411e7ef5feb"></a>
### AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject)

```java
public AlarmId(
    com.tailf.ncs.alarmman.common.ManagedDevice managedDevice,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.ManagedObject managedObject
)
```

Types: [ManagedDevice](ManagedDevice.md#cls-ManagedDevice), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [ManagedObject](ManagedObject.md#cls-ManagedObject)

Constructs an `AlarmId` with `specificProblem`
 set to the empty string "".

**Parameters**

- `com.tailf.ncs.alarmman.common.ManagedDevice managedDevice` - The managed device
- `com.tailf.conf.ConfIdentityRef alarmType` - Alarm type
- `com.tailf.ncs.alarmman.common.ManagedObject managedObject` - The managed object

<a id="m-alarmid-ad5c8bdf2045"></a>
### AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject, ConfBuf)

```java
public AlarmId(
    com.tailf.ncs.alarmman.common.ManagedDevice managedDevice,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.ManagedObject managedObject,
    com.tailf.conf.ConfBuf specificProblem
)
```

Types: [ManagedDevice](ManagedDevice.md#cls-ManagedDevice), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [ManagedObject](ManagedObject.md#cls-ManagedObject), [ConfBuf](../../../conf/ConfBuf.md#cls-ConfBuf)

Constructs an AlarmId with the specified managed device, alarm type,
 managed object, and ConfBuf specific problem.

**Parameters**

- `com.tailf.ncs.alarmman.common.ManagedDevice managedDevice` - The managed device
- `com.tailf.conf.ConfIdentityRef alarmType` - The alarm type identity reference
- `com.tailf.ncs.alarmman.common.ManagedObject managedObject` - The managed object
- `com.tailf.conf.ConfBuf specificProblem` - The specific problem as ConfBuf

<a id="m-alarmid-76778f74e5e5"></a>
### AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject, String)

```java
public AlarmId(
    com.tailf.ncs.alarmman.common.ManagedDevice managedDevice,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.ManagedObject managedObject,
    String specificProblem
)
```

Types: [ManagedDevice](ManagedDevice.md#cls-ManagedDevice), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [ManagedObject](ManagedObject.md#cls-ManagedObject)

Constructs an `AlarmId` with the specified properties.

**Parameters**

- `com.tailf.ncs.alarmman.common.ManagedDevice managedDevice` - The managed device
- `com.tailf.conf.ConfIdentityRef alarmType` - Alarm type
- `com.tailf.ncs.alarmman.common.ManagedObject managedObject` - The managed object
- `String specificProblem` - The Specific problem


## Methods

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

A unique Alarm instance is the combination of a [`ManagedDevice`](ManagedDevice.md#cls-ManagedDevice),
 a [`ManagedObject`](ManagedObject.md#cls-ManagedObject), an alarm-type ([`ConfIdentityRef`](../../../conf/ConfIdentityRef.md#cls-ConfIdentityRef)) and
 a specific-problem ([`ConfBuf`](../../../conf/ConfBuf.md#cls-ConfBuf)).


 This method compares the specified object with this AlarmId for equality.
 Returns `true` if and only if the specified object is also an
 AlarmId and the four properties also test true for equality.


 Specifically, this implementation first checks if the specified object is
 this AlarmId. If so, it returns `true`; if not, it checks if the
 specified object is an AlarmId. If not, it returns `false`; if so,
 it compares managedDevice, managedObject, alarmType and
 specificProblem. If any one of these comparisons returns `false`,
 this method returns `false`, otherwise it returns `true`.

**Parameters**

- `Object o` - the object to be compared for equality with this AlarmId

**Returns:** `true` if the specified object is equal to this AlarmId

<a id="m-getalarmtype-80d08d07e5c6"></a>
### getAlarmType()

```java
public com.tailf.conf.ConfIdentityRef getAlarmType()
```

Types: [ConfIdentityRef](../../../conf/ConfIdentityRef.md#cls-ConfIdentityRef)

Gets the alarm type identity reference.

**Returns:** ConfIdentityRef the alarm type

<a id="m-getmanageddevice-a92f8741d02f"></a>
### getManagedDevice()

```java
public com.tailf.ncs.alarmman.common.ManagedDevice getManagedDevice()
```

Types: [ManagedDevice](ManagedDevice.md#cls-ManagedDevice)

Gets the managed device associated with this alarm.

**Returns:** ManagedDevice the managed device

<a id="m-getmanagedobject-2257610c0381"></a>
### getManagedObject()

```java
public com.tailf.ncs.alarmman.common.ManagedObject getManagedObject()
```

Types: [ManagedObject](ManagedObject.md#cls-ManagedObject)

Gets the managed object associated with this alarm.

**Returns:** ManagedObject the managed object

<a id="m-getspecificproblem-236478d10663"></a>
### getSpecificProblem()

```java
public String getSpecificProblem()
```

Gets the specific problem string for this alarm.

**Returns:** String the specific problem description

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

Returns a hash code value for this AlarmId. The hash code is computed
 based on all four identifying properties.

**Returns:** int hash code value

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Returns a string representation of this AlarmId.

**Returns:** String formatted string containing all alarm identifier
  components
