<a id="s-NedException"></a>
# NedException

```java
public class com.tailf.ned.NedException
    extends Exception
```

Exception raised from the NED package

## Members

**Constructors**:

- [NedException(NedErrorCode, String)](#s-NedException-1)
- [NedException(NedErrorCode, String, Throwable)](#s-NedException-2)

**Methods**:

- [getNedErrorCode()](#s-getNedErrorCode)

## Constructors

<a id="s-NedException-1"></a>
### NedException(NedErrorCode, String)

```java
public NedException(com.tailf.ned.NedErrorCode aCode, String msg)
```

Types: [NedErrorCode](NedErrorCode.md#s-NedErrorCode)

**Parameters**

- `com.tailf.ned.NedErrorCode aCode`
- `String msg`

<a id="s-NedException-2"></a>
### NedException(NedErrorCode, String, Throwable)

```java
public NedException(com.tailf.ned.NedErrorCode aCode, String msg, Throwable cause)
```

Types: [NedErrorCode](NedErrorCode.md#s-NedErrorCode)

**Parameters**

- `com.tailf.ned.NedErrorCode aCode`
- `String msg`
- `Throwable cause`


## Methods

<a id="s-getNedErrorCode"></a>
### getNedErrorCode()

```java
public com.tailf.ned.NedErrorCode getNedErrorCode()
```

Types: [NedErrorCode](NedErrorCode.md#s-NedErrorCode)
