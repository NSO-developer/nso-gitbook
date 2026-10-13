# Attribute <a href="#attribute-cb42ffd9bcdd" id="attribute-cb42ffd9bcdd"></a>

```java
public class com.tailf.ncs.alarmman.common.Attribute
```

Base class for attributes. Use [`AlarmAttribute`](AlarmAttribute.md#alarmattribute-df3ac1d0638e) or
 [`StatusChangeAttribute`](StatusChangeAttribute.md#statuschangeattribute-53548dbb7d69) instead.

**Related classes**

- [AlarmAttribute](AlarmAttribute.md#alarmattribute-df3ac1d0638e)
- [StatusChangeAttribute](StatusChangeAttribute.md#statuschangeattribute-53548dbb7d69)

## Members

**Constructors**:

- [Attribute\(ConfNamespace, String, ConfValue\)](#attribute-8450316471c9)

**Fields**:

- [node](#node-ff68e6a3ebc6)

**Methods**:

- [getId\(\)](#getid-199a349c70ef)
- [getNameSpace\(\)](#getnamespace-e413af21e168)
- [getValue\(\)](#getvalue-d93864668c40)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### Attribute(ConfNamespace, String, ConfValue) <a href="#attribute-8450316471c9" id="attribute-8450316471c9"></a>

```java
protected Attribute(
    com.tailf.conf.ConfNamespace ns,
    String attributeId,
    com.tailf.conf.ConfValue value
)
```

Types: [ConfNamespace](../../../conf/ConfNamespace.md#confnamespace-51b928e168d1), [ConfValue](../../../conf/ConfValue.md#confvalue-769292781c7d)

**Parameters**

- `com.tailf.conf.ConfNamespace ns`
- `String attributeId` - the hash of the alarm attribute.
- `com.tailf.conf.ConfValue value` - the value of the alarm attribute.

**Throws**

- `ConfException`


## Fields

### node <a href="#node-ff68e6a3ebc6" id="node-ff68e6a3ebc6"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode node = null;
```

Types: [CSNode](../../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)


## Methods

### getId() <a href="#getid-199a349c70ef" id="getid-199a349c70ef"></a>

```java
public String getId()
```

**Returns:** String

### getNameSpace() <a href="#getnamespace-e413af21e168" id="getnamespace-e413af21e168"></a>

```java
public com.tailf.conf.ConfNamespace getNameSpace()
```

Types: [ConfNamespace](../../../conf/ConfNamespace.md#confnamespace-51b928e168d1)

**Returns:** ConfNamespace

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](../../../conf/ConfValue.md#confvalue-769292781c7d)

**Returns:** ConfValue

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
