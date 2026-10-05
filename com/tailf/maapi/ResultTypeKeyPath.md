# ResultTypeKeyPath <a href="#resulttypekeypath-6681ecc7f47b" id="resulttypekeypath-6681ecc7f47b"></a>

```java
public interface com.tailf.maapi.ResultTypeKeyPath
    extends com.tailf.maapi.ResultType
```

Types: [ResultType](ResultType.md#resulttype-1a8a08651698)

XPath Result in keypath format.

 This format is specified trough `ReslutTypeKeyPath.class`
 as a parameter
 to `Maapi#queryStart(int,String,String,int,int,List,Class)`


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

- [keyPath\(\)](#keypath-df48f9bfdabb)

## Methods

### keyPath() <a href="#keypath-df48f9bfdabb" id="keypath-df48f9bfdabb"></a>

```java
public abstract com.tailf.conf.ConfObject[] keyPath()
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

Retrieves the result keypath from a query

**Returns:** keypath as `ConfObject[]` from the result
