<a id="s-MaapiUserSessionFlag"></a>
# MaapiUserSessionFlag

```java
public enum com.tailf.maapi.MaapiUserSessionFlag
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#s-MaapiUserSessionFlag)

flags for defining User Session protocol

**Related classes**

- [MaapiUserSessionFlag](MaapiUserSessionFlag.md#s-MaapiUserSessionFlag)

## Members

**Enum Constants**:

- [PROTO_CONSOLE](#s-PROTO_CONSOLE)
- [PROTO_SSH](#s-PROTO_SSH)
- [PROTO_SSL](#s-PROTO_SSL)
- [PROTO_TCP](#s-PROTO_TCP)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-PROTO_CONSOLE"></a>
### PROTO_CONSOLE

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_CONSOLE;
```

User session originates from the console.

<a id="s-PROTO_SSH"></a>
### PROTO_SSH

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_SSH;
```

User session is transported over SSH.

<a id="s-PROTO_SSL"></a>
### PROTO_SSL

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_SSL;
```

User session transported over SSL.

<a id="s-PROTO_TCP"></a>
### PROTO_TCP

```java
public static final com.tailf.maapi.MaapiUserSessionFlag PROTO_TCP;
```

User session transported over TCP.


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.maapi.MaapiUserSessionFlag valueOf(int i)
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#s-MaapiUserSessionFlag)

**Parameters**

- `int i`

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.maapi.MaapiUserSessionFlag valueOf(String name)
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#s-MaapiUserSessionFlag)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.maapi.MaapiUserSessionFlag[] values()
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#s-MaapiUserSessionFlag)
