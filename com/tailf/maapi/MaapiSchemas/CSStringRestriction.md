<a id="s-CSStringRestriction"></a>
# CSStringRestriction

```java
public static class com.tailf.maapi.MaapiSchemas.CSStringRestriction
```

## Members

**Constructors**:

- [CSStringRestriction()](#s-CSStringRestriction-1)
- [CSStringRestriction(String, boolean, CSStringLength[])](#s-CSStringRestriction-2)

**Fields**:

- [COMPILED_PATTERN](#s-COMPILED_PATTERN)
- [TEXT_PATTERN](#s-TEXT_PATTERN)

**Methods**:

- [getCompiledPattern()](#s-getCompiledPattern)
- [getInvertMatch()](#s-getInvertMatch)
- [getJavaPattern()](#s-getJavaPattern)
- [getLengthArray()](#s-getLengthArray)
- [getPatternType()](#s-getPatternType)
- [getTextPattern()](#s-getTextPattern)
- [setCompiledPattern(int)](#s-setCompiledPattern)
- [setInvertMatch(boolean)](#s-setInvertMatch)
- [setJavaPattern(Pattern)](#s-setJavaPattern)
- [setLengthArray(CSStringLength[])](#s-setLengthArray)
- [setPatternType(int)](#s-setPatternType)
- [setTextPattern(String)](#s-setTextPattern)

## Constructors

<a id="s-CSStringRestriction-1"></a>
### CSStringRestriction()

```java
protected CSStringRestriction()
```

<a id="s-CSStringRestriction-2"></a>
### CSStringRestriction(String, boolean, CSStringLength[])

```java
public CSStringRestriction(
    String textPattern,
    boolean invertMatch,
    com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr
)
```

Types: [CSStringLength](CSStringLength.md#s-CSStringLength)

**Parameters**

- `String textPattern`
- `boolean invertMatch`
- `com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr`


## Fields

<a id="s-COMPILED_PATTERN"></a>
### COMPILED_PATTERN

```java
public static final int COMPILED_PATTERN = 1;
```

<a id="s-TEXT_PATTERN"></a>
### TEXT_PATTERN

```java
public static final int TEXT_PATTERN = 2;
```


## Methods

<a id="s-getCompiledPattern"></a>
### getCompiledPattern()

```java
public int getCompiledPattern()
```

<a id="s-getInvertMatch"></a>
### getInvertMatch()

```java
public boolean getInvertMatch()
```

<a id="s-getJavaPattern"></a>
### getJavaPattern()

```java
public java.util.regex.Pattern getJavaPattern()
```

<a id="s-getLengthArray"></a>
### getLengthArray()

```java
public com.tailf.maapi.MaapiSchemas.CSStringLength[] getLengthArray()
```

Types: [CSStringLength](CSStringLength.md#s-CSStringLength)

<a id="s-getPatternType"></a>
### getPatternType()

```java
public int getPatternType()
```

<a id="s-getTextPattern"></a>
### getTextPattern()

```java
public String getTextPattern()
```

<a id="s-setCompiledPattern"></a>
### setCompiledPattern(int)

```java
protected void setCompiledPattern(int compiledPattern)
```

**Parameters**

- `int compiledPattern`

<a id="s-setInvertMatch"></a>
### setInvertMatch(boolean)

```java
protected void setInvertMatch(boolean invertMatch)
```

**Parameters**

- `boolean invertMatch`

<a id="s-setJavaPattern"></a>
### setJavaPattern(Pattern)

```java
protected void setJavaPattern(java.util.regex.Pattern javaPattern)
```

**Parameters**

- `java.util.regex.Pattern javaPattern`

<a id="s-setLengthArray"></a>
### setLengthArray(CSStringLength[])

```java
protected void setLengthArray(com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr)
```

Types: [CSStringLength](CSStringLength.md#s-CSStringLength)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr`

<a id="s-setPatternType"></a>
### setPatternType(int)

```java
protected void setPatternType(int patternType)
```

**Parameters**

- `int patternType`

<a id="s-setTextPattern"></a>
### setTextPattern(String)

```java
protected void setTextPattern(String textPattern)
```

**Parameters**

- `String textPattern`
