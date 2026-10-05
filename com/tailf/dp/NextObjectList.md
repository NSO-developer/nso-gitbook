<a id="cls-NextObjectList"></a>
# NextObjectList

```java
public interface com.tailf.dp.NextObjectList<E>
    extends java.util.List<E>
```

Instances of classes implementing this interface can be used as
 return value for the
 [`DpDataCallback#getIteratorObjectList`](DpDataCallback.md#m-getiteratorobjectlist-17a0707464f1)
 method.

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#m-registerannotatedcallbacks-ffaebadbfc42)

## Members

**Methods**:

- [getTimeout()](#m-gettimeout-c6606d7f7c00)

## Methods

<a id="m-gettimeout-c6606d7f7c00"></a>
### getTimeout()

```java
public abstract int getTimeout()
```

This method is used by the library to read the timeout value (in
 milliseconds) pertaining to the objects in this List instance.

 A value of 0 instructs NCS to use the default, governed by
 /ncs-config/japi/object-cache-timeout.

 When the timeout expires, NCS will discard the objects from its cache
 and if needed request them via the callback again.
