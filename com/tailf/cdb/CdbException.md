<a id="s-CdbException"></a>
# CdbException

```java
public class com.tailf.cdb.CdbException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Cdb package generic exception

**Related classes**

- [CdbExtendedException](CdbExtendedException.md#s-CdbExtendedException)

## Members

**Constructors**:

- [CdbException(String)](#s-CdbException-1)
- [CdbException(String, ErrorCode)](#s-CdbException-2)
- [CdbException(String, ErrorCode, Throwable)](#s-CdbException-3)
- [CdbException(String, int)](#s-CdbException-4)
- [CdbException(String, int, Throwable)](#s-CdbException-5)
- [CdbException(String, Throwable)](#s-CdbException-6)
- [CdbException(Throwable)](#s-CdbException-7)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](#s-mk)
- [mk(ConfResponse, ConfPath)](#s-mk-1)

## Constructors

<a id="s-CdbException-1"></a>
### CdbException(String)

```java
public CdbException(String msg)
```

**Parameters**

- `String msg`

<a id="s-CdbException-2"></a>
### CdbException(String, ErrorCode)

```java
public CdbException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

<a id="s-CdbException-3"></a>
### CdbException(String, ErrorCode, Throwable)

```java
public CdbException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="s-CdbException-4"></a>
### CdbException(String, int)

```java
public CdbException(String msg, int codeInteger)
```

**Parameters**

- `String msg`
- `int codeInteger`

<a id="s-CdbException-5"></a>
### CdbException(String, int, Throwable)

```java
public CdbException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

<a id="s-CdbException-6"></a>
### CdbException(String, Throwable)

```java
public CdbException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

<a id="s-CdbException-7"></a>
### CdbException(Throwable)

```java
public CdbException(Throwable t)
```

**Parameters**

- `Throwable t`


## Methods

<a id="s-mk"></a>
### mk(ConfResponse)

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#s-ConfException), [ConfResponse](../conf/ConfResponse.md#s-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`

<a id="s-mk-1"></a>
### mk(ConfResponse, ConfPath)

```java
public static com.tailf.conf.ConfException mk(
    com.tailf.conf.ConfResponse r,
    com.tailf.conf.ConfPath path
)
```

Types: [ConfException](../conf/ConfException.md#s-ConfException), [ConfResponse](../conf/ConfResponse.md#s-ConfResponse), [ConfPath](../conf/ConfPath.md#s-ConfPath)

**Parameters**

- `com.tailf.conf.ConfResponse r`
- `com.tailf.conf.ConfPath path`
