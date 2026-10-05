# MaapiRetryableOp <a href="#cls-MaapiRetryableOp" id="cls-MaapiRetryableOp"></a>

```java
public interface com.tailf.maapi.MaapiRetryableOp
```

Maapi retryable operation that will be called repeatadly until no
 transaction conflict occurred (or max number of tries was reached).

## Members

**Methods**:

- [execute(Maapi, int)](#m-execute-3f0f8a96b258)

## Methods

### execute(Maapi, int) <a href="#m-execute-3f0f8a96b258" id="m-execute-3f0f8a96b258"></a>

```java
public abstract boolean execute(
    com.tailf.maapi.Maapi maapi,
    int tid
)
    throws java.io.IOException, com.tailf.conf.ConfException, com.tailf.maapi.MaapiException
```

Types: [Maapi](Maapi.md#cls-Maapi), [ConfException](../conf/ConfException.md#cls-ConfException), [MaapiException](MaapiException.md#cls-MaapiException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int tid`
