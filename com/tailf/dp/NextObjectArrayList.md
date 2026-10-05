<a id="cls-NextObjectArrayList"></a>
# NextObjectArrayList

```java
public class com.tailf.dp.NextObjectArrayList<E>
    extends java.util.ArrayList<E>
    implements com.tailf.dp.NextObjectList<E>
```

Types: [NextObjectList](NextObjectList.md#cls-NextObjectList)

ArrayList-based implementation of the NextObjectList interface.

## Members

**Constructors**:

- [NextObjectArrayList()](#m-nextobjectarraylist-8247e2abf6fa)
- [NextObjectArrayList(Collection<? extends E>)](#m-nextobjectarraylist-a6fbfda6c13c)
- [NextObjectArrayList(int)](#m-nextobjectarraylist-dc46d12ae286)

**Methods**:

- [getTimeout()](#m-gettimeout-c6606d7f7c00)
- [setTimeout(int)](#m-settimeout-cbe758ecb5d8)

## Constructors

<a id="m-nextobjectarraylist-8247e2abf6fa"></a>
### NextObjectArrayList()

```java
public NextObjectArrayList()
```

<a id="m-nextobjectarraylist-a6fbfda6c13c"></a>
### NextObjectArrayList(Collection<? extends E>)

```java
public NextObjectArrayList(java.util.Collection<? extends E> c)
```

**Parameters**

- `java.util.Collection<? extends E> c`

<a id="m-nextobjectarraylist-dc46d12ae286"></a>
### NextObjectArrayList(int)

```java
public NextObjectArrayList(int initialCapacity)
```

**Parameters**

- `int initialCapacity`


## Methods

<a id="m-gettimeout-c6606d7f7c00"></a>
### getTimeout()

```java
public int getTimeout()
```

This method is used by the library to read the timeout value pertaining
 to the objects in this instance.

 I.e. it governs for how long NCS will retain the objects and read them
 from its cache.

<a id="m-settimeout-cbe758ecb5d8"></a>
### setTimeout(int)

```java
public void setTimeout(int newTimeout)
```

Setter method for the value returned by the getTimeout() method.

**Parameters**

- `int newTimeout`
