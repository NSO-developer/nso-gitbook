<a id="s-MountIdCb"></a>
# MountIdCb

```java
public class com.tailf.maapi.MountIdCb
    implements com.tailf.conf.MountIdInterface
```

Types: [MountIdInterface](../conf/MountIdInterface.md#s-MountIdInterface)

## Members

**Constructors**:

- [MountIdCb(Maapi, int)](#s-MountIdCb-1)

**Methods**:

- [acceptTagPath()](#s-acceptTagPath)
- [getMountId(ConfPath)](#s-getMountId)

## Constructors

<a id="s-MountIdCb-1"></a>
### MountIdCb(Maapi, int)

```java
public MountIdCb(com.tailf.maapi.Maapi maapi, int tid)
```

Types: [Maapi](Maapi.md#s-Maapi)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int tid`


## Methods

<a id="s-acceptTagPath"></a>
### acceptTagPath()

```java
public boolean acceptTagPath()
```

<a id="s-getMountId"></a>
### getMountId(ConfPath)

```java
public java.util.List<String> getMountId(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfPath path`
