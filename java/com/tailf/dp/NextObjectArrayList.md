# NextObjectArrayList <a href="#nextobjectarraylist-28f6c867871e" id="nextobjectarraylist-28f6c867871e"></a>

```java
public class com.tailf.dp.NextObjectArrayList<E>
    extends java.util.ArrayList<E>
    implements com.tailf.dp.NextObjectList<E>
```

Types: [NextObjectList](NextObjectList.md#nextobjectlist-86d6d5d5f508)

ArrayList-based implementation of the NextObjectList interface.

## Members

**Constructors**:

- [NextObjectArrayList\(\)](#nextobjectarraylist-8247e2abf6fa)
- [NextObjectArrayList\(Collection\<? extends E\>\)](#nextobjectarraylist-a6fbfda6c13c)
- [NextObjectArrayList\(int\)](#nextobjectarraylist-dc46d12ae286)

**Methods**:

- [getTimeout\(\)](#gettimeout-c6606d7f7c00)
- [setTimeout\(int\)](#settimeout-cbe758ecb5d8)

## Constructors

### NextObjectArrayList() <a href="#nextobjectarraylist-8247e2abf6fa" id="nextobjectarraylist-8247e2abf6fa"></a>

```java
public NextObjectArrayList()
```

### NextObjectArrayList(Collection&lt;? extends E&gt;) <a href="#nextobjectarraylist-a6fbfda6c13c" id="nextobjectarraylist-a6fbfda6c13c"></a>

```java
public NextObjectArrayList(java.util.Collection<? extends E> c)
```

**Parameters**

- `java.util.Collection<? extends E> c`

### NextObjectArrayList(int) <a href="#nextobjectarraylist-dc46d12ae286" id="nextobjectarraylist-dc46d12ae286"></a>

```java
public NextObjectArrayList(int initialCapacity)
```

**Parameters**

- `int initialCapacity`


## Methods

### getTimeout() <a href="#gettimeout-c6606d7f7c00" id="gettimeout-c6606d7f7c00"></a>

```java
public int getTimeout()
```

This method is used by the library to read the timeout value pertaining
 to the objects in this instance.

 I.e. it governs for how long NCS will retain the objects and read them
 from its cache.

### setTimeout(int) <a href="#settimeout-cbe758ecb5d8" id="settimeout-cbe758ecb5d8"></a>

```java
public void setTimeout(int newTimeout)
```

Setter method for the value returned by the getTimeout() method.

**Parameters**

- `int newTimeout`
