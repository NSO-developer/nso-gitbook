<a id="cls-MountIdCb"></a>
# MountIdCb

```java
public class com.tailf.maapi.MountIdCb
    implements com.tailf.conf.MountIdInterface
```

Types: [MountIdInterface](../conf/MountIdInterface.md#cls-MountIdInterface)

## Members

**Constructors**:

- [MountIdCb(Maapi, int)](#m-mountidcb-b291d44025b0)

**Methods**:

- [acceptTagPath()](#m-accepttagpath-3efa26ad697b)
- [getMountId(ConfPath)](#m-getmountid-83243c09b7c3)

## Constructors

<a id="m-mountidcb-b291d44025b0"></a>
### MountIdCb(Maapi, int)

```java
public MountIdCb(com.tailf.maapi.Maapi maapi, int tid)
```

Types: [Maapi](Maapi.md#cls-Maapi)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int tid`


## Methods

<a id="m-accepttagpath-3efa26ad697b"></a>
### acceptTagPath()

```java
public boolean acceptTagPath()
```

<a id="m-getmountid-83243c09b7c3"></a>
### getMountId(ConfPath)

```java
public java.util.List<String> getMountId(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfPath path`
