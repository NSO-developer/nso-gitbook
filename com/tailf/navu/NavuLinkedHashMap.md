<a id="s-NavuLinkedHashMap"></a>
# NavuLinkedHashMap

```java
public class com.tailf.navu.NavuLinkedHashMap<K, V>
    extends java.util.LinkedHashMap<K,V>
```

## Members

**Constructors**:

- [NavuLinkedHashMap()](#s-NavuLinkedHashMap-1)

**Methods**:

- [removeEldestEntry(Entry<K,V>)](#s-removeEldestEntry)
- [setMaxSize(int)](#s-setMaxSize)

## Constructors

<a id="s-NavuLinkedHashMap-1"></a>
### NavuLinkedHashMap()

```java
public NavuLinkedHashMap()
```


## Methods

<a id="s-removeEldestEntry"></a>
### removeEldestEntry(Entry<K,V>)

```java
protected boolean removeEldestEntry(java.util.Map.Entry<K,V> eldest)
```

**Parameters**

- `java.util.Map.Entry<K,V> eldest`

<a id="s-setMaxSize"></a>
### setMaxSize(int)

```java
public void setMaxSize(int maxSize)
```

**Parameters**

- `int maxSize`
