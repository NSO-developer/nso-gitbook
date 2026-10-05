# ApplyException <a href="#cls-ApplyException" id="cls-ApplyException"></a>

```java
public class com.tailf.ned.NedCliBaseTemplate.ApplyException
    extends Exception
```

## Members

**Constructors**:

- [ApplyException(String, boolean, boolean)](#m-ApplyException-7b81fcea900a)
- [ApplyException(String, String, boolean, boolean)](#m-ApplyException-bbb5076611ee)

**Fields**:

- [inConfigMode](#m-inConfigMode)
- [isAtTop](#m-isAtTop)
- [serialVersionUID](#m-serialVersionUID)

## Constructors

### ApplyException(String, boolean, boolean) <a href="#m-ApplyException-7b81fcea900a" id="m-ApplyException-7b81fcea900a"></a>

```java
public ApplyException(String msg, boolean isAtTop, boolean inConfigMode)
```

**Parameters**

- `String msg`
- `boolean isAtTop`
- `boolean inConfigMode`

### ApplyException(String, String, boolean, boolean) <a href="#m-ApplyException-bbb5076611ee" id="m-ApplyException-bbb5076611ee"></a>

```java
public ApplyException(String line, String msg, boolean isAtTop, boolean inConfigMode)
```

**Parameters**

- `String line`
- `String msg`
- `boolean isAtTop`
- `boolean inConfigMode`


## Fields

### inConfigMode <a href="#m-inConfigMode" id="m-inConfigMode"></a>

```java
public boolean inConfigMode = null;
```

### isAtTop <a href="#m-isAtTop" id="m-isAtTop"></a>

```java
public boolean isAtTop = null;
```

### serialVersionUID <a href="#m-serialVersionUID" id="m-serialVersionUID"></a>

```java
public static final long serialVersionUID = 1285361782;
```
