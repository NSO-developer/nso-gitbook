<a id="s-NextObjectList"></a>
# NextObjectList

```java
public interface com.tailf.dp.NextObjectList<E>
    extends java.util.List<E>
```

Instances of classes implementing this interface can be used as
 return value for the
 [`DpDataCallback`](DpDataCallback.md#s-DpDataCallback)
 method.

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#s-registerAnnotatedCallbacks)

## Members

**Methods**:

- [getTimeout()](#s-getTimeout)

## Methods

<a id="s-getTimeout"></a>
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
