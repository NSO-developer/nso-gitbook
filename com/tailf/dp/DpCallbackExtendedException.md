# DpCallbackExtendedException <a href="#cls-DpCallbackExtendedException" id="cls-DpCallbackExtendedException"></a>

```java
public class com.tailf.dp.DpCallbackExtendedException
    extends com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

Extended errorcode Exceptions thrown from inside callbacks to
 identify problems.

## Members

**Constructors**:

- [DpCallbackExtendedException(int, ConfNamespace, String, ConfException)](#m-DpCallbackExtendedException-4ba8ef4cb3cd)
- [DpCallbackExtendedException(int, ConfNamespace, String, String, Object[])](#m-DpCallbackExtendedException-8617be9ab41f)
- [DpCallbackExtendedException(int, String)](#m-DpCallbackExtendedException-789b6c061950)

**Fields**:

- [ERRCODE_ACCESS_DENIED](#m-ERRCODE_ACCESS_DENIED)
- [ERRCODE_APPLICATION](#m-ERRCODE_APPLICATION)
- [ERRCODE_APPLICATION_INTERNAL](#m-ERRCODE_APPLICATION_INTERNAL)
- [ERRCODE_DATA_MISSING](#m-ERRCODE_DATA_MISSING)
- [ERRCODE_IN_USE](#m-ERRCODE_IN_USE)
- [ERRCODE_INCONSISTENT_VALUE](#m-ERRCODE_INCONSISTENT_VALUE)
- [ERRCODE_INTERNAL](#m-ERRCODE_INTERNAL)
- [ERRCODE_INTERRUPT](#m-ERRCODE_INTERRUPT)
- [ERRCODE_PROTO_USAGE](#m-ERRCODE_PROTO_USAGE)
- [ERRCODE_RESOURCE_DENIED](#m-ERRCODE_RESOURCE_DENIED)
- [extendedErrorCode](#m-extendedErrorCode)

**Methods**:

- [getAppNS()](#m-getAppNS-7c6fc85ea70b)
- [getAppTag()](#m-getAppTag-9f85f05c1736)
- [getErrorCode()](../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getExtendedErrorCodeString()](#m-getExtendedErrorCodeString-522ef11dd66a)
- [getOpaque()](../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](DpException.md#m-mk-de1cedfc6ea8) from DpException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

### DpCallbackExtendedException(int, ConfNamespace, String, ConfException) <a href="#m-DpCallbackExtendedException-4ba8ef4cb3cd" id="m-DpCallbackExtendedException-4ba8ef4cb3cd"></a>

```java
public DpCallbackExtendedException(
    int extendedErrorCode,
    com.tailf.conf.ConfNamespace appNS,
    String appTag,
    com.tailf.conf.ConfException ex
)
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `int extendedErrorCode` - - One of `ERRCODE_IN_USE`,
            `ERRCODE_RESOURCE_DENIED`,
            `ERRCODE_INCONSISTENT_VALUE`,
            `ERRCODE_ACCESS_DENIED`,
            `ERRCODE_DATA_MISSING`,
            `ERRCODE_INTERRUPT`,
            `ERRCODE_APPLICATION` or
            `ERRCODE_APPLICATION_INTERNAL`
- `com.tailf.conf.ConfNamespace appNS` - - not implemented, should be null
- `String appTag` - - not implemented, should be null
- `com.tailf.conf.ConfException ex` - - cause exception

### DpCallbackExtendedException(int, ConfNamespace, String, String, Object[]) <a href="#m-DpCallbackExtendedException-8617be9ab41f" id="m-DpCallbackExtendedException-8617be9ab41f"></a>

