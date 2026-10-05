# NedShowFilter <a href="#nedshowfilter-b3caa9383bc4" id="nedshowfilter-b3caa9383bc4"></a>

```java
public class com.tailf.ned.NedShowFilter
```

Filter used when requesting data from a NED using the
 showStatsFilter method.

 Corresponds to the subtree filter in a NETCONF get or get-config
 request and should be handled according to RFC6241.

## Members

**Constructors**:

- [NedShowFilter(ConfTag, List<NedShowFilter>, Map<String,String>)](#nedshowfilter-e24067760c77)
- [NedShowFilter(ConfTag, Map<String,String>)](#nedshowfilter-5a69a2a4897b)
- [NedShowFilter(ConfTag, String, Map<String,String>)](#nedshowfilter-2ca13ef3b25d)

**Methods**:

- [attributesToString(StringBuilder)](#attributestostring-68fbb6883385)
- [childrenToString(StringBuilder)](#childrentostring-afdb9b7e7d76)
- [fromFNode(ConfETuple)](#fromfnode-7e0a9ee74a68)
- [fromFNodes(ConfEList)](#fromfnodes-f0ad64958391)
- [getAttributes()](#getattributes-34824a17bc02)
- [getChildren()](#getchildren-fe2038dff10d)
- [getData()](#getdata-8ef0e36ab01b)
- [getTag()](#gettag-315f45956d6f)
- [getType()](#gettype-5a52f6f0d4c1)
- [toString()](#tostring-e9d48c5503ef)
- [toString(StringBuilder)](#tostring-55c3f8510392)

**Nested Types**:

- [Type](NedShowFilter/Type.md#type-e2b37c882bf2)

## Constructors

### NedShowFilter(ConfTag, List&lt;NedShowFilter&gt;, Map&lt;String,String&gt;) <a href="#nedshowfilter-e24067760c77" id="nedshowfilter-e24067760c77"></a>

```java
public NedShowFilter(
    com.tailf.conf.ConfTag tag,
    java.util.List<com.tailf.ned.NedShowFilter> children,
    java.util.Map<String,String> attributes
)
    throws com.tailf.ned.NedException
```

Types: [ConfTag](../conf/ConfTag.md#conftag-73757b87bc93), [NedShowFilter](NedShowFilter.md#nedshowfilter-b3caa9383bc4), [NedException](NedException.md#nedexception-9d3a19f3640e)

**Parameters**

- `com.tailf.conf.ConfTag tag`
- `java.util.List<com.tailf.ned.NedShowFilter> children`
- `java.util.Map<String,String> attributes`

### NedShowFilter(ConfTag, Map&lt;String,String&gt;) <a href="#nedshowfilter-5a69a2a4897b" id="nedshowfilter-5a69a2a4897b"></a>

```java
public NedShowFilter(
    com.tailf.conf.ConfTag tag,
    java.util.Map<String,String> attributes
)
    throws com.tailf.ned.NedException
```

Types: [ConfTag](../conf/ConfTag.md#conftag-73757b87bc93), [NedException](NedException.md#nedexception-9d3a19f3640e)

**Parameters**

- `com.tailf.conf.ConfTag tag`
- `java.util.Map<String,String> attributes`

### NedShowFilter(ConfTag, String, Map&lt;String,String&gt;) <a href="#nedshowfilter-2ca13ef3b25d" id="nedshowfilter-2ca13ef3b25d"></a>

```java
public NedShowFilter(
    com.tailf.conf.ConfTag tag,
    String data,
    java.util.Map<String,String> attributes
)
    throws com.tailf.ned.NedException
```

Types: [ConfTag](../conf/ConfTag.md#conftag-73757b87bc93), [NedException](NedException.md#nedexception-9d3a19f3640e)

**Parameters**

- `com.tailf.conf.ConfTag tag`
- `String data`
- `java.util.Map<String,String> attributes`


## Methods

### attributesToString(StringBuilder) <a href="#attributestostring-68fbb6883385" id="attributestostring-68fbb6883385"></a>

```java
protected StringBuilder attributesToString(StringBuilder builder)
```

**Parameters**

- `StringBuilder builder`

### childrenToString(StringBuilder) <a href="#childrentostring-afdb9b7e7d76" id="childrentostring-afdb9b7e7d76"></a>

```java
protected StringBuilder childrenToString(StringBuilder builder)
```

**Parameters**

- `StringBuilder builder`

### fromFNode(ConfETuple) <a href="#fromfnode-7e0a9ee74a68" id="fromfnode-7e0a9ee74a68"></a>

```java
public static com.tailf.ned.NedShowFilter fromFNode(
    com.tailf.proto.ConfETuple fnode
)
    throws com.tailf.ned.NedException
```

Types: [NedShowFilter](NedShowFilter.md#nedshowfilter-b3caa9383bc4), [ConfETuple](../proto/ConfETuple.md#confetuple-b1f9702a82a1), [NedException](NedException.md#nedexception-9d3a19f3640e)

**Parameters**

- `com.tailf.proto.ConfETuple fnode`

### fromFNodes(ConfEList) <a href="#fromfnodes-f0ad64958391" id="fromfnodes-f0ad64958391"></a>

```java
public static java.util.List<com.tailf.ned.NedShowFilter> fromFNodes(
    com.tailf.proto.ConfEList fnodes
)
    throws com.tailf.ned.NedException
```

Types: [NedShowFilter](NedShowFilter.md#nedshowfilter-b3caa9383bc4), [ConfEList](../proto/ConfEList.md#confelist-78fa4ba3b3a8), [NedException](NedException.md#nedexception-9d3a19f3640e)

**Parameters**

- `com.tailf.proto.ConfEList fnodes`

### getAttributes() <a href="#getattributes-34824a17bc02" id="getattributes-34824a17bc02"></a>

```java
public java.util.Map<String,String> getAttributes()
```

### getChildren() <a href="#getchildren-fe2038dff10d" id="getchildren-fe2038dff10d"></a>

```java
public java.util.List<com.tailf.ned.NedShowFilter> getChildren()
```

Types: [NedShowFilter](NedShowFilter.md#nedshowfilter-b3caa9383bc4)

### getData() <a href="#getdata-8ef0e36ab01b" id="getdata-8ef0e36ab01b"></a>

```java
public String getData()
```

### getTag() <a href="#gettag-315f45956d6f" id="gettag-315f45956d6f"></a>

```java
public com.tailf.conf.ConfTag getTag()
```

Types: [ConfTag](../conf/ConfTag.md#conftag-73757b87bc93)

### getType() <a href="#gettype-5a52f6f0d4c1" id="gettype-5a52f6f0d4c1"></a>

```java
public com.tailf.ned.NedShowFilter.Type getType()
```

Types: [Type](NedShowFilter/Type.md#type-e2b37c882bf2)

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### toString(StringBuilder) <a href="#tostring-55c3f8510392" id="tostring-55c3f8510392"></a>

```java
protected StringBuilder toString(StringBuilder builder)
```

**Parameters**

- `StringBuilder builder`


## Nested Types

- [Type](NedShowFilter/Type.md#type-e2b37c882bf2)
