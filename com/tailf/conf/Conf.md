# Conf <a href="#cls-Conf" id="cls-Conf"></a>

```java
public class com.tailf.conf.Conf
```

General class for static methods and constants used
 by the ConfD API:s (Maapi, Cdb, Dp, and Notif)

**See also:** [`Maapi`](../maapi/Maapi.md#cls-Maapi), [`Cdb`](../cdb/Cdb.md#cls-Cdb), [`Dp`](../dp/Dp.md#cls-Dp), [`Notif`](../notif/Notif.md#cls-Notif)

## Members

**Constructors**:

- [Conf()](#m-Conf-d07fb1802863)

**Fields**:

- [DB_CANDIDATE](#m-DB_CANDIDATE)
- [DB_INTENDED](#m-DB_INTENDED)
- [DB_NONE](#m-DB_NONE)
- [DB_OPERATIONAL](#m-DB_OPERATIONAL)
- [DB_PRE_COMMIT_RUNNING](#m-DB_PRE_COMMIT_RUNNING)
- [DB_RUNNING](#m-DB_RUNNING)
- [DB_STARTUP](#m-DB_STARTUP)
- [DB_TRANSACTION](#m-DB_TRANSACTION)
- [DEBUG_NORMAL](#m-DEBUG_NORMAL)
- [DEBUG_PROTO](#m-DEBUG_PROTO)
- [DEBUG_SILENT](#m-DEBUG_SILENT)
- [DEBUG_TRACE](#m-DEBUG_TRACE)
- [IA_CLIENT_HA](#m-IA_CLIENT_HA)
- [IA_CLIENT_MAAPI](#m-IA_CLIENT_MAAPI)
- [IA_CLIENT_NCS](#m-IA_CLIENT_NCS)
- [LIBVSN](#m-LIBVSN)
- [MODE_READ](#m-MODE_READ)
- [MODE_READ_WRITE](#m-MODE_READ_WRITE)
- [NCS_PATH](#m-NCS_PATH)
- [NCS_PORT](#m-NCS_PORT)
- [PORT](#m-PORT)
- [PROTOVSN](#m-PROTOVSN)
- [REPLY_ACCUMULATE](#m-REPLY_ACCUMULATE)
- [REPLY_ALREADY_LOCKED](#m-REPLY_ALREADY_LOCKED)
- [REPLY_DELAYED_RESPONSE](#m-REPLY_DELAYED_RESPONSE)
- [REPLY_EOF](#m-REPLY_EOF)
- [REPLY_ERR](#m-REPLY_ERR)
- [REPLY_OK](#m-REPLY_OK)
- [REPLY_VALIDATION_WARN](#m-REPLY_VALIDATION_WARN)

**Methods**:

- [byteArrayToHexString(byte[])](#m-byteArrayToHexString-d2fcd7957dae)
- [dbnameToString(int)](#m-dbnameToString-2282036c6d4c)
- [hexStringToByteArray(String)](#m-hexStringToByteArray-089f10c91f26)
- [kpToString(ConfObject[])](#m-kpToString-078f830def26)
- [modeToString(int)](#m-modeToString-dc0acb156ca7)

## Constructors

### Conf() <a href="#m-Conf-d07fb1802863" id="m-Conf-d07fb1802863"></a>

```java
public Conf()
```


## Fields

### DB_CANDIDATE <a href="#m-DB_CANDIDATE" id="m-DB_CANDIDATE"></a>

```java
public static final int DB_CANDIDATE = 1;
```

Indicates the candidate configuration.

### DB_INTENDED <a href="#m-DB_INTENDED" id="m-DB_INTENDED"></a>

```java
public static final int DB_INTENDED = 7;
```

Indicates the intended db.

### DB_NONE <a href="#m-DB_NONE" id="m-DB_NONE"></a>

```java
public static final int DB_NONE = 0;
```

Indicates the null db (should not be used).

### DB_OPERATIONAL <a href="#m-DB_OPERATIONAL" id="m-DB_OPERATIONAL"></a>

```java
public static final int DB_OPERATIONAL = 4;
```

Indicates the operational db.

### DB_PRE_COMMIT_RUNNING <a href="#m-DB_PRE_COMMIT_RUNNING" id="m-DB_PRE_COMMIT_RUNNING"></a>

```java
public static final int DB_PRE_COMMIT_RUNNING = 6;
```

Indicates the pre commit running db.
 Only available in cdb subscriptions

### DB_RUNNING <a href="#m-DB_RUNNING" id="m-DB_RUNNING"></a>

```java
public static final int DB_RUNNING = 2;
```

Indicates the running configuration.

### DB_STARTUP <a href="#m-DB_STARTUP" id="m-DB_STARTUP"></a>

```java
public static final int DB_STARTUP = 3;
```

Indicates the startup configuration.

### DB_TRANSACTION <a href="#m-DB_TRANSACTION" id="m-DB_TRANSACTION"></a>

```java
public static final int DB_TRANSACTION = 5;
```

Indicates transaction db (trans-in-trans).

### DEBUG_NORMAL <a href="#m-DEBUG_NORMAL" id="m-DEBUG_NORMAL"></a>

```java
public static final int DEBUG_NORMAL = 1;
```

Debug level flag.
 The execution of user callback functions will be traced.

### DEBUG_PROTO <a href="#m-DEBUG_PROTO" id="m-DEBUG_PROTO"></a>

```java
public static final int DEBUG_PROTO = 3;
```

Debug level flag.
 Various internal trace printouts will occur.

### DEBUG_SILENT <a href="#m-DEBUG_SILENT" id="m-DEBUG_SILENT"></a>

```java
public static final int DEBUG_SILENT = 0;
```

Debug level flag.
 No debug printouts whatsoever are produced by the library.

### DEBUG_TRACE <a href="#m-DEBUG_TRACE" id="m-DEBUG_TRACE"></a>

```java
public static final int DEBUG_TRACE = 2;
```

Debug level flag.
 Various internal trace printouts will occur.

### IA_CLIENT_HA <a href="#m-IA_CLIENT_HA" id="m-IA_CLIENT_HA"></a>

```java
public static final int IA_CLIENT_HA = 17;
```

### IA_CLIENT_MAAPI <a href="#m-IA_CLIENT_MAAPI" id="m-IA_CLIENT_MAAPI"></a>

```java
public static final int IA_CLIENT_MAAPI = 7;
```

Internal Acceptor client ids used by both application and
 ConfInternal

### IA_CLIENT_NCS <a href="#m-IA_CLIENT_NCS" id="m-IA_CLIENT_NCS"></a>

```java
public static final int IA_CLIENT_NCS = 18;
```

### LIBVSN <a href="#m-LIBVSN" id="m-LIBVSN"></a>

```java
public static final int LIBVSN = 134742016;
```

Library version.

### MODE_READ <a href="#m-MODE_READ" id="m-MODE_READ"></a>

```java
public static final int MODE_READ = 1;
```

Indicates a read only transaction.

### MODE_READ_WRITE <a href="#m-MODE_READ_WRITE" id="m-MODE_READ_WRITE"></a>

```java
public static final int MODE_READ_WRITE = 2;
```

Indicates a read and write transaction.

### NCS_PATH <a href="#m-NCS_PATH" id="m-NCS_PATH"></a>

```java
public static final String NCS_PATH = "/tmp/nso/nso-ipc";
```

Default path for NCS Local IPC (Unix domain socket).

### NCS_PORT <a href="#m-NCS_PORT" id="m-NCS_PORT"></a>

```java
public static final int NCS_PORT = 4569;
```

Deprecated default port number that NCS listens to.

**Deprecated:** Use [`NCS_PATH`](Conf.md#m-NCS_PATH) instead.

### PORT <a href="#m-PORT" id="m-PORT"></a>

```java
public static final int PORT = 4565;
```

Default port number that ConfD listens to.

### PROTOVSN <a href="#m-PROTOVSN" id="m-PROTOVSN"></a>

```java
public static final int PROTOVSN = 88;
```

Library protocol version.

### REPLY_ACCUMULATE <a href="#m-REPLY_ACCUMULATE" id="m-REPLY_ACCUMULATE"></a>

```java
public static final int REPLY_ACCUMULATE = 1;
```

General return value for many of the API methods.

### REPLY_ALREADY_LOCKED <a href="#m-REPLY_ALREADY_LOCKED" id="m-REPLY_ALREADY_LOCKED"></a>

```java
public static final int REPLY_ALREADY_LOCKED = -4;
```

General return value for many of the API methods.

### REPLY_DELAYED_RESPONSE <a href="#m-REPLY_DELAYED_RESPONSE" id="m-REPLY_DELAYED_RESPONSE"></a>

```java
public static final int REPLY_DELAYED_RESPONSE = 2;
```

General return value for many of the API methods.

### REPLY_EOF <a href="#m-REPLY_EOF" id="m-REPLY_EOF"></a>

```java
public static final int REPLY_EOF = -2;
```

General return value for many of the API methods.

### REPLY_ERR <a href="#m-REPLY_ERR" id="m-REPLY_ERR"></a>

```java
public static final int REPLY_ERR = -1;
```

General return value for many of the API methods.

### REPLY_OK <a href="#m-REPLY_OK" id="m-REPLY_OK"></a>

```java
public static final int REPLY_OK = 0;
```

General return value for many of the API methods.

### REPLY_VALIDATION_WARN <a href="#m-REPLY_VALIDATION_WARN" id="m-REPLY_VALIDATION_WARN"></a>

```java
public static final int REPLY_VALIDATION_WARN = -3;
```

General return value for many of the API methods.


## Methods

### byteArrayToHexString(byte[]) <a href="#m-byteArrayToHexString-d2fcd7957dae" id="m-byteArrayToHexString-d2fcd7957dae"></a>

```java
public static String byteArrayToHexString(byte[] a)
```

Converts a byte array to a hex string

**Parameters**

- `byte[] a`

### dbnameToString(int) <a href="#m-dbnameToString-2282036c6d4c" id="m-dbnameToString-2282036c6d4c"></a>

```java
public static String dbnameToString(int dbname)
```

Converts a dbname constant into a string

**Parameters**

- `int dbname`

### hexStringToByteArray(String) <a href="#m-hexStringToByteArray-089f10c91f26" id="m-hexStringToByteArray-089f10c91f26"></a>

```java
public static byte[] hexStringToByteArray(String s)
```

Converts a hex string to a byte array

**Parameters**

- `String s`

### kpToString(ConfObject[]) <a href="#m-kpToString-078f830def26" id="m-kpToString-078f830def26"></a>

```java
public static String kpToString(com.tailf.conf.ConfObject[] kp)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Converts a keypath Object[] kp into a string.
 A keypath is an array of either ConfTag or ConfKey objects.
 Mostly used for debugging keypaths.
 Notice that a keypath array is always reversed,
 beginning with the leaf first.
 This method will return the string of the keypath in
 correct order, beginning with namespace and top element first.

**Parameters**

- `com.tailf.conf.ConfObject[] kp` - Keypath

### modeToString(int) <a href="#m-modeToString-dc0acb156ca7" id="m-modeToString-dc0acb156ca7"></a>

```java
public static String modeToString(int mode)
```

Converts a mode constant into a string

**Parameters**

- `int mode`
