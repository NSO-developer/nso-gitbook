<a id="s-NavuException"></a>
# NavuException

```java
public class com.tailf.navu.NavuException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Exception raised from the navu package

**Related classes**

- [IllegalParentNavuNodeException](IllegalParentNavuNodeException.md#s-IllegalParentNavuNodeException)
- [NavuSAXException](NavuSAXException.md#s-NavuSAXException)
- [NoSuchNavuCaseException](NoSuchNavuCaseException.md#s-NoSuchNavuCaseException)
- [NoSuchNavuChoiceException](NoSuchNavuChoiceException.md#s-NoSuchNavuChoiceException)
- [NoSuchNavuNodeException](NoSuchNavuNodeException.md#s-NoSuchNavuNodeException)

## Members

**Constructors**:

- [NavuException(ConfException)](#s-NavuException-1)
- [NavuException(IOException)](#s-NavuException-2)
- [NavuException(MaapiException)](#s-NavuException-3)
- [NavuException(String)](#s-NavuException-4)
- [NavuException(String, ConfException)](#s-NavuException-5)
- [NavuException(String, ErrorCode, Throwable)](#s-NavuException-6)
- [NavuException(String, int, Throwable)](#s-NavuException-7)
- [NavuException(String, Throwable)](#s-NavuException-8)
- [NavuException(Throwable)](#s-NavuException-9)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](#s-mk)
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#s-mk-1) from ConfException

## Constructors

<a id="s-NavuException-1"></a>
### NavuException(ConfException)

```java
public NavuException(com.tailf.conf.ConfException e)
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfException e`

<a id="s-NavuException-2"></a>
### NavuException(IOException)

```java
public NavuException(java.io.IOException e)
```

**Parameters**

- `java.io.IOException e`

<a id="s-NavuException-3"></a>
### NavuException(MaapiException)

```java
public NavuException(com.tailf.maapi.MaapiException e)
```

Types: [MaapiException](../maapi/MaapiException.md#s-MaapiException)

**Parameters**

- `com.tailf.maapi.MaapiException e`

<a id="s-NavuException-4"></a>
### NavuException(String)

```java
public NavuException(String msg)
```

**Parameters**

- `String msg`

<a id="s-NavuException-5"></a>
### NavuException(String, ConfException)

```java
public NavuException(String msg, com.tailf.conf.ConfException e)
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `String msg` - a message describing the exception.
- `com.tailf.conf.ConfException e`

<a id="s-NavuException-6"></a>
### NavuException(String, ErrorCode, Throwable)

```java
public NavuException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#s-ErrorCode)

**Parameters**

- `String msg` - a message describing the exception.
- `com.tailf.conf.ErrorCode code` - a code classifying the exception.
- `Throwable cause`

<a id="s-NavuException-7"></a>
### NavuException(String, int, Throwable)

```java
public NavuException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

<a id="s-NavuException-8"></a>
### NavuException(String, Throwable)

```java
public NavuException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

<a id="s-NavuException-9"></a>
### NavuException(Throwable)

```java
public NavuException(Throwable cause)
```

**Parameters**

- `Throwable cause`


## Methods

<a id="s-mk"></a>
### mk(ConfResponse)

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#s-ConfException), [ConfResponse](../conf/ConfResponse.md#s-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`
