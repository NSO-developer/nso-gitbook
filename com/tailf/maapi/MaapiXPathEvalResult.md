<a id="s-MaapiXPathEvalResult"></a>
# MaapiXPathEvalResult

```java
public interface com.tailf.maapi.MaapiXPathEvalResult
```

This interface is used with `xpathEval`
 method in `Maapi`. It allows a way
 to iterate through a set of resulting nodes from evaluating xpath expression.

**See also:** [`Maapi#xpathEval`](Maapi.md#s-xpathEval)

## Members

**Methods**:

- [result(ConfObject[], ConfValue, Object)](#s-result)

## Methods

<a id="s-result"></a>
### result(ConfObject[], ConfValue, Object)

```java
public abstract com.tailf.maapi.XPathNodeIterateResultFlag result(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue value,
    Object state
)
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag), [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfValue](../conf/ConfValue.md#s-ConfValue)

For each node in the resulting node set evaluated by the xpath
 this method will be called.


 For each node in the resulting node set, this method
 is called with keypath (as `ConfObject[]`) to
 the resulting  node as the first argument, and, if the node is a
 leaf and has a value (as `ConfValue`), the value of that node
 as the second argument otherwise it will return the string "undefined".


 After each invocation this method (done
 by [xpathEval](Maapi.md#s-Maapi) )
 this method should return either
 [ITER_CONTINUE](XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag) to
 tell the xpath evaluator to continue with the
 next resulting node or stop [ITER_STOP](XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag)
 to stop the iteration.

**Parameters**

- `com.tailf.conf.ConfObject[] kp` - Keypath
- `com.tailf.conf.ConfValue value` - Value (if leaf) or string "undefined" if the node
           is not a leaf
- `Object state` - User suplied opaque
