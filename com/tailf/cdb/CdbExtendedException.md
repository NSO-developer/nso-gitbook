# CdbExtendedException <a href="#cdbextendedexception-9de7535dd8dd" id="cdbextendedexception-9de7535dd8dd"></a>

```java
public class com.tailf.cdb.CdbExtendedException
    extends com.tailf.cdb.CdbException
```

Types: [CdbException](CdbException.md#cdbexception-a14a27a1a190)

This exception is used by clients of CdbSubscription that needs to report
 errors. As such it can is required to hold an extendedErrorCode and an
 message. The extendedErrorCode is one of: ERRCODE_IN_USE
 ERRCODE_RESOURCE_DENIED ERRCODE_INCONSISTENT_VALUE ERRCODE_ACCESS_DENIED
 ERRCODE_APPLICATION ERRCODE_APPLICATION_INTERNAL ERRCODE_DATA_MISSING
 ERRCODE_INTERRUPT

 It can also indicate an application namespace and tag to further indicate
 place for the error.

## Members

**Constructors**:

- [CdbExtendedException\(int, ConfNamespace, String, ConfException\)](#cdbextendedexception-d4627df609d2)
- [CdbExtendedException\(int, ConfNamespace, String, String\)](#cdbextendedexception-dcf45499af32)
- [CdbExtendedException\(int, String\)](#cdbextendedexception-03279c6b0750)

**Fields**:

- [ERRCODE\_ACCESS\_DENIED](#errcode_access_denied-8378f1679ea9)
- [ERRCODE\_APPLICATION](#errcode_application-768d4d3ab472)
- [ERRCODE\_APPLICATION\_INTERNAL](#errcode_application_internal-df6aa1d24b5f)
- [ERRCODE\_DATA\_MISSING](#errcode_data_missing-7c7b0e40eee5)
- [ERRCODE\_IN\_USE](#errcode_in_use-45e7b94d9a26)
- [ERRCODE\_INCONSISTENT\_VALUE](#errcode_inconsistent_value-25091f223ca4)
- [ERRCODE\_INTERNAL](#errcode_internal-d03248afe467)
- [ERRCODE\_INTERRUPT](#errcode_interrupt-e2cc2ca2104c)
- [ERRCODE\_PROTO\_USAGE](#errcode_proto_usage-2f5be49068a7)
- [ERRCODE\_RESOURCE\_DENIED](#errcode_resource_denied-4d20871f49da)
- [extendedErrorCode](#extendederrorcode-3db0588d19ba)

**Methods**:

- [getAppNS\(\)](#getappns-7c6fc85ea70b)
- [getAppTag\(\)](#getapptag-9f85f05c1736)
- [getErrorCode\(\)](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getExtendedErrorCodeString\(\)](#getextendederrorcodestring-522ef11dd66a)
- [getOpaque\(\)](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk\(ConfResponse\)](CdbException.md#mk-de1cedfc6ea8) from CdbException
- [mk\(ConfResponse, ConfPath\)](CdbException.md#mk-79e69ffbc022) from CdbException
- [mk\(int, ConfNamespace, String, ConfResponse\)](#mk-45b8f9041391)

## Constructors

### CdbExtendedException(int, ConfNamespace, String, ConfException) <a href="#cdbextendedexception-d4627df609d2" id="cdbextendedexception-d4627df609d2"></a>

```java
public CdbExtendedException(
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

### CdbExtendedException(int, ConfNamespace, String, String) <a href="#cdbextendedexception-dcf45499af32" id="cdbextendedexception-dcf45499af32"></a>

```java
public CdbExtendedException(
    int extendedErrorCode,
    com.tailf.conf.ConfNamespace appNS,
    String appTag,
    String msg
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
- `String msg` - - informative text describing this exception

### CdbExtendedException(int, String) <a href="#cdbextendedexception-03279c6b0750" id="cdbextendedexception-03279c6b0750"></a>

```java
public CdbExtendedException(int extendedErrorCode, String msg)
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

### mk(int, ConfNamespace, String, ConfResponse) <a href="#mk-45b8f9041391" id="mk-45b8f9041391"></a>

```java
public static com.tailf.conf.ConfException mk(
    int extendedErrorCode,
    com.tailf.conf.ConfNamespace appNS,
    String appTag,
    com.tailf.conf.ConfResponse r
)
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1), [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49)

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
- `com.tailf.conf.ConfResponse r` - - cause response

**Returns:** ConfException - the resulting exception
