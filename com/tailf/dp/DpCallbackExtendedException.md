# DpCallbackExtendedException <a href="#dpcallbackextendedexception-56110945bf17" id="dpcallbackextendedexception-56110945bf17"></a>

```java
public class com.tailf.dp.DpCallbackExtendedException
    extends com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Extended errorcode Exceptions thrown from inside callbacks to
 identify problems.

## Members

**Constructors**:

- [DpCallbackExtendedException(int, ConfNamespace, String, ConfException)](#dpcallbackextendedexception-4ba8ef4cb3cd)
- [DpCallbackExtendedException(int, ConfNamespace, String, String, Object[])](#dpcallbackextendedexception-8617be9ab41f)
- [DpCallbackExtendedException(int, String)](#dpcallbackextendedexception-789b6c061950)

**Fields**:

- [ERRCODE_ACCESS_DENIED](#errcode_access_denied-8378f1679ea9)
- [ERRCODE_APPLICATION](#errcode_application-768d4d3ab472)
- [ERRCODE_APPLICATION_INTERNAL](#errcode_application_internal-df6aa1d24b5f)
- [ERRCODE_DATA_MISSING](#errcode_data_missing-7c7b0e40eee5)
- [ERRCODE_IN_USE](#errcode_in_use-45e7b94d9a26)
- [ERRCODE_INCONSISTENT_VALUE](#errcode_inconsistent_value-25091f223ca4)
- [ERRCODE_INTERNAL](#errcode_internal-d03248afe467)
- [ERRCODE_INTERRUPT](#errcode_interrupt-e2cc2ca2104c)
- [ERRCODE_PROTO_USAGE](#errcode_proto_usage-2f5be49068a7)
- [ERRCODE_RESOURCE_DENIED](#errcode_resource_denied-4d20871f49da)
- [extendedErrorCode](#extendederrorcode-3db0588d19ba)

**Methods**:

- [getAppNS()](#getappns-7c6fc85ea70b)
- [getAppTag()](#getapptag-9f85f05c1736)
- [getErrorCode()](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getExtendedErrorCodeString()](#getextendederrorcodestring-522ef11dd66a)
- [getOpaque()](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](DpException.md#mk-de1cedfc6ea8) from DpException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#mk-79e69ffbc022) from ConfException

## Constructors

### DpCallbackExtendedException(int, ConfNamespace, String, ConfException) <a href="#dpcallbackextendedexception-4ba8ef4cb3cd" id="dpcallbackextendedexception-4ba8ef4cb3cd"></a>

```java
public DpCallbackExtendedException(
    int extendedErrorCode,
    com.tailf.conf.ConfNamespace appNS,
    String appTag,
    com.tailf.conf.ConfException ex
)
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

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

### DpCallbackExtendedException(int, ConfNamespace, String, String, Object[]) <a href="#dpcallbackextendedexception-8617be9ab41f" id="dpcallbackextendedexception-8617be9ab41f"></a>

```java
public DpCallbackExtendedException(
    int extendedErrorCode,
    com.tailf.conf.ConfNamespace appNS,
    String appTag,
    String fmt,
    Object[] arguments
)
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

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

### DpCallbackExtendedException(int, String) <a href="#dpcallbackextendedexception-789b6c061950" id="dpcallbackextendedexception-789b6c061950"></a>

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

### ERRCODE_ACCESS_DENIED <a href="#errcode_access_denied-8378f1679ea9" id="errcode_access_denied-8378f1679ea9"></a>

```java
public static final int ERRCODE_ACCESS_DENIED = 3;
```

### ERRCODE_APPLICATION <a href="#errcode_application-768d4d3ab472" id="errcode_application-768d4d3ab472"></a>

```java
public static final int ERRCODE_APPLICATION = 4;
```

### ERRCODE_APPLICATION_INTERNAL <a href="#errcode_application_internal-df6aa1d24b5f" id="errcode_application_internal-df6aa1d24b5f"></a>

```java
public static final int ERRCODE_APPLICATION_INTERNAL = 5;
```

### ERRCODE_DATA_MISSING <a href="#errcode_data_missing-7c7b0e40eee5" id="errcode_data_missing-7c7b0e40eee5"></a>

```java
public static final int ERRCODE_DATA_MISSING = 8;
```

### ERRCODE_IN_USE <a href="#errcode_in_use-45e7b94d9a26" id="errcode_in_use-45e7b94d9a26"></a>

```java
public static final int ERRCODE_IN_USE = 0;
```

### ERRCODE_INCONSISTENT_VALUE <a href="#errcode_inconsistent_value-25091f223ca4" id="errcode_inconsistent_value-25091f223ca4"></a>

```java
public static final int ERRCODE_INCONSISTENT_VALUE = 2;
```

### ERRCODE_INTERNAL <a href="#errcode_internal-d03248afe467" id="errcode_internal-d03248afe467"></a>

```java
protected static final int ERRCODE_INTERNAL = 7;
```

### ERRCODE_INTERRUPT <a href="#errcode_interrupt-e2cc2ca2104c" id="errcode_interrupt-e2cc2ca2104c"></a>

```java
public static final int ERRCODE_INTERRUPT = 9;
```

### ERRCODE_PROTO_USAGE <a href="#errcode_proto_usage-2f5be49068a7" id="errcode_proto_usage-2f5be49068a7"></a>

```java
protected static final int ERRCODE_PROTO_USAGE = 6;
```

### ERRCODE_RESOURCE_DENIED <a href="#errcode_resource_denied-4d20871f49da" id="errcode_resource_denied-4d20871f49da"></a>

```java
public static final int ERRCODE_RESOURCE_DENIED = 1;
```

### extendedErrorCode <a href="#extendederrorcode-3db0588d19ba" id="extendederrorcode-3db0588d19ba"></a>

```java
public int extendedErrorCode = null;
```


## Methods

### getAppNS() <a href="#getappns-7c6fc85ea70b" id="getappns-7c6fc85ea70b"></a>

```java
public com.tailf.conf.ConfNamespace getAppNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

**Returns:** ConfNamespace for this extended exception

### getAppTag() <a href="#getapptag-9f85f05c1736" id="getapptag-9f85f05c1736"></a>

```java
public String getAppTag()
```

**Returns:** appTag for the extended exception

### getExtendedErrorCodeString() <a href="#getextendederrorcodestring-522ef11dd66a" id="getextendederrorcodestring-522ef11dd66a"></a>

```java
public String getExtendedErrorCodeString()
```

Get string representation of this exception error code.

**Returns:** String representation of the errorcode for this extended
         exception
