<a id="cls-ApplyException"></a>
# ApplyException

```java
public class com.tailf.ned.NedCliBaseTemplate.ApplyException
    extends Exception
```

## Members

**Constructors**:

- [ApplyException(String, boolean, boolean)](#m-applyexception-7b81fcea900a)
- [ApplyException(String, String, boolean, boolean)](#m-applyexception-bbb5076611ee)

**Fields**:

- [inConfigMode](#m-inConfigMode)
- [isAtTop](#m-isAtTop)
- [serialVersionUID](#m-serialVersionUID)

## Constructors

<a id="m-applyexception-7b81fcea900a"></a>
### ApplyException(String, boolean, boolean)

```java
public ApplyException(String msg, boolean isAtTop, boolean inConfigMode)
```

**Parameters**

- `String msg`
- `boolean isAtTop`
- `boolean inConfigMode`

<a id="m-applyexception-bbb5076611ee"></a>
### ApplyException(String, String, boolean, boolean)

```java
public ApplyException(String line, String msg, boolean isAtTop, boolean inConfigMode)
```

**Parameters**

- `String line`
- `String msg`
- `boolean isAtTop`
- `boolean inConfigMode`


## Fields

<a id="m-inConfigMode"></a>
### inConfigMode

```java
public boolean inConfigMode = null;
```

<a id="m-isAtTop"></a>
### isAtTop

```java
public boolean isAtTop = null;
```

<a id="m-serialVersionUID"></a>
### serialVersionUID

```java
public static final long serialVersionUID = 1285361782;
```
