<a id="s-MaapiRetryableOp"></a>
# MaapiRetryableOp

```java
public interface com.tailf.maapi.MaapiRetryableOp
```

Maapi retryable operation that will be called repeatadly until no
 transaction conflict occurred (or max number of tries was reached).

## Members

**Methods**:

- [execute(Maapi, int)](#s-execute)

## Methods

<a id="s-execute"></a>
### execute(Maapi, int)

```java
public abstract boolean execute(
    com.tailf.maapi.Maapi maapi,
    int tid
)
    throws java.io.IOException, com.tailf.conf.ConfException, com.tailf.maapi.MaapiException
```

Types: [Maapi](Maapi.md#s-Maapi), [ConfException](../conf/ConfException.md#s-ConfException), [MaapiException](MaapiException.md#s-MaapiException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int tid`
