# MountIdCb <a href="#mountidcb-b2c40ac53111" id="mountidcb-b2c40ac53111"></a>

```java
public class com.tailf.maapi.MountIdCb
    implements com.tailf.conf.MountIdInterface
```

Types: [MountIdInterface](../conf/MountIdInterface.md#mountidinterface-113d1b54dae0)

## Members

**Constructors**:

- [MountIdCb\(Maapi, int\)](#mountidcb-b291d44025b0)

**Methods**:

- [acceptTagPath\(\)](#accepttagpath-3efa26ad697b)
- [getMountId\(ConfPath\)](#getmountid-83243c09b7c3)

## Constructors

### MountIdCb(Maapi, int) <a href="#mountidcb-b291d44025b0" id="mountidcb-b291d44025b0"></a>

```java
public MountIdCb(com.tailf.maapi.Maapi maapi, int tid)
```

Types: [Maapi](Maapi.md#maapi-67bcbe89c42e)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int tid`


## Methods

### acceptTagPath() <a href="#accepttagpath-3efa26ad697b" id="accepttagpath-3efa26ad697b"></a>

```java
public boolean acceptTagPath()
```

### getMountId(ConfPath) <a href="#getmountid-83243c09b7c3" id="getmountid-83243c09b7c3"></a>

```java
public java.util.List<String> getMountId(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfPath path`
