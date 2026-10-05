# MaapiXPathEvalTrace <a href="#cls-MaapiXPathEvalTrace" id="cls-MaapiXPathEvalTrace"></a>

```java
public interface com.tailf.maapi.MaapiXPathEvalTrace
```

This interface is used with the `xpathEval` method
 in Maapi. It allows a way trace output from the xpath evaluator.

**See also:** [`Maapi#xpathEval`](Maapi.md#m-xpathEval-8e8640817c0b)

## Members

**Methods**:

- [trace(String)](#m-trace-108e6d2bbf2f)

## Methods

### trace(String) <a href="#m-trace-108e6d2bbf2f" id="m-trace-108e6d2bbf2f"></a>

```java
public abstract com.tailf.maapi.XPathNodeIterateResultFlag trace(String str)
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#cls-XPathNodeIterateResultFlag)

The interface declare a method that takes a single string as argument.
 If supplied to `maapiXPathEval` method it will be
 invoked when the xpath implementation has trace output for the current
 expression.  If no trace is wanted null can be called to
 `maapiXPathEval` given.


 If the `trace` method returns `ITER_STOP`
 no more trace output is done. If `ITER_CONTINUE` returns
 it tells the xpath evaluator to continues with the next
 tracing output.

**Parameters**

- `String str`
