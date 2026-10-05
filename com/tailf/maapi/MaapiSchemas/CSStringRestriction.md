# CSStringRestriction <a href="#cls-CSStringRestriction" id="cls-CSStringRestriction"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSStringRestriction
```

## Members

**Constructors**:

- [CSStringRestriction()](#m-CSStringRestriction-3876ae4b99b2)
- [CSStringRestriction(String, boolean, CSStringLength[])](#m-CSStringRestriction-82ebcca0d9d3)

**Fields**:

- [COMPILED_PATTERN](#m-COMPILED_PATTERN)
- [TEXT_PATTERN](#m-TEXT_PATTERN)

**Methods**:

- [getCompiledPattern()](#m-getCompiledPattern-59c5274d608a)
- [getInvertMatch()](#m-getInvertMatch-323126ccbf2f)
- [getJavaPattern()](#m-getJavaPattern-91c839a1079c)
- [getLengthArray()](#m-getLengthArray-9268b7dc6e45)
- [getPatternType()](#m-getPatternType-21a9ae22d96b)
- [getTextPattern()](#m-getTextPattern-a7f518cee006)
- [setCompiledPattern(int)](#m-setCompiledPattern-3a9c38f879a6)
- [setInvertMatch(boolean)](#m-setInvertMatch-e00cbbce7115)
- [setJavaPattern(Pattern)](#m-setJavaPattern-7222e0b83e1f)
- [setLengthArray(CSStringLength[])](#m-setLengthArray-030198126ca6)
- [setPatternType(int)](#m-setPatternType-865c414ccb37)
- [setTextPattern(String)](#m-setTextPattern-2901f3b12d12)

## Constructors

### CSStringRestriction() <a href="#m-CSStringRestriction-3876ae4b99b2" id="m-CSStringRestriction-3876ae4b99b2"></a>

```java
protected CSStringRestriction()
```

### CSStringRestriction(String, boolean, CSStringLength[]) <a href="#m-CSStringRestriction-82ebcca0d9d3" id="m-CSStringRestriction-82ebcca0d9d3"></a>

```java
public CSStringRestriction(
    String textPattern,
    boolean invertMatch,
    com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr
)
```

Types: [CSStringLength](CSStringLength.md#cls-CSStringLength)

**Parameters**

- `String textPattern`
- `boolean invertMatch`
- `com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr`


## Fields

### COMPILED_PATTERN <a href="#m-COMPILED_PATTERN" id="m-COMPILED_PATTERN"></a>

```java
public static final int COMPILED_PATTERN = 1;
```

### TEXT_PATTERN <a href="#m-TEXT_PATTERN" id="m-TEXT_PATTERN"></a>

```java
public static final int TEXT_PATTERN = 2;
```


## Methods

### getCompiledPattern() <a href="#m-getCompiledPattern-59c5274d608a" id="m-getCompiledPattern-59c5274d608a"></a>

```java
public int getCompiledPattern()
```

### getInvertMatch() <a href="#m-getInvertMatch-323126ccbf2f" id="m-getInvertMatch-323126ccbf2f"></a>

```java
public boolean getInvertMatch()
```

### getJavaPattern() <a href="#m-getJavaPattern-91c839a1079c" id="m-getJavaPattern-91c839a1079c"></a>

```java
public java.util.regex.Pattern getJavaPattern()
```

### getLengthArray() <a href="#m-getLengthArray-9268b7dc6e45" id="m-getLengthArray-9268b7dc6e45"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSStringLength[] getLengthArray()
```

Types: [CSStringLength](CSStringLength.md#cls-CSStringLength)

### getPatternType() <a href="#m-getPatternType-21a9ae22d96b" id="m-getPatternType-21a9ae22d96b"></a>

```java
public int getPatternType()
```

### getTextPattern() <a href="#m-getTextPattern-a7f518cee006" id="m-getTextPattern-a7f518cee006"></a>

```java
public String getTextPattern()
```

### setCompiledPattern(int) <a href="#m-setCompiledPattern-3a9c38f879a6" id="m-setCompiledPattern-3a9c38f879a6"></a>

```java
protected void setCompiledPattern(int compiledPattern)
```

**Parameters**

- `int compiledPattern`

### setInvertMatch(boolean) <a href="#m-setInvertMatch-e00cbbce7115" id="m-setInvertMatch-e00cbbce7115"></a>

```java
protected void setInvertMatch(boolean invertMatch)
```

**Parameters**

- `boolean invertMatch`

### setJavaPattern(Pattern) <a href="#m-setJavaPattern-7222e0b83e1f" id="m-setJavaPattern-7222e0b83e1f"></a>

```java
protected void setJavaPattern(java.util.regex.Pattern javaPattern)
```

**Parameters**

- `java.util.regex.Pattern javaPattern`

### setLengthArray(CSStringLength[]) <a href="#m-setLengthArray-030198126ca6" id="m-setLengthArray-030198126ca6"></a>

```java
protected void setLengthArray(com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr)
```

Types: [CSStringLength](CSStringLength.md#cls-CSStringLength)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr`

### setPatternType(int) <a href="#m-setPatternType-865c414ccb37" id="m-setPatternType-865c414ccb37"></a>

```java
protected void setPatternType(int patternType)
```

**Parameters**

- `int patternType`

### setTextPattern(String) <a href="#m-setTextPattern-2901f3b12d12" id="m-setTextPattern-2901f3b12d12"></a>

```java
protected void setTextPattern(String textPattern)
```

**Parameters**

- `String textPattern`
