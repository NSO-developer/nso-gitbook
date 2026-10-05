# MountIdCb <a href="#cls-MountIdCb" id="cls-MountIdCb"></a>

```java
public class com.tailf.maapi.MountIdCb
    implements com.tailf.conf.MountIdInterface
```

Types: [MountIdInterface](../conf/MountIdInterface.md#cls-MountIdInterface)

## Members

**Constructors**:

- [MountIdCb(Maapi, int)](#m-MountIdCb-b291d44025b0)

**Methods**:

- [acceptTagPath()](#m-acceptTagPath-3efa26ad697b)
- [getMountId(ConfPath)](#m-getMountId-83243c09b7c3)

## Constructors

### MountIdCb(Maapi, int) <a href="#m-MountIdCb-b291d44025b0" id="m-MountIdCb-b291d44025b0"></a>

```java
public MountIdCb(com.tailf.maapi.Maapi maapi, int tid)
```

Types: [Maapi](Maapi.md#cls-Maapi)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int tid`


## Methods

### acceptTagPath() <a href="#m-acceptTagPath-3efa26ad697b" id="m-acceptTagPath-3efa26ad697b"></a>

```java
public boolean acceptTagPath()
```

### getMountId(ConfPath) <a href="#m-getMountId-83243c09b7c3" id="m-getMountId-83243c09b7c3"></a>

```java
public java.util.List<String> getMountId(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfPath path`
