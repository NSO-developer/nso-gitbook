<a id="s-DataCallbackProxy"></a>
# DataCallbackProxy

```java
public class com.tailf.dp.annotations.DataCallbackProxy
    implements com.tailf.dp.DpDataCallback
```

Types: [DpDataCallback](../DpDataCallback.md#s-DpDataCallback)

Callback proxy for Data Callbacks. Implements the [`DpDataCallback`](../DpDataCallback.md#s-DpDataCallback)
 interface and delegates calls to the registered callback POJO with annotated
 methods

## Members

**Constructors**:

- [DataCallbackProxy(Object, String)](#s-DataCallbackProxy-1)

**Fields**:

- [M_ALL](../DpDataCallback.md#s-M_ALL) from DpDataCallback
- [M_CREATE](../DpDataCallback.md#s-M_CREATE) from DpDataCallback
- [M_EXISTS_OPTIONAL](../DpDataCallback.md#s-M_EXISTS_OPTIONAL) from DpDataCallback
- [M_GET_ATTRS](../DpDataCallback.md#s-M_GET_ATTRS) from DpDataCallback
- [M_GET_CASE](../DpDataCallback.md#s-M_GET_CASE) from DpDataCallback
- [M_GET_ELEM](../DpDataCallback.md#s-M_GET_ELEM) from DpDataCallback
- [M_GET_NEXT](../DpDataCallback.md#s-M_GET_NEXT) from DpDataCallback
- [M_GET_NEXT_OBJECT](../DpDataCallback.md#s-M_GET_NEXT_OBJECT) from DpDataCallback
- [M_GET_OBJECT](../DpDataCallback.md#s-M_GET_OBJECT) from DpDataCallback
- [M_MOVE_AFTER](../DpDataCallback.md#s-M_MOVE_AFTER) from DpDataCallback
- [M_NUM_INSTANCES](../DpDataCallback.md#s-M_NUM_INSTANCES) from DpDataCallback
- [M_REMOVE](../DpDataCallback.md#s-M_REMOVE) from DpDataCallback
- [M_SET_ATTR](../DpDataCallback.md#s-M_SET_ATTR) from DpDataCallback
- [M_SET_CASE](../DpDataCallback.md#s-M_SET_CASE) from DpDataCallback
- [M_SET_ELEM](../DpDataCallback.md#s-M_SET_ELEM) from DpDataCallback
- [M_WANT_FILTER](../DpDataCallback.md#s-M_WANT_FILTER) from DpDataCallback
- [M_WRITE_ALL](../DpDataCallback.md#s-M_WRITE_ALL) from DpDataCallback

**Methods**:

- [addActionCapability(DataCBType)](#s-addActionCapability)
- [addActionMethod(String, Method)](#s-addActionMethod)
- [addExtraActionCapability(Integer)](#s-addExtraActionCapability)
- [callpoint()](#s-callpoint)
- [create(DpTrans, ConfObject[])](#s-create)
- [existsOptional(DpTrans, ConfObject[])](#s-existsOptional)
- [getAttrs(DpTrans, ConfObject[], List<ConfAttributeValue>)](#s-getAttrs)
- [getBackupObject()](#s-getBackupObject)
- [getCallPoint()](#s-getCallPoint)
- [getCase(DpTrans, ConfObject[], ConfObject[])](#s-getCase)
- [getDataCallbackProxys(String, Object)](#s-getDataCallbackProxys)
- [getElem(DpTrans, ConfObject[])](#s-getElem)
- [getFlags()](#s-getFlags)
- [getIteratorKey(DpTrans, ConfObject[], Object)](#s-getIteratorKey)
- [getIteratorObject(DpTrans, ConfObject[], Object)](#s-getIteratorObject)
- [getIteratorObjectList(DpTrans, ConfObject[], Object, Iterator<? extends Object>)](#s-getIteratorObjectList)
- [getObject(DpTrans, ConfObject[])](#s-getObject)
- [iterator(DpTrans, ConfObject[])](#s-iterator)
- [iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey)](#s-iterator-1)
- [iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey, DpListFilter)](#s-iterator-2)
- [iterator(DpTrans, ConfObject[], DpListFilter)](#s-iterator-3)
- [mask()](#s-mask)
- [moveAfter(DpTrans, ConfObject[], ConfKey)](#s-moveAfter)
- [numInstances(DpTrans, ConfObject[])](#s-numInstances)
- [remove(DpTrans, ConfObject[])](#s-remove)
- [setAttr(DpTrans, ConfObject[], ConfAttributeValue)](#s-setAttr)
- [setCase(DpTrans, ConfObject[], ConfObject[], ConfTag)](#s-setCase)
- [setElem(DpTrans, ConfObject[], ConfValue)](#s-setElem)
- [writeAll(DpTrans, ConfObject[])](#s-writeAll)

## Constructors

<a id="s-DataCallbackProxy-1"></a>
### DataCallbackProxy(Object, String)

```java
public DataCallbackProxy(Object backupObject, String callPoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

<a id="s-addActionCapability"></a>
### addActionCapability(DataCBType)

```java
public void addActionCapability(com.tailf.dp.proto.DataCBType dataCBType)
```

Types: [DataCBType](../proto/DataCBType.md#s-DataCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.DataCBType dataCBType` - action type

<a id="s-addActionMethod"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="s-addExtraActionCapability"></a>
### addExtraActionCapability(Integer)

```java
protected void addExtraActionCapability(Integer value)
```

**Parameters**

- `Integer value`

<a id="s-callpoint"></a>
### callpoint()

```java
public String callpoint()
```

<a id="s-create"></a>
### create(DpTrans, ConfObject[])

```java
public int create(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

<a id="s-existsOptional"></a>
### existsOptional(DpTrans, ConfObject[])

```java
public boolean existsOptional(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

<a id="s-getAttrs"></a>
### getAttrs(DpTrans, ConfObject[], List<ConfAttributeValue>)

```java
public int getAttrs(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    java.util.List<com.tailf.conf.ConfAttributeValue> attrList
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [ConfAttributeValue](../../conf/ConfAttributeValue.md#s-ConfAttributeValue), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `java.util.List<com.tailf.conf.ConfAttributeValue> attrList`

<a id="s-getBackupObject"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="s-getCallPoint"></a>
### getCallPoint()

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

<a id="s-getCase"></a>
### getCase(DpTrans, ConfObject[], ConfObject[])

```java
public com.tailf.conf.ConfObject getCase(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfObject[] choice
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpTrans](../DpTrans.md#s-DpTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfObject[] choice`

<a id="s-getDataCallbackProxys"></a>
### getDataCallbackProxys(String, Object)

```java
public static com.tailf.dp.annotations.DataCallbackProxy[] getDataCallbackProxys(
    String mountId,
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DataCallbackProxy](DataCallbackProxy.md#s-DataCallbackProxy), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `String mountId`
- `Object obj` - registered Callback POJO

**Returns:** array of DataCallbackProxy

**Throws**

- `DpCallbackException`

<a id="s-getElem"></a>
### getElem(DpTrans, ConfObject[])

```java
public com.tailf.conf.ConfValue getElem(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfValue](../../conf/ConfValue.md#s-ConfValue), [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

<a id="s-getFlags"></a>
### getFlags()

```java
public java.util.EnumSet<com.tailf.dp.proto.DpFlag> getFlags()
```

Types: [DpFlag](../proto/DpFlag.md#s-DpFlag)

<a id="s-getIteratorKey"></a>
### getIteratorKey(DpTrans, ConfObject[], Object)

```java
public com.tailf.conf.ConfKey getIteratorKey(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfKey](../../conf/ConfKey.md#s-ConfKey), [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `Object obj`

<a id="s-getIteratorObject"></a>
### getIteratorObject(DpTrans, ConfObject[], Object)

```java
public com.tailf.conf.ConfObject[] getIteratorObject(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpTrans](../DpTrans.md#s-DpTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `Object obj`

<a id="s-getIteratorObjectList"></a>
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

Types: [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpTrans](../DpTrans.md#s-DpTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `Object obj`
- `java.util.Iterator<? extends Object> iterator`

<a id="s-getObject"></a>
### getObject(DpTrans, ConfObject[])

```java
public com.tailf.conf.ConfObject[] getObject(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpTrans](../DpTrans.md#s-DpTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

<a id="s-iterator"></a>
### iterator(DpTrans, ConfObject[])

```java
public java.util.Iterator<Object> iterator(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

<a id="s-iterator-1"></a>
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

Types: [DpDataFindNextIterator](../DpDataFindNextIterator.md#s-DpDataFindNextIterator), [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [ConfFindNextType](../../conf/ConfFindNextType.md#s-ConfFindNextType), [ConfKey](../../conf/ConfKey.md#s-ConfKey), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfFindNextType type`
- `com.tailf.conf.ConfKey key`

<a id="s-iterator-2"></a>
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

Types: [DpDataFindNextIterator](../DpDataFindNextIterator.md#s-DpDataFindNextIterator), [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [ConfFindNextType](../../conf/ConfFindNextType.md#s-ConfFindNextType), [ConfKey](../../conf/ConfKey.md#s-ConfKey), [DpListFilter](../DpListFilter.md#s-DpListFilter), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfFindNextType type`
- `com.tailf.conf.ConfKey key`
- `com.tailf.dp.DpListFilter filter`

<a id="s-iterator-3"></a>
### iterator(DpTrans, ConfObject[], DpListFilter)

```java
public java.util.Iterator<Object> iterator(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.dp.DpListFilter filter
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpListFilter](../DpListFilter.md#s-DpListFilter), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.dp.DpListFilter filter`

<a id="s-mask"></a>
### mask()

```java
public int mask()
```

<a id="s-moveAfter"></a>
### moveAfter(DpTrans, ConfObject[], ConfKey)

```java
public int moveAfter(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfKey prevkey
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [ConfKey](../../conf/ConfKey.md#s-ConfKey), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfKey prevkey`

<a id="s-numInstances"></a>
### numInstances(DpTrans, ConfObject[])

```java
public int numInstances(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

<a id="s-remove"></a>
### remove(DpTrans, ConfObject[])

```java
public int remove(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

<a id="s-setAttr"></a>
### setAttr(DpTrans, ConfObject[], ConfAttributeValue)

```java
public int setAttr(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfAttributeValue attr
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [ConfAttributeValue](../../conf/ConfAttributeValue.md#s-ConfAttributeValue), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfAttributeValue attr`

<a id="s-setCase"></a>
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

Types: [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [ConfTag](../../conf/ConfTag.md#s-ConfTag), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfObject[] choice`
- `com.tailf.conf.ConfTag caseval`

<a id="s-setElem"></a>
### setElem(DpTrans, ConfObject[], ConfValue)

```java
public int setElem(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue newval
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [ConfValue](../../conf/ConfValue.md#s-ConfValue), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfValue newval`

<a id="s-writeAll"></a>
### writeAll(DpTrans, ConfObject[])

```java
public int writeAll(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
