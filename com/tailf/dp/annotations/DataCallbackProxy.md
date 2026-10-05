<a id="cls-DataCallbackProxy"></a>
# DataCallbackProxy

```java
public class com.tailf.dp.annotations.DataCallbackProxy
    implements com.tailf.dp.DpDataCallback
```

Types: [DpDataCallback](../DpDataCallback.md#cls-DpDataCallback)

Callback proxy for Data Callbacks. Implements the [`DpDataCallback`](../DpDataCallback.md#cls-DpDataCallback)
 interface and delegates calls to the registered callback POJO with annotated
 methods

## Members

**Constructors**:

- [DataCallbackProxy(Object, String)](#m-datacallbackproxy-3ad070be1b20)

**Fields**:

- [M_ALL](../DpDataCallback.md#m-M_ALL) from DpDataCallback
- [M_CREATE](../DpDataCallback.md#m-M_CREATE) from DpDataCallback
- [M_EXISTS_OPTIONAL](../DpDataCallback.md#m-M_EXISTS_OPTIONAL) from DpDataCallback
- [M_GET_ATTRS](../DpDataCallback.md#m-M_GET_ATTRS) from DpDataCallback
- [M_GET_CASE](../DpDataCallback.md#m-M_GET_CASE) from DpDataCallback
- [M_GET_ELEM](../DpDataCallback.md#m-M_GET_ELEM) from DpDataCallback
- [M_GET_NEXT](../DpDataCallback.md#m-M_GET_NEXT) from DpDataCallback
- [M_GET_NEXT_OBJECT](../DpDataCallback.md#m-M_GET_NEXT_OBJECT) from DpDataCallback
- [M_GET_OBJECT](../DpDataCallback.md#m-M_GET_OBJECT) from DpDataCallback
- [M_MOVE_AFTER](../DpDataCallback.md#m-M_MOVE_AFTER) from DpDataCallback
- [M_NUM_INSTANCES](../DpDataCallback.md#m-M_NUM_INSTANCES) from DpDataCallback
- [M_REMOVE](../DpDataCallback.md#m-M_REMOVE) from DpDataCallback
- [M_SET_ATTR](../DpDataCallback.md#m-M_SET_ATTR) from DpDataCallback
- [M_SET_CASE](../DpDataCallback.md#m-M_SET_CASE) from DpDataCallback
- [M_SET_ELEM](../DpDataCallback.md#m-M_SET_ELEM) from DpDataCallback
- [M_WANT_FILTER](../DpDataCallback.md#m-M_WANT_FILTER) from DpDataCallback
- [M_WRITE_ALL](../DpDataCallback.md#m-M_WRITE_ALL) from DpDataCallback

**Methods**:

- [addActionCapability(DataCBType)](#m-addactioncapability-fef5fed819b7)
- [addActionMethod(String, Method)](#m-addactionmethod-cf3e43a67fd9)
- [addExtraActionCapability(Integer)](#m-addextraactioncapability-8dec5455a1dc)
- [callpoint()](#m-callpoint-d6336403521b)
- [create(DpTrans, ConfObject[])](#m-create-b5264b1d26e2)
- [existsOptional(DpTrans, ConfObject[])](#m-existsoptional-3a4437a2a54a)
- [getAttrs(DpTrans, ConfObject[], List<ConfAttributeValue>)](#m-getattrs-47ef46821576)
- [getBackupObject()](#m-getbackupobject-a6fb23c24524)
- [getCallPoint()](#m-getcallpoint-f816d0a44b26)
- [getCase(DpTrans, ConfObject[], ConfObject[])](#m-getcase-24568d257ce7)
- [getDataCallbackProxys(String, Object)](#m-getdatacallbackproxys-d0b69f7a129e)
- [getElem(DpTrans, ConfObject[])](#m-getelem-baf9006121df)
- [getFlags()](#m-getflags-3c1ca90fd29c)
- [getIteratorKey(DpTrans, ConfObject[], Object)](#m-getiteratorkey-6df7c38f65f8)
- [getIteratorObject(DpTrans, ConfObject[], Object)](#m-getiteratorobject-425632c26c31)
- [getIteratorObjectList(DpTrans, ConfObject[], Object, Iterator<? extends Object>)](#m-getiteratorobjectlist-17a0707464f1)
- [getObject(DpTrans, ConfObject[])](#m-getobject-b2d87f9b9270)
- [iterator(DpTrans, ConfObject[])](#m-iterator-89c62926f3e8)
- [iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey)](#m-iterator-5d250fbe6a8b)
- [iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey, DpListFilter)](#m-iterator-b1da1a451977)
- [iterator(DpTrans, ConfObject[], DpListFilter)](#m-iterator-02bb74b2989b)
- [mask()](#m-mask-24c2fa29c6af)
- [moveAfter(DpTrans, ConfObject[], ConfKey)](#m-moveafter-023d2bce078c)
- [numInstances(DpTrans, ConfObject[])](#m-numinstances-71fd723ecab5)
- [remove(DpTrans, ConfObject[])](#m-remove-93340909c9a0)
- [setAttr(DpTrans, ConfObject[], ConfAttributeValue)](#m-setattr-656af041deec)
- [setCase(DpTrans, ConfObject[], ConfObject[], ConfTag)](#m-setcase-430d4dbe7c83)
- [setElem(DpTrans, ConfObject[], ConfValue)](#m-setelem-8a5e46811f6e)
- [writeAll(DpTrans, ConfObject[])](#m-writeall-a4604e96718c)

## Constructors

<a id="m-datacallbackproxy-3ad070be1b20"></a>
### DataCallbackProxy(Object, String)

```java
public DataCallbackProxy(Object backupObject, String callPoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

<a id="m-addactioncapability-fef5fed819b7"></a>
### addActionCapability(DataCBType)

```java
public void addActionCapability(com.tailf.dp.proto.DataCBType dataCBType)
```

Types: [DataCBType](../proto/DataCBType.md#cls-DataCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.DataCBType dataCBType` - action type

<a id="m-addactionmethod-cf3e43a67fd9"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="m-addextraactioncapability-8dec5455a1dc"></a>
### addExtraActionCapability(Integer)

```java
protected void addExtraActionCapability(Integer value)
```

**Parameters**

- `Integer value`

<a id="m-callpoint-d6336403521b"></a>
### callpoint()

```java
public String callpoint()
```

<a id="m-create-b5264b1d26e2"></a>
### create(DpTrans, ConfObject[])

```java
public int create(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

<a id="m-existsoptional-3a4437a2a54a"></a>
### existsOptional(DpTrans, ConfObject[])

```java
public boolean existsOptional(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

<a id="m-getattrs-47ef46821576"></a>
### getAttrs(DpTrans, ConfObject[], List<ConfAttributeValue>)

```java
public int getAttrs(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    java.util.List<com.tailf.conf.ConfAttributeValue> attrList
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [ConfAttributeValue](../../conf/ConfAttributeValue.md#cls-ConfAttributeValue), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `java.util.List<com.tailf.conf.ConfAttributeValue> attrList`

<a id="m-getbackupobject-a6fb23c24524"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="m-getcallpoint-f816d0a44b26"></a>
### getCallPoint()

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

<a id="m-getcase-24568d257ce7"></a>
### getCase(DpTrans, ConfObject[], ConfObject[])

```java
public com.tailf.conf.ConfObject getCase(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfObject[] choice
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfObject[] choice`

<a id="m-getdatacallbackproxys-d0b69f7a129e"></a>
### getDataCallbackProxys(String, Object)

```java
public static com.tailf.dp.annotations.DataCallbackProxy[] getDataCallbackProxys(
    String mountId,
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DataCallbackProxy](DataCallbackProxy.md#cls-DataCallbackProxy), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `String mountId`
- `Object obj` - registered Callback POJO

**Returns:** array of DataCallbackProxy

**Throws**

- `DpCallbackException`

<a id="m-getelem-baf9006121df"></a>
### getElem(DpTrans, ConfObject[])

```java
public com.tailf.conf.ConfValue getElem(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfValue](../../conf/ConfValue.md#cls-ConfValue), [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

<a id="m-getflags-3c1ca90fd29c"></a>
### getFlags()

```java
public java.util.EnumSet<com.tailf.dp.proto.DpFlag> getFlags()
```

Types: [DpFlag](../proto/DpFlag.md#cls-DpFlag)

<a id="m-getiteratorkey-6df7c38f65f8"></a>
### getIteratorKey(DpTrans, ConfObject[], Object)

```java
public com.tailf.conf.ConfKey getIteratorKey(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfKey](../../conf/ConfKey.md#cls-ConfKey), [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `Object obj`

<a id="m-getiteratorobject-425632c26c31"></a>
### getIteratorObject(DpTrans, ConfObject[], Object)

```java
public com.tailf.conf.ConfObject[] getIteratorObject(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `Object obj`

<a id="m-getiteratorobjectlist-17a0707464f1"></a>
### getIteratorObjectList(DpTrans, ConfObject[], Object, Iterator<? extends Object>)

```java
public java.util.List<com.tailf.conf.ConfObject[]> getIteratorObjectList(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    Object obj,
    java.util.Iterator<? extends Object> iterator
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `Object obj`
- `java.util.Iterator<? extends Object> iterator`

<a id="m-getobject-b2d87f9b9270"></a>
### getObject(DpTrans, ConfObject[])

```java
public com.tailf.conf.ConfObject[] getObject(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

<a id="m-iterator-89c62926f3e8"></a>
### iterator(DpTrans, ConfObject[])

```java
public java.util.Iterator<Object> iterator(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

<a id="m-iterator-5d250fbe6a8b"></a>
### iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey)

```java
public com.tailf.dp.DpDataFindNextIterator iterator(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfFindNextType type,
    com.tailf.conf.ConfKey key
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDataFindNextIterator](../DpDataFindNextIterator.md#cls-DpDataFindNextIterator), [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [ConfFindNextType](../../conf/ConfFindNextType.md#cls-ConfFindNextType), [ConfKey](../../conf/ConfKey.md#cls-ConfKey), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfFindNextType type`
- `com.tailf.conf.ConfKey key`

<a id="m-iterator-b1da1a451977"></a>
### iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey, DpListFilter)

```java
public com.tailf.dp.DpDataFindNextIterator iterator(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfFindNextType type,
    com.tailf.conf.ConfKey key,
    com.tailf.dp.DpListFilter filter
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDataFindNextIterator](../DpDataFindNextIterator.md#cls-DpDataFindNextIterator), [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [ConfFindNextType](../../conf/ConfFindNextType.md#cls-ConfFindNextType), [ConfKey](../../conf/ConfKey.md#cls-ConfKey), [DpListFilter](../DpListFilter.md#cls-DpListFilter), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfFindNextType type`
- `com.tailf.conf.ConfKey key`
- `com.tailf.dp.DpListFilter filter`

<a id="m-iterator-02bb74b2989b"></a>
### iterator(DpTrans, ConfObject[], DpListFilter)

```java
public java.util.Iterator<Object> iterator(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.dp.DpListFilter filter
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpListFilter](../DpListFilter.md#cls-DpListFilter), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.dp.DpListFilter filter`

<a id="m-mask-24c2fa29c6af"></a>
### mask()

```java
public int mask()
```

<a id="m-moveafter-023d2bce078c"></a>
### moveAfter(DpTrans, ConfObject[], ConfKey)

```java
public int moveAfter(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfKey prevkey
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [ConfKey](../../conf/ConfKey.md#cls-ConfKey), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfKey prevkey`

<a id="m-numinstances-71fd723ecab5"></a>
### numInstances(DpTrans, ConfObject[])

```java
public int numInstances(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

<a id="m-remove-93340909c9a0"></a>
### remove(DpTrans, ConfObject[])

```java
public int remove(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

<a id="m-setattr-656af041deec"></a>
### setAttr(DpTrans, ConfObject[], ConfAttributeValue)

```java
public int setAttr(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfAttributeValue attr
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [ConfAttributeValue](../../conf/ConfAttributeValue.md#cls-ConfAttributeValue), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfAttributeValue attr`

<a id="m-setcase-430d4dbe7c83"></a>
### setCase(DpTrans, ConfObject[], ConfObject[], ConfTag)

```java
public int setCase(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfObject[] choice,
    com.tailf.conf.ConfTag caseval
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [ConfTag](../../conf/ConfTag.md#cls-ConfTag), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfObject[] choice`
- `com.tailf.conf.ConfTag caseval`

<a id="m-setelem-8a5e46811f6e"></a>
### setElem(DpTrans, ConfObject[], ConfValue)

```java
public int setElem(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue newval
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [ConfValue](../../conf/ConfValue.md#cls-ConfValue), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfValue newval`

<a id="m-writeall-a4604e96718c"></a>
### writeAll(DpTrans, ConfObject[])

```java
public int writeAll(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
