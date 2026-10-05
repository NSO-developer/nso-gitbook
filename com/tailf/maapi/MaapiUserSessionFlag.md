# MaapiUserSessionFlag <a href="#cls-MaapiUserSessionFlag" id="cls-MaapiUserSessionFlag"></a>

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

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(int)](#m-valueOf-c0d46d25fc67)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### PROTO_CONSOLE <a href="#m-PROTO_CONSOLE" id="m-PROTO_CONSOLE"></a>

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_CONSOLE;
```

User session originates from the console.

### PROTO_SSH <a href="#m-PROTO_SSH" id="m-PROTO_SSH"></a>

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_SSH;
```

User session is transported over SSH.

### PROTO_SSL <a href="#m-PROTO_SSL" id="m-PROTO_SSL"></a>

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_SSL;
```

User session transported over SSL.

### PROTO_TCP <a href="#m-PROTO_TCP" id="m-PROTO_TCP"></a>

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_TCP;
```

User session transported over TCP.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#m-valueOf-c0d46d25fc67" id="m-valueOf-c0d46d25fc67"></a>

```java
public static com.tailf.maapi.MaapiUserSessionFlag valueOf(int i)
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#cls-MaapiUserSessionFlag)

**Parameters**

- `int i`

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.maapi.MaapiUserSessionFlag valueOf(String name)
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#cls-MaapiUserSessionFlag)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.MaapiUserSessionFlag[] values()
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#cls-MaapiUserSessionFlag)
