# MountIdInterface <a href="#cls-MountIdInterface" id="cls-MountIdInterface"></a>

```java
public interface com.tailf.conf.MountIdInterface
```

## Members

**Methods**:

- [acceptTagPath()](#m-acceptTagPath-3efa26ad697b)
- [getMountId(ConfPath)](#m-getMountId-83243c09b7c3)

## Methods

### acceptTagPath() <a href="#m-acceptTagPath-3efa26ad697b" id="m-acceptTagPath-3efa26ad697b"></a>

```java
public abstract boolean acceptTagPath()
```

### getMountId(ConfPath) <a href="#m-getMountId-83243c09b7c3" id="m-getMountId-83243c09b7c3"></a>

```java
public abstract java.util.List<String> getMountId(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfPath path`
