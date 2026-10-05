# AlarmId <a href="#alarmid-8dc3862f7d0c" id="alarmid-8dc3862f7d0c"></a>

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

- [AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject)](#alarmid-f411e7ef5feb)
- [AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject, ConfBuf)](#alarmid-ad5c8bdf2045)
- [AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject, String)](#alarmid-76778f74e5e5)

**Methods**:

- [equals(Object)](#equals-fcd6492e0d6c)
- [getAlarmType()](#getalarmtype-80d08d07e5c6)
- [getManagedDevice()](#getmanageddevice-a92f8741d02f)
- [getManagedObject()](#getmanagedobject-2257610c0381)
- [getSpecificProblem()](#getspecificproblem-236478d10663)
- [hashCode()](#hashcode-ef797a217903)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject) <a href="#alarmid-f411e7ef5feb" id="alarmid-f411e7ef5feb"></a>

```java
public AlarmId(
    com.tailf.ncs.alarmman.common.ManagedDevice managedDevice,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.ManagedObject managedObject
)
```

Types: [ManagedDevice](ManagedDevice.md#manageddevice-8da1cfb0571b), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [ManagedObject](ManagedObject.md#managedobject-fef83f36bfab)

Constructs an `AlarmId` with `specificProblem`
 set to the empty string "".

**Parameters**

- `com.tailf.ncs.alarmman.common.ManagedDevice managedDevice` - The managed device
- `com.tailf.conf.ConfIdentityRef alarmType` - Alarm type
- `com.tailf.ncs.alarmman.common.ManagedObject managedObject` - The managed object

### AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject, ConfBuf) <a href="#alarmid-ad5c8bdf2045" id="alarmid-ad5c8bdf2045"></a>

```java
public AlarmId(
    com.tailf.ncs.alarmman.common.ManagedDevice managedDevice,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.ManagedObject managedObject,
    com.tailf.conf.ConfBuf specificProblem
)
```

Types: [ManagedDevice](ManagedDevice.md#manageddevice-8da1cfb0571b), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [ManagedObject](ManagedObject.md#managedobject-fef83f36bfab), [ConfBuf](../../../conf/ConfBuf.md#confbuf-c460585d9115)

Constructs an AlarmId with the specified managed device, alarm type,
 managed object, and ConfBuf specific problem.

**Parameters**

- `com.tailf.ncs.alarmman.common.ManagedDevice managedDevice` - The managed device
- `com.tailf.conf.ConfIdentityRef alarmType` - The alarm type identity reference
- `com.tailf.ncs.alarmman.common.ManagedObject managedObject` - The managed object
- `com.tailf.conf.ConfBuf specificProblem` - The specific problem as ConfBuf

### AlarmId(ManagedDevice, ConfIdentityRef, ManagedObject, String) <a href="#alarmid-76778f74e5e5" id="alarmid-76778f74e5e5"></a>

```java
public AlarmId(
    com.tailf.ncs.alarmman.common.ManagedDevice managedDevice,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.ManagedObject managedObject,
    String specificProblem
)
```

Types: [ManagedDevice](ManagedDevice.md#manageddevice-8da1cfb0571b), [ConfIdentityRef](../../../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [ManagedObject](ManagedObject.md#managedobject-fef83f36bfab)

Constructs an `AlarmId` with the specified properties.

**Parameters**

- `com.tailf.ncs.alarmman.common.ManagedDevice managedDevice` - The managed device
- `com.tailf.conf.ConfIdentityRef alarmType` - Alarm type
- `com.tailf.ncs.alarmman.common.ManagedObject managedObject` - The managed object
- `String specificProblem` - The Specific problem


## Methods

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

A unique Alarm instance is the combination of a [`ManagedDevice`](ManagedDevice.md#manageddevice-8da1cfb0571b),
 a [`ManagedObject`](ManagedObject.md#managedobject-fef83f36bfab), an alarm-type ([`ConfIdentityRef`](../../../conf/ConfIdentityRef.md#confidentityref-1a367056e764)) and
 a specific-problem ([`ConfBuf`](../../../conf/ConfBuf.md#confbuf-c460585d9115)).


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

### getAlarmType() <a href="#getalarmtype-80d08d07e5c6" id="getalarmtype-80d08d07e5c6"></a>

```java
public com.tailf.conf.ConfIdentityRef getAlarmType()
```

Types: [ConfIdentityRef](../../../conf/ConfIdentityRef.md#confidentityref-1a367056e764)

Gets the alarm type identity reference.

**Returns:** ConfIdentityRef the alarm type

### getManagedDevice() <a href="#getmanageddevice-a92f8741d02f" id="getmanageddevice-a92f8741d02f"></a>

```java
public com.tailf.ncs.alarmman.common.ManagedDevice getManagedDevice()
```

Types: [ManagedDevice](ManagedDevice.md#manageddevice-8da1cfb0571b)

Gets the managed device associated with this alarm.

**Returns:** ManagedDevice the managed device

### getManagedObject() <a href="#getmanagedobject-2257610c0381" id="getmanagedobject-2257610c0381"></a>

```java
public com.tailf.ncs.alarmman.common.ManagedObject getManagedObject()
```

Types: [ManagedObject](ManagedObject.md#managedobject-fef83f36bfab)

Gets the managed object associated with this alarm.

**Returns:** ManagedObject the managed object

### getSpecificProblem() <a href="#getspecificproblem-236478d10663" id="getspecificproblem-236478d10663"></a>

```java
public String getSpecificProblem()
```

Gets the specific problem string for this alarm.

**Returns:** String the specific problem description

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

Returns a hash code value for this AlarmId. The hash code is computed
 based on all four identifying properties.

**Returns:** int hash code value

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Returns a string representation of this AlarmId.

**Returns:** String formatted string containing all alarm identifier
  components
