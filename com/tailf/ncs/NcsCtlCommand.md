<a id="s-NcsCtlCommand"></a>
# NcsCtlCommand

```java
public class com.tailf.ncs.NcsCtlCommand
```

Ncs Java VM protocol command representation class

## Members

**Constructors**:

- [NcsCtlCommand(ConfETuple, Socket)](#s-NcsCtlCommand-1)

**Fields**:

- [ADD_PACKAGES](#s-ADD_PACKAGES)
- [CLEAR_MOUNT_ID_CACHE](#s-CLEAR_MOUNT_ID_CACHE)
- [command](#s-command)
- [data](#s-data)
- [DONE_LOADING](#s-DONE_LOADING)
- [INIT_JVM](#s-INIT_JVM)
- [INSTANTIATE_COMPONENT](#s-INSTANTIATE_COMPONENT)
- [LOAD_PACKAGE](#s-LOAD_PACKAGE)
- [LOAD_SHARED_JARS](#s-LOAD_SHARED_JARS)
- [REDEPLOY_PACKAGE](#s-REDEPLOY_PACKAGE)
- [RELOAD_SCHEMA](#s-RELOAD_SCHEMA)
- [requestId](#s-requestId)
- [RERUN](#s-RERUN)
- [SELFTEST](#s-SELFTEST)
- [STATUS](#s-STATUS)
- [STOP_VM](#s-STOP_VM)
- [UNLOAD_ALL](#s-UNLOAD_ALL)
- [UNLOAD_PACKAGE](#s-UNLOAD_PACKAGE)

**Methods**:

- [getCommandString()](#s-getCommandString)
- [reply(boolean, ConfETuple)](#s-reply)
- [reply(boolean, String)](#s-reply-1)
- [toString()](#s-toString)

## Constructors

<a id="s-NcsCtlCommand-1"></a>
### NcsCtlCommand(ConfETuple, Socket)

```java
public NcsCtlCommand(com.tailf.proto.ConfETuple t, java.net.Socket socket)
```

Types: [ConfETuple](../proto/ConfETuple.md#s-ConfETuple)

**Parameters**

- `com.tailf.proto.ConfETuple t`
- `java.net.Socket socket`


## Fields

<a id="s-ADD_PACKAGES"></a>
### ADD_PACKAGES

```java
public static final int ADD_PACKAGES = 16;
```

<a id="s-CLEAR_MOUNT_ID_CACHE"></a>
### CLEAR_MOUNT_ID_CACHE

```java
public static final int CLEAR_MOUNT_ID_CACHE = 15;
```

<a id="s-command"></a>
### command

```java
public int command = null;
```

<a id="s-data"></a>
### data

```java
public com.tailf.proto.ConfEObject data = null;
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

<a id="s-DONE_LOADING"></a>
### DONE_LOADING

```java
public static final int DONE_LOADING = 10;
```

<a id="s-INIT_JVM"></a>
### INIT_JVM

```java
public static final int INIT_JVM = 13;
```

<a id="s-INSTANTIATE_COMPONENT"></a>
### INSTANTIATE_COMPONENT

```java
public static final int INSTANTIATE_COMPONENT = 12;
```

<a id="s-LOAD_PACKAGE"></a>
### LOAD_PACKAGE

```java
public static final int LOAD_PACKAGE = 9;
```

<a id="s-LOAD_SHARED_JARS"></a>
### LOAD_SHARED_JARS

```java
public static final int LOAD_SHARED_JARS = 8;
```

<a id="s-REDEPLOY_PACKAGE"></a>
### REDEPLOY_PACKAGE

```java
public static final int REDEPLOY_PACKAGE = 11;
```

<a id="s-RELOAD_SCHEMA"></a>
### RELOAD_SCHEMA

```java
public static final int RELOAD_SCHEMA = 6;
```

<a id="s-requestId"></a>
### requestId

```java
public int requestId = null;
```

<a id="s-RERUN"></a>
### RERUN

```java
public static final int RERUN = 1;
```

<a id="s-SELFTEST"></a>
### SELFTEST

```java
public static final int SELFTEST = 2;
```

<a id="s-STATUS"></a>
### STATUS

```java
public static final int STATUS = 4;
```

<a id="s-STOP_VM"></a>
### STOP_VM

```java
public static final int STOP_VM = 3;
```

<a id="s-UNLOAD_ALL"></a>
### UNLOAD_ALL

```java
public static final int UNLOAD_ALL = 14;
```

<a id="s-UNLOAD_PACKAGE"></a>
### UNLOAD_PACKAGE

```java
public static final int UNLOAD_PACKAGE = 7;
```


## Methods

<a id="s-getCommandString"></a>
### getCommandString()

```java
public String getCommandString()
```

<a id="s-reply"></a>
### reply(boolean, ConfETuple)

```java
public void reply(boolean b, com.tailf.proto.ConfETuple obj) throws java.io.IOException
```

Types: [ConfETuple](../proto/ConfETuple.md#s-ConfETuple)

**Parameters**

- `boolean b`
- `com.tailf.proto.ConfETuple obj`

<a id="s-reply-1"></a>
### reply(boolean, String)

```java
public void reply(boolean b, String str) throws java.io.IOException
```

**Parameters**

- `boolean b`
- `String str`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
