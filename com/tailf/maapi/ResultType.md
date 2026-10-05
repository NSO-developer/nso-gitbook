<a id="s-ResultType"></a>
# ResultType

```java
public interface com.tailf.maapi.ResultType
```

Specifies the result type from XPath query.

  The query is issued trough
 [`Maapi`](Maapi.md#s-Maapi) where
 the result type (the last parameter) is supplied as the class
 token corresponding to the specific sub type of this interface.



 The results can be returned as subtype of this interface:


- strings, `String` [`ResultTypeString`](ResultTypeString.md#s-ResultTypeString)
- hkeypaths, array of `ConfObject[]`
 [`ResultTypeKeyPath`](ResultTypeKeyPath.md#s-ResultTypeKeyPath)
- hkeypaths and values, array of `ConfObject[]` and
 `ConfValue`
 [`ResultTypeKeyPathValue`](ResultTypeKeyPathValue.md#s-ResultTypeKeyPathValue)
- tag and values, `ConfXMLParam` [`ResultTypeTag`](ResultTypeTag.md#s-ResultTypeTag)




 The string is just the resulting string of
 evaluating the select XPath expression.


 For hkeypaths, tags, and values it is the path/tag/value of the
 node that the  select XPath expression evaluates to.
 This means that care must be  taken so that the combination of
 select expression and return types actually yield sensible results.


 For example "1 + 2" is a valid select XPath expression, and would result
 in the string "3" when setting the result type to
 `ResultTypeString`  but it is not a node, and thus have
 no hkeypath, tag, or value.
