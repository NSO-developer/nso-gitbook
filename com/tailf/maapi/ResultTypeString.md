# ResultTypeString <a href="#resulttypestring-6e023ffcb7ea" id="resulttypestring-6e023ffcb7ea"></a>

```java
public interface com.tailf.maapi.ResultTypeString
    extends com.tailf.maapi.ResultType
```

Types: [ResultType](ResultType.md#resulttype-1a8a08651698)

XPath Result in string format. This format
 is specified trough `ReslutTypeString.class` as a parameter
 to `Maapi#queryStart(int,String,String,int,int,List,Class)`


 Example:


```
  QueryResult<ResultTypeString> qR4 =
      maapi.queryStart(th,&quot;/mtest/servers/server[ip='1.2.3.4']&quot;,
                       &quot;/&quot;,3,1,
                       Arrays.asList(&quot;name&quot;,
                                     &quot;ip&quot;,
                                     &quot;port&quot;),
                       ResultTypeString.class);
  for(QueryResult.Entry entry : qR4){
      List<ResultTypeString> rsValue = entry.value();
      for(ResultTypeString typ: rsValue){
          String str = typ.stringValue();
          System.out.println(&quot;value is : &quot; + str);
      }
  }
```




 This result type is just the resulting string of evaluatioin the
 select XPath expression evaluates to. This means that care must be
 taken so that the combination of select expression and return
 types actually yield sensible results
 (for example 1 + 2 is a valid select XPath expression, and would
 result in the string 3 when setting the result type to
 `ResultTypeString`
 but it is not a node, and thus have no hkeypath, tag, or value).

## Members

**Methods**:

- [stringValue()](#stringvalue-a6efca13ec08)

## Methods

### stringValue() <a href="#stringvalue-a6efca13ec08" id="stringvalue-a6efca13ec08"></a>

```java
public abstract String stringValue()
```
