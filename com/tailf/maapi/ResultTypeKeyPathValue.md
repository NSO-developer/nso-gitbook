# ResultTypeKeyPathValue <a href="#resulttypekeypathvalue-73a624076b63" id="resulttypekeypathvalue-73a624076b63"></a>

```java
public interface com.tailf.maapi.ResultTypeKeyPathValue
    extends com.tailf.maapi.ResultTypeKeyPath
```

Types: [ResultTypeKeyPath](ResultTypeKeyPath.md#resulttypekeypath-6681ecc7f47b)

XPath Result in keypath and value format. This format
 is specified trough `ReslutTypeKeyPathValue.class` as a parameter
 to `Maapi#queryStart(int,String,String,int,int,List,Class)`


 Example:


```
  QueryResult<ResultTypeKeyPathValue> qR4 =
      maapi.queryStart(th,&quot;/mtest/servers/server[ip='1.2.3.4']&quot;,
                       &quot;/&quot;, 3,1,
                       Arrays.asList(&quot;name&quot;,
                                     &quot;ip&quot;,
                                     &quot;port&quot;),
                       ResultTypeKeyPathValue.class);
  for(QueryResult.Entry entry : qR4){
      List<ResultTypeKeyPathValue> rsValue = entry.value();
      for(ResultTypeKeyPathValue typ: rsValue){
          ConfObject[] v0 = typ.keyPath();
          System.out.println(&quot;path = &quot; + Arrays.toString(v0));
          ConfValue v1 = typ.confValue();
          System.out.println(&quot;value = &quot; + v1);
      }
  }
```

## Members

**Methods**:

- [confValue()](#confvalue-baca27cbbecf)
- [keyPath()](ResultTypeKeyPath.md#keypath-df48f9bfdabb) from ResultTypeKeyPath

## Methods

### confValue() <a href="#confvalue-baca27cbbecf" id="confvalue-baca27cbbecf"></a>

```java
public abstract com.tailf.conf.ConfValue confValue()
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

Retrieves the result value from a query

**Returns:** value as ConfValue from the result
