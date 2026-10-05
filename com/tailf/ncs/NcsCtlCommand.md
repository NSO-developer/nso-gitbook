# NcsCtlCommand <a href="#cls-NcsCtlCommand" id="cls-NcsCtlCommand"></a>

```java
public class com.tailf.ncs.NcsCtlCommand
```

Ncs Java VM protocol command representation class

## Members

**Constructors**:

- [NcsCtlCommand(ConfETuple, Socket)](#m-NcsCtlCommand-2e93c877cc48)

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

- [getCommandString()](#m-getCommandString-a5d8cbab7e7d)
- [reply(boolean, ConfETuple)](#m-reply-af85a8b7a1c5)
- [reply(boolean, String)](#m-reply-cf461c3b174d)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### NcsCtlCommand(ConfETuple, Socket) <a href="#m-NcsCtlCommand-2e93c877cc48" id="m-NcsCtlCommand-2e93c877cc48"></a>

```java
public NcsCtlCommand(com.tailf.proto.ConfETuple t, java.net.Socket socket)
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple)

**Parameters**

- `com.tailf.proto.ConfETuple t`
- `java.net.Socket socket`


## Fields

### ADD_PACKAGES <a href="#m-ADD_PACKAGES" id="m-ADD_PACKAGES"></a>

```java
public static final int ADD_PACKAGES = 16;
```

### CLEAR_MOUNT_ID_CACHE <a href="#m-CLEAR_MOUNT_ID_CACHE" id="m-CLEAR_MOUNT_ID_CACHE"></a>

```java
public static final int CLEAR_MOUNT_ID_CACHE = 15;
```

### command <a href="#m-command" id="m-command"></a>

```java
public int command = null;
```

### data <a href="#m-data" id="m-data"></a>

```java
public com.tailf.proto.ConfEObject data = null;
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

### DONE_LOADING <a href="#m-DONE_LOADING" id="m-DONE_LOADING"></a>

```java
public static final int DONE_LOADING = 10;
```

### INIT_JVM <a href="#m-INIT_JVM" id="m-INIT_JVM"></a>

```java
public static final int INIT_JVM = 13;
```

### INSTANTIATE_COMPONENT <a href="#m-INSTANTIATE_COMPONENT" id="m-INSTANTIATE_COMPONENT"></a>

```java
public static final int INSTANTIATE_COMPONENT = 12;
```

### LOAD_PACKAGE <a href="#m-LOAD_PACKAGE" id="m-LOAD_PACKAGE"></a>

```java
public static final int LOAD_PACKAGE = 9;
```

### LOAD_SHARED_JARS <a href="#m-LOAD_SHARED_JARS" id="m-LOAD_SHARED_JARS"></a>

```java
public static final int LOAD_SHARED_JARS = 8;
```

### REDEPLOY_PACKAGE <a href="#m-REDEPLOY_PACKAGE" id="m-REDEPLOY_PACKAGE"></a>

```java
public static final int REDEPLOY_PACKAGE = 11;
```

### RELOAD_SCHEMA <a href="#m-RELOAD_SCHEMA" id="m-RELOAD_SCHEMA"></a>

```java
public static final int RELOAD_SCHEMA = 6;
```

### requestId <a href="#m-requestId" id="m-requestId"></a>

```java
public int requestId = null;
```

### RERUN <a href="#m-RERUN" id="m-RERUN"></a>

```java
public static final int RERUN = 1;
```

### SELFTEST <a href="#m-SELFTEST" id="m-SELFTEST"></a>

```java
public static final int SELFTEST = 2;
```

### STATUS <a href="#m-STATUS" id="m-STATUS"></a>

```java
public static final int STATUS = 4;
```

### STOP_VM <a href="#m-STOP_VM" id="m-STOP_VM"></a>

```java
public static final int STOP_VM = 3;
```

### UNLOAD_ALL <a href="#m-UNLOAD_ALL" id="m-UNLOAD_ALL"></a>

```java
public static final int UNLOAD_ALL = 14;
```

### UNLOAD_PACKAGE <a href="#m-UNLOAD_PACKAGE" id="m-UNLOAD_PACKAGE"></a>

```java
public static final int UNLOAD_PACKAGE = 7;
```


## Methods

### getCommandString() <a href="#m-getCommandString-a5d8cbab7e7d" id="m-getCommandString-a5d8cbab7e7d"></a>

```java
public String getCommandString()
```

### reply(boolean, ConfETuple) <a href="#m-reply-af85a8b7a1c5" id="m-reply-af85a8b7a1c5"></a>

```java
public void reply(boolean b, com.tailf.proto.ConfETuple obj) throws java.io.IOException
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple)

**Parameters**

- `boolean b`
- `com.tailf.proto.ConfETuple obj`

### reply(boolean, String) <a href="#m-reply-cf461c3b174d" id="m-reply-cf461c3b174d"></a>

```java
public void reply(boolean b, String str) throws java.io.IOException
```

**Parameters**

- `boolean b`
- `String str`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
