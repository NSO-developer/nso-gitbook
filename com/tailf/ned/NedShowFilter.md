<a id="s-NedShowFilter"></a>
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

- [NedShowFilter(ConfTag, List<NedShowFilter>, Map<String,String>)](#s-NedShowFilter-1)
- [NedShowFilter(ConfTag, Map<String,String>)](#s-NedShowFilter-2)
- [NedShowFilter(ConfTag, String, Map<String,String>)](#s-NedShowFilter-3)

**Methods**:

- [attributesToString(StringBuilder)](#s-attributesToString)
- [childrenToString(StringBuilder)](#s-childrenToString)
- [fromFNode(ConfETuple)](#s-fromFNode)
- [fromFNodes(ConfEList)](#s-fromFNodes)
- [getAttributes()](#s-getAttributes)
- [getChildren()](#s-getChildren)
- [getData()](#s-getData)
- [getTag()](#s-getTag)
- [getType()](#s-getType)
- [toString()](#s-toString)
- [toString(StringBuilder)](#s-toString-1)

**Nested Types**:

- [Type](NedShowFilter/Type.md#s-Type)

## Constructors

<a id="s-NedShowFilter-1"></a>
### NedShowFilter(ConfTag, List<NedShowFilter>, Map<String,String>)

```java
public NedShowFilter(
    com.tailf.conf.ConfTag tag,
    java.util.List<com.tailf.ned.NedShowFilter> children,
    java.util.Map<String,String> attributes
)
    throws com.tailf.ned.NedException
```

Types: [ConfTag](../conf/ConfTag.md#s-ConfTag), [NedShowFilter](NedShowFilter.md#s-NedShowFilter), [NedException](NedException.md#s-NedException)

**Parameters**

- `com.tailf.conf.ConfTag tag`
- `java.util.List<com.tailf.ned.NedShowFilter> children`
- `java.util.Map<String,String> attributes`

<a id="s-NedShowFilter-2"></a>
### NedShowFilter(ConfTag, Map<String,String>)

```java
public NedShowFilter(
    com.tailf.conf.ConfTag tag,
    java.util.Map<String,String> attributes
)
    throws com.tailf.ned.NedException
```

Types: [ConfTag](../conf/ConfTag.md#s-ConfTag), [NedException](NedException.md#s-NedException)

**Parameters**

- `com.tailf.conf.ConfTag tag`
- `java.util.Map<String,String> attributes`

<a id="s-NedShowFilter-3"></a>
### NedShowFilter(ConfTag, String, Map<String,String>)

```java
public NedShowFilter(
    com.tailf.conf.ConfTag tag,
    String data,
    java.util.Map<String,String> attributes
)
    throws com.tailf.ned.NedException
```

Types: [ConfTag](../conf/ConfTag.md#s-ConfTag), [NedException](NedException.md#s-NedException)

**Parameters**

- `com.tailf.conf.ConfTag tag`
- `String data`
- `java.util.Map<String,String> attributes`


## Methods

<a id="s-attributesToString"></a>
### attributesToString(StringBuilder)

```java
protected StringBuilder attributesToString(StringBuilder builder)
```

**Parameters**

- `StringBuilder builder`

<a id="s-childrenToString"></a>
### childrenToString(StringBuilder)

```java
protected StringBuilder childrenToString(StringBuilder builder)
```

**Parameters**

- `StringBuilder builder`

<a id="s-fromFNode"></a>
### fromFNode(ConfETuple)

```java
public static com.tailf.ned.NedShowFilter fromFNode(
    com.tailf.proto.ConfETuple fnode
)
    throws com.tailf.ned.NedException
```

Types: [NedShowFilter](NedShowFilter.md#s-NedShowFilter), [ConfETuple](../proto/ConfETuple.md#s-ConfETuple), [NedException](NedException.md#s-NedException)

**Parameters**

- `com.tailf.proto.ConfETuple fnode`

<a id="s-fromFNodes"></a>
### fromFNodes(ConfEList)

```java
public static java.util.List<com.tailf.ned.NedShowFilter> fromFNodes(
    com.tailf.proto.ConfEList fnodes
)
    throws com.tailf.ned.NedException
```

Types: [NedShowFilter](NedShowFilter.md#s-NedShowFilter), [ConfEList](../proto/ConfEList.md#s-ConfEList), [NedException](NedException.md#s-NedException)

**Parameters**

- `com.tailf.proto.ConfEList fnodes`

<a id="s-getAttributes"></a>
### getAttributes()

```java
public java.util.Map<String,String> getAttributes()
```

<a id="s-getChildren"></a>
### getChildren()

```java
public java.util.List<com.tailf.ned.NedShowFilter> getChildren()
```

Types: [NedShowFilter](NedShowFilter.md#s-NedShowFilter)

<a id="s-getData"></a>
### getData()

```java
public String getData()
```

<a id="s-getTag"></a>
### getTag()

```java
public com.tailf.conf.ConfTag getTag()
```

Types: [ConfTag](../conf/ConfTag.md#s-ConfTag)

<a id="s-getType"></a>
### getType()

```java
public com.tailf.ned.NedShowFilter.Type getType()
```

Types: [Type](NedShowFilter/Type.md#s-Type)

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-toString-1"></a>
### toString(StringBuilder)

```java
protected StringBuilder toString(StringBuilder builder)
```

**Parameters**

- `StringBuilder builder`


## Nested Types

- [Type](NedShowFilter/Type.md)
