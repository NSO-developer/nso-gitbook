<a id="s-ResultTypeTag"></a>
# ResultTypeTag

```java
public interface com.tailf.maapi.ResultTypeTag
    extends com.tailf.maapi.ResultType
```

Types: [ResultType](ResultType.md#s-ResultType)

XPath Result in ConfXMLParam format. This
 is specified trough `ReslutType.class` as a parameter
 to [`Maapi`](Maapi.md#s-Maapi)


 Example:


```
  QueryResult<ResultTypeTag> qR4 =
      maapi.queryStart(th,&quot;/mtest/servers/server[ip='1.2.3.4']&quot;,
                       &quot;/&quot;,3,1,
                       Arrays.asList(&quot;name&quot;,
                                     &quot;ip&quot;,
                                     &quot;port&quot;),
                       ResultTypeTag.class);
  for(QueryResult.Entry entry : qR4){
      List<ResultTypeTag> rsValue = entry.value();
      for(ResultTypeTag typ: rsValue){
          ConfXMLParam v0 = typ.tag();
          System.out.println(&quot;tag :&quot; + v0);
      }
  }
```

## Members

**Methods**:

- [tag()](#s-tag)

## Methods

<a id="s-tag"></a>
### tag()

```java
public abstract com.tailf.conf.ConfXMLParam tag()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam)

Retrieves the result tag from a query

**Returns:** ConfXMLParam tag from the result
