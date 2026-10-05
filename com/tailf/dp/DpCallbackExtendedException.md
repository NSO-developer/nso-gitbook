<a id="s-DpCallbackExtendedException"></a>
# DpCallbackExtendedException

```java
public class com.tailf.dp.DpCallbackExtendedException
    extends com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

Extended errorcode Exceptions thrown from inside callbacks to
 identify problems.

## Members

**Constructors**:

- [DpCallbackExtendedException(int, ConfNamespace, String, ConfException)](#s-DpCallbackExtendedException-1)
- [DpCallbackExtendedException(int, ConfNamespace, String, String, Object[])](#s-DpCallbackExtendedException-2)
- [DpCallbackExtendedException(int, String)](#s-DpCallbackExtendedException-3)

**Fields**:

- [ERRCODE_ACCESS_DENIED](#s-ERRCODE_ACCESS_DENIED)
- [ERRCODE_APPLICATION](#s-ERRCODE_APPLICATION)
- [ERRCODE_APPLICATION_INTERNAL](#s-ERRCODE_APPLICATION_INTERNAL)
- [ERRCODE_DATA_MISSING](#s-ERRCODE_DATA_MISSING)
- [ERRCODE_IN_USE](#s-ERRCODE_IN_USE)
- [ERRCODE_INCONSISTENT_VALUE](#s-ERRCODE_INCONSISTENT_VALUE)
- [ERRCODE_INTERNAL](#s-ERRCODE_INTERNAL)
- [ERRCODE_INTERRUPT](#s-ERRCODE_INTERRUPT)
- [ERRCODE_PROTO_USAGE](#s-ERRCODE_PROTO_USAGE)
- [ERRCODE_RESOURCE_DENIED](#s-ERRCODE_RESOURCE_DENIED)
- [extendedErrorCode](#s-extendedErrorCode)

**Methods**:

- [getAppNS()](#s-getAppNS)
- [getAppTag()](#s-getAppTag)
- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getExtendedErrorCodeString()](#s-getExtendedErrorCodeString)
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](DpException.md#s-mk) from DpException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#s-mk-1) from ConfException

## Constructors

<a id="s-DpCallbackExtendedException-1"></a>
### DpCallbackExtendedException(int, ConfNamespace, String, ConfException)

```java
public DpCallbackExtendedException(
    int extendedErrorCode,
    com.tailf.conf.ConfNamespace appNS,
    String appTag,
    com.tailf.conf.ConfException ex
)
```

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace), [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-DpCallbackExtendedException-2"></a>
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

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace)

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

<a id="s-DpCallbackExtendedException-3"></a>
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

<a id="s-ERRCODE_ACCESS_DENIED"></a>
### ERRCODE_ACCESS_DENIED

```java
public static final int ERRCODE_ACCESS_DENIED = 3;
```

<a id="s-ERRCODE_APPLICATION"></a>
### ERRCODE_APPLICATION

```java
public static final int ERRCODE_APPLICATION = 4;
```

<a id="s-ERRCODE_APPLICATION_INTERNAL"></a>
### ERRCODE_APPLICATION_INTERNAL

```java
public static final int ERRCODE_APPLICATION_INTERNAL = 5;
```

<a id="s-ERRCODE_DATA_MISSING"></a>
### ERRCODE_DATA_MISSING

```java
public static final int ERRCODE_DATA_MISSING = 8;
```

<a id="s-ERRCODE_IN_USE"></a>
### ERRCODE_IN_USE

```java
public static final int ERRCODE_IN_USE = 0;
```

<a id="s-ERRCODE_INCONSISTENT_VALUE"></a>
### ERRCODE_INCONSISTENT_VALUE

```java
public static final int ERRCODE_INCONSISTENT_VALUE = 2;
```

<a id="s-ERRCODE_INTERNAL"></a>
### ERRCODE_INTERNAL

```java
protected static final int ERRCODE_INTERNAL = 7;
```

<a id="s-ERRCODE_INTERRUPT"></a>
### ERRCODE_INTERRUPT

```java
public static final int ERRCODE_INTERRUPT = 9;
```

<a id="s-ERRCODE_PROTO_USAGE"></a>
### ERRCODE_PROTO_USAGE

```java
protected static final int ERRCODE_PROTO_USAGE = 6;
```

<a id="s-ERRCODE_RESOURCE_DENIED"></a>
### ERRCODE_RESOURCE_DENIED

```java
public static final int ERRCODE_RESOURCE_DENIED = 1;
```

<a id="s-extendedErrorCode"></a>
### extendedErrorCode

```java
public int extendedErrorCode = null;
```


## Methods

<a id="s-getAppNS"></a>
### getAppNS()

```java
public com.tailf.conf.ConfNamespace getAppNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace)

**Returns:** ConfNamespace for this extended exception

<a id="s-getAppTag"></a>
### getAppTag()

```java
public String getAppTag()
```

**Returns:** appTag for the extended exception

<a id="s-getExtendedErrorCodeString"></a>
### getExtendedErrorCodeString()

```java
public String getExtendedErrorCodeString()
```

Get string representation of this exception error code.

**Returns:** String representation of the errorcode for this extended
         exception
