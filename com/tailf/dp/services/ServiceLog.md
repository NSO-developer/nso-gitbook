# ServiceLog <a href="#cls-ServiceLog" id="cls-ServiceLog"></a>

```java
public class com.tailf.dp.services.ServiceLog
```

This class contains methods to write service log entries.

## Members

**Constructors**:

- [ServiceLog()](#m-ServiceLog-e0ce7e0be510)

**Methods**:

- [debug(NavuNode, String, ConfIdentityRef)](#m-debug-39896980ab6c)
- [error(NavuNode, String, ConfIdentityRef)](#m-error-36ea172332a6)
- [info(NavuNode, String, ConfIdentityRef)](#m-info-4b3af861e27b)
- [trace(NavuNode, String, ConfIdentityRef)](#m-trace-678d3c696ad3)
- [warn(NavuNode, String, ConfIdentityRef)](#m-warn-34f7ad4bc513)

## Constructors

### ServiceLog() <a href="#m-ServiceLog-e0ce7e0be510" id="m-ServiceLog-e0ce7e0be510"></a>

```java
public ServiceLog()
```


## Methods

### debug(NavuNode, String, ConfIdentityRef) <a href="#m-debug-39896980ab6c" id="m-debug-39896980ab6c"></a>

```java
public static void debug(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [ConfIdentityRef](../../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [ConfException](../../conf/ConfException.md#cls-ConfException)

Write service log entry with level debug.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`

### error(NavuNode, String, ConfIdentityRef) <a href="#m-error-36ea172332a6" id="m-error-36ea172332a6"></a>

```java
public static void error(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [ConfIdentityRef](../../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [ConfException](../../conf/ConfException.md#cls-ConfException)

Write service log entry with level error.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`

### info(NavuNode, String, ConfIdentityRef) <a href="#m-info-4b3af861e27b" id="m-info-4b3af861e27b"></a>

```java
public static void info(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [ConfIdentityRef](../../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [ConfException](../../conf/ConfException.md#cls-ConfException)

Write service log entry with level info.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`

### trace(NavuNode, String, ConfIdentityRef) <a href="#m-trace-678d3c696ad3" id="m-trace-678d3c696ad3"></a>

```java
public static void trace(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [ConfIdentityRef](../../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [ConfException](../../conf/ConfException.md#cls-ConfException)

Write service log entry with level trace.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`

### warn(NavuNode, String, ConfIdentityRef) <a href="#m-warn-34f7ad4bc513" id="m-warn-34f7ad4bc513"></a>

```java
public static void warn(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [ConfIdentityRef](../../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [ConfException](../../conf/ConfException.md#cls-ConfException)

Write service log entry with level warn.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`
