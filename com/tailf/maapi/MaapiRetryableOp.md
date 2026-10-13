# MaapiRetryableOp <a href="#maapiretryableop-cfc27c59f49e" id="maapiretryableop-cfc27c59f49e"></a>

```java
public interface com.tailf.maapi.MaapiRetryableOp
```

Maapi retryable operation that will be called repeatadly until no
 transaction conflict occurred (or max number of tries was reached).

## Members

**Methods**:

- [execute\(Maapi, int\)](#execute-3f0f8a96b258)

## Methods

### execute(Maapi, int) <a href="#execute-3f0f8a96b258" id="execute-3f0f8a96b258"></a>

```java
public abstract boolean execute(
    com.tailf.maapi.Maapi maapi,
    int tid
)
    throws java.io.IOException, com.tailf.conf.ConfException, com.tailf.maapi.MaapiException
```

Types: [Maapi](Maapi.md#maapi-67bcbe89c42e), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int tid`
