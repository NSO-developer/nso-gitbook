# CSMNsMap <a href="#cls-CSMNsMap" id="cls-CSMNsMap"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSMNsMap
```

## Members

**Constructors**:

- [CSMNsMap(List<String>)](#m-CSMNsMap-c1764ee15d8f)

**Methods**:

- [add(String, String, String, String, int)](#m-add-5d9d8db3f874)
- [getAllMNs()](#m-getAllMNs-4f8a3881acba)
- [getAllModules()](#m-getAllModules-977bceea7683)
- [getAllPrefixes()](#m-getAllPrefixes-3223fb389e6b)
- [getAllXmlNs()](#m-getAllXmlNs-9c426a56e891)
- [getMountId()](#m-getMountId-c5175827f949)
- [getNSByModule(String)](#m-getNSByModule-52cc099debc8)
- [getNSByNSHash(Integer)](#m-getNSByNSHash-8fc75d27f21a)
- [getNSByPrefix(String)](#m-getNSByPrefix-cd06560cf0a9)
- [getNSByXmlNs(String)](#m-getNSByXmlNs-0c87fd4defab)
- [getPrefixByNS(String)](#m-getPrefixByNS-53c75e018163)
- [getSize()](#m-getSize-572b3725211f)

## Constructors

### CSMNsMap(List<String>) <a href="#m-CSMNsMap-c1764ee15d8f" id="m-CSMNsMap-c1764ee15d8f"></a>

```java
public CSMNsMap(java.util.List<String> mountId)
```

**Parameters**

- `java.util.List<String> mountId`


## Methods

### add(String, String, String, String, int) <a href="#m-add-5d9d8db3f874" id="m-add-5d9d8db3f874"></a>

```java
public void add(String ns, String prefix, String xmlns, String modname, int nshash)
```

**Parameters**

- `String ns`
- `String prefix`
- `String xmlns`
- `String modname`
- `int nshash`

### getAllMNs() <a href="#m-getAllMNs-4f8a3881acba" id="m-getAllMNs-4f8a3881acba"></a>

```java
public java.util.Collection<String> getAllMNs()
```

### getAllModules() <a href="#m-getAllModules-977bceea7683" id="m-getAllModules-977bceea7683"></a>

```java
public java.util.Set<String> getAllModules()
```

### getAllPrefixes() <a href="#m-getAllPrefixes-3223fb389e6b" id="m-getAllPrefixes-3223fb389e6b"></a>

```java
public java.util.Set<String> getAllPrefixes()
```

### getAllXmlNs() <a href="#m-getAllXmlNs-9c426a56e891" id="m-getAllXmlNs-9c426a56e891"></a>

```java
public java.util.Set<String> getAllXmlNs()
```

### getMountId() <a href="#m-getMountId-c5175827f949" id="m-getMountId-c5175827f949"></a>

```java
public java.util.List<String> getMountId()
```

### getNSByModule(String) <a href="#m-getNSByModule-52cc099debc8" id="m-getNSByModule-52cc099debc8"></a>

```java
public String getNSByModule(String module)
```

**Parameters**

- `String module`

### getNSByNSHash(Integer) <a href="#m-getNSByNSHash-8fc75d27f21a" id="m-getNSByNSHash-8fc75d27f21a"></a>

```java
public String getNSByNSHash(Integer nsHash)
```

**Parameters**

- `Integer nsHash`

### getNSByPrefix(String) <a href="#m-getNSByPrefix-cd06560cf0a9" id="m-getNSByPrefix-cd06560cf0a9"></a>

```java
public String getNSByPrefix(String prefix)
```

**Parameters**

- `String prefix`

### getNSByXmlNs(String) <a href="#m-getNSByXmlNs-0c87fd4defab" id="m-getNSByXmlNs-0c87fd4defab"></a>

```java
public String getNSByXmlNs(String xmlNS)
```

**Parameters**

- `String xmlNS`

### getPrefixByNS(String) <a href="#m-getPrefixByNS-53c75e018163" id="m-getPrefixByNS-53c75e018163"></a>

```java
public String getPrefixByNS(String ns)
```

**Parameters**

- `String ns`

### getSize() <a href="#m-getSize-572b3725211f" id="m-getSize-572b3725211f"></a>

```java
public long getSize()
```
