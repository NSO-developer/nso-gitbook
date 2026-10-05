# CSIdref <a href="#csidref-ad9cd0da8b26" id="csidref-ad9cd0da8b26"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSIdref
```

## Members

**Constructors**:

- [CSIdref\(String, String, int, int\)](#csidref-6752ec689cfb)

**Fields**:

- [id](#id-048276095f61)
- [name](#name-c64f5553ba82)
- [ns](#ns-8a46ea397979)
- [qName](#qname-ea64db1f80ab)

**Methods**:

- [getId\(\)](#getid-199a349c70ef)
- [getName\(\)](#getname-2634b18b4a25)
- [getNS\(\)](#getns-3613c99d8888)
- [getQName\(\)](#getqname-9e09580fbf90)
- [setName\(String\)](#setname-c76ccfcb9f18)
- [setQName\(String\)](#setqname-62d2dd2eb710)

## Constructors

### CSIdref(String, String, int, int) <a href="#csidref-6752ec689cfb" id="csidref-6752ec689cfb"></a>

```java
public CSIdref(String qname, String name, int ns, int id)
```

**Parameters**

- `String qname`
- `String name`
- `int ns`
- `int id`


## Fields

### id <a href="#id-048276095f61" id="id-048276095f61"></a>

**Package-private**

```java
int id = null;
```

### name <a href="#name-c64f5553ba82" id="name-c64f5553ba82"></a>

**Package-private**

```java
String name = null;
```

### ns <a href="#ns-8a46ea397979" id="ns-8a46ea397979"></a>

**Package-private**

```java
int ns = null;
```

### qName <a href="#qname-ea64db1f80ab" id="qname-ea64db1f80ab"></a>

**Package-private**

```java
String qName = null;
```


## Methods

### getId() <a href="#getid-199a349c70ef" id="getid-199a349c70ef"></a>

```java
public int getId()
```

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public String getName()
```

### getNS() <a href="#getns-3613c99d8888" id="getns-3613c99d8888"></a>

```java
public int getNS()
```

### getQName() <a href="#getqname-9e09580fbf90" id="getqname-9e09580fbf90"></a>

```java
public String getQName()
```

Return the string "prefix:name"
 of a identity

### setName(String) <a href="#setname-c76ccfcb9f18" id="setname-c76ccfcb9f18"></a>

```java
public void setName(String name)
```

**Parameters**

- `String name`

### setQName(String) <a href="#setqname-62d2dd2eb710" id="setqname-62d2dd2eb710"></a>

**Package-private**

```java
void setQName(String qName)
```

**Parameters**

- `String qName`
