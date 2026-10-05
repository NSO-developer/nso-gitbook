<a id="s-CSIdref"></a>
# CSIdref

```java
public static class com.tailf.maapi.MaapiSchemas.CSIdref
```

## Members

**Constructors**:

- [CSIdref(String, String, int, int)](#s-CSIdref-1)

**Fields**:

- [id](#s-id)
- [name](#s-name)
- [ns](#s-ns)
- [qName](#s-qName)

**Methods**:

- [getId()](#s-getId)
- [getName()](#s-getName)
- [getNS()](#s-getNS)
- [getQName()](#s-getQName)
- [setName(String)](#s-setName)
- [setQName(String)](#s-setQName)

## Constructors

<a id="s-CSIdref-1"></a>
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

<a id="s-id"></a>
### id

**Package-private**

```java
int id = null;
```

<a id="s-name"></a>
### name

**Package-private**

```java
String name = null;
```

<a id="s-ns"></a>
### ns

**Package-private**

```java
int ns = null;
```

<a id="s-qName"></a>
### qName

**Package-private**

```java
String qName = null;
```


## Methods

<a id="s-getId"></a>
### getId()

```java
public int getId()
```

<a id="s-getName"></a>
### getName()

```java
public String getName()
```

<a id="s-getNS"></a>
### getNS()

```java
public int getNS()
```

<a id="s-getQName"></a>
### getQName()

```java
public String getQName()
```

Return the string "prefix:name"
 of a identity

<a id="s-setName"></a>
### setName(String)

```java
public void setName(String name)
```

**Parameters**

- `String name`

<a id="s-setQName"></a>
### setQName(String)

**Package-private**

```java
void setQName(String qName)
```

**Parameters**

- `String qName`
