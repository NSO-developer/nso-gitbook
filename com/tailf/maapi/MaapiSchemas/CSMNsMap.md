<a id="cls-CSMNsMap"></a>
# CSMNsMap

```java
public static class com.tailf.maapi.MaapiSchemas.CSMNsMap
```

## Members

**Constructors**:

- [CSMNsMap(List<String>)](#m-csmnsmap-c1764ee15d8f)

**Methods**:

- [add(String, String, String, String, int)](#m-add-5d9d8db3f874)
- [getAllMNs()](#m-getallmns-4f8a3881acba)
- [getAllModules()](#m-getallmodules-977bceea7683)
- [getAllPrefixes()](#m-getallprefixes-3223fb389e6b)
- [getAllXmlNs()](#m-getallxmlns-9c426a56e891)
- [getMountId()](#m-getmountid-c5175827f949)
- [getNSByModule(String)](#m-getnsbymodule-52cc099debc8)
- [getNSByNSHash(Integer)](#m-getnsbynshash-8fc75d27f21a)
- [getNSByPrefix(String)](#m-getnsbyprefix-cd06560cf0a9)
- [getNSByXmlNs(String)](#m-getnsbyxmlns-0c87fd4defab)
- [getPrefixByNS(String)](#m-getprefixbyns-53c75e018163)
- [getSize()](#m-getsize-572b3725211f)

## Constructors

<a id="m-csmnsmap-c1764ee15d8f"></a>
### CSMNsMap(List<String>)

```java
public CSMNsMap(java.util.List<String> mountId)
```

**Parameters**

- `java.util.List<String> mountId`


## Methods

<a id="m-add-5d9d8db3f874"></a>
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

<a id="m-getallmns-4f8a3881acba"></a>
### getAllMNs()

```java
public java.util.Collection<String> getAllMNs()
```

<a id="m-getallmodules-977bceea7683"></a>
### getAllModules()

```java
public java.util.Set<String> getAllModules()
```

<a id="m-getallprefixes-3223fb389e6b"></a>
### getAllPrefixes()

```java
public java.util.Set<String> getAllPrefixes()
```

<a id="m-getallxmlns-9c426a56e891"></a>
### getAllXmlNs()

```java
public java.util.Set<String> getAllXmlNs()
```

<a id="m-getmountid-c5175827f949"></a>
### getMountId()

```java
public java.util.List<String> getMountId()
```

<a id="m-getnsbymodule-52cc099debc8"></a>
### getNSByModule(String)

```java
public String getNSByModule(String module)
```

**Parameters**

- `String module`

<a id="m-getnsbynshash-8fc75d27f21a"></a>
### getNSByNSHash(Integer)

```java
public String getNSByNSHash(Integer nsHash)
```

**Parameters**

- `Integer nsHash`

<a id="m-getnsbyprefix-cd06560cf0a9"></a>
### getNSByPrefix(String)

```java
public String getNSByPrefix(String prefix)
```

**Parameters**

- `String prefix`

<a id="m-getnsbyxmlns-0c87fd4defab"></a>
### getNSByXmlNs(String)

```java
public String getNSByXmlNs(String xmlNS)
```

**Parameters**

- `String xmlNS`

<a id="m-getprefixbyns-53c75e018163"></a>
### getPrefixByNS(String)

```java
public String getPrefixByNS(String ns)
```

**Parameters**

- `String ns`

<a id="m-getsize-572b3725211f"></a>
### getSize()

```java
public long getSize()
```
