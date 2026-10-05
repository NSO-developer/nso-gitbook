<a id="s-NedExpectResult"></a>
# NedExpectResult

```java
public class com.tailf.ned.NedExpectResult
```

The result of a expect() method invocation. It contains
 the text accumulated by the expect method and which
 pattern was matched.

## Members

**Constructors**:

- [NedExpectResult(int, String)](#s-NedExpectResult-1)
- [NedExpectResult(int, String, String)](#s-NedExpectResult-2)

**Methods**:

- [getHit()](#s-getHit)
- [getMatch()](#s-getMatch)
- [getText()](#s-getText)

## Constructors

<a id="s-NedExpectResult-1"></a>
### NedExpectResult(int, String)

```java
public NedExpectResult(int hit, String text)
```

**Parameters**

- `int hit`
- `String text`

<a id="s-NedExpectResult-2"></a>
### NedExpectResult(int, String, String)

```java
public NedExpectResult(int hit, String text, String match)
```

**Parameters**

- `int hit`
- `String text`
- `String match`


## Methods

<a id="s-getHit"></a>
### getHit()

```java
public int getHit()
```

<a id="s-getMatch"></a>
### getMatch()

```java
public String getMatch()
```

<a id="s-getText"></a>
### getText()

```java
public String getText()
```
