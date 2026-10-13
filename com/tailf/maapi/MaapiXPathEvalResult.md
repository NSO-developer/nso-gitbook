# MaapiXPathEvalResult <a href="#maapixpathevalresult-e5a539712098" id="maapixpathevalresult-e5a539712098"></a>

```java
public interface com.tailf.maapi.MaapiXPathEvalResult
```

This interface is used with `xpathEval`
 method in `Maapi`. It allows a way
 to iterate through a set of resulting nodes from evaluating xpath expression.

**See also:** [`Maapi#xpathEval`](Maapi.md#xpatheval-8e8640817c0b)

## Members

**Methods**:

- [result\(ConfObject\[\], ConfValue, Object\)](#result-94a00942459a)

## Methods

### result(ConfObject[], ConfValue, Object) <a href="#result-94a00942459a" id="result-94a00942459a"></a>

```java
public abstract com.tailf.maapi.XPathNodeIterateResultFlag result(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue value,
    Object state
)
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#xpathnodeiterateresultflag-a264e20c01cd), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

For each node in the resulting node set evaluated by the xpath
 this method will be called.


 For each node in the resulting node set, this method
 is called with keypath (as `ConfObject[]`) to
 the resulting  node as the first argument, and, if the node is a
 leaf and has a value (as `ConfValue`), the value of that node
 as the second argument otherwise it will return the string "undefined".


 After each invocation this method (done
 by [xpathEval](Maapi.md#xpatheval-8e8640817c0b) )
 this method should return either
 [ITER\_CONTINUE](XPathNodeIterateResultFlag.md#xpathnodeiterateresultflag-a264e20c01cd) to
 tell the xpath evaluator to continue with the
 next resulting node or stop [ITER\_STOP](XPathNodeIterateResultFlag.md#xpathnodeiterateresultflag-a264e20c01cd)
 to stop the iteration.

**Parameters**

- `com.tailf.conf.ConfObject[] kp` - Keypath
- `com.tailf.conf.ConfValue value` - Value (if leaf) or string "undefined" if the node
           is not a leaf
- `Object state` - User suplied opaque
