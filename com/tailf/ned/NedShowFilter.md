# NedShowFilter <a href="#cls-NedShowFilter" id="cls-NedShowFilter"></a>

```java
public class com.tailf.ned.NedShowFilter
```

Filter used when requesting data from a NED using the
 showStatsFilter method.

 Corresponds to the subtree filter in a NETCONF get or get-config
 request and should be handled according to RFC6241.

## Members

**Constructors**:

- [NedShowFilter(ConfTag, List<NedShowFilter>, Map<String,String>)](#m-NedShowFilter-e24067760c77)
- [NedShowFilter(ConfTag, Map<String,String>)](#m-NedShowFilter-5a69a2a4897b)
- [NedShowFilter(ConfTag, String, Map<String,String>)](#m-NedShowFilter-2ca13ef3b25d)

**Methods**:

- [attributesToString(StringBuilder)](#m-attributesToString-68fbb6883385)
- [childrenToString(StringBuilder)](#m-childrenToString-afdb9b7e7d76)
- [fromFNode(ConfETuple)](#m-fromFNode-7e0a9ee74a68)
- [fromFNodes(ConfEList)](#m-fromFNodes-f0ad64958391)
- [getAttributes()](#m-getAttributes-34824a17bc02)
- [getChildren()](#m-getChildren-fe2038dff10d)
- [getData()](#m-getData-8ef0e36ab01b)
- [getTag()](#m-getTag-315f45956d6f)
- [getType()](#m-getType-5a52f6f0d4c1)
- [toString()](#m-toString-e9d48c5503ef)
- [toString(StringBuilder)](#m-toString-55c3f8510392)

**Nested Types**:

- [Type](NedShowFilter/Type.md#cls-Type)

## Constructors

### NedShowFilter(ConfTag, List<NedShowFilter>, Map<String,String>) <a href="#m-NedShowFilter-e24067760c77" id="m-NedShowFilter-e24067760c77"></a>

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

### NedShowFilter(ConfTag, Map<String,String>) <a href="#m-NedShowFilter-5a69a2a4897b" id="m-NedShowFilter-5a69a2a4897b"></a>

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

### NedShowFilter(ConfTag, String, Map<String,String>) <a href="#m-NedShowFilter-2ca13ef3b25d" id="m-NedShowFilter-2ca13ef3b25d"></a>

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

### attributesToString(StringBuilder) <a href="#m-attributesToString-68fbb6883385" id="m-attributesToString-68fbb6883385"></a>

```java
protected StringBuilder attributesToString(StringBuilder builder)
```

**Parameters**

- `StringBuilder builder`

### childrenToString(StringBuilder) <a href="#m-childrenToString-afdb9b7e7d76" id="m-childrenToString-afdb9b7e7d76"></a>

```java
protected StringBuilder childrenToString(StringBuilder builder)
```

**Parameters**

- `StringBuilder builder`

### fromFNode(ConfETuple) <a href="#m-fromFNode-7e0a9ee74a68" id="m-fromFNode-7e0a9ee74a68"></a>

```java
public static com.tailf.ned.NedShowFilter fromFNode(
    com.tailf.proto.ConfETuple fnode
)
    throws com.tailf.ned.NedException
```

Types: [NedShowFilter](NedShowFilter.md#cls-NedShowFilter), [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple), [NedException](NedException.md#cls-NedException)

**Parameters**

- `com.tailf.proto.ConfETuple fnode`

### fromFNodes(ConfEList) <a href="#m-fromFNodes-f0ad64958391" id="m-fromFNodes-f0ad64958391"></a>

```java
public static java.util.List<com.tailf.ned.NedShowFilter> fromFNodes(
    com.tailf.proto.ConfEList fnodes
)
    throws com.tailf.ned.NedException
```

Types: [NedShowFilter](NedShowFilter.md#cls-NedShowFilter), [ConfEList](../proto/ConfEList.md#cls-ConfEList), [NedException](NedException.md#cls-NedException)

**Parameters**

- `com.tailf.proto.ConfEList fnodes`

### getAttributes() <a href="#m-getAttributes-34824a17bc02" id="m-getAttributes-34824a17bc02"></a>

```java
public java.util.Map<String,String> getAttributes()
```

### getChildren() <a href="#m-getChildren-fe2038dff10d" id="m-getChildren-fe2038dff10d"></a>

```java
public java.util.List<com.tailf.ned.NedShowFilter> getChildren()
```

Types: [NedShowFilter](NedShowFilter.md#cls-NedShowFilter)

### getData() <a href="#m-getData-8ef0e36ab01b" id="m-getData-8ef0e36ab01b"></a>

```java
public String getData()
```

### getTag() <a href="#m-getTag-315f45956d6f" id="m-getTag-315f45956d6f"></a>

```java
public com.tailf.conf.ConfTag getTag()
```

Types: [ConfTag](../conf/ConfTag.md#cls-ConfTag)

### getType() <a href="#m-getType-5a52f6f0d4c1" id="m-getType-5a52f6f0d4c1"></a>

```java
public com.tailf.ned.NedShowFilter.Type getType()
```

Types: [Type](NedShowFilter/Type.md#cls-Type)

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### toString(StringBuilder) <a href="#m-toString-55c3f8510392" id="m-toString-55c3f8510392"></a>

```java
protected StringBuilder toString(StringBuilder builder)
```

**Parameters**

- `StringBuilder builder`


## Nested Types

- [Type](NedShowFilter/Type.md#cls-Type)
