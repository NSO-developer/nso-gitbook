# DryRunEntry <a href="#cls-DryRunEntry" id="cls-DryRunEntry"></a>

```java
public static class com.tailf.maapi.DryRunResult.DryRunEntry
```

## Members

**Constructors**:

- [DryRunEntry(String, Type, String)](#m-DryRunEntry-719d1bc10043)

**Methods**:

- [getData()](#m-getData-8ef0e36ab01b)
- [getName()](#m-getName-2634b18b4a25)
- [getType()](#m-getType-5a52f6f0d4c1)
- [getTypeAsString()](#m-getTypeAsString-ea437139f174)

**Nested Types**:

- [Type](DryRunEntry/Type.md#cls-Type)

## Constructors

### DryRunEntry(String, Type, String) <a href="#m-DryRunEntry-719d1bc10043" id="m-DryRunEntry-719d1bc10043"></a>

**Package-private**

```java
DryRunEntry(String name, com.tailf.maapi.DryRunResult.DryRunEntry.Type type, String data)
```

Types: [Type](DryRunEntry/Type.md#cls-Type)

**Parameters**

- `String name`
- `com.tailf.maapi.DryRunResult.DryRunEntry.Type type`
- `String data`


## Methods

### getData() <a href="#m-getData-8ef0e36ab01b" id="m-getData-8ef0e36ab01b"></a>

```java
public String getData()
```

Return the data of the dry-run result.

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public String getName()
```

Return the name of the device/node.

### getType() <a href="#m-getType-5a52f6f0d4c1" id="m-getType-5a52f6f0d4c1"></a>

```java
public com.tailf.maapi.DryRunResult.DryRunEntry.Type getType()
```

Types: [Type](DryRunEntry/Type.md#cls-Type)

Return whether the result is for a device/node.

 The type could be any of the following:

 `DryRunEntry#DEVICE` means that the data is for the device.

 `DryRunEntry#LOCAL_NODE` means that the data is for the
 local-node.

 `DryRunEntry#LSA_NODE` means that the data is for the
 lsa-node.

### getTypeAsString() <a href="#m-getTypeAsString-ea437139f174" id="m-getTypeAsString-ea437139f174"></a>

```java
public String getTypeAsString()
```

Return the type as a string.


## Nested Types

- [Type](DryRunEntry/Type.md#cls-Type)
