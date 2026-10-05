<a id="cls-MountIdLRUMap"></a>
# MountIdLRUMap

```java
public static class com.tailf.maapi.MaapiSchemas.MountIdLRUMap<K, V>
    extends java.util.LinkedHashMap<K,V>
```

## Members

**Constructors**:

- [MountIdLRUMap(int)](#m-mountidlrumap-7436757c8be6)

**Methods**:

- [removeEldestEntry(Entry<K,V>)](#m-removeeldestentry-2ee85ed7aee8)

## Constructors

<a id="m-mountidlrumap-7436757c8be6"></a>
### MountIdLRUMap(int)

```java
protected MountIdLRUMap(int threshold)
```

**Parameters**

- `int threshold`


## Methods

<a id="m-removeeldestentry-2ee85ed7aee8"></a>
### removeEldestEntry(Entry<K,V>)

```java
protected boolean removeEldestEntry(java.util.Map.Entry<K,V> eldest)
```

**Parameters**

- `java.util.Map.Entry<K,V> eldest`
