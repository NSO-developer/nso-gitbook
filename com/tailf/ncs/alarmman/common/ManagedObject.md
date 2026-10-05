<a id="s-ManagedObject"></a>
# ManagedObject

```java
public class com.tailf.ncs.alarmman.common.ManagedObject
```

The Managed object is the object within a managed device that is
 a component of an [`Alarm`](Alarm.md#s-Alarm).


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

- [ManagedObject(ConfBuf)](#s-ManagedObject-1)
- [ManagedObject(ConfObjectRef)](#s-ManagedObject-2)
- [ManagedObject(ConfOID)](#s-ManagedObject-3)
- [ManagedObject(ConfPath)](#s-ManagedObject-4)
- [ManagedObject(ConfValue)](#s-ManagedObject-5)
- [ManagedObject(String)](#s-ManagedObject-6)
- [ManagedObject(String, MountIdInterface)](#s-ManagedObject-7)

**Methods**:

- [equals(Object)](#s-equals)
- [getAsConfValue()](#s-getAsConfValue)
- [hashCode()](#s-hashCode)
- [toString()](#s-toString)

## Constructors

<a id="s-ManagedObject-1"></a>
### ManagedObject(ConfBuf)

```java
public ManagedObject(com.tailf.conf.ConfBuf value)
```

Types: [ConfBuf](../../../conf/ConfBuf.md#s-ConfBuf)

Creates a ManagedObject as a general string.

**Parameters**

- `com.tailf.conf.ConfBuf value` - the ConfBuf representing the ManagedObject

<a id="s-ManagedObject-2"></a>
### ManagedObject(ConfObjectRef)

```java
public ManagedObject(com.tailf.conf.ConfObjectRef value)
```

Types: [ConfObjectRef](../../../conf/ConfObjectRef.md#s-ConfObjectRef)

Creates a ManagedObject as a ConfObjectRef.

**Parameters**

- `com.tailf.conf.ConfObjectRef value` - the ConfObjectRef representing the ManagedObject

<a id="s-ManagedObject-3"></a>
### ManagedObject(ConfOID)

```java
public ManagedObject(com.tailf.conf.ConfOID value)
```

Types: [ConfOID](../../../conf/ConfOID.md#s-ConfOID)

Creates a ManagedObject as a ConfOID.

**Parameters**

- `com.tailf.conf.ConfOID value` - the ConfOID representing the ManagedObject

<a id="s-ManagedObject-4"></a>
### ManagedObject(ConfPath)

```java
public ManagedObject(com.tailf.conf.ConfPath value) throws com.tailf.conf.ConfException
```

Types: [ConfPath](../../../conf/ConfPath.md#s-ConfPath), [ConfException](../../../conf/ConfException.md#s-ConfException)

Creates a ManagedObject as a ConfObjectRef defined from a ConfPath.

**Parameters**

- `com.tailf.conf.ConfPath value` - the ConfPath representing the ManagedObject

<a id="s-ManagedObject-5"></a>
### ManagedObject(ConfValue)

```java
public ManagedObject(com.tailf.conf.ConfValue value)
```

Types: [ConfValue](../../../conf/ConfValue.md#s-ConfValue)

**Parameters**

- `com.tailf.conf.ConfValue value` - A value matching the typedef managed-object-t
              in tailf-ncs-alarms.yang. Specifically,
              the value can have one of the following types:
              [`ConfBuf`](../../../conf/ConfBuf.md#s-ConfBuf),
              [`ConfObjectRef`](../../../conf/ConfObjectRef.md#s-ConfObjectRef),
              [`ConfOID`](../../../conf/ConfOID.md#s-ConfOID)

**Throws**

- `IllegalArgumentException` - If the supplied value
         is not of one of the types listed above

<a id="s-ManagedObject-6"></a>
### ManagedObject(String)

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
              [`ConfBuf`](../../../conf/ConfBuf.md#s-ConfBuf),
              [`ConfObjectRef`](../../../conf/ConfObjectRef.md#s-ConfObjectRef),
              [`ConfOID`](../../../conf/ConfOID.md#s-ConfOID)

<a id="s-ManagedObject-7"></a>
### ManagedObject(String, MountIdInterface)

```java
public ManagedObject(String value, com.tailf.conf.MountIdInterface mountGetter)
```

Types: [MountIdInterface](../../../conf/MountIdInterface.md#s-MountIdInterface)

**Parameters**

- `String value`
- `com.tailf.conf.MountIdInterface mountGetter`


## Methods

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="s-getAsConfValue"></a>
### getAsConfValue()

```java
public com.tailf.conf.ConfValue getAsConfValue()
```

Types: [ConfValue](../../../conf/ConfValue.md#s-ConfValue)

Get the ConfValue representation of this managedObject.
 Since the modeled managedObject is a union of ConfBuf,
 ConfObjectRef and ConfOID, the returned value can be
 either one of these three.

**Returns:** ConfValue the ConfValue representation of this ManagedObject

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

**See also:** [`ManagedObject#toString()`](ManagedObject.md#s-toString)
