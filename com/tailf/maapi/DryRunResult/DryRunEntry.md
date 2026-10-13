# DryRunEntry <a href="#dryrunentry-2d08ec41ae5c" id="dryrunentry-2d08ec41ae5c"></a>

```java
public static class com.tailf.maapi.DryRunResult.DryRunEntry
```

## Members

**Constructors**:

- [DryRunEntry\(String, Type, String\)](#dryrunentry-719d1bc10043)

**Methods**:

- [getData\(\)](#getdata-8ef0e36ab01b)
- [getName\(\)](#getname-2634b18b4a25)
- [getType\(\)](#gettype-5a52f6f0d4c1)
- [getTypeAsString\(\)](#gettypeasstring-ea437139f174)

**Nested Types**:

- [Type](DryRunEntry/Type.md#type-e2b37c882bf2)

## Constructors

### DryRunEntry(String, Type, String) <a href="#dryrunentry-719d1bc10043" id="dryrunentry-719d1bc10043"></a>

**Package-private**

```java
DryRunEntry(String name, com.tailf.maapi.DryRunResult.DryRunEntry.Type type, String data)
```

Types: [Type](DryRunEntry/Type.md#type-e2b37c882bf2)

**Parameters**

- `String name`
- `com.tailf.maapi.DryRunResult.DryRunEntry.Type type`
- `String data`


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

 `DryRunEntry#DEVICE` means that the data is for the device.

 `DryRunEntry#LOCAL_NODE` means that the data is for the
 local-node.

 `DryRunEntry#LSA_NODE` means that the data is for the
 lsa-node.

### getTypeAsString() <a href="#gettypeasstring-ea437139f174" id="gettypeasstring-ea437139f174"></a>

```java
public String getTypeAsString()
```

Return the type as a string.


## Nested Types

- [Type](DryRunEntry/Type.md#type-e2b37c882bf2)
