<a id="s-MountIdLRUMap"></a>
# MountIdLRUMap

```java
public static class com.tailf.maapi.MaapiSchemas.MountIdLRUMap<K, V>
    extends java.util.LinkedHashMap<K,V>
```

## Members

**Constructors**:

- [MountIdLRUMap(int)](#s-MountIdLRUMap-1)

**Methods**:

- [removeEldestEntry(Entry<K,V>)](#s-removeEldestEntry)

## Constructors

<a id="s-MountIdLRUMap-1"></a>
### MountIdLRUMap(int)

```java
protected MountIdLRUMap(int threshold)
```

**Parameters**

- `int threshold`


## Methods

<a id="s-removeEldestEntry"></a>
### removeEldestEntry(Entry<K,V>)

```java
protected boolean removeEldestEntry(java.util.Map.Entry<K,V> eldest)
```

**Parameters**

- `java.util.Map.Entry<K,V> eldest`
