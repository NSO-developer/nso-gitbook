<a id="s-DryRunEntry"></a>
# DryRunEntry

```java
public static class com.tailf.maapi.DryRunResult.DryRunEntry
```

## Members

**Constructors**:

- [DryRunEntry(String, Type, String)](#s-DryRunEntry-1)

**Methods**:

- [getData()](#s-getData)
- [getName()](#s-getName)
- [getType()](#s-getType)
- [getTypeAsString()](#s-getTypeAsString)

**Nested Types**:

- [Type](DryRunEntry/Type.md#s-Type)

## Constructors

<a id="s-DryRunEntry-1"></a>
### DryRunEntry(String, Type, String)

**Package-private**

```java
DryRunEntry(String name, com.tailf.maapi.DryRunResult.DryRunEntry.Type type, String data)
```

Types: [Type](DryRunEntry/Type.md#s-Type)

**Parameters**

- `String name`
- `com.tailf.maapi.DryRunResult.DryRunEntry.Type type`
- `String data`


## Methods

<a id="s-getData"></a>
### getData()

```java
public String getData()
```

Return the data of the dry-run result.

<a id="s-getName"></a>
### getName()

```java
public String getName()
```

Return the name of the device/node.

<a id="s-getType"></a>
### getType()

```java
public com.tailf.maapi.DryRunResult.DryRunEntry.Type getType()
```

Types: [Type](DryRunEntry/Type.md#s-Type)

Return whether the result is for a device/node.

 The type could be any of the following:

 `Type#DEVICE` means that the data is for the device.

 `Type#LOCAL_NODE` means that the data is for the
 local-node.

 `Type#LSA_NODE` means that the data is for the
 lsa-node.

<a id="s-getTypeAsString"></a>
### getTypeAsString()

```java
public String getTypeAsString()
```

Return the type as a string.


## Nested Types

- [Type](DryRunEntry/Type.md)
