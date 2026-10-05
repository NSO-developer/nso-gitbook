<a id="s-NextObjectArrayList"></a>
# NextObjectArrayList

```java
public class com.tailf.dp.NextObjectArrayList<E>
    extends java.util.ArrayList<E>
    implements com.tailf.dp.NextObjectList<E>
```

Types: [NextObjectList](NextObjectList.md#s-NextObjectList)

ArrayList-based implementation of the NextObjectList interface.

## Members

**Constructors**:

- [NextObjectArrayList()](#s-NextObjectArrayList-1)
- [NextObjectArrayList(Collection<? extends E>)](#s-NextObjectArrayList-2)
- [NextObjectArrayList(int)](#s-NextObjectArrayList-3)

**Methods**:

- [getTimeout()](#s-getTimeout)
- [setTimeout(int)](#s-setTimeout)

## Constructors

<a id="s-NextObjectArrayList-1"></a>
### NextObjectArrayList()

```java
public NextObjectArrayList()
```

<a id="s-NextObjectArrayList-2"></a>
### NextObjectArrayList(Collection<? extends E>)

```java
public NextObjectArrayList(java.util.Collection<? extends E> c)
```

**Parameters**

- `java.util.Collection<? extends E> c`

<a id="s-NextObjectArrayList-3"></a>
### NextObjectArrayList(int)

```java
public NextObjectArrayList(int initialCapacity)
```

**Parameters**

- `int initialCapacity`


## Methods

<a id="s-getTimeout"></a>
### getTimeout()

```java
public int getTimeout()
```

This method is used by the library to read the timeout value pertaining
 to the objects in this instance.

 I.e. it governs for how long NCS will retain the objects and read them
 from its cache.

<a id="s-setTimeout"></a>
### setTimeout(int)

```java
public void setTimeout(int newTimeout)
```

Setter method for the value returned by the getTimeout() method.

**Parameters**

- `int newTimeout`
