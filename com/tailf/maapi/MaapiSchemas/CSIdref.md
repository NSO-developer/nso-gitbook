# CSIdref <a href="#cls-CSIdref" id="cls-CSIdref"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSIdref
```

## Members

**Constructors**:

- [CSIdref(String, String, int, int)](#m-CSIdref-6752ec689cfb)

**Fields**:

- [id](#m-id)
- [name](#m-name)
- [ns](#m-ns)
- [qName](#m-qName)

**Methods**:

- [getId()](#m-getId-199a349c70ef)
- [getName()](#m-getName-2634b18b4a25)
- [getNS()](#m-getNS-3613c99d8888)
- [getQName()](#m-getQName-9e09580fbf90)
- [setName(String)](#m-setName-c76ccfcb9f18)
- [setQName(String)](#m-setQName-62d2dd2eb710)

## Constructors

### CSIdref(String, String, int, int) <a href="#m-CSIdref-6752ec689cfb" id="m-CSIdref-6752ec689cfb"></a>

```java
public CSIdref(String qname, String name, int ns, int id)
```

**Parameters**

- `String qname`
- `String name`
- `int ns`
- `int id`


## Fields

### id <a href="#m-id" id="m-id"></a>

**Package-private**

```java
int id = null;
```

### name <a href="#m-name" id="m-name"></a>

**Package-private**

```java
String name = null;
```

### ns <a href="#m-ns" id="m-ns"></a>

**Package-private**

```java
int ns = null;
```

### qName <a href="#m-qName" id="m-qName"></a>

**Package-private**

```java
String qName = null;
```


## Methods

### getId() <a href="#m-getId-199a349c70ef" id="m-getId-199a349c70ef"></a>

```java
public int getId()
```

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public String getName()
```

### getNS() <a href="#m-getNS-3613c99d8888" id="m-getNS-3613c99d8888"></a>

```java
public int getNS()
```

### getQName() <a href="#m-getQName-9e09580fbf90" id="m-getQName-9e09580fbf90"></a>

```java
public String getQName()
```

Return the string "prefix:name"
 of a identity

### setName(String) <a href="#m-setName-c76ccfcb9f18" id="m-setName-c76ccfcb9f18"></a>

```java
public void setName(String name)
```

**Parameters**

- `String name`

### setQName(String) <a href="#m-setQName-62d2dd2eb710" id="m-setQName-62d2dd2eb710"></a>

**Package-private**

```java
void setQName(String qName)
```

**Parameters**

- `String qName`
