<a id="s-MountIdInterface"></a>
# MountIdInterface

```java
public interface com.tailf.conf.MountIdInterface
```

## Members

**Methods**:

- [acceptTagPath()](#s-acceptTagPath)
- [getMountId(ConfPath)](#s-getMountId)

## Methods

<a id="s-acceptTagPath"></a>
### acceptTagPath()

```java
public abstract boolean acceptTagPath()
```

<a id="s-getMountId"></a>
### getMountId(ConfPath)

```java
public abstract java.util.List<String> getMountId(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#s-ConfPath), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfPath path`
