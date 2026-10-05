<a id="s-CSMNsMap"></a>
# CSMNsMap

```java
public static class com.tailf.maapi.MaapiSchemas.CSMNsMap
```

## Members

**Constructors**:

- [CSMNsMap(List<String>)](#s-CSMNsMap-1)

**Methods**:

- [add(String, String, String, String, int)](#s-add)
- [getAllMNs()](#s-getAllMNs)
- [getAllModules()](#s-getAllModules)
- [getAllPrefixes()](#s-getAllPrefixes)
- [getAllXmlNs()](#s-getAllXmlNs)
- [getMountId()](#s-getMountId)
- [getNSByModule(String)](#s-getNSByModule)
- [getNSByNSHash(Integer)](#s-getNSByNSHash)
- [getNSByPrefix(String)](#s-getNSByPrefix)
- [getNSByXmlNs(String)](#s-getNSByXmlNs)
- [getPrefixByNS(String)](#s-getPrefixByNS)
- [getSize()](#s-getSize)

## Constructors

<a id="s-CSMNsMap-1"></a>
### CSMNsMap(List<String>)

```java
public CSMNsMap(java.util.List<String> mountId)
```

**Parameters**

- `java.util.List<String> mountId`


## Methods

<a id="s-add"></a>
### add(String, String, String, String, int)

```java
public void add(String ns, String prefix, String xmlns, String modname, int nshash)
```

**Parameters**

- `String ns`
- `String prefix`
- `String xmlns`
- `String modname`
- `int nshash`

<a id="s-getAllMNs"></a>
### getAllMNs()

```java
public java.util.Collection<String> getAllMNs()
```

<a id="s-getAllModules"></a>
### getAllModules()

```java
public java.util.Set<String> getAllModules()
```

<a id="s-getAllPrefixes"></a>
### getAllPrefixes()

```java
public java.util.Set<String> getAllPrefixes()
```

<a id="s-getAllXmlNs"></a>
### getAllXmlNs()

```java
public java.util.Set<String> getAllXmlNs()
```

<a id="s-getMountId"></a>
### getMountId()

```java
public java.util.List<String> getMountId()
```

<a id="s-getNSByModule"></a>
### getNSByModule(String)

```java
public String getNSByModule(String module)
```

**Parameters**

- `String module`

<a id="s-getNSByNSHash"></a>
### getNSByNSHash(Integer)

```java
public String getNSByNSHash(Integer nsHash)
```

**Parameters**

- `Integer nsHash`

<a id="s-getNSByPrefix"></a>
### getNSByPrefix(String)

```java
public String getNSByPrefix(String prefix)
```

**Parameters**

- `String prefix`

<a id="s-getNSByXmlNs"></a>
### getNSByXmlNs(String)

```java
public String getNSByXmlNs(String xmlNS)
```

**Parameters**

- `String xmlNS`

<a id="s-getPrefixByNS"></a>
### getPrefixByNS(String)

```java
public String getPrefixByNS(String ns)
```

**Parameters**

- `String ns`

<a id="s-getSize"></a>
### getSize()

```java
public long getSize()
```
