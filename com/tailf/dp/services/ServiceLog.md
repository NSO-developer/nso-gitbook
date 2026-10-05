<a id="cls-ServiceLog"></a>
# ServiceLog

```java
public class com.tailf.dp.services.ServiceLog
```

This class contains methods to write service log entries.

## Members

**Constructors**:

- [ServiceLog()](#m-servicelog-e0ce7e0be510)

**Methods**:

- [debug(NavuNode, String, ConfIdentityRef)](#m-debug-39896980ab6c)
- [error(NavuNode, String, ConfIdentityRef)](#m-error-36ea172332a6)
- [info(NavuNode, String, ConfIdentityRef)](#m-info-4b3af861e27b)
- [trace(NavuNode, String, ConfIdentityRef)](#m-trace-678d3c696ad3)
- [warn(NavuNode, String, ConfIdentityRef)](#m-warn-34f7ad4bc513)

## Constructors

<a id="m-servicelog-e0ce7e0be510"></a>
### ServiceLog()

```java
public ServiceLog()
```


## Methods

<a id="m-debug-39896980ab6c"></a>
### debug(NavuNode, String, ConfIdentityRef)

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

<a id="m-error-36ea172332a6"></a>
### error(NavuNode, String, ConfIdentityRef)

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

<a id="m-info-4b3af861e27b"></a>
### info(NavuNode, String, ConfIdentityRef)

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

<a id="m-trace-678d3c696ad3"></a>
### trace(NavuNode, String, ConfIdentityRef)

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

<a id="m-warn-34f7ad4bc513"></a>
### warn(NavuNode, String, ConfIdentityRef)

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
