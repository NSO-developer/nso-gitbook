# MountIdLRUMap <a href="#mountidlrumap-977210c3c8c8" id="mountidlrumap-977210c3c8c8"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.MountIdLRUMap<K, V>
    extends java.util.LinkedHashMap<K,V>
```

## Members

**Constructors**:

- [MountIdLRUMap(int)](#mountidlrumap-7436757c8be6)

**Methods**:

- [removeEldestEntry(Entry<K,V>)](#removeeldestentry-2ee85ed7aee8)

## Constructors

### MountIdLRUMap(int) <a href="#mountidlrumap-7436757c8be6" id="mountidlrumap-7436757c8be6"></a>

```java
protected MountIdLRUMap(int threshold)
```

**Parameters**

- `int threshold`


## Methods

### removeEldestEntry(Entry&lt;K,V&gt;) <a href="#removeeldestentry-2ee85ed7aee8" id="removeeldestentry-2ee85ed7aee8"></a>

```java
protected boolean removeEldestEntry(java.util.Map.Entry<K,V> eldest)
```

**Parameters**

- `java.util.Map.Entry<K,V> eldest`
