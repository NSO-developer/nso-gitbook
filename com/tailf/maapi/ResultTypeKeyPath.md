<a id="s-ResultTypeKeyPath"></a>
# ResultTypeKeyPath

```java
public interface com.tailf.maapi.ResultTypeKeyPath
    extends com.tailf.maapi.ResultType
```

Types: [ResultType](ResultType.md#s-ResultType)

XPath Result in keypath format.

 This format is specified trough `ReslutTypeKeyPath.class`
 as a parameter
 to [`Maapi`](Maapi.md#s-Maapi)


 Example:


```
  QueryResult<ResultTypeKeyPath> qR4 =
      maapi.queryStart(th,&quot;/mtest/servers/server[ip='1.2.3.4']&quot;,
                       &quot;/&quot;,3,1,
                       Arrays.asList(&quot;name&quot;,
                                     &quot;ip&quot;,
                                     &quot;port&quot;),
                       ResultTypeKeyPath.class);
  for(QueryResult.Entry entry : qR4){
      List<ResultTypeKeyPath> rsValue = entry.value();
      for(ResultTypeKeyPath typ: rsValue){
          ConfObject[] v0 = typ.keyPath();
          System.out.println(&quot;path = &quot; + Arrays.toString(v0));
      }
  }
```

## Members

**Methods**:

- [keyPath()](#s-keyPath)

## Methods

<a id="s-keyPath"></a>
### keyPath()

```java
public abstract com.tailf.conf.ConfObject[] keyPath()
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject)

Retrieves the result keypath from a query

**Returns:** keypath as `ConfObject[]` from the result
