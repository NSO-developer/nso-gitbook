<a id="cls-NcsCtlCommand"></a>
# NcsCtlCommand

```java
public class com.tailf.ncs.NcsCtlCommand
```

Ncs Java VM protocol command representation class

## Members

**Constructors**:

- [NcsCtlCommand(ConfETuple, Socket)](#m-ncsctlcommand-2e93c877cc48)

**Fields**:

- [ADD_PACKAGES](#m-ADD_PACKAGES)
- [CLEAR_MOUNT_ID_CACHE](#m-CLEAR_MOUNT_ID_CACHE)
- [command](#m-command)
- [data](#m-data)
- [DONE_LOADING](#m-DONE_LOADING)
- [INIT_JVM](#m-INIT_JVM)
- [INSTANTIATE_COMPONENT](#m-INSTANTIATE_COMPONENT)
- [LOAD_PACKAGE](#m-LOAD_PACKAGE)
- [LOAD_SHARED_JARS](#m-LOAD_SHARED_JARS)
- [REDEPLOY_PACKAGE](#m-REDEPLOY_PACKAGE)
- [RELOAD_SCHEMA](#m-RELOAD_SCHEMA)
- [requestId](#m-requestId)
- [RERUN](#m-RERUN)
- [SELFTEST](#m-SELFTEST)
- [STATUS](#m-STATUS)
- [STOP_VM](#m-STOP_VM)
- [UNLOAD_ALL](#m-UNLOAD_ALL)
- [UNLOAD_PACKAGE](#m-UNLOAD_PACKAGE)

**Methods**:

- [getCommandString()](#m-getcommandstring-a5d8cbab7e7d)
- [reply(boolean, ConfETuple)](#m-reply-af85a8b7a1c5)
- [reply(boolean, String)](#m-reply-cf461c3b174d)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-ncsctlcommand-2e93c877cc48"></a>
### NcsCtlCommand(ConfETuple, Socket)

```java
public NcsCtlCommand(com.tailf.proto.ConfETuple t, java.net.Socket socket)
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple)

**Parameters**

- `com.tailf.proto.ConfETuple t`
- `java.net.Socket socket`


## Fields

<a id="m-ADD_PACKAGES"></a>
### ADD_PACKAGES

```java
public static final int ADD_PACKAGES = 16;
```

<a id="m-CLEAR_MOUNT_ID_CACHE"></a>
### CLEAR_MOUNT_ID_CACHE

```java
public static final int CLEAR_MOUNT_ID_CACHE = 15;
```

<a id="m-command"></a>
### command

```java
public int command = null;
```

<a id="m-data"></a>
### data

```java
public com.tailf.proto.ConfEObject data = null;
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

<a id="m-DONE_LOADING"></a>
### DONE_LOADING

```java
public static final int DONE_LOADING = 10;
```

<a id="m-INIT_JVM"></a>
### INIT_JVM

```java
public static final int INIT_JVM = 13;
```

<a id="m-INSTANTIATE_COMPONENT"></a>
### INSTANTIATE_COMPONENT

```java
public static final int INSTANTIATE_COMPONENT = 12;
```

<a id="m-LOAD_PACKAGE"></a>
### LOAD_PACKAGE

```java
public static final int LOAD_PACKAGE = 9;
```

<a id="m-LOAD_SHARED_JARS"></a>
### LOAD_SHARED_JARS

```java
public static final int LOAD_SHARED_JARS = 8;
```

<a id="m-REDEPLOY_PACKAGE"></a>
### REDEPLOY_PACKAGE

```java
public static final int REDEPLOY_PACKAGE = 11;
```

<a id="m-RELOAD_SCHEMA"></a>
### RELOAD_SCHEMA

```java
public static final int RELOAD_SCHEMA = 6;
```

<a id="m-requestId"></a>
### requestId

```java
public int requestId = null;
```

<a id="m-RERUN"></a>
### RERUN

```java
public static final int RERUN = 1;
```

<a id="m-SELFTEST"></a>
### SELFTEST

```java
public static final int SELFTEST = 2;
```

<a id="m-STATUS"></a>
### STATUS

```java
public static final int STATUS = 4;
```

<a id="m-STOP_VM"></a>
### STOP_VM

```java
public static final int STOP_VM = 3;
```

<a id="m-UNLOAD_ALL"></a>
### UNLOAD_ALL

```java
public static final int UNLOAD_ALL = 14;
```

<a id="m-UNLOAD_PACKAGE"></a>
### UNLOAD_PACKAGE

```java
public static final int UNLOAD_PACKAGE = 7;
```


## Methods

<a id="m-getcommandstring-a5d8cbab7e7d"></a>
### getCommandString()

```java
public String getCommandString()
```

<a id="m-reply-af85a8b7a1c5"></a>
### reply(boolean, ConfETuple)

```java
public void reply(boolean b, com.tailf.proto.ConfETuple obj) throws java.io.IOException
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple)

**Parameters**

- `boolean b`
- `com.tailf.proto.ConfETuple obj`

<a id="m-reply-cf461c3b174d"></a>
### reply(boolean, String)

```java
public void reply(boolean b, String str) throws java.io.IOException
```

**Parameters**

- `boolean b`
- `String str`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
