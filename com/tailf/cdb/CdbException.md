# CdbException <a href="#cls-CdbException" id="cls-CdbException"></a>

```java
public class com.tailf.cdb.CdbException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Cdb package generic exception

**Related classes**

- [CdbExtendedException](CdbExtendedException.md#cls-CdbExtendedException)

## Members

**Constructors**:

- [CdbException(String)](#m-CdbException-712018a53039)
- [CdbException(String, ErrorCode)](#m-CdbException-aa046b728f43)
- [CdbException(String, ErrorCode, Throwable)](#m-CdbException-f772b12ea6ee)
- [CdbException(String, int)](#m-CdbException-1a95721d5c78)
- [CdbException(String, int, Throwable)](#m-CdbException-9adb758e9e8e)
- [CdbException(String, Throwable)](#m-CdbException-5e6f61025d70)
- [CdbException(Throwable)](#m-CdbException-7a4196d4ccee)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#m-mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](#m-mk-79e69ffbc022)

## Constructors

### CdbException(String) <a href="#m-CdbException-712018a53039" id="m-CdbException-712018a53039"></a>

```java
public CdbException(String msg)
```

**Parameters**

- `String msg`

### CdbException(String, ErrorCode) <a href="#m-CdbException-aa046b728f43" id="m-CdbException-aa046b728f43"></a>

```java
public CdbException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

### CdbException(String, ErrorCode, Throwable) <a href="#m-CdbException-f772b12ea6ee" id="m-CdbException-f772b12ea6ee"></a>

```java
public CdbException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### CdbException(String, int) <a href="#m-CdbException-1a95721d5c78" id="m-CdbException-1a95721d5c78"></a>

```java
public CdbException(String msg, int codeInteger)
```

**Parameters**

- `String msg`
- `int codeInteger`

### CdbException(String, int, Throwable) <a href="#m-CdbException-9adb758e9e8e" id="m-CdbException-9adb758e9e8e"></a>

```java
public CdbException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

### CdbException(String, Throwable) <a href="#m-CdbException-5e6f61025d70" id="m-CdbException-5e6f61025d70"></a>

```java
public CdbException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

### CdbException(Throwable) <a href="#m-CdbException-7a4196d4ccee" id="m-CdbException-7a4196d4ccee"></a>

```java
public CdbException(Throwable t)
```

**Parameters**

- `Throwable t`


## Methods

### mk(ConfResponse) <a href="#m-mk-de1cedfc6ea8" id="m-mk-de1cedfc6ea8"></a>

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException), [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`

### mk(ConfResponse, ConfPath) <a href="#m-mk-79e69ffbc022" id="m-mk-79e69ffbc022"></a>

```java
public static com.tailf.conf.ConfException mk(
    com.tailf.conf.ConfResponse r,
    com.tailf.conf.ConfPath path
)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException), [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse), [ConfPath](../conf/ConfPath.md#cls-ConfPath)

**Parameters**

- `com.tailf.conf.ConfResponse r`
- `com.tailf.conf.ConfPath path`
