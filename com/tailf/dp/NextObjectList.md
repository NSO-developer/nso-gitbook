# NextObjectList <a href="#cls-NextObjectList" id="cls-NextObjectList"></a>

```java
public interface com.tailf.dp.NextObjectList<E>
    extends java.util.List<E>
```

Instances of classes implementing this interface can be used as
 return value for the
 [`DpDataCallback#getIteratorObjectList`](DpDataCallback.md#m-getIteratorObjectList-17a0707464f1)
 method.

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#m-registerAnnotatedCallbacks-ffaebadbfc42)

## Members

**Methods**:

- [getTimeout()](#m-getTimeout-c6606d7f7c00)

## Methods

### getTimeout() <a href="#m-getTimeout-c6606d7f7c00" id="m-getTimeout-c6606d7f7c00"></a>

```java
public abstract int getTimeout()
```

This method is used by the library to read the timeout value (in
 milliseconds) pertaining to the objects in this List instance.

 A value of 0 instructs NCS to use the default, governed by
 /ncs-config/japi/object-cache-timeout.

 When the timeout expires, NCS will discard the objects from its cache
 and if needed request them via the callback again.
