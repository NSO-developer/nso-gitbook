# DryRunEntry <a href="#dryrunentry-2d08ec41ae5c" id="dryrunentry-2d08ec41ae5c"></a>

```java
public static class com.tailf.maapi.DryRunResult.DryRunEntry
```

## Members

**Methods**:

- [getData\(\)](#getdata-8ef0e36ab01b)
- [getName\(\)](#getname-2634b18b4a25)
- [getType\(\)](#gettype-5a52f6f0d4c1)
- [getTypeAsString\(\)](#gettypeasstring-ea437139f174)

**Nested Types**:

- [Type](DryRunEntry/Type.md#type-e2b37c882bf2)

## Methods

### getData() <a href="#getdata-8ef0e36ab01b" id="getdata-8ef0e36ab01b"></a>

```java
public String getData()
```

Return the data of the dry-run result.

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public String getName()
```

Return the name of the device/node.

### getType() <a href="#gettype-5a52f6f0d4c1" id="gettype-5a52f6f0d4c1"></a>

```java
public com.tailf.maapi.DryRunResult.DryRunEntry.Type getType()
```

Types: [Type](DryRunEntry/Type.md#type-e2b37c882bf2)

Return whether the result is for a device/node.

The type could be any of the following:

[`Type#DEVICE`](DryRunEntry/Type.md#device-530223f65d97) means that the data is for the device.

[`Type#LOCAL_NODE`](DryRunEntry/Type.md#local_node-0394590310ba) means that the data is for the
 local-node.

[`Type#LSA_NODE`](DryRunEntry/Type.md#lsa_node-ce1c2350351b) means that the data is for the
 lsa-node.

### getTypeAsString() <a href="#gettypeasstring-ea437139f174" id="gettypeasstring-ea437139f174"></a>

```java
public String getTypeAsString()
```

Return the type as a string.
