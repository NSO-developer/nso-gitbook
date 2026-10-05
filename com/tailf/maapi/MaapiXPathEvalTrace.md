<a id="s-MaapiXPathEvalTrace"></a>
# MaapiXPathEvalTrace

```java
public interface com.tailf.maapi.MaapiXPathEvalTrace
```

This interface is used with the `xpathEval` method
 in Maapi. It allows a way trace output from the xpath evaluator.

**See also:** [`Maapi#xpathEval`](Maapi.md#s-xpathEval)

## Members

**Methods**:

- [trace(String)](#s-trace)

## Methods

<a id="s-trace"></a>
### trace(String)

```java
public abstract com.tailf.maapi.XPathNodeIterateResultFlag trace(String str)
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag)

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
