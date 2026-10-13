# NextObjectList <a href="#nextobjectlist-86d6d5d5f508" id="nextobjectlist-86d6d5d5f508"></a>

```java
public interface com.tailf.dp.NextObjectList<E>
    extends java.util.List<E>
```

Instances of classes implementing this interface can be used as
 return value for the
 [`DpDataCallback#getIteratorObjectList`](DpDataCallback.md#getiteratorobjectlist-17a0707464f1)
 method.

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#registerannotatedcallbacks-ffaebadbfc42)

## Members

**Methods**:

- [getTimeout\(\)](#gettimeout-c6606d7f7c00)

## Methods

### getTimeout() <a href="#gettimeout-c6606d7f7c00" id="gettimeout-c6606d7f7c00"></a>

```java
public abstract int getTimeout()
```

This method is used by the library to read the timeout value (in
 milliseconds) pertaining to the objects in this List instance.

 A value of 0 instructs NCS to use the default, governed by
 /ncs-config/japi/object-cache-timeout.

 When the timeout expires, NCS will discard the objects from its cache
 and if needed request them via the callback again.
