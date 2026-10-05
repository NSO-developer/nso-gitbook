<a id="cls-NavuException"></a>
# NavuException

```java
public class com.tailf.navu.NavuException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Exception raised from the navu package

**Related classes**

- [IllegalParentNavuNodeException](IllegalParentNavuNodeException.md#cls-IllegalParentNavuNodeException)
- [NavuSAXException](NavuSAXException.md#cls-NavuSAXException)
- [NoSuchNavuCaseException](NoSuchNavuCaseException.md#cls-NoSuchNavuCaseException)
- [NoSuchNavuChoiceException](NoSuchNavuChoiceException.md#cls-NoSuchNavuChoiceException)
- [NoSuchNavuNodeException](NoSuchNavuNodeException.md#cls-NoSuchNavuNodeException)

## Members

**Constructors**:

- [NavuException(ConfException)](#m-navuexception-cb130257ec60)
- [NavuException(IOException)](#m-navuexception-77041496a997)
- [NavuException(MaapiException)](#m-navuexception-5c5a496fd22b)
- [NavuException(String)](#m-navuexception-a3ed40280047)
- [NavuException(String, ConfException)](#m-navuexception-a4ac943843f8)
- [NavuException(String, ErrorCode, Throwable)](#m-navuexception-011f1640694f)
- [NavuException(String, int, Throwable)](#m-navuexception-5613700dce64)
- [NavuException(String, Throwable)](#m-navuexception-f8be029568e4)
- [NavuException(Throwable)](#m-navuexception-d0b010924c53)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#m-mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

<a id="m-navuexception-cb130257ec60"></a>
### NavuException(ConfException)

```java
public NavuException(com.tailf.conf.ConfException e)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfException e`

<a id="m-navuexception-77041496a997"></a>
### NavuException(IOException)

```java
public NavuException(java.io.IOException e)
```

**Parameters**

- `java.io.IOException e`

<a id="m-navuexception-5c5a496fd22b"></a>
### NavuException(MaapiException)

```java
public NavuException(com.tailf.maapi.MaapiException e)
```

Types: [MaapiException](../maapi/MaapiException.md#cls-MaapiException)

**Parameters**

- `com.tailf.maapi.MaapiException e`

<a id="m-navuexception-a3ed40280047"></a>
### NavuException(String)

```java
public NavuException(String msg)
```

**Parameters**

- `String msg`

<a id="m-navuexception-a4ac943843f8"></a>
### NavuException(String, ConfException)

```java
public NavuException(String msg, com.tailf.conf.ConfException e)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `String msg` - a message describing the exception.
- `com.tailf.conf.ConfException e`

<a id="m-navuexception-011f1640694f"></a>
### NavuException(String, ErrorCode, Throwable)

```java
public NavuException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg` - a message describing the exception.
- `com.tailf.conf.ErrorCode code` - a code classifying the exception.
- `Throwable cause`

<a id="m-navuexception-5613700dce64"></a>
### NavuException(String, int, Throwable)

```java
public NavuException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

<a id="m-navuexception-f8be029568e4"></a>
### NavuException(String, Throwable)

```java
public NavuException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

<a id="m-navuexception-d0b010924c53"></a>
### NavuException(Throwable)

```java
public NavuException(Throwable cause)
```

**Parameters**

- `Throwable cause`


## Methods

<a id="m-mk-de1cedfc6ea8"></a>
### mk(ConfResponse)

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException), [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`
