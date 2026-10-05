<a id="s-Conf"></a>
# Conf

```java
public class com.tailf.conf.Conf
```

General class for static methods and constants used
 by the ConfD API:s (Maapi, Cdb, Dp, and Notif)

**See also:** [`Maapi`](../maapi/Maapi.md#s-Maapi), [`Cdb`](../cdb/Cdb.md#s-Cdb), [`Dp`](../dp/Dp.md#s-Dp), [`Notif`](../notif/Notif.md#s-Notif)

## Members

**Constructors**:

- [Conf()](#s-Conf-1)

**Fields**:

- [DB_CANDIDATE](#s-DB_CANDIDATE)
- [DB_INTENDED](#s-DB_INTENDED)
- [DB_NONE](#s-DB_NONE)
- [DB_OPERATIONAL](#s-DB_OPERATIONAL)
- [DB_PRE_COMMIT_RUNNING](#s-DB_PRE_COMMIT_RUNNING)
- [DB_RUNNING](#s-DB_RUNNING)
- [DB_STARTUP](#s-DB_STARTUP)
- [DB_TRANSACTION](#s-DB_TRANSACTION)
- [DEBUG_NORMAL](#s-DEBUG_NORMAL)
- [DEBUG_PROTO](#s-DEBUG_PROTO)
- [DEBUG_SILENT](#s-DEBUG_SILENT)
- [DEBUG_TRACE](#s-DEBUG_TRACE)
- [IA_CLIENT_HA](#s-IA_CLIENT_HA)
- [IA_CLIENT_MAAPI](#s-IA_CLIENT_MAAPI)
- [IA_CLIENT_NCS](#s-IA_CLIENT_NCS)
- [LIBVSN](#s-LIBVSN)
- [MODE_READ](#s-MODE_READ)
- [MODE_READ_WRITE](#s-MODE_READ_WRITE)
- [NCS_PATH](#s-NCS_PATH)
- [NCS_PORT](#s-NCS_PORT)
- [PORT](#s-PORT)
- [PROTOVSN](#s-PROTOVSN)
- [REPLY_ACCUMULATE](#s-REPLY_ACCUMULATE)
- [REPLY_ALREADY_LOCKED](#s-REPLY_ALREADY_LOCKED)
- [REPLY_DELAYED_RESPONSE](#s-REPLY_DELAYED_RESPONSE)
- [REPLY_EOF](#s-REPLY_EOF)
- [REPLY_ERR](#s-REPLY_ERR)
- [REPLY_OK](#s-REPLY_OK)
- [REPLY_VALIDATION_WARN](#s-REPLY_VALIDATION_WARN)

**Methods**:

- [byteArrayToHexString(byte[])](#s-byteArrayToHexString)
- [dbnameToString(int)](#s-dbnameToString)
- [hexStringToByteArray(String)](#s-hexStringToByteArray)
- [kpToString(ConfObject[])](#s-kpToString)
- [modeToString(int)](#s-modeToString)

## Constructors

<a id="s-Conf-1"></a>
### Conf()

```java
public Conf()
```


## Fields

<a id="s-DB_CANDIDATE"></a>
### DB_CANDIDATE

```java
public static final int DB_CANDIDATE = 1;
```

Indicates the candidate configuration.

<a id="s-DB_INTENDED"></a>
### DB_INTENDED

```java
public static final int DB_INTENDED = 7;
```

Indicates the intended db.

<a id="s-DB_NONE"></a>
### DB_NONE

```java
public static final int DB_NONE = 0;
```

Indicates the null db (should not be used).

<a id="s-DB_OPERATIONAL"></a>
### DB_OPERATIONAL

```java
public static final int DB_OPERATIONAL = 4;
```

Indicates the operational db.

<a id="s-DB_PRE_COMMIT_RUNNING"></a>
### DB_PRE_COMMIT_RUNNING

```java
public static final int DB_PRE_COMMIT_RUNNING = 6;
```

Indicates the pre commit running db.
 Only available in cdb subscriptions

<a id="s-DB_RUNNING"></a>
### DB_RUNNING

```java
public static final int DB_RUNNING = 2;
```

Indicates the running configuration.

<a id="s-DB_STARTUP"></a>
### DB_STARTUP

```java
public static final int DB_STARTUP = 3;
```

Indicates the startup configuration.

<a id="s-DB_TRANSACTION"></a>
### DB_TRANSACTION

```java
public static final int DB_TRANSACTION = 5;
```

Indicates transaction db (trans-in-trans).

<a id="s-DEBUG_NORMAL"></a>
### DEBUG_NORMAL

```java
public static final int DEBUG_NORMAL = 1;
```

Debug level flag.
 The execution of user callback functions will be traced.

<a id="s-DEBUG_PROTO"></a>
### DEBUG_PROTO

```java
public static final int DEBUG_PROTO = 3;
```

Debug level flag.
 Various internal trace printouts will occur.

<a id="s-DEBUG_SILENT"></a>
### DEBUG_SILENT

```java
public static final int DEBUG_SILENT = 0;
```

Debug level flag.
 No debug printouts whatsoever are produced by the library.

<a id="s-DEBUG_TRACE"></a>
### DEBUG_TRACE

```java
public static final int DEBUG_TRACE = 2;
```

Debug level flag.
 Various internal trace printouts will occur.

<a id="s-IA_CLIENT_HA"></a>
### IA_CLIENT_HA

```java
public static final int IA_CLIENT_HA = 17;
```

<a id="s-IA_CLIENT_MAAPI"></a>
### IA_CLIENT_MAAPI

```java
public static final int IA_CLIENT_MAAPI = 7;
```

Internal Acceptor client ids used by both application and
 ConfInternal

<a id="s-IA_CLIENT_NCS"></a>
### IA_CLIENT_NCS

```java
public static final int IA_CLIENT_NCS = 18;
```

<a id="s-LIBVSN"></a>
### LIBVSN

```java
public static final int LIBVSN = 134742016;
```

Library version.

<a id="s-MODE_READ"></a>
### MODE_READ

```java
public static final int MODE_READ = 1;
```

Indicates a read only transaction.

<a id="s-MODE_READ_WRITE"></a>
### MODE_READ_WRITE

```java
public static final int MODE_READ_WRITE = 2;
```

Indicates a read and write transaction.

<a id="s-NCS_PATH"></a>
### NCS_PATH

```java
public static final String NCS_PATH = "/tmp/nso/nso-ipc";
```

Default path for NCS Local IPC (Unix domain socket).

<a id="s-NCS_PORT"></a>
### NCS_PORT

```java
public static final int NCS_PORT = 4569;
```

Deprecated default port number that NCS listens to.

**Deprecated:** Use `#NCS_PATH` instead.

<a id="s-PORT"></a>
### PORT

```java
public static final int PORT = 4565;
```

Default port number that ConfD listens to.

<a id="s-PROTOVSN"></a>
### PROTOVSN

```java
public static final int PROTOVSN = 88;
```

Library protocol version.

<a id="s-REPLY_ACCUMULATE"></a>
### REPLY_ACCUMULATE

```java
public static final int REPLY_ACCUMULATE = 1;
```

General return value for many of the API methods.

<a id="s-REPLY_ALREADY_LOCKED"></a>
### REPLY_ALREADY_LOCKED

```java
public static final int REPLY_ALREADY_LOCKED = -4;
```

General return value for many of the API methods.

<a id="s-REPLY_DELAYED_RESPONSE"></a>
### REPLY_DELAYED_RESPONSE

```java
public static final int REPLY_DELAYED_RESPONSE = 2;
```

General return value for many of the API methods.

<a id="s-REPLY_EOF"></a>
### REPLY_EOF

```java
public static final int REPLY_EOF = -2;
```

General return value for many of the API methods.

<a id="s-REPLY_ERR"></a>
### REPLY_ERR

```java
public static final int REPLY_ERR = -1;
```

General return value for many of the API methods.

<a id="s-REPLY_OK"></a>
### REPLY_OK

```java
public static final int REPLY_OK = 0;
```

General return value for many of the API methods.

<a id="s-REPLY_VALIDATION_WARN"></a>
### REPLY_VALIDATION_WARN

```java
public static final int REPLY_VALIDATION_WARN = -3;
```

General return value for many of the API methods.


## Methods

<a id="s-byteArrayToHexString"></a>
### byteArrayToHexString(byte[])

```java
public static String byteArrayToHexString(byte[] a)
```

Converts a byte array to a hex string

**Parameters**

- `byte[] a`

<a id="s-dbnameToString"></a>
### dbnameToString(int)

```java
public static String dbnameToString(int dbname)
```

Converts a dbname constant into a string

**Parameters**

- `int dbname`

<a id="s-hexStringToByteArray"></a>
### hexStringToByteArray(String)

```java
public static byte[] hexStringToByteArray(String s)
```

Converts a hex string to a byte array

**Parameters**

- `String s`

<a id="s-kpToString"></a>
### kpToString(ConfObject[])

```java
public static String kpToString(com.tailf.conf.ConfObject[] kp)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

Converts a keypath Object[] kp into a string.
 A keypath is an array of either ConfTag or ConfKey objects.
 Mostly used for debugging keypaths.
 Notice that a keypath array is always reversed,
 beginning with the leaf first.
 This method will return the string of the keypath in
 correct order, beginning with namespace and top element first.

**Parameters**

- `com.tailf.conf.ConfObject[] kp` - Keypath

<a id="s-modeToString"></a>
### modeToString(int)

```java
public static String modeToString(int mode)
```

Converts a mode constant into a string

**Parameters**

- `int mode`
