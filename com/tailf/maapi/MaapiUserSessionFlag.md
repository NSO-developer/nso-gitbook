<a id="cls-MaapiUserSessionFlag"></a>
# MaapiUserSessionFlag

```java
public enum com.tailf.maapi.MaapiUserSessionFlag
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#cls-MaapiUserSessionFlag)

flags for defining User Session protocol

## Members

**Enum Constants**:

- [PROTO_CONSOLE](#m-PROTO_CONSOLE)
- [PROTO_SSH](#m-PROTO_SSH)
- [PROTO_SSL](#m-PROTO_SSL)
- [PROTO_TCP](#m-PROTO_TCP)

**Methods**:

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(int)](#m-valueof-c0d46d25fc67)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-PROTO_CONSOLE"></a>
### PROTO_CONSOLE

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_CONSOLE;
```

User session originates from the console.

<a id="m-PROTO_SSH"></a>
### PROTO_SSH

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_SSH;
```

User session is transported over SSH.

<a id="m-PROTO_SSL"></a>
### PROTO_SSL

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_SSL;
```

User session transported over SSL.

<a id="m-PROTO_TCP"></a>
### PROTO_TCP

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_TCP;
```

User session transported over TCP.


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-c0d46d25fc67"></a>
### valueOf(int)

```java
public static com.tailf.maapi.MaapiUserSessionFlag valueOf(int i)
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#cls-MaapiUserSessionFlag)

**Parameters**

- `int i`

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.maapi.MaapiUserSessionFlag valueOf(String name)
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#cls-MaapiUserSessionFlag)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.maapi.MaapiUserSessionFlag[] values()
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#cls-MaapiUserSessionFlag)
