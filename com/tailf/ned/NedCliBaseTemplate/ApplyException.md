<a id="s-ApplyException"></a>
# ApplyException

```java
public class com.tailf.ned.NedCliBaseTemplate.ApplyException
    extends Exception
```

## Members

**Constructors**:

- [ApplyException(String, boolean, boolean)](#s-ApplyException-1)
- [ApplyException(String, String, boolean, boolean)](#s-ApplyException-2)

**Fields**:

- [inConfigMode](#s-inConfigMode)
- [isAtTop](#s-isAtTop)
- [serialVersionUID](#s-serialVersionUID)

## Constructors

<a id="s-ApplyException-1"></a>
### ApplyException(String, boolean, boolean)

```java
public ApplyException(String msg, boolean isAtTop, boolean inConfigMode)
```

**Parameters**

- `String msg`
- `boolean isAtTop`
- `boolean inConfigMode`

<a id="s-ApplyException-2"></a>
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

<a id="s-inConfigMode"></a>
### inConfigMode

```java
public boolean inConfigMode = null;
```

<a id="s-isAtTop"></a>
### isAtTop

```java
public boolean isAtTop = null;
```

<a id="s-serialVersionUID"></a>
### serialVersionUID

```java
public static final long serialVersionUID = 1285361782;
```
