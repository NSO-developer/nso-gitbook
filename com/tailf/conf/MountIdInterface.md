# MountIdInterface <a href="#mountidinterface-113d1b54dae0" id="mountidinterface-113d1b54dae0"></a>

```java
public interface com.tailf.conf.MountIdInterface
```

## Members

**Methods**:

- [acceptTagPath()](#accepttagpath-3efa26ad697b)
- [getMountId(ConfPath)](#getmountid-83243c09b7c3)

## Methods

### acceptTagPath() <a href="#accepttagpath-3efa26ad697b" id="accepttagpath-3efa26ad697b"></a>

```java
public abstract boolean acceptTagPath()
```

### getMountId(ConfPath) <a href="#getmountid-83243c09b7c3" id="getmountid-83243c09b7c3"></a>

```java
public abstract java.util.List<String> getMountId(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#confpath-327831c6fc7d), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfPath path`
