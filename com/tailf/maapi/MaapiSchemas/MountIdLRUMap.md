# MountIdLRUMap <a href="#cls-MountIdLRUMap" id="cls-MountIdLRUMap"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.MountIdLRUMap<K, V>
    extends java.util.LinkedHashMap<K,V>
```

## Members

**Constructors**:

- [MountIdLRUMap(int)](#m-MountIdLRUMap-7436757c8be6)

**Methods**:

- [removeEldestEntry(Entry<K,V>)](#m-removeEldestEntry-2ee85ed7aee8)

## Constructors

### MountIdLRUMap(int) <a href="#m-MountIdLRUMap-7436757c8be6" id="m-MountIdLRUMap-7436757c8be6"></a>

```java
protected MountIdLRUMap(int threshold)
```

**Parameters**

- `int threshold`


## Methods

### removeEldestEntry(Entry<K,V>) <a href="#m-removeEldestEntry-2ee85ed7aee8" id="m-removeEldestEntry-2ee85ed7aee8"></a>

```java
protected boolean removeEldestEntry(java.util.Map.Entry<K,V> eldest)
```

**Parameters**

- `java.util.Map.Entry<K,V> eldest`
