<a id="cls-MountIdInterface"></a>
# MountIdInterface

```java
public interface com.tailf.conf.MountIdInterface
```

## Members

**Methods**:

- [acceptTagPath()](#m-accepttagpath-3efa26ad697b)
- [getMountId(ConfPath)](#m-getmountid-83243c09b7c3)

## Methods

<a id="m-accepttagpath-3efa26ad697b"></a>
### acceptTagPath()

```java
public abstract boolean acceptTagPath()
```

<a id="m-getmountid-83243c09b7c3"></a>
### getMountId(ConfPath)

```java
public abstract java.util.List<String> getMountId(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfPath path`
