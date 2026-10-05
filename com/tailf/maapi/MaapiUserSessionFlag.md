# MaapiUserSessionFlag <a href="#maapiusersessionflag-ee298af54ca4" id="maapiusersessionflag-ee298af54ca4"></a>

```java
public enum com.tailf.maapi.MaapiUserSessionFlag
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#maapiusersessionflag-ee298af54ca4)

flags for defining User Session protocol

## Members

**Enum Constants**:

- [PROTO\_CONSOLE](#proto_console-78051500ad84)
- [PROTO\_SSH](#proto_ssh-cc9a1a228f8c)
- [PROTO\_SSL](#proto_ssl-5514b2e651a4)
- [PROTO\_TCP](#proto_tcp-828eb785fabf)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(int\)](#valueof-c0d46d25fc67)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### PROTO_CONSOLE <a href="#proto_console-78051500ad84" id="proto_console-78051500ad84"></a>

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_CONSOLE;
```

User session originates from the console.

### PROTO_SSH <a href="#proto_ssh-cc9a1a228f8c" id="proto_ssh-cc9a1a228f8c"></a>

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_SSH;
```

User session is transported over SSH.

### PROTO_SSL <a href="#proto_ssl-5514b2e651a4" id="proto_ssl-5514b2e651a4"></a>

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_SSL;
```

User session transported over SSL.

### PROTO_TCP <a href="#proto_tcp-828eb785fabf" id="proto_tcp-828eb785fabf"></a>

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_TCP;
```

User session transported over TCP.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.maapi.MaapiUserSessionFlag valueOf(int i)
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#maapiusersessionflag-ee298af54ca4)

**Parameters**

- `int i`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.maapi.MaapiUserSessionFlag valueOf(String name)
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#maapiusersessionflag-ee298af54ca4)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.MaapiUserSessionFlag[] values()
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#maapiusersessionflag-ee298af54ca4)
