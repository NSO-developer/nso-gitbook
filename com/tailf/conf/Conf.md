<a id="cls-Conf"></a>
# Conf

```java
public class com.tailf.conf.Conf
```

General class for static methods and constants used
 by the ConfD API:s (Maapi, Cdb, Dp, and Notif)

**See also:** [`Maapi`](../maapi/Maapi.md#cls-Maapi), [`Cdb`](../cdb/Cdb.md#cls-Cdb), [`Dp`](../dp/Dp.md#cls-Dp), [`Notif`](../notif/Notif.md#cls-Notif)

## Members

**Constructors**:

- [Conf()](#m-conf-d07fb1802863)

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

- [byteArrayToHexString(byte[])](#m-bytearraytohexstring-d2fcd7957dae)
- [dbnameToString(int)](#m-dbnametostring-2282036c6d4c)
- [hexStringToByteArray(String)](#m-hexstringtobytearray-089f10c91f26)
- [kpToString(ConfObject[])](#m-kptostring-078f830def26)
- [modeToString(int)](#m-modetostring-dc0acb156ca7)

## Constructors

<a id="m-conf-d07fb1802863"></a>
### Conf()

```java
public Conf()
```


## Fields

<a id="m-DB_CANDIDATE"></a>
### DB_CANDIDATE

```java
public static final int DB_CANDIDATE = 1;
```

Indicates the candidate configuration.

<a id="m-DB_INTENDED"></a>
### DB_INTENDED

```java
public static final int DB_INTENDED = 7;
```

Indicates the intended db.

<a id="m-DB_NONE"></a>
### DB_NONE

```java
public static final int DB_NONE = 0;
```

Indicates the null db (should not be used).

<a id="m-DB_OPERATIONAL"></a>
### DB_OPERATIONAL

```java
public static final int DB_OPERATIONAL = 4;
```

Indicates the operational db.

<a id="m-DB_PRE_COMMIT_RUNNING"></a>
### DB_PRE_COMMIT_RUNNING

```java
public static final int DB_PRE_COMMIT_RUNNING = 6;
```

Indicates the pre commit running db.
 Only available in cdb subscriptions

<a id="m-DB_RUNNING"></a>
### DB_RUNNING

```java
public static final int DB_RUNNING = 2;
```

Indicates the running configuration.

<a id="m-DB_STARTUP"></a>
### DB_STARTUP

```java
public static final int DB_STARTUP = 3;
```

Indicates the startup configuration.

<a id="m-DB_TRANSACTION"></a>
### DB_TRANSACTION

```java
public static final int DB_TRANSACTION = 5;
```

Indicates transaction db (trans-in-trans).

<a id="m-DEBUG_NORMAL"></a>
### DEBUG_NORMAL

```java
public static final int DEBUG_NORMAL = 1;
```

Debug level flag.
 The execution of user callback functions will be traced.

<a id="m-DEBUG_PROTO"></a>
### DEBUG_PROTO

```java
public static final int DEBUG_PROTO = 3;
```

Debug level flag.
 Various internal trace printouts will occur.

<a id="m-DEBUG_SILENT"></a>
### DEBUG_SILENT

```java
public static final int DEBUG_SILENT = 0;
```

Debug level flag.
 No debug printouts whatsoever are produced by the library.

<a id="m-DEBUG_TRACE"></a>
### DEBUG_TRACE

```java
public static final int DEBUG_TRACE = 2;
```

Debug level flag.
 Various internal trace printouts will occur.

<a id="m-IA_CLIENT_HA"></a>
### IA_CLIENT_HA

```java
public static final int IA_CLIENT_HA = 17;
```

<a id="m-IA_CLIENT_MAAPI"></a>
### IA_CLIENT_MAAPI

```java
public static final int IA_CLIENT_MAAPI = 7;
```

Internal Acceptor client ids used by both application and
 ConfInternal

<a id="m-IA_CLIENT_NCS"></a>
### IA_CLIENT_NCS

```java
public static final int IA_CLIENT_NCS = 18;
```

<a id="m-LIBVSN"></a>
### LIBVSN

```java
public static final int LIBVSN = 134742016;
```

Library version.

<a id="m-MODE_READ"></a>
### MODE_READ

```java
public static final int MODE_READ = 1;
```

Indicates a read only transaction.

<a id="m-MODE_READ_WRITE"></a>
### MODE_READ_WRITE

```java
public static final int MODE_READ_WRITE = 2;
```

Indicates a read and write transaction.

<a id="m-NCS_PATH"></a>
### NCS_PATH

```java
public static final String NCS_PATH = "/tmp/nso/nso-ipc";
```

Default path for NCS Local IPC (Unix domain socket).

<a id="m-NCS_PORT"></a>
### NCS_PORT

```java
public static final int NCS_PORT = 4569;
```

Deprecated default port number that NCS listens to.

**Deprecated:** Use `#NCS_PATH` instead.

<a id="m-PORT"></a>
### PORT

```java
public static final int PORT = 4565;
```

Default port number that ConfD listens to.

<a id="m-PROTOVSN"></a>
### PROTOVSN

```java
public static final int PROTOVSN = 88;
```

Library protocol version.

<a id="m-REPLY_ACCUMULATE"></a>
### REPLY_ACCUMULATE

```java
public static final int REPLY_ACCUMULATE = 1;
```

General return value for many of the API methods.

<a id="m-REPLY_ALREADY_LOCKED"></a>
### REPLY_ALREADY_LOCKED

```java
public static final int REPLY_ALREADY_LOCKED = -4;
```

General return value for many of the API methods.

<a id="m-REPLY_DELAYED_RESPONSE"></a>
### REPLY_DELAYED_RESPONSE

```java
public static final int REPLY_DELAYED_RESPONSE = 2;
```

General return value for many of the API methods.

<a id="m-REPLY_EOF"></a>
### REPLY_EOF

```java
public static final int REPLY_EOF = -2;
```

General return value for many of the API methods.

<a id="m-REPLY_ERR"></a>
### REPLY_ERR

```java
public static final int REPLY_ERR = -1;
```

General return value for many of the API methods.

<a id="m-REPLY_OK"></a>
### REPLY_OK

```java
public static final int REPLY_OK = 0;
```

General return value for many of the API methods.

<a id="m-REPLY_VALIDATION_WARN"></a>
### REPLY_VALIDATION_WARN

```java
public static final int REPLY_VALIDATION_WARN = -3;
```

General return value for many of the API methods.


## Methods

<a id="m-bytearraytohexstring-d2fcd7957dae"></a>
### byteArrayToHexString(byte[])

```java
public static String byteArrayToHexString(byte[] a)
```

Converts a byte array to a hex string

**Parameters**

- `byte[] a`

<a id="m-dbnametostring-2282036c6d4c"></a>
### dbnameToString(int)

```java
public static String dbnameToString(int dbname)
```

Converts a dbname constant into a string

**Parameters**

- `int dbname`

<a id="m-hexstringtobytearray-089f10c91f26"></a>
### hexStringToByteArray(String)

```java
public static byte[] hexStringToByteArray(String s)
```

Converts a hex string to a byte array

**Parameters**

- `String s`

<a id="m-kptostring-078f830def26"></a>
### kpToString(ConfObject[])

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

<a id="m-modetostring-dc0acb156ca7"></a>
### modeToString(int)

```java
public static String modeToString(int mode)
```

Converts a mode constant into a string

**Parameters**

- `int mode`
