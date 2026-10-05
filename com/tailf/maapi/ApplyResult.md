# ApplyResult <a href="#cls-ApplyResult" id="cls-ApplyResult"></a>

```java
public class com.tailf.maapi.ApplyResult
```

Represents a successful invocation of the
 [`Maapi#applyTransParams(int, boolean, CommitParams)`](Maapi.md#m-applyTransParams-6c20b7896663) method.

**Related classes**

- [CommitQueueResult](CommitQueueResult.md#cls-CommitQueueResult)
- [DryRunResult](DryRunResult.md#cls-DryRunResult)

## Members

**Constructors**:

- [ApplyResult(ConfResponse)](#m-ApplyResult-7b53e46df937)

## Constructors

### ApplyResult(ConfResponse) <a href="#m-ApplyResult-7b53e46df937" id="m-ApplyResult-7b53e46df937"></a>

```java
public ApplyResult(
    com.tailf.conf.ConfResponse result
)
    throws com.tailf.maapi.MaapiException, com.tailf.conf.ConfException
```

Types: [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse), [MaapiException](MaapiException.md#cls-MaapiException), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfResponse result`
