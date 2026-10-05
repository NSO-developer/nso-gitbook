<a id="s-ServiceLog"></a>
# ServiceLog

```java
public class com.tailf.dp.services.ServiceLog
```

This class contains methods to write service log entries.

## Members

**Constructors**:

- [ServiceLog()](#s-ServiceLog-1)

**Methods**:

- [debug(NavuNode, String, ConfIdentityRef)](#s-debug)
- [error(NavuNode, String, ConfIdentityRef)](#s-error)
- [info(NavuNode, String, ConfIdentityRef)](#s-info)
- [trace(NavuNode, String, ConfIdentityRef)](#s-trace)
- [warn(NavuNode, String, ConfIdentityRef)](#s-warn)

## Constructors

<a id="s-ServiceLog-1"></a>
### ServiceLog()

```java
public ServiceLog()
```


## Methods

<a id="s-debug"></a>
### debug(NavuNode, String, ConfIdentityRef)

```java
public static void debug(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#s-NavuNode), [ConfIdentityRef](../../conf/ConfIdentityRef.md#s-ConfIdentityRef), [ConfException](../../conf/ConfException.md#s-ConfException)

Write service log entry with level debug.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`

<a id="s-error"></a>
### error(NavuNode, String, ConfIdentityRef)

```java
public static void error(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#s-NavuNode), [ConfIdentityRef](../../conf/ConfIdentityRef.md#s-ConfIdentityRef), [ConfException](../../conf/ConfException.md#s-ConfException)

Write service log entry with level error.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`

<a id="s-info"></a>
### info(NavuNode, String, ConfIdentityRef)

```java
public static void info(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#s-NavuNode), [ConfIdentityRef](../../conf/ConfIdentityRef.md#s-ConfIdentityRef), [ConfException](../../conf/ConfException.md#s-ConfException)

Write service log entry with level info.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`

<a id="s-trace"></a>
### trace(NavuNode, String, ConfIdentityRef)

```java
public static void trace(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#s-NavuNode), [ConfIdentityRef](../../conf/ConfIdentityRef.md#s-ConfIdentityRef), [ConfException](../../conf/ConfException.md#s-ConfException)

Write service log entry with level trace.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`

<a id="s-warn"></a>
### warn(NavuNode, String, ConfIdentityRef)

```java
public static void warn(
    com.tailf.navu.NavuNode service,
    String msg,
    com.tailf.conf.ConfIdentityRef type
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#s-NavuNode), [ConfIdentityRef](../../conf/ConfIdentityRef.md#s-ConfIdentityRef), [ConfException](../../conf/ConfException.md#s-ConfException)

Write service log entry with level warn.

**Parameters**

- `com.tailf.navu.NavuNode service` - the path to the service
- `String msg` - the message to be logged
- `com.tailf.conf.ConfIdentityRef type` - what type of log entry this is

**Throws**

- `IOException`
- `ConfException`
