# ManagedObject <a href="#managedobject-fef83f36bfab" id="managedobject-fef83f36bfab"></a>

```java
public class com.tailf.ncs.alarmman.common.ManagedObject
```

The Managed object is the object within a managed device that is
 a component of an [`Alarm`](Alarm.md#alarm-e07586c3430f).


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

- [ManagedObject(ConfBuf)](#managedobject-efd4fa3079cc)
- [ManagedObject(ConfObjectRef)](#managedobject-2308f0fca056)
- [ManagedObject(ConfOID)](#managedobject-fb037f79e02d)
- [ManagedObject(ConfPath)](#managedobject-ed89c5578582)
- [ManagedObject(ConfValue)](#managedobject-994d60b828f1)
- [ManagedObject(String)](#managedobject-de2707ffa6da)
- [ManagedObject(String, MountIdInterface)](#managedobject-531f3424d0f3)

**Methods**:

- [equals(Object)](#equals-fcd6492e0d6c)
- [getAsConfValue()](#getasconfvalue-7d0bad95ad00)
- [hashCode()](#hashcode-ef797a217903)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### ManagedObject(ConfBuf) <a href="#managedobject-efd4fa3079cc" id="managedobject-efd4fa3079cc"></a>

```java
public ManagedObject(com.tailf.conf.ConfBuf value)
```

Types: [ConfBuf](../../../conf/ConfBuf.md#confbuf-c460585d9115)

Creates a ManagedObject as a general string.

**Parameters**

- `com.tailf.conf.ConfBuf value` - the ConfBuf representing the ManagedObject

### ManagedObject(ConfObjectRef) <a href="#managedobject-2308f0fca056" id="managedobject-2308f0fca056"></a>

```java
public ManagedObject(com.tailf.conf.ConfObjectRef value)
```

Types: [ConfObjectRef](../../../conf/ConfObjectRef.md#confobjectref-6b7c225d0d3d)

Creates a ManagedObject as a ConfObjectRef.

**Parameters**

- `com.tailf.conf.ConfObjectRef value` - the ConfObjectRef representing the ManagedObject

### ManagedObject(ConfOID) <a href="#managedobject-fb037f79e02d" id="managedobject-fb037f79e02d"></a>

```java
public ManagedObject(com.tailf.conf.ConfOID value)
```

Types: [ConfOID](../../../conf/ConfOID.md#confoid-11dc95a517d2)

Creates a ManagedObject as a ConfOID.

**Parameters**

- `com.tailf.conf.ConfOID value` - the ConfOID representing the ManagedObject

### ManagedObject(ConfPath) <a href="#managedobject-ed89c5578582" id="managedobject-ed89c5578582"></a>

```java
public ManagedObject(com.tailf.conf.ConfPath value) throws com.tailf.conf.ConfException
```

Types: [ConfPath](../../../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../../../conf/ConfException.md#confexception-baeaab99f7f9)

Creates a ManagedObject as a ConfObjectRef defined from a ConfPath.

**Parameters**

- `com.tailf.conf.ConfPath value` - the ConfPath representing the ManagedObject

### ManagedObject(ConfValue) <a href="#managedobject-994d60b828f1" id="managedobject-994d60b828f1"></a>

```java
public ManagedObject(com.tailf.conf.ConfValue value)
```

Types: [ConfValue](../../../conf/ConfValue.md#confvalue-769292781c7d)

**Parameters**

- `com.tailf.conf.ConfValue value` - A value matching the typedef managed-object-t
              in tailf-ncs-alarms.yang. Specifically,
              the value can have one of the following types:
              [`ConfBuf`](../../../conf/ConfBuf.md#confbuf-c460585d9115),
              [`ConfObjectRef`](../../../conf/ConfObjectRef.md#confobjectref-6b7c225d0d3d),
              [`ConfOID`](../../../conf/ConfOID.md#confoid-11dc95a517d2)

**Throws**

- `IllegalArgumentException` - If the supplied value
         is not of one of the types listed above

### ManagedObject(String) <a href="#managedobject-de2707ffa6da" id="managedobject-de2707ffa6da"></a>

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
              [`ConfBuf`](../../../conf/ConfBuf.md#confbuf-c460585d9115),
              [`ConfObjectRef`](../../../conf/ConfObjectRef.md#confobjectref-6b7c225d0d3d),
              [`ConfOID`](../../../conf/ConfOID.md#confoid-11dc95a517d2)

### ManagedObject(String, MountIdInterface) <a href="#managedobject-531f3424d0f3" id="managedobject-531f3424d0f3"></a>

```java
public ManagedObject(String value, com.tailf.conf.MountIdInterface mountGetter)
```

Types: [MountIdInterface](../../../conf/MountIdInterface.md#mountidinterface-113d1b54dae0)

**Parameters**

- `String value`
- `com.tailf.conf.MountIdInterface mountGetter`


## Methods

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getAsConfValue() <a href="#getasconfvalue-7d0bad95ad00" id="getasconfvalue-7d0bad95ad00"></a>

```java
public com.tailf.conf.ConfValue getAsConfValue()
```

Types: [ConfValue](../../../conf/ConfValue.md#confvalue-769292781c7d)

Get the ConfValue representation of this managedObject.
 Since the modeled managedObject is a union of ConfBuf,
 ConfObjectRef and ConfOID, the returned value can be
 either one of these three.

**Returns:** ConfValue the ConfValue representation of this ManagedObject

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

**See also:** [`ManagedObject#toString()`](ManagedObject.md#tostring-e9d48c5503ef)
