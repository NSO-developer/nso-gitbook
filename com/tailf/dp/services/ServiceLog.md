# ServiceLog <a href="#servicelog-e6fa4f1a1851" id="servicelog-e6fa4f1a1851"></a>

```java
public class com.tailf.dp.services.ServiceLog
```

This class contains methods to write service log entries.

## Members

**Constructors**:

- [ServiceLog()](#servicelog-e0ce7e0be510)

**Methods**:

- [debug(NavuNode, String, ConfIdentityRef)](#debug-39896980ab6c)
- [error(NavuNode, String, ConfIdentityRef)](#error-36ea172332a6)
- [info(NavuNode, String, ConfIdentityRef)](#info-4b3af861e27b)
- [trace(NavuNode, String, ConfIdentityRef)](#trace-678d3c696ad3)
- [warn(NavuNode, String, ConfIdentityRef)](#warn-34f7ad4bc513)

## Constructors

### ServiceLog() <a href="#servicelog-e0ce7e0be510" id="servicelog-e0ce7e0be510"></a>

```java
public ServiceLog()
```


## Methods

### debug(NavuNode, String, ConfIdentityRef) <a href="#debug-39896980ab6c" id="debug-39896980ab6c"></a>

```java
public static void debug(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [ConfIdentityRef](../../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Write service log entry with level debug.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`

### error(NavuNode, String, ConfIdentityRef) <a href="#error-36ea172332a6" id="error-36ea172332a6"></a>

```java
public static void error(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [ConfIdentityRef](../../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Write service log entry with level error.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`

### info(NavuNode, String, ConfIdentityRef) <a href="#info-4b3af861e27b" id="info-4b3af861e27b"></a>

```java
public static void info(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [ConfIdentityRef](../../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Write service log entry with level info.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`

### trace(NavuNode, String, ConfIdentityRef) <a href="#trace-678d3c696ad3" id="trace-678d3c696ad3"></a>

```java
public static void trace(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [ConfIdentityRef](../../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Write service log entry with level trace.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`

### warn(NavuNode, String, ConfIdentityRef) <a href="#warn-34f7ad4bc513" id="warn-34f7ad4bc513"></a>

```java
public static void warn(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [ConfIdentityRef](../../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Write service log entry with level warn.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`
