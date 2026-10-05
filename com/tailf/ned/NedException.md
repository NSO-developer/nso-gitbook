<a id="cls-NedException"></a>
# NedException

```java
public class com.tailf.ned.NedException
    extends Exception
```

Exception raised from the NED package

## Members

**Constructors**:

- [NedException(NedErrorCode, String)](#m-nedexception-b9f14788dc0a)
- [NedException(NedErrorCode, String, Throwable)](#m-nedexception-076b429c0440)

**Methods**:

- [getNedErrorCode()](#m-getnederrorcode-452b35680338)

## Constructors

<a id="m-nedexception-b9f14788dc0a"></a>
### NedException(NedErrorCode, String)

```java
public NedException(com.tailf.ned.NedErrorCode aCode, String msg)
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode)

**Parameters**

- `com.tailf.ned.NedErrorCode aCode`
- `String msg`

<a id="m-nedexception-076b429c0440"></a>
### NedException(NedErrorCode, String, Throwable)

```java
public NedException(com.tailf.ned.NedErrorCode aCode, String msg, Throwable cause)
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode)

**Parameters**

- `com.tailf.ned.NedErrorCode aCode`
- `String msg`
- `Throwable cause`


## Methods

<a id="m-getnederrorcode-452b35680338"></a>
### getNedErrorCode()

```java
public com.tailf.ned.NedErrorCode getNedErrorCode()
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode)
