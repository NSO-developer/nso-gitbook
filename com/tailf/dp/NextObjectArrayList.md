# NextObjectArrayList <a href="#cls-NextObjectArrayList" id="cls-NextObjectArrayList"></a>

```java
public class com.tailf.dp.NextObjectArrayList<E>
    extends java.util.ArrayList<E>
    implements com.tailf.dp.NextObjectList<E>
```

Types: [NextObjectList](NextObjectList.md#cls-NextObjectList)

ArrayList-based implementation of the NextObjectList interface.

## Members

**Constructors**:

- [NextObjectArrayList()](#m-NextObjectArrayList-8247e2abf6fa)
- [NextObjectArrayList(Collection<? extends E>)](#m-NextObjectArrayList-a6fbfda6c13c)
- [NextObjectArrayList(int)](#m-NextObjectArrayList-dc46d12ae286)

**Methods**:

- [getTimeout()](#m-getTimeout-c6606d7f7c00)
- [setTimeout(int)](#m-setTimeout-cbe758ecb5d8)

## Constructors

### NextObjectArrayList() <a href="#m-NextObjectArrayList-8247e2abf6fa" id="m-NextObjectArrayList-8247e2abf6fa"></a>

```java
public NextObjectArrayList()
```

### NextObjectArrayList(Collection<? extends E>) <a href="#m-NextObjectArrayList-a6fbfda6c13c" id="m-NextObjectArrayList-a6fbfda6c13c"></a>

```java
public NextObjectArrayList(java.util.Collection<? extends E> c)
```

**Parameters**

- `java.util.Collection<? extends E> c`

### NextObjectArrayList(int) <a href="#m-NextObjectArrayList-dc46d12ae286" id="m-NextObjectArrayList-dc46d12ae286"></a>

```java
public NextObjectArrayList(int initialCapacity)
```

**Parameters**

- `int initialCapacity`


## Methods

### getTimeout() <a href="#m-getTimeout-c6606d7f7c00" id="m-getTimeout-c6606d7f7c00"></a>

```java
public int getTimeout()
```

This method is used by the library to read the timeout value pertaining
 to the objects in this instance.

 I.e. it governs for how long NCS will retain the objects and read them
 from its cache.

### setTimeout(int) <a href="#m-setTimeout-cbe758ecb5d8" id="m-setTimeout-cbe758ecb5d8"></a>

```java
public void setTimeout(int newTimeout)
```

Setter method for the value returned by the getTimeout() method.

**Parameters**

- `int newTimeout`
