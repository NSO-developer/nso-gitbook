# DataCallbackProxy <a href="#cls-DataCallbackProxy" id="cls-DataCallbackProxy"></a>

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

- [DataCallbackProxy(Object, String)](#m-DataCallbackProxy-3ad070be1b20)

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

- [addActionCapability(DataCBType)](#m-addActionCapability-fef5fed819b7)
- [addActionMethod(String, Method)](#m-addActionMethod-cf3e43a67fd9)
- [addExtraActionCapability(Integer)](#m-addExtraActionCapability-8dec5455a1dc)
- [callpoint()](#m-callpoint-d6336403521b)
- [create(DpTrans, ConfObject[])](#m-create-b5264b1d26e2)
- [existsOptional(DpTrans, ConfObject[])](#m-existsOptional-3a4437a2a54a)
- [getAttrs(DpTrans, ConfObject[], List<ConfAttributeValue>)](#m-getAttrs-47ef46821576)
- [getBackupObject()](#m-getBackupObject-a6fb23c24524)
- [getCallPoint()](#m-getCallPoint-f816d0a44b26)
- [getCase(DpTrans, ConfObject[], ConfObject[])](#m-getCase-24568d257ce7)
- [getDataCallbackProxys(String, Object)](#m-getDataCallbackProxys-d0b69f7a129e)
- [getElem(DpTrans, ConfObject[])](#m-getElem-baf9006121df)
- [getFlags()](#m-getFlags-3c1ca90fd29c)
- [getIteratorKey(DpTrans, ConfObject[], Object)](#m-getIteratorKey-6df7c38f65f8)
- [getIteratorObject(DpTrans, ConfObject[], Object)](#m-getIteratorObject-425632c26c31)
- [getIteratorObjectList(DpTrans, ConfObject[], Object, Iterator<? extends Object>)](#m-getIteratorObjectList-17a0707464f1)
- [getObject(DpTrans, ConfObject[])](#m-getObject-b2d87f9b9270)
- [iterator(DpTrans, ConfObject[])](#m-iterator-89c62926f3e8)
- [iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey)](#m-iterator-5d250fbe6a8b)
- [iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey, DpListFilter)](#m-iterator-b1da1a451977)
- [iterator(DpTrans, ConfObject[], DpListFilter)](#m-iterator-02bb74b2989b)
- [mask()](#m-mask-24c2fa29c6af)
- [moveAfter(DpTrans, ConfObject[], ConfKey)](#m-moveAfter-023d2bce078c)
- [numInstances(DpTrans, ConfObject[])](#m-numInstances-71fd723ecab5)
- [remove(DpTrans, ConfObject[])](#m-remove-93340909c9a0)
- [setAttr(DpTrans, ConfObject[], ConfAttributeValue)](#m-setAttr-656af041deec)
- [setCase(DpTrans, ConfObject[], ConfObject[], ConfTag)](#m-setCase-430d4dbe7c83)
- [setElem(DpTrans, ConfObject[], ConfValue)](#m-setElem-8a5e46811f6e)
- [writeAll(DpTrans, ConfObject[])](#m-writeAll-a4604e96718c)

## Constructors

### DataCallbackProxy(Object, String) <a href="#m-DataCallbackProxy-3ad070be1b20" id="m-DataCallbackProxy-3ad070be1b20"></a>

```java
public DataCallbackProxy(Object backupObject, String callPoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

### addActionCapability(DataCBType) <a href="#m-addActionCapability-fef5fed819b7" id="m-addActionCapability-fef5fed819b7"></a>

```java
public void addActionCapability(com.tailf.dp.proto.DataCBType dataCBType)
```

Types: [DataCBType](../proto/DataCBType.md#cls-DataCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.DataCBType dataCBType` - action type

### addActionMethod(String, Method) <a href="#m-addActionMethod-cf3e43a67fd9" id="m-addActionMethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### addExtraActionCapability(Integer) <a href="#m-addExtraActionCapability-8dec5455a1dc" id="m-addExtraActionCapability-8dec5455a1dc"></a>

```java
protected void addExtraActionCapability(Integer value)
```

**Parameters**

- `Integer value`

### callpoint() <a href="#m-callpoint-d6336403521b" id="m-callpoint-d6336403521b"></a>

```java
public String callpoint()
```

### create(DpTrans, ConfObject[]) <a href="#m-create-b5264b1d26e2" id="m-create-b5264b1d26e2"></a>

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

### existsOptional(DpTrans, ConfObject[]) <a href="#m-existsOptional-3a4437a2a54a" id="m-existsOptional-3a4437a2a54a"></a>

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

### getAttrs(DpTrans, ConfObject[], List<ConfAttributeValue>) <a href="#m-getAttrs-47ef46821576" id="m-getAttrs-47ef46821576"></a>

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

### getBackupObject() <a href="#m-getBackupObject-a6fb23c24524" id="m-getBackupObject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getCallPoint() <a href="#m-getCallPoint-f816d0a44b26" id="m-getCallPoint-f816d0a44b26"></a>

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

### getCase(DpTrans, ConfObject[], ConfObject[]) <a href="#m-getCase-24568d257ce7" id="m-getCase-24568d257ce7"></a>

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

### getDataCallbackProxys(String, Object) <a href="#m-getDataCallbackProxys-d0b69f7a129e" id="m-getDataCallbackProxys-d0b69f7a129e"></a>

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

### getElem(DpTrans, ConfObject[]) <a href="#m-getElem-baf9006121df" id="m-getElem-baf9006121df"></a>

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

### getFlags() <a href="#m-getFlags-3c1ca90fd29c" id="m-getFlags-3c1ca90fd29c"></a>

```java
public java.util.EnumSet<com.tailf.dp.proto.DpFlag> getFlags()
```

Types: [DpFlag](../proto/DpFlag.md#cls-DpFlag)

### getIteratorKey(DpTrans, ConfObject[], Object) <a href="#m-getIteratorKey-6df7c38f65f8" id="m-getIteratorKey-6df7c38f65f8"></a>

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

### getIteratorObject(DpTrans, ConfObject[], Object) <a href="#m-getIteratorObject-425632c26c31" id="m-getIteratorObject-425632c26c31"></a>

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

### getIteratorObjectList(DpTrans, ConfObject[], Object, Iterator<? extends Object>) <a href="#m-getIteratorObjectList-17a0707464f1" id="m-getIteratorObjectList-17a0707464f1"></a>

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

### getObject(DpTrans, ConfObject[]) <a href="#m-getObject-b2d87f9b9270" id="m-getObject-b2d87f9b9270"></a>

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

### iterator(DpTrans, ConfObject[]) <a href="#m-iterator-89c62926f3e8" id="m-iterator-89c62926f3e8"></a>

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

### iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey) <a href="#m-iterator-5d250fbe6a8b" id="m-iterator-5d250fbe6a8b"></a>

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

### iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey, DpListFilter) <a href="#m-iterator-b1da1a451977" id="m-iterator-b1da1a451977"></a>

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

### iterator(DpTrans, ConfObject[], DpListFilter) <a href="#m-iterator-02bb74b2989b" id="m-iterator-02bb74b2989b"></a>

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

### mask() <a href="#m-mask-24c2fa29c6af" id="m-mask-24c2fa29c6af"></a>

```java
public int mask()
```

### moveAfter(DpTrans, ConfObject[], ConfKey) <a href="#m-moveAfter-023d2bce078c" id="m-moveAfter-023d2bce078c"></a>

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

### numInstances(DpTrans, ConfObject[]) <a href="#m-numInstances-71fd723ecab5" id="m-numInstances-71fd723ecab5"></a>

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

### remove(DpTrans, ConfObject[]) <a href="#m-remove-93340909c9a0" id="m-remove-93340909c9a0"></a>

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

### setAttr(DpTrans, ConfObject[], ConfAttributeValue) <a href="#m-setAttr-656af041deec" id="m-setAttr-656af041deec"></a>

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

### setCase(DpTrans, ConfObject[], ConfObject[], ConfTag) <a href="#m-setCase-430d4dbe7c83" id="m-setCase-430d4dbe7c83"></a>

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

### setElem(DpTrans, ConfObject[], ConfValue) <a href="#m-setElem-8a5e46811f6e" id="m-setElem-8a5e46811f6e"></a>

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

### writeAll(DpTrans, ConfObject[]) <a href="#m-writeAll-a4604e96718c" id="m-writeAll-a4604e96718c"></a>

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