```java
public DpCallbackExtendedException(
    int extendedErrorCode,
    com.tailf.conf.ConfNamespace appNS,
    String appTag,
    String fmt,
    Object[] arguments
)
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

**Parameters**

- `int extendedErrorCode` - - One of `ERRCODE_IN_USE`,
            `ERRCODE_RESOURCE_DENIED`,
            `ERRCODE_INCONSISTENT_VALUE`,
            `ERRCODE_ACCESS_DENIED`,
            `ERRCODE_DATA_MISSING`,
            `ERRCODE_INTERRUPT`,
            `ERRCODE_APPLICATION` or
            `ERRCODE_APPLICATION_INTERNAL`
- `com.tailf.conf.ConfNamespace appNS` - - not implemented, should be null
- `String appTag` - - not implemented, should be null
- `String fmt` - - informative text describing this exception
- `Object[] arguments` - - arguments to be substituted in fmt

### DpCallbackExtendedException(int, String) <a href="#m-DpCallbackExtendedException-789b6c061950" id="m-DpCallbackExtendedException-789b6c061950"></a>

```java
public DpCallbackExtendedException(int extendedErrorCode, String msg)
```

**Parameters**

- `int extendedErrorCode` - - One of `ERRCODE_IN_USE`,
            `ERRCODE_RESOURCE_DENIED`,
            `ERRCODE_INCONSISTENT_VALUE`,
            `ERRCODE_ACCESS_DENIED`,
            `ERRCODE_DATA_MISSING`,
            `ERRCODE_INTERRUPT`,
            `ERRCODE_APPLICATION` or
            `ERRCODE_APPLICATION_INTERNAL`
- `String msg` - - informative text describing this exception


## Fields

### ERRCODE_ACCESS_DENIED <a href="#m-ERRCODE_ACCESS_DENIED" id="m-ERRCODE_ACCESS_DENIED"></a>

```java
public static final int ERRCODE_ACCESS_DENIED = 3;
```

### ERRCODE_APPLICATION <a href="#m-ERRCODE_APPLICATION" id="m-ERRCODE_APPLICATION"></a>

```java
public static final int ERRCODE_APPLICATION = 4;
```

### ERRCODE_APPLICATION_INTERNAL <a href="#m-ERRCODE_APPLICATION_INTERNAL" id="m-ERRCODE_APPLICATION_INTERNAL"></a>

```java
public static final int ERRCODE_APPLICATION_INTERNAL = 5;
```

### ERRCODE_DATA_MISSING <a href="#m-ERRCODE_DATA_MISSING" id="m-ERRCODE_DATA_MISSING"></a>

```java
public static final int ERRCODE_DATA_MISSING = 8;
```

### ERRCODE_IN_USE <a href="#m-ERRCODE_IN_USE" id="m-ERRCODE_IN_USE"></a>

```java
public static final int ERRCODE_IN_USE = 0;
```

### ERRCODE_INCONSISTENT_VALUE <a href="#m-ERRCODE_INCONSISTENT_VALUE" id="m-ERRCODE_INCONSISTENT_VALUE"></a>

```java
public static final int ERRCODE_INCONSISTENT_VALUE = 2;
```

### ERRCODE_INTERNAL <a href="#m-ERRCODE_INTERNAL" id="m-ERRCODE_INTERNAL"></a>

```java
protected static final int ERRCODE_INTERNAL = 7;
```

### ERRCODE_INTERRUPT <a href="#m-ERRCODE_INTERRUPT" id="m-ERRCODE_INTERRUPT"></a>

```java
public static final int ERRCODE_INTERRUPT = 9;
```

### ERRCODE_PROTO_USAGE <a href="#m-ERRCODE_PROTO_USAGE" id="m-ERRCODE_PROTO_USAGE"></a>

```java
protected static final int ERRCODE_PROTO_USAGE = 6;
```

### ERRCODE_RESOURCE_DENIED <a href="#m-ERRCODE_RESOURCE_DENIED" id="m-ERRCODE_RESOURCE_DENIED"></a>

```java
public static final int ERRCODE_RESOURCE_DENIED = 1;
```

### extendedErrorCode <a href="#m-extendedErrorCode" id="m-extendedErrorCode"></a>

```java
public int extendedErrorCode = null;
```


## Methods

### getAppNS() <a href="#m-getAppNS-7c6fc85ea70b" id="m-getAppNS-7c6fc85ea70b"></a>

```java
public com.tailf.conf.ConfNamespace getAppNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

**Returns:** ConfNamespace for this extended exception

### getAppTag() <a href="#m-getAppTag-9f85f05c1736" id="m-getAppTag-9f85f05c1736"></a>

```java
public String getAppTag()
```

**Returns:** appTag for the extended exception

### getExtendedErrorCodeString() <a href="#m-getExtendedErrorCodeString-522ef11dd66a" id="m-getExtendedErrorCodeString-522ef11dd66a"></a>

```java
public String getExtendedErrorCodeString()
```

Get string representation of this exception error code.

**Returns:** String representation of the errorcode for this extended
         exception
