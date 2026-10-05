<a id="cls-CSIdref"></a>
# CSIdref

```java
public static class com.tailf.maapi.MaapiSchemas.CSIdref
```

## Members

**Constructors**:

- [CSIdref(String, String, int, int)](#m-csidref-6752ec689cfb)

**Fields**:

- [id](#m-id)
- [name](#m-name)
- [ns](#m-ns)
- [qName](#m-qName)

**Methods**:

- [getId()](#m-getid-199a349c70ef)
- [getName()](#m-getname-2634b18b4a25)
- [getNS()](#m-getns-3613c99d8888)
- [getQName()](#m-getqname-9e09580fbf90)
- [setName(String)](#m-setname-c76ccfcb9f18)
- [setQName(String)](#m-setqname-62d2dd2eb710)

## Constructors

<a id="m-csidref-6752ec689cfb"></a>
### CSIdref(String, String, int, int)

```java
public CSIdref(String qname, String name, int ns, int id)
```

**Parameters**

- `String qname`
- `String name`
- `int ns`
- `int id`


## Fields

<a id="m-id"></a>
### id

**Package-private**

```java
int id = null;
```

<a id="m-name"></a>
### name

**Package-private**

```java
String name = null;
```

<a id="m-ns"></a>
### ns

**Package-private**

```java
int ns = null;
```

<a id="m-qName"></a>
### qName

**Package-private**

```java
String qName = null;
```


## Methods

<a id="m-getid-199a349c70ef"></a>
### getId()

```java
public int getId()
```

<a id="m-getname-2634b18b4a25"></a>
### getName()

```java
public String getName()
```

<a id="m-getns-3613c99d8888"></a>
### getNS()

```java
public int getNS()
```

<a id="m-getqname-9e09580fbf90"></a>
### getQName()

```java
public String getQName()
```

Return the string "prefix:name"
 of a identity

<a id="m-setname-c76ccfcb9f18"></a>
### setName(String)

```java
public void setName(String name)
```

**Parameters**

- `String name`

<a id="m-setqname-62d2dd2eb710"></a>
### setQName(String)

**Package-private**

```java
void setQName(String qName)
```

**Parameters**

- `String qName`
