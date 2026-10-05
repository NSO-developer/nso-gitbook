# ManagedObject <a href="#cls-ManagedObject" id="cls-ManagedObject"></a>

```java
public class com.tailf.ncs.alarmman.common.ManagedObject
```

The Managed object is the object within a managed device that is
 a component of an [`Alarm`](Alarm.md#cls-Alarm).


 Managed object represents one element in the key:


 `/al:alarms/alarms/alarm-list/alarm/device
       /al:alarms/alarms/alarm-list/alarm/type
       /al:alarms/alarms/alarm-list/alarm/managed-object
       /al:alarms/alarms/alarm-list/alarm/specific-problem
  `
  in the alarm list: `/al:alarms/alarm-list/alarm`.



 The `ManagedObject` is a union of the types:


- ***ConfObjectRef***
 - Which is the YANG type instance-identifier
- ***ConfOID*** - Which is the YANG type object-identifier
- ***ConfBuf*** - Which is the YANG type string




  Which means that there is a constructor for each of the above
  types for creating an instance of `ManagedObject`.


  It is important to choose the correct type for the object being
  created. Specifically, the ConfBuf type MUST NOT be used if the
  type is really an instance-identifier or object-identifier.  The reason
  for this is that when such an object is passed back-and-forth over
  text-based protocols such as NETCONF, WebUI, and REST, the conversion
  from the internal representation to string and then back to the internal
  representation MUST result in the same internal representation as the
  original object had.

## Members

**Constructors**:

- [ManagedObject(ConfBuf)](#m-ManagedObject-efd4fa3079cc)
- [ManagedObject(ConfObjectRef)](#m-ManagedObject-2308f0fca056)
- [ManagedObject(ConfOID)](#m-ManagedObject-fb037f79e02d)
- [ManagedObject(ConfPath)](#m-ManagedObject-ed89c5578582)
- [ManagedObject(ConfValue)](#m-ManagedObject-994d60b828f1)
- [ManagedObject(String)](#m-ManagedObject-de2707ffa6da)
- [ManagedObject(String, MountIdInterface)](#m-ManagedObject-531f3424d0f3)

**Methods**:

- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getAsConfValue()](#m-getAsConfValue-7d0bad95ad00)
- [hashCode()](#m-hashCode-ef797a217903)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ManagedObject(ConfBuf) <a href="#m-ManagedObject-efd4fa3079cc" id="m-ManagedObject-efd4fa3079cc"></a>

```java
public ManagedObject(com.tailf.conf.ConfBuf value)
```

Types: [ConfBuf](../../../conf/ConfBuf.md#cls-ConfBuf)

Creates a ManagedObject as a general string.

**Parameters**

- `com.tailf.conf.ConfBuf value` - the ConfBuf representing the ManagedObject

### ManagedObject(ConfObjectRef) <a href="#m-ManagedObject-2308f0fca056" id="m-ManagedObject-2308f0fca056"></a>

```java
public ManagedObject(com.tailf.conf.ConfObjectRef value)
```

Types: [ConfObjectRef](../../../conf/ConfObjectRef.md#cls-ConfObjectRef)

Creates a ManagedObject as a ConfObjectRef.

**Parameters**

- `com.tailf.conf.ConfObjectRef value` - the ConfObjectRef representing the ManagedObject

### ManagedObject(ConfOID) <a href="#m-ManagedObject-fb037f79e02d" id="m-ManagedObject-fb037f79e02d"></a>

```java
public ManagedObject(com.tailf.conf.ConfOID value)
```

Types: [ConfOID](../../../conf/ConfOID.md#cls-ConfOID)

Creates a ManagedObject as a ConfOID.

**Parameters**

- `com.tailf.conf.ConfOID value` - the ConfOID representing the ManagedObject

### ManagedObject(ConfPath) <a href="#m-ManagedObject-ed89c5578582" id="m-ManagedObject-ed89c5578582"></a>

```java
public ManagedObject(com.tailf.conf.ConfPath value) throws com.tailf.conf.ConfException
```

Types: [ConfPath](../../../conf/ConfPath.md#cls-ConfPath), [ConfException](../../../conf/ConfException.md#cls-ConfException)

Creates a ManagedObject as a ConfObjectRef defined from a ConfPath.

**Parameters**

- `com.tailf.conf.ConfPath value` - the ConfPath representing the ManagedObject

### ManagedObject(ConfValue) <a href="#m-ManagedObject-994d60b828f1" id="m-ManagedObject-994d60b828f1"></a>

```java
public ManagedObject(com.tailf.conf.ConfValue value)
```

Types: [ConfValue](../../../conf/ConfValue.md#cls-ConfValue)

**Parameters**

- `com.tailf.conf.ConfValue value` - A value matching the typedef managed-object-t
              in tailf-ncs-alarms.yang. Specifically,
              the value can have one of the following types:
              [`ConfBuf`](../../../conf/ConfBuf.md#cls-ConfBuf),
              [`ConfObjectRef`](../../../conf/ConfObjectRef.md#cls-ConfObjectRef),
              [`ConfOID`](../../../conf/ConfOID.md#cls-ConfOID)

**Throws**

- `IllegalArgumentException` - If the supplied value
         is not of one of the types listed above

### ManagedObject(String) <a href="#m-ManagedObject-de2707ffa6da" id="m-ManagedObject-de2707ffa6da"></a>

```java
public ManagedObject(String value)
```

Constructor that takes a string representation of one of the below
  listed types. The string is first checked to see if it represents an
  XPath and in this case a ConfObjectRef is set. Otherwise, the string
  is checked to see if it represents an OID and if so a ConfOID is set.
  Otherwise a ConfBuf is set.

**Parameters**

- `String value` - String representation of typedef managed-object-t
              in tailf-ncs-alarms.yang. Specifically, the value can be
              a string representation of one of the following types:
              [`ConfBuf`](../../../conf/ConfBuf.md#cls-ConfBuf),
              [`ConfObjectRef`](../../../conf/ConfObjectRef.md#cls-ConfObjectRef),
              [`ConfOID`](../../../conf/ConfOID.md#cls-ConfOID)

### ManagedObject(String, MountIdInterface) <a href="#m-ManagedObject-531f3424d0f3" id="m-ManagedObject-531f3424d0f3"></a>

```java
public ManagedObject(String value, com.tailf.conf.MountIdInterface mountGetter)
```

Types: [MountIdInterface](../../../conf/MountIdInterface.md#cls-MountIdInterface)

**Parameters**

- `String value`
- `com.tailf.conf.MountIdInterface mountGetter`


## Methods

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getAsConfValue() <a href="#m-getAsConfValue-7d0bad95ad00" id="m-getAsConfValue-7d0bad95ad00"></a>

```java
public com.tailf.conf.ConfValue getAsConfValue()
```

Types: [ConfValue](../../../conf/ConfValue.md#cls-ConfValue)

Get the ConfValue representation of this managedObject.
 Since the modeled managedObject is a union of ConfBuf,
 ConfObjectRef and ConfOID, the returned value can be
 either one of these three.

**Returns:** ConfValue the ConfValue representation of this ManagedObject

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

**See also:** [`ManagedObject#toString()`](ManagedObject.md#m-toString-e9d48c5503ef)
