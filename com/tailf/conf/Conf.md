# Conf <a href="#conf-4868d3a88b04" id="conf-4868d3a88b04"></a>

```java
public class com.tailf.conf.Conf
```

General class for static methods and constants used
 by the ConfD API:s (Maapi, Cdb, Dp, and Notif)

**See also:** [`Maapi`](../maapi/Maapi.md#maapi-67bcbe89c42e), [`Cdb`](../cdb/Cdb.md#cdb-cb7fc41768c9), [`Dp`](../dp/Dp.md#dp-64c27347820e), [`Notif`](../notif/Notif.md#notif-09a310797640)

## Members

**Constructors**:

- [Conf\(\)](#conf-d07fb1802863)

**Fields**:

- [DB\_CANDIDATE](#db_candidate-8b43a337ac93)
- [DB\_INTENDED](#db_intended-3fa310253bdb)
- [DB\_NONE](#db_none-5069c3fe4466)
- [DB\_OPERATIONAL](#db_operational-0d12377eea71)
- [DB\_PRE\_COMMIT\_RUNNING](#db_pre_commit_running-0244b447e03f)
- [DB\_RUNNING](#db_running-c391f371da28)
- [DB\_STARTUP](#db_startup-2ce085259486)
- [DB\_TRANSACTION](#db_transaction-634c84c4ad85)
- [DEBUG\_NORMAL](#debug_normal-d1daed2bc44d)
- [DEBUG\_PROTO](#debug_proto-38ac7a34ac85)
- [DEBUG\_SILENT](#debug_silent-5f227c3b34ee)
- [DEBUG\_TRACE](#debug_trace-aa7bd5491a71)
- [IA\_CLIENT\_HA](#ia_client_ha-d7be530dd67b)
- [IA\_CLIENT\_MAAPI](#ia_client_maapi-abd097089172)
- [IA\_CLIENT\_NCS](#ia_client_ncs-a23fe7f73990)
- [LIBVSN](#libvsn-9b15fe9684a4)
- [MODE\_READ](#mode_read-1e4ced2f015c)
- [MODE\_READ\_WRITE](#mode_read_write-0883a33af731)
- [NCS\_PATH](#ncs_path-4edf16fedc10)
- [NCS\_PORT](#ncs_port-a3ad2496735b)
- [PORT](#port-c87f4778bfce)
- [PROTOVSN](#protovsn-2bf2bf5cea5d)
- [REPLY\_ACCUMULATE](#reply_accumulate-37dbdbd9601e)
- [REPLY\_ALREADY\_LOCKED](#reply_already_locked-962c898a1150)
- [REPLY\_DELAYED\_RESPONSE](#reply_delayed_response-3d5e5d91f027)
- [REPLY\_EOF](#reply_eof-b25ad8656332)
- [REPLY\_ERR](#reply_err-4ccb5116fda6)
- [REPLY\_OK](#reply_ok-bb7e2f4029a2)
- [REPLY\_VALIDATION\_WARN](#reply_validation_warn-706fd9b0a6b4)

**Methods**:

- [byteArrayToHexString\(byte\[\]\)](#bytearraytohexstring-d2fcd7957dae)
- [dbnameToString\(int\)](#dbnametostring-2282036c6d4c)
- [hexStringToByteArray\(String\)](#hexstringtobytearray-089f10c91f26)
- [kpToString\(ConfObject\[\]\)](#kptostring-078f830def26)
- [modeToString\(int\)](#modetostring-dc0acb156ca7)

## Constructors

### Conf() <a href="#conf-d07fb1802863" id="conf-d07fb1802863"></a>

```java
public Conf()
```


## Fields

### DB_CANDIDATE <a href="#db_candidate-8b43a337ac93" id="db_candidate-8b43a337ac93"></a>

```java
public static final int DB_CANDIDATE = 1;
```

Indicates the candidate configuration.

### DB_INTENDED <a href="#db_intended-3fa310253bdb" id="db_intended-3fa310253bdb"></a>

```java
public static final int DB_INTENDED = 7;
```

Indicates the intended db.

### DB_NONE <a href="#db_none-5069c3fe4466" id="db_none-5069c3fe4466"></a>

```java
public static final int DB_NONE = 0;
```

Indicates the null db (should not be used).

### DB_OPERATIONAL <a href="#db_operational-0d12377eea71" id="db_operational-0d12377eea71"></a>

```java
public static final int DB_OPERATIONAL = 4;
```

Indicates the operational db.

### DB_PRE_COMMIT_RUNNING <a href="#db_pre_commit_running-0244b447e03f" id="db_pre_commit_running-0244b447e03f"></a>

```java
public static final int DB_PRE_COMMIT_RUNNING = 6;
```

Indicates the pre commit running db.
 Only available in cdb subscriptions

### DB_RUNNING <a href="#db_running-c391f371da28" id="db_running-c391f371da28"></a>

```java
public static final int DB_RUNNING = 2;
```

Indicates the running configuration.

### DB_STARTUP <a href="#db_startup-2ce085259486" id="db_startup-2ce085259486"></a>

```java
public static final int DB_STARTUP = 3;
```

Indicates the startup configuration.

### DB_TRANSACTION <a href="#db_transaction-634c84c4ad85" id="db_transaction-634c84c4ad85"></a>

```java
public static final int DB_TRANSACTION = 5;
```

Indicates transaction db (trans-in-trans).

### DEBUG_NORMAL <a href="#debug_normal-d1daed2bc44d" id="debug_normal-d1daed2bc44d"></a>

```java
public static final int DEBUG_NORMAL = 1;
```

Debug level flag.
 The execution of user callback functions will be traced.

### DEBUG_PROTO <a href="#debug_proto-38ac7a34ac85" id="debug_proto-38ac7a34ac85"></a>

```java
public static final int DEBUG_PROTO = 3;
```

Debug level flag.
 Various internal trace printouts will occur.

### DEBUG_SILENT <a href="#debug_silent-5f227c3b34ee" id="debug_silent-5f227c3b34ee"></a>

```java
public static final int DEBUG_SILENT = 0;
```

Debug level flag.
 No debug printouts whatsoever are produced by the library.

### DEBUG_TRACE <a href="#debug_trace-aa7bd5491a71" id="debug_trace-aa7bd5491a71"></a>

```java
public static final int DEBUG_TRACE = 2;
```

Debug level flag.
 Various internal trace printouts will occur.

### IA_CLIENT_HA <a href="#ia_client_ha-d7be530dd67b" id="ia_client_ha-d7be530dd67b"></a>

```java
public static final int IA_CLIENT_HA = 17;
```

### IA_CLIENT_MAAPI <a href="#ia_client_maapi-abd097089172" id="ia_client_maapi-abd097089172"></a>

```java
public static final int IA_CLIENT_MAAPI = 7;
```

Internal Acceptor client ids used by both application and
 ConfInternal

### IA_CLIENT_NCS <a href="#ia_client_ncs-a23fe7f73990" id="ia_client_ncs-a23fe7f73990"></a>

```java
public static final int IA_CLIENT_NCS = 18;
```

### LIBVSN <a href="#libvsn-9b15fe9684a4" id="libvsn-9b15fe9684a4"></a>

```java
public static final int LIBVSN = 134742016;
```

Library version.

### MODE_READ <a href="#mode_read-1e4ced2f015c" id="mode_read-1e4ced2f015c"></a>

```java
public static final int MODE_READ = 1;
```

Indicates a read only transaction.

### MODE_READ_WRITE <a href="#mode_read_write-0883a33af731" id="mode_read_write-0883a33af731"></a>

```java
public static final int MODE_READ_WRITE = 2;
```

Indicates a read and write transaction.

### NCS_PATH <a href="#ncs_path-4edf16fedc10" id="ncs_path-4edf16fedc10"></a>

```java
public static final String NCS_PATH = "/tmp/nso/nso-ipc";
```

Default path for NCS Local IPC (Unix domain socket).

### NCS_PORT <a href="#ncs_port-a3ad2496735b" id="ncs_port-a3ad2496735b"></a>

```java
public static final int NCS_PORT = 4569;
```

Deprecated default port number that NCS listens to.

**Deprecated:** Use [`NCS_PATH`](Conf.md#ncs_path-4edf16fedc10) instead.

### PORT <a href="#port-c87f4778bfce" id="port-c87f4778bfce"></a>

```java
public static final int PORT = 4565;
```

Default port number that ConfD listens to.

### PROTOVSN <a href="#protovsn-2bf2bf5cea5d" id="protovsn-2bf2bf5cea5d"></a>

```java
public static final int PROTOVSN = 88;
```

Library protocol version.

### REPLY_ACCUMULATE <a href="#reply_accumulate-37dbdbd9601e" id="reply_accumulate-37dbdbd9601e"></a>

```java
public static final int REPLY_ACCUMULATE = 1;
```

General return value for many of the API methods.

### REPLY_ALREADY_LOCKED <a href="#reply_already_locked-962c898a1150" id="reply_already_locked-962c898a1150"></a>

```java
public static final int REPLY_ALREADY_LOCKED = -4;
```

General return value for many of the API methods.

### REPLY_DELAYED_RESPONSE <a href="#reply_delayed_response-3d5e5d91f027" id="reply_delayed_response-3d5e5d91f027"></a>

```java
public static final int REPLY_DELAYED_RESPONSE = 2;
```

General return value for many of the API methods.

### REPLY_EOF <a href="#reply_eof-b25ad8656332" id="reply_eof-b25ad8656332"></a>

```java
public static final int REPLY_EOF = -2;
```

General return value for many of the API methods.

### REPLY_ERR <a href="#reply_err-4ccb5116fda6" id="reply_err-4ccb5116fda6"></a>

```java
public static final int REPLY_ERR = -1;
```

General return value for many of the API methods.

### REPLY_OK <a href="#reply_ok-bb7e2f4029a2" id="reply_ok-bb7e2f4029a2"></a>

```java
public static final int REPLY_OK = 0;
```

General return value for many of the API methods.

### REPLY_VALIDATION_WARN <a href="#reply_validation_warn-706fd9b0a6b4" id="reply_validation_warn-706fd9b0a6b4"></a>

```java
public static final int REPLY_VALIDATION_WARN = -3;
```

General return value for many of the API methods.


## Methods

### byteArrayToHexString(byte[]) <a href="#bytearraytohexstring-d2fcd7957dae" id="bytearraytohexstring-d2fcd7957dae"></a>

```java
public static String byteArrayToHexString(byte[] a)
```

Converts a byte array to a hex string

**Parameters**

- `byte[] a`

### dbnameToString(int) <a href="#dbnametostring-2282036c6d4c" id="dbnametostring-2282036c6d4c"></a>

```java
public static String dbnameToString(int dbname)
```

Converts a dbname constant into a string

**Parameters**

- `int dbname`

### hexStringToByteArray(String) <a href="#hexstringtobytearray-089f10c91f26" id="hexstringtobytearray-089f10c91f26"></a>

```java
public static byte[] hexStringToByteArray(String s)
```

Converts a hex string to a byte array

**Parameters**

- `String s`

### kpToString(ConfObject[]) <a href="#kptostring-078f830def26" id="kptostring-078f830def26"></a>

```java
public static String kpToString(com.tailf.conf.ConfObject[] kp)
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

Converts a keypath Object[] kp into a string.
 A keypath is an array of either ConfTag or ConfKey objects.
 Mostly used for debugging keypaths.
 Notice that a keypath array is always reversed,
 beginning with the leaf first.
 This method will return the string of the keypath in
 correct order, beginning with namespace and top element first.

**Parameters**

- `com.tailf.conf.ConfObject[] kp` - Keypath

### modeToString(int) <a href="#modetostring-dc0acb156ca7" id="modetostring-dc0acb156ca7"></a>

```java
public static String modeToString(int mode)
```

Converts a mode constant into a string

**Parameters**

- `int mode`
