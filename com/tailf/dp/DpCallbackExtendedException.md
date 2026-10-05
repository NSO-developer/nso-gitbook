<a id="cls-DpCallbackExtendedException"></a>
# DpCallbackExtendedException

```java
public class com.tailf.dp.DpCallbackExtendedException
    extends com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

Extended errorcode Exceptions thrown from inside callbacks to
 identify problems.

## Members

**Constructors**:

- [DpCallbackExtendedException(int, ConfNamespace, String, ConfException)](#m-dpcallbackextendedexception-4ba8ef4cb3cd)
- [DpCallbackExtendedException(int, ConfNamespace, String, String, Object[])](#m-dpcallbackextendedexception-8617be9ab41f)
- [DpCallbackExtendedException(int, String)](#m-dpcallbackextendedexception-789b6c061950)

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

- [getAppNS()](#m-getappns-7c6fc85ea70b)
- [getAppTag()](#m-getapptag-9f85f05c1736)
- [getErrorCode()](../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getExtendedErrorCodeString()](#m-getextendederrorcodestring-522ef11dd66a)
- [getOpaque()](../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](DpException.md#m-mk-de1cedfc6ea8) from DpException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

<a id="m-dpcallbackextendedexception-4ba8ef4cb3cd"></a>
### DpCallbackExtendedException(int, ConfNamespace, String, ConfException)

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

<a id="m-dpcallbackextendedexception-8617be9ab41f"></a>
### DpCallbackExtendedException(int, ConfNamespace, String, String, Object[])

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

<a id="m-dpcallbackextendedexception-789b6c061950"></a>
### DpCallbackExtendedException(int, String)

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

<a id="m-ERRCODE_ACCESS_DENIED"></a>
### ERRCODE_ACCESS_DENIED

```java
public static final int ERRCODE_ACCESS_DENIED = 3;
```

<a id="m-ERRCODE_APPLICATION"></a>
### ERRCODE_APPLICATION

```java
public static final int ERRCODE_APPLICATION = 4;
```

<a id="m-ERRCODE_APPLICATION_INTERNAL"></a>
### ERRCODE_APPLICATION_INTERNAL

```java
public static final int ERRCODE_APPLICATION_INTERNAL = 5;
```

<a id="m-ERRCODE_DATA_MISSING"></a>
### ERRCODE_DATA_MISSING

```java
public static final int ERRCODE_DATA_MISSING = 8;
```

<a id="m-ERRCODE_IN_USE"></a>
### ERRCODE_IN_USE

```java
public static final int ERRCODE_IN_USE = 0;
```

<a id="m-ERRCODE_INCONSISTENT_VALUE"></a>
### ERRCODE_INCONSISTENT_VALUE

```java
public static final int ERRCODE_INCONSISTENT_VALUE = 2;
```

<a id="m-ERRCODE_INTERNAL"></a>
### ERRCODE_INTERNAL

```java
protected static final int ERRCODE_INTERNAL = 7;
```

<a id="m-ERRCODE_INTERRUPT"></a>
### ERRCODE_INTERRUPT

```java
public static final int ERRCODE_INTERRUPT = 9;
```

<a id="m-ERRCODE_PROTO_USAGE"></a>
### ERRCODE_PROTO_USAGE

```java
protected static final int ERRCODE_PROTO_USAGE = 6;
```

<a id="m-ERRCODE_RESOURCE_DENIED"></a>
### ERRCODE_RESOURCE_DENIED

```java
public static final int ERRCODE_RESOURCE_DENIED = 1;
```

<a id="m-extendedErrorCode"></a>
### extendedErrorCode

```java
public int extendedErrorCode = null;
```


## Methods

<a id="m-getappns-7c6fc85ea70b"></a>
### getAppNS()

```java
public com.tailf.conf.ConfNamespace getAppNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

**Returns:** ConfNamespace for this extended exception

<a id="m-getapptag-9f85f05c1736"></a>
### getAppTag()

```java
public String getAppTag()
```

**Returns:** appTag for the extended exception

<a id="m-getextendederrorcodestring-522ef11dd66a"></a>
### getExtendedErrorCodeString()

```java
public String getExtendedErrorCodeString()
```

Get string representation of this exception error code.

**Returns:** String representation of the errorcode for this extended
         exception
