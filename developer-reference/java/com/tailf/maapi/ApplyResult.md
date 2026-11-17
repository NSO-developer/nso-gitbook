# ApplyResult <a href="#applyresult-77b049ed4f17" id="applyresult-77b049ed4f17"></a>

```java
public class com.tailf.maapi.ApplyResult
```

Represents a successful invocation of the
 [`Maapi#applyTransParams(int, boolean, CommitParams)`](Maapi.md#applytransparams-6c20b7896663) method.

**Related classes**

- [CommitQueueResult](CommitQueueResult.md#commitqueueresult-0daa10abf91a)
- [DryRunResult](DryRunResult.md#dryrunresult-28828490822f)

## Members

**Constructors**:

- [ApplyResult\(ConfResponse\)](#applyresult-7b53e46df937)

## Constructors

### ApplyResult(ConfResponse) <a href="#applyresult-7b53e46df937" id="applyresult-7b53e46df937"></a>

```java
public ApplyResult(
    com.tailf.conf.ConfResponse result
)
    throws com.tailf.maapi.MaapiException, com.tailf.conf.ConfException
```

Types: [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfResponse result`
