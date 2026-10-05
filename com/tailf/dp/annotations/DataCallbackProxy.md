# DataCallbackProxy <a href="#datacallbackproxy-1ffb50eb2bf8" id="datacallbackproxy-1ffb50eb2bf8"></a>

```java
public class com.tailf.dp.annotations.DataCallbackProxy
    implements com.tailf.dp.DpDataCallback
```

Types: [DpDataCallback](../DpDataCallback.md#dpdatacallback-79de01fc87fa)

Callback proxy for Data Callbacks. Implements the [`DpDataCallback`](../DpDataCallback.md#dpdatacallback-79de01fc87fa)
 interface and delegates calls to the registered callback POJO with annotated
 methods

## Members

**Constructors**:

- [DataCallbackProxy\(Object, String\)](#datacallbackproxy-3ad070be1b20)

**Fields**:

- [M\_ALL](../DpDataCallback.md#m_all-e3844e41e8ee) from DpDataCallback
- [M\_CREATE](../DpDataCallback.md#m_create-741f9c6b07dc) from DpDataCallback
- [M\_EXISTS\_OPTIONAL](../DpDataCallback.md#m_exists_optional-6814920a830e) from DpDataCallback
- [M\_GET\_ATTRS](../DpDataCallback.md#m_get_attrs-e6cbc705a879) from DpDataCallback
- [M\_GET\_CASE](../DpDataCallback.md#m_get_case-6bc0dd9524a3) from DpDataCallback
- [M\_GET\_ELEM](../DpDataCallback.md#m_get_elem-d837ad1dba58) from DpDataCallback
- [M\_GET\_NEXT](../DpDataCallback.md#m_get_next-179382a70531) from DpDataCallback
- [M\_GET\_NEXT\_OBJECT](../DpDataCallback.md#m_get_next_object-85c17c4c50dc) from DpDataCallback
- [M\_GET\_OBJECT](../DpDataCallback.md#m_get_object-513329fab831) from DpDataCallback
- [M\_MOVE\_AFTER](../DpDataCallback.md#m_move_after-f2fb007ea462) from DpDataCallback
- [M\_NUM\_INSTANCES](../DpDataCallback.md#m_num_instances-e3d67bbf1d7d) from DpDataCallback
- [M\_REMOVE](../DpDataCallback.md#m_remove-bf7885c8e11d) from DpDataCallback
- [M\_SET\_ATTR](../DpDataCallback.md#m_set_attr-47814df091ce) from DpDataCallback
- [M\_SET\_CASE](../DpDataCallback.md#m_set_case-54f26a9aec00) from DpDataCallback
- [M\_SET\_ELEM](../DpDataCallback.md#m_set_elem-2941c6cba3c3) from DpDataCallback
- [M\_WANT\_FILTER](../DpDataCallback.md#m_want_filter-4a49bdf17872) from DpDataCallback
- [M\_WRITE\_ALL](../DpDataCallback.md#m_write_all-845ab355d8fb) from DpDataCallback

**Methods**:

- [addActionCapability\(DataCBType\)](#addactioncapability-fef5fed819b7)
- [addActionMethod\(String, Method\)](#addactionmethod-cf3e43a67fd9)
- [addExtraActionCapability\(Integer\)](#addextraactioncapability-8dec5455a1dc)
- [callpoint\(\)](#callpoint-d6336403521b)
- [create\(DpTrans, ConfObject\[\]\)](#create-b5264b1d26e2)
- [existsOptional\(DpTrans, ConfObject\[\]\)](#existsoptional-3a4437a2a54a)
- [getAttrs\(DpTrans, ConfObject\[\], List\<ConfAttributeValue\>\)](#getattrs-47ef46821576)
- [getBackupObject\(\)](#getbackupobject-a6fb23c24524)
- [getCallPoint\(\)](#getcallpoint-f816d0a44b26)
- [getCase\(DpTrans, ConfObject\[\], ConfObject\[\]\)](#getcase-24568d257ce7)
- [getDataCallbackProxys\(String, Object\)](#getdatacallbackproxys-d0b69f7a129e)
- [getElem\(DpTrans, ConfObject\[\]\)](#getelem-baf9006121df)
- [getFlags\(\)](#getflags-3c1ca90fd29c)
- [getIteratorKey\(DpTrans, ConfObject\[\], Object\)](#getiteratorkey-6df7c38f65f8)
- [getIteratorObject\(DpTrans, ConfObject\[\], Object\)](#getiteratorobject-425632c26c31)
- [getIteratorObjectList\(DpTrans, ConfObject\[\], Object, Iterator\<? extends Object\>\)](#getiteratorobjectlist-17a0707464f1)
- [getObject\(DpTrans, ConfObject\[\]\)](#getobject-b2d87f9b9270)
- [iterator\(DpTrans, ConfObject\[\]\)](#iterator-89c62926f3e8)
- [iterator\(DpTrans, ConfObject\[\], ConfFindNextType, ConfKey\)](#iterator-5d250fbe6a8b)
- [iterator\(DpTrans, ConfObject\[\], ConfFindNextType, ConfKey, DpListFilter\)](#iterator-b1da1a451977)
- [iterator\(DpTrans, ConfObject\[\], DpListFilter\)](#iterator-02bb74b2989b)
- [mask\(\)](#mask-24c2fa29c6af)
- [moveAfter\(DpTrans, ConfObject\[\], ConfKey\)](#moveafter-023d2bce078c)
- [numInstances\(DpTrans, ConfObject\[\]\)](#numinstances-71fd723ecab5)
- [remove\(DpTrans, ConfObject\[\]\)](#remove-93340909c9a0)
- [setAttr\(DpTrans, ConfObject\[\], ConfAttributeValue\)](#setattr-656af041deec)
- [setCase\(DpTrans, ConfObject\[\], ConfObject\[\], ConfTag\)](#setcase-430d4dbe7c83)
- [setElem\(DpTrans, ConfObject\[\], ConfValue\)](#setelem-8a5e46811f6e)
- [writeAll\(DpTrans, ConfObject\[\]\)](#writeall-a4604e96718c)

## Constructors

### DataCallbackProxy(Object, String) <a href="#datacallbackproxy-3ad070be1b20" id="datacallbackproxy-3ad070be1b20"></a>

```java
public DataCallbackProxy(Object backupObject, String callPoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

### addActionCapability(DataCBType) <a href="#addactioncapability-fef5fed819b7" id="addactioncapability-fef5fed819b7"></a>

```java
public void addActionCapability(com.tailf.dp.proto.DataCBType dataCBType)
```

Types: [DataCBType](../proto/DataCBType.md#datacbtype-1cb4e4ee7708)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.DataCBType dataCBType` - action type

### addActionMethod(String, Method) <a href="#addactionmethod-cf3e43a67fd9" id="addactionmethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### addExtraActionCapability(Integer) <a href="#addextraactioncapability-8dec5455a1dc" id="addextraactioncapability-8dec5455a1dc"></a>

```java
protected void addExtraActionCapability(Integer value)
```

**Parameters**

- `Integer value`

### callpoint() <a href="#callpoint-d6336403521b" id="callpoint-d6336403521b"></a>

```java
public String callpoint()
```

### create(DpTrans, ConfObject[]) <a href="#create-b5264b1d26e2" id="create-b5264b1d26e2"></a>

```java
public int create(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

### existsOptional(DpTrans, ConfObject[]) <a href="#existsoptional-3a4437a2a54a" id="existsoptional-3a4437a2a54a"></a>

```java
public boolean existsOptional(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

### getAttrs(DpTrans, ConfObject[], List&lt;ConfAttributeValue&gt;) <a href="#getattrs-47ef46821576" id="getattrs-47ef46821576"></a>

```java
public int getAttrs(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    java.util.List<com.tailf.conf.ConfAttributeValue> attrList
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [ConfAttributeValue](../../conf/ConfAttributeValue.md#confattributevalue-d38e058ca48e), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `java.util.List<com.tailf.conf.ConfAttributeValue> attrList`

### getBackupObject() <a href="#getbackupobject-a6fb23c24524" id="getbackupobject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getCallPoint() <a href="#getcallpoint-f816d0a44b26" id="getcallpoint-f816d0a44b26"></a>

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

### getCase(DpTrans, ConfObject[], ConfObject[]) <a href="#getcase-24568d257ce7" id="getcase-24568d257ce7"></a>

```java
public com.tailf.conf.ConfObject getCase(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfObject[] choice
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfObject[] choice`

### getDataCallbackProxys(String, Object) <a href="#getdatacallbackproxys-d0b69f7a129e" id="getdatacallbackproxys-d0b69f7a129e"></a>

```java
public static com.tailf.dp.annotations.DataCallbackProxy[] getDataCallbackProxys(
    String mountId,
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DataCallbackProxy](DataCallbackProxy.md#datacallbackproxy-1ffb50eb2bf8), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `String mountId`
- `Object obj` - registered Callback POJO

**Returns:** array of DataCallbackProxy

**Throws**

- `DpCallbackException`

### getElem(DpTrans, ConfObject[]) <a href="#getelem-baf9006121df" id="getelem-baf9006121df"></a>

```java
public com.tailf.conf.ConfValue getElem(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfValue](../../conf/ConfValue.md#confvalue-769292781c7d), [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

### getFlags() <a href="#getflags-3c1ca90fd29c" id="getflags-3c1ca90fd29c"></a>

```java
public java.util.EnumSet<com.tailf.dp.proto.DpFlag> getFlags()
```

Types: [DpFlag](../proto/DpFlag.md#dpflag-40a7c12f7903)

### getIteratorKey(DpTrans, ConfObject[], Object) <a href="#getiteratorkey-6df7c38f65f8" id="getiteratorkey-6df7c38f65f8"></a>

```java
public com.tailf.conf.ConfKey getIteratorKey(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfKey](../../conf/ConfKey.md#confkey-e4e1ca98e867), [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `Object obj`

### getIteratorObject(DpTrans, ConfObject[], Object) <a href="#getiteratorobject-425632c26c31" id="getiteratorobject-425632c26c31"></a>

```java
public com.tailf.conf.ConfObject[] getIteratorObject(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `Object obj`

### getIteratorObjectList(DpTrans, ConfObject[], Object, Iterator&lt;? extends Object&gt;) <a href="#getiteratorobjectlist-17a0707464f1" id="getiteratorobjectlist-17a0707464f1"></a>

```java
public java.util.List<com.tailf.conf.ConfObject[]> getIteratorObjectList(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    Object obj,
    java.util.Iterator<? extends Object> iterator
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `Object obj`
- `java.util.Iterator<? extends Object> iterator`

### getObject(DpTrans, ConfObject[]) <a href="#getobject-b2d87f9b9270" id="getobject-b2d87f9b9270"></a>

```java
public com.tailf.conf.ConfObject[] getObject(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

### iterator(DpTrans, ConfObject[]) <a href="#iterator-89c62926f3e8" id="iterator-89c62926f3e8"></a>

```java
public java.util.Iterator<Object> iterator(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

### iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey) <a href="#iterator-5d250fbe6a8b" id="iterator-5d250fbe6a8b"></a>

```java
public com.tailf.dp.DpDataFindNextIterator iterator(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfFindNextType type,
    com.tailf.conf.ConfKey key
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDataFindNextIterator](../DpDataFindNextIterator.md#dpdatafindnextiterator-36f0eadb3071), [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [ConfFindNextType](../../conf/ConfFindNextType.md#conffindnexttype-c34c1027a581), [ConfKey](../../conf/ConfKey.md#confkey-e4e1ca98e867), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfFindNextType type`
- `com.tailf.conf.ConfKey key`

### iterator(DpTrans, ConfObject[], ConfFindNextType, ConfKey, DpListFilter) <a href="#iterator-b1da1a451977" id="iterator-b1da1a451977"></a>

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

Types: [DpDataFindNextIterator](../DpDataFindNextIterator.md#dpdatafindnextiterator-36f0eadb3071), [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [ConfFindNextType](../../conf/ConfFindNextType.md#conffindnexttype-c34c1027a581), [ConfKey](../../conf/ConfKey.md#confkey-e4e1ca98e867), [DpListFilter](../DpListFilter.md#dplistfilter-fe6aac67a14c), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfFindNextType type`
- `com.tailf.conf.ConfKey key`
- `com.tailf.dp.DpListFilter filter`

### iterator(DpTrans, ConfObject[], DpListFilter) <a href="#iterator-02bb74b2989b" id="iterator-02bb74b2989b"></a>

```java
public java.util.Iterator<Object> iterator(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.dp.DpListFilter filter
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpListFilter](../DpListFilter.md#dplistfilter-fe6aac67a14c), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.dp.DpListFilter filter`

### mask() <a href="#mask-24c2fa29c6af" id="mask-24c2fa29c6af"></a>

```java
public int mask()
```

### moveAfter(DpTrans, ConfObject[], ConfKey) <a href="#moveafter-023d2bce078c" id="moveafter-023d2bce078c"></a>

```java
public int moveAfter(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfKey prevkey
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [ConfKey](../../conf/ConfKey.md#confkey-e4e1ca98e867), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfKey prevkey`

### numInstances(DpTrans, ConfObject[]) <a href="#numinstances-71fd723ecab5" id="numinstances-71fd723ecab5"></a>

```java
public int numInstances(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

### remove(DpTrans, ConfObject[]) <a href="#remove-93340909c9a0" id="remove-93340909c9a0"></a>

```java
public int remove(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`

### setAttr(DpTrans, ConfObject[], ConfAttributeValue) <a href="#setattr-656af041deec" id="setattr-656af041deec"></a>

```java
public int setAttr(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfAttributeValue attr
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [ConfAttributeValue](../../conf/ConfAttributeValue.md#confattributevalue-d38e058ca48e), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfAttributeValue attr`

### setCase(DpTrans, ConfObject[], ConfObject[], ConfTag) <a href="#setcase-430d4dbe7c83" id="setcase-430d4dbe7c83"></a>

```java
public int setCase(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfObject[] choice,
    com.tailf.conf.ConfTag caseval
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [ConfTag](../../conf/ConfTag.md#conftag-73757b87bc93), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfObject[] choice`
- `com.tailf.conf.ConfTag caseval`

### setElem(DpTrans, ConfObject[], ConfValue) <a href="#setelem-8a5e46811f6e" id="setelem-8a5e46811f6e"></a>

```java
public int setElem(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue newval
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [ConfValue](../../conf/ConfValue.md#confvalue-769292781c7d), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfValue newval`

### writeAll(DpTrans, ConfObject[]) <a href="#writeall-a4604e96718c" id="writeall-a4604e96718c"></a>

```java
public int writeAll(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
