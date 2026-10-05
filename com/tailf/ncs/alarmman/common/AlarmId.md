<a id="s-AlarmId"></a>
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

- [AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject)](#s-AlarmId-1)
- [AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject, ConfBuf)](#s-AlarmId-2)
- [AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject, String)](#s-AlarmId-3)

**Methods**:

- [equals(Object)](#s-equals)
- [getAlarmType()](#s-getAlarmType)
- [getManagedDevice()](#s-getManagedDevice)
- [getManagedObject()](#s-getManagedObject)
- [getSpecificProblem()](#s-getSpecificProblem)
- [hashCode()](#s-hashCode)
- [toString()](#s-toString)

## Constructors

<a id="s-AlarmId-1"></a>
### AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject)

```java
public AlarmId(
    com.tailf.ncs.alarmman.common.ManagedDevice managedDevice,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.ManagedObject managedObject
)
```

Types: [ManagedDevice](ManagedDevice.md#s-ManagedDevice), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#s-ConfIdentityRef), [ManagedObject](ManagedObject.md#s-ManagedObject)

Constructs an `AlarmId` with `specificProblem`
 set to the empty string "".

**Parameters**

- `com.tailf.ncs.alarmman.common.ManagedDevice managedDevice` - The managed device
- `com.tailf.conf.ConfIdentityRef alarmType` - Alarm type
- `com.tailf.ncs.alarmman.common.ManagedObject managedObject` - The managed object

<a id="s-AlarmId-2"></a>
### AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject, ConfBuf)

```java
public AlarmId(
    com.tailf.ncs.alarmman.common.ManagedDevice managedDevice,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.ManagedObject managedObject,
    com.tailf.conf.ConfBuf specificProblem
)
```

Types: [ManagedDevice](ManagedDevice.md#s-ManagedDevice), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#s-ConfIdentityRef), [ManagedObject](ManagedObject.md#s-ManagedObject), [ConfBuf](../../../conf/ConfBuf.md#s-ConfBuf)

Constructs an AlarmId with the specified managed device, alarm type,
 managed object, and ConfBuf specific problem.

**Parameters**

- `com.tailf.ncs.alarmman.common.ManagedDevice managedDevice` - The managed device
- `com.tailf.conf.ConfIdentityRef alarmType` - The alarm type identity reference
- `com.tailf.ncs.alarmman.common.ManagedObject managedObject` - The managed object
- `com.tailf.conf.ConfBuf specificProblem` - The specific problem as ConfBuf

<a id="s-AlarmId-3"></a>
### AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject, String)

```java
public AlarmId(
    com.tailf.ncs.alarmman.common.ManagedDevice managedDevice,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.ManagedObject managedObject,
    String specificProblem
)
```

Types: [ManagedDevice](ManagedDevice.md#s-ManagedDevice), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#s-ConfIdentityRef), [ManagedObject](ManagedObject.md#s-ManagedObject)

Constructs an `AlarmId` with the specified properties.

**Parameters**

- `com.tailf.ncs.alarmman.common.ManagedDevice managedDevice` - The managed device
- `com.tailf.conf.ConfIdentityRef alarmType` - Alarm type
- `com.tailf.ncs.alarmman.common.ManagedObject managedObject` - The managed object
- `String specificProblem` - The Specific problem


## Methods

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

A unique Alarm instance is the combination of a [`ManagedDevice`](ManagedDevice.md#s-ManagedDevice),
 a [`ManagedObject`](ManagedObject.md#s-ManagedObject), an alarm-type ([`ConfIdentityRef`](../../../conf/ConfIdentityRef.md#s-ConfIdentityRef)) and
 a specific-problem ([`ConfBuf`](../../../conf/ConfBuf.md#s-ConfBuf)).


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

<a id="s-getAlarmType"></a>
### getAlarmType()

```java
public com.tailf.conf.ConfIdentityRef getAlarmType()
```

Types: [ConfIdentityRef](../../../conf/ConfIdentityRef.md#s-ConfIdentityRef)

Gets the alarm type identity reference.

**Returns:** ConfIdentityRef the alarm type

<a id="s-getManagedDevice"></a>
### getManagedDevice()

```java
public com.tailf.ncs.alarmman.common.ManagedDevice getManagedDevice()
```

Types: [ManagedDevice](ManagedDevice.md#s-ManagedDevice)

Gets the managed device associated with this alarm.

**Returns:** ManagedDevice the managed device

<a id="s-getManagedObject"></a>
### getManagedObject()

```java
public com.tailf.ncs.alarmman.common.ManagedObject getManagedObject()
```

Types: [ManagedObject](ManagedObject.md#s-ManagedObject)

Gets the managed object associated with this alarm.

**Returns:** ManagedObject the managed object

<a id="s-getSpecificProblem"></a>
### getSpecificProblem()

```java
public String getSpecificProblem()
```

Gets the specific problem string for this alarm.

**Returns:** String the specific problem description

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

Returns a hash code value for this AlarmId. The hash code is computed
 based on all four identifying properties.

**Returns:** int hash code value

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Returns a string representation of this AlarmId.

**Returns:** String formatted string containing all alarm identifier
  components
