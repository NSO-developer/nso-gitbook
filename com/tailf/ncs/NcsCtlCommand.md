# NcsCtlCommand <a href="#ncsctlcommand-8bc93279649b" id="ncsctlcommand-8bc93279649b"></a>

```java
public class com.tailf.ncs.NcsCtlCommand
```

Ncs Java VM protocol command representation class

## Members

**Constructors**:

- [NcsCtlCommand(ConfETuple, Socket)](#ncsctlcommand-2e93c877cc48)

**Fields**:

- [ADD_PACKAGES](#add_packages-d5e018d505f0)
- [CLEAR_MOUNT_ID_CACHE](#clear_mount_id_cache-f072855efe3a)
- [command](#command-82a38d31596c)
- [data](#data-4415a4d33c53)
- [DONE_LOADING](#done_loading-c4da50f7eff6)
- [INIT_JVM](#init_jvm-a4f53c069c37)
- [INSTANTIATE_COMPONENT](#instantiate_component-4a49010db382)
- [LOAD_PACKAGE](#load_package-8d36bfdd569c)
- [LOAD_SHARED_JARS](#load_shared_jars-0af221fb126a)
- [REDEPLOY_PACKAGE](#redeploy_package-73aa8e828f1c)
- [RELOAD_SCHEMA](#reload_schema-20cb49bb632d)
- [requestId](#requestid-4b247ba15f86)
- [RERUN](#rerun-dc3d68f96819)
- [SELFTEST](#selftest-40450ef7f9d7)
- [STATUS](#status-108f5067a231)
- [STOP_VM](#stop_vm-ff4f9db3ef03)
- [UNLOAD_ALL](#unload_all-cde8ab4f1717)
- [UNLOAD_PACKAGE](#unload_package-b38a70e37323)

**Methods**:

- [getCommandString()](#getcommandstring-a5d8cbab7e7d)
- [reply(boolean, ConfETuple)](#reply-af85a8b7a1c5)
- [reply(boolean, String)](#reply-cf461c3b174d)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### NcsCtlCommand(ConfETuple, Socket) <a href="#ncsctlcommand-2e93c877cc48" id="ncsctlcommand-2e93c877cc48"></a>

```java
public NcsCtlCommand(com.tailf.proto.ConfETuple t, java.net.Socket socket)
```

Types: [ConfETuple](../proto/ConfETuple.md#confetuple-b1f9702a82a1)

**Parameters**

- `com.tailf.proto.ConfETuple t`
- `java.net.Socket socket`


## Fields

### ADD_PACKAGES <a href="#add_packages-d5e018d505f0" id="add_packages-d5e018d505f0"></a>

```java
public static final int ADD_PACKAGES = 16;
```

### CLEAR_MOUNT_ID_CACHE <a href="#clear_mount_id_cache-f072855efe3a" id="clear_mount_id_cache-f072855efe3a"></a>

```java
public static final int CLEAR_MOUNT_ID_CACHE = 15;
```

### command <a href="#command-82a38d31596c" id="command-82a38d31596c"></a>

```java
public int command = null;
```

### data <a href="#data-4415a4d33c53" id="data-4415a4d33c53"></a>

```java
public com.tailf.proto.ConfEObject data = null;
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

### DONE_LOADING <a href="#done_loading-c4da50f7eff6" id="done_loading-c4da50f7eff6"></a>

```java
public static final int DONE_LOADING = 10;
```

### INIT_JVM <a href="#init_jvm-a4f53c069c37" id="init_jvm-a4f53c069c37"></a>

```java
public static final int INIT_JVM = 13;
```

### INSTANTIATE_COMPONENT <a href="#instantiate_component-4a49010db382" id="instantiate_component-4a49010db382"></a>

```java
public static final int INSTANTIATE_COMPONENT = 12;
```

### LOAD_PACKAGE <a href="#load_package-8d36bfdd569c" id="load_package-8d36bfdd569c"></a>

```java
public static final int LOAD_PACKAGE = 9;
```

### LOAD_SHARED_JARS <a href="#load_shared_jars-0af221fb126a" id="load_shared_jars-0af221fb126a"></a>

```java
public static final int LOAD_SHARED_JARS = 8;
```

### REDEPLOY_PACKAGE <a href="#redeploy_package-73aa8e828f1c" id="redeploy_package-73aa8e828f1c"></a>

```java
public static final int REDEPLOY_PACKAGE = 11;
```

### RELOAD_SCHEMA <a href="#reload_schema-20cb49bb632d" id="reload_schema-20cb49bb632d"></a>

```java
public static final int RELOAD_SCHEMA = 6;
```

### requestId <a href="#requestid-4b247ba15f86" id="requestid-4b247ba15f86"></a>

```java
public int requestId = null;
```

### RERUN <a href="#rerun-dc3d68f96819" id="rerun-dc3d68f96819"></a>

```java
public static final int RERUN = 1;
```

### SELFTEST <a href="#selftest-40450ef7f9d7" id="selftest-40450ef7f9d7"></a>

```java
public static final int SELFTEST = 2;
```

### STATUS <a href="#status-108f5067a231" id="status-108f5067a231"></a>

```java
public static final int STATUS = 4;
```

### STOP_VM <a href="#stop_vm-ff4f9db3ef03" id="stop_vm-ff4f9db3ef03"></a>

```java
public static final int STOP_VM = 3;
```

### UNLOAD_ALL <a href="#unload_all-cde8ab4f1717" id="unload_all-cde8ab4f1717"></a>

```java
public static final int UNLOAD_ALL = 14;
```

### UNLOAD_PACKAGE <a href="#unload_package-b38a70e37323" id="unload_package-b38a70e37323"></a>

```java
public static final int UNLOAD_PACKAGE = 7;
```


## Methods

### getCommandString() <a href="#getcommandstring-a5d8cbab7e7d" id="getcommandstring-a5d8cbab7e7d"></a>

```java
public String getCommandString()
```

### reply(boolean, ConfETuple) <a href="#reply-af85a8b7a1c5" id="reply-af85a8b7a1c5"></a>

```java
public void reply(boolean b, com.tailf.proto.ConfETuple obj) throws java.io.IOException
```

Types: [ConfETuple](../proto/ConfETuple.md#confetuple-b1f9702a82a1)

**Parameters**

- `boolean b`
- `com.tailf.proto.ConfETuple obj`

### reply(boolean, String) <a href="#reply-cf461c3b174d" id="reply-cf461c3b174d"></a>

```java
public void reply(boolean b, String str) throws java.io.IOException
```

**Parameters**

- `boolean b`
- `String str`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
