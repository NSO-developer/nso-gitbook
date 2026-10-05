<a id="cls-NedShowFilter"></a>
# NedShowFilter

```java
public class com.tailf.ned.NedShowFilter
```

Filter used when requesting data from a NED using the
 showStatsFilter method.

 Corresponds to the subtree filter in a NETCONF get or get-config
 request and should be handled according to RFC6241.

## Members

**Constructors**:

- [NedShowFilter(ConfTag, List<NedShowFilter>, Map<String,String>)](#m-nedshowfilter-e24067760c77)
- [NedShowFilter(ConfTag, Map<String,String>)](#m-nedshowfilter-5a69a2a4897b)
- [NedShowFilter(ConfTag, String, Map<String,String>)](#m-nedshowfilter-2ca13ef3b25d)

**Methods**:

- [attributesToString(StringBuilder)](#m-attributestostring-68fbb6883385)
- [childrenToString(StringBuilder)](#m-childrentostring-afdb9b7e7d76)
- [fromFNode(ConfETuple)](#m-fromfnode-7e0a9ee74a68)
- [fromFNodes(ConfEList)](#m-fromfnodes-f0ad64958391)
- [getAttributes()](#m-getattributes-34824a17bc02)
- [getChildren()](#m-getchildren-fe2038dff10d)
- [getData()](#m-getdata-8ef0e36ab01b)
- [getTag()](#m-gettag-315f45956d6f)
- [getType()](#m-gettype-5a52f6f0d4c1)
- [toString()](#m-tostring-e9d48c5503ef)
- [toString(StringBuilder)](#m-tostring-55c3f8510392)

**Nested Types**:

- [Type](NedShowFilter/Type.md#cls-Type)

## Constructors

<a id="m-nedshowfilter-e24067760c77"></a>
### NedShowFilter(ConfTag, List<NedShowFilter>, Map<String,String>)

```java
public NedShowFilter(
    com.tailf.conf.ConfTag tag,
    java.util.List<com.tailf.ned.NedShowFilter> children,
    java.util.Map<String,String> attributes
)
    throws com.tailf.ned.NedException
```

Types: [ConfTag](../conf/ConfTag.md#cls-ConfTag), [NedShowFilter](NedShowFilter.md#cls-NedShowFilter), [NedException](NedException.md#cls-NedException)

**Parameters**

- `com.tailf.conf.ConfTag tag`
- `java.util.List<com.tailf.ned.NedShowFilter> children`
- `java.util.Map<String,String> attributes`

<a id="m-nedshowfilter-5a69a2a4897b"></a>
### NedShowFilter(ConfTag, Map<String,String>)

```java
public NedShowFilter(
    com.tailf.conf.ConfTag tag,
    java.util.Map<String,String> attributes
)
    throws com.tailf.ned.NedException
```

Types: [ConfTag](../conf/ConfTag.md#cls-ConfTag), [NedException](NedException.md#cls-NedException)

**Parameters**

- `com.tailf.conf.ConfTag tag`
- `java.util.Map<String,String> attributes`

<a id="m-nedshowfilter-2ca13ef3b25d"></a>
### NedShowFilter(ConfTag, String, Map<String,String>)

```java
public NedShowFilter(
    com.tailf.conf.ConfTag tag,
    String data,
    java.util.Map<String,String> attributes
)
    throws com.tailf.ned.NedException
```

Types: [ConfTag](../conf/ConfTag.md#cls-ConfTag), [NedException](NedException.md#cls-NedException)

**Parameters**

- `com.tailf.conf.ConfTag tag`
- `String data`
- `java.util.Map<String,String> attributes`


## Methods

<a id="m-attributestostring-68fbb6883385"></a>
### attributesToString(StringBuilder)

```java
protected StringBuilder attributesToString(StringBuilder builder)
```

**Parameters**

- `StringBuilder builder`

<a id="m-childrentostring-afdb9b7e7d76"></a>
### childrenToString(StringBuilder)

```java
protected StringBuilder childrenToString(StringBuilder builder)
```

**Parameters**

- `StringBuilder builder`

<a id="m-fromfnode-7e0a9ee74a68"></a>
### fromFNode(ConfETuple)

```java
public static com.tailf.ned.NedShowFilter fromFNode(
    com.tailf.proto.ConfETuple fnode
)
    throws com.tailf.ned.NedException
```

Types: [NedShowFilter](NedShowFilter.md#cls-NedShowFilter), [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple), [NedException](NedException.md#cls-NedException)

**Parameters**

- `com.tailf.proto.ConfETuple fnode`

<a id="m-fromfnodes-f0ad64958391"></a>
### fromFNodes(ConfEList)

```java
public static java.util.List<com.tailf.ned.NedShowFilter> fromFNodes(
    com.tailf.proto.ConfEList fnodes
)
    throws com.tailf.ned.NedException
```

Types: [NedShowFilter](NedShowFilter.md#cls-NedShowFilter), [ConfEList](../proto/ConfEList.md#cls-ConfEList), [NedException](NedException.md#cls-NedException)

**Parameters**

- `com.tailf.proto.ConfEList fnodes`

<a id="m-getattributes-34824a17bc02"></a>
### getAttributes()

```java
public java.util.Map<String,String> getAttributes()
```

<a id="m-getchildren-fe2038dff10d"></a>
### getChildren()

```java
public java.util.List<com.tailf.ned.NedShowFilter> getChildren()
```

Types: [NedShowFilter](NedShowFilter.md#cls-NedShowFilter)

<a id="m-getdata-8ef0e36ab01b"></a>
### getData()

```java
public String getData()
```

<a id="m-gettag-315f45956d6f"></a>
### getTag()

```java
public com.tailf.conf.ConfTag getTag()
```

Types: [ConfTag](../conf/ConfTag.md#cls-ConfTag)

<a id="m-gettype-5a52f6f0d4c1"></a>
### getType()

```java
public com.tailf.ned.NedShowFilter.Type getType()
```

Types: [Type](NedShowFilter/Type.md#cls-Type)

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

<a id="m-tostring-55c3f8510392"></a>
### toString(StringBuilder)

```java
protected StringBuilder toString(StringBuilder builder)
```

**Parameters**

- `StringBuilder builder`


## Nested Types

- [Type](NedShowFilter/Type.md#cls-Type)
