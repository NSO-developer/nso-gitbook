# CSMNsMap <a href="#csmnsmap-1123c939e6bb" id="csmnsmap-1123c939e6bb"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSMNsMap
```

## Members

**Constructors**:

- [CSMNsMap\(List\<String\>\)](#csmnsmap-c1764ee15d8f)

**Methods**:

- [add\(String, String, String, String, int\)](#add-5d9d8db3f874)
- [getAllMNs\(\)](#getallmns-4f8a3881acba)
- [getAllModules\(\)](#getallmodules-977bceea7683)
- [getAllPrefixes\(\)](#getallprefixes-3223fb389e6b)
- [getAllXmlNs\(\)](#getallxmlns-9c426a56e891)
- [getMountId\(\)](#getmountid-c5175827f949)
- [getNSByModule\(String\)](#getnsbymodule-52cc099debc8)
- [getNSByNSHash\(Integer\)](#getnsbynshash-8fc75d27f21a)
- [getNSByPrefix\(String\)](#getnsbyprefix-cd06560cf0a9)
- [getNSByXmlNs\(String\)](#getnsbyxmlns-0c87fd4defab)
- [getPrefixByNS\(String\)](#getprefixbyns-53c75e018163)
- [getSize\(\)](#getsize-572b3725211f)

## Constructors

### CSMNsMap(List&lt;String&gt;) <a href="#csmnsmap-c1764ee15d8f" id="csmnsmap-c1764ee15d8f"></a>

```java
public CSMNsMap(java.util.List<String> mountId)
```

**Parameters**

- `java.util.List<String> mountId`


## Methods

### add(String, String, String, String, int) <a href="#add-5d9d8db3f874" id="add-5d9d8db3f874"></a>

```java
public void add(String ns, String prefix, String xmlns, String modname, int nshash)
```

**Parameters**

- `String ns`
- `String prefix`
- `String xmlns`
- `String modname`
- `int nshash`

### getAllMNs() <a href="#getallmns-4f8a3881acba" id="getallmns-4f8a3881acba"></a>

```java
public java.util.Collection<String> getAllMNs()
```

### getAllModules() <a href="#getallmodules-977bceea7683" id="getallmodules-977bceea7683"></a>

```java
public java.util.Set<String> getAllModules()
```

### getAllPrefixes() <a href="#getallprefixes-3223fb389e6b" id="getallprefixes-3223fb389e6b"></a>

```java
public java.util.Set<String> getAllPrefixes()
```

### getAllXmlNs() <a href="#getallxmlns-9c426a56e891" id="getallxmlns-9c426a56e891"></a>

```java
public java.util.Set<String> getAllXmlNs()
```

### getMountId() <a href="#getmountid-c5175827f949" id="getmountid-c5175827f949"></a>

```java
public java.util.List<String> getMountId()
```

### getNSByModule(String) <a href="#getnsbymodule-52cc099debc8" id="getnsbymodule-52cc099debc8"></a>

```java
public String getNSByModule(String module)
```

**Parameters**

- `String module`

### getNSByNSHash(Integer) <a href="#getnsbynshash-8fc75d27f21a" id="getnsbynshash-8fc75d27f21a"></a>

```java
public String getNSByNSHash(Integer nsHash)
```

**Parameters**

- `Integer nsHash`

### getNSByPrefix(String) <a href="#getnsbyprefix-cd06560cf0a9" id="getnsbyprefix-cd06560cf0a9"></a>

```java
public String getNSByPrefix(String prefix)
```

**Parameters**

- `String prefix`

### getNSByXmlNs(String) <a href="#getnsbyxmlns-0c87fd4defab" id="getnsbyxmlns-0c87fd4defab"></a>

```java
public String getNSByXmlNs(String xmlNS)
```

**Parameters**

- `String xmlNS`

### getPrefixByNS(String) <a href="#getprefixbyns-53c75e018163" id="getprefixbyns-53c75e018163"></a>

```java
public String getPrefixByNS(String ns)
```

**Parameters**

- `String ns`

### getSize() <a href="#getsize-572b3725211f" id="getsize-572b3725211f"></a>

```java
public long getSize()
```
