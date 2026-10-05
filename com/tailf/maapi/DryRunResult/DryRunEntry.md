<a id="cls-DryRunEntry"></a>
# DryRunEntry

```java
public static class com.tailf.maapi.DryRunResult.DryRunEntry
```

## Members

**Constructors**:

- [DryRunEntry(String, Type, String)](#m-dryrunentry-719d1bc10043)

**Methods**:

- [getData()](#m-getdata-8ef0e36ab01b)
- [getName()](#m-getname-2634b18b4a25)
- [getType()](#m-gettype-5a52f6f0d4c1)
- [getTypeAsString()](#m-gettypeasstring-ea437139f174)

**Nested Types**:

- [Type](DryRunEntry/Type.md#cls-Type)

## Constructors

<a id="m-dryrunentry-719d1bc10043"></a>
### DryRunEntry(String, Type, String)

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

<a id="m-getdata-8ef0e36ab01b"></a>
### getData()

```java
public String getData()
```

Return the data of the dry-run result.

<a id="m-getname-2634b18b4a25"></a>
### getName()

```java
public String getName()
```

Return the name of the device/node.

<a id="m-gettype-5a52f6f0d4c1"></a>
### getType()

```java
public com.tailf.maapi.DryRunResult.DryRunEntry.Type getType()
```

Types: [Type](DryRunEntry/Type.md#cls-Type)

Return whether the result is for a device/node.

 The type could be any of the following:

 `Type#DEVICE` means that the data is for the device.

 `Type#LOCAL_NODE` means that the data is for the
 local-node.

 `Type#LSA_NODE` means that the data is for the
 lsa-node.

<a id="m-gettypeasstring-ea437139f174"></a>
### getTypeAsString()

```java
public String getTypeAsString()
```

Return the type as a string.


## Nested Types

- [Type](DryRunEntry/Type.md#cls-Type)
