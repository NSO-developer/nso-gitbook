# ResultTypeTag <a href="#resulttypetag-91d1aeee8818" id="resulttypetag-91d1aeee8818"></a>

```java
public interface com.tailf.maapi.ResultTypeTag
    extends com.tailf.maapi.ResultType
```

Types: [ResultType](ResultType.md#resulttype-1a8a08651698)

XPath Result in ConfXMLParam format. This
 is specified trough `ReslutType.class` as a parameter
 to [`Maapi#queryStart(int,String,String,int,int,List,Class)`](Maapi.md#querystart-87abe9e2ad2a)

Example:

```
 QueryResult<ResultTypeTag> qR4 =
     maapi.queryStart(th,"/mtest/servers/server[ip='1.2.3.4']",
                      "/",3,1,
                      Arrays.asList("name",
                                    "ip",
                                    "port"),
                      ResultTypeTag.class);
 for(QueryResult.Entry entry : qR4){
     List<ResultTypeTag> rsValue = entry.value();
     for(ResultTypeTag typ: rsValue){
         ConfXMLParam v0 = typ.tag();
         System.out.println("tag :" + v0);
     }
 }
```

## Members

**Methods**:

- [tag\(\)](#tag-7b2271ab156c)

## Methods

### tag() <a href="#tag-7b2271ab156c" id="tag-7b2271ab156c"></a>

```java
com.tailf.conf.ConfXMLParam tag()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

Retrieves the result tag from a query

**Returns:** ConfXMLParam tag from the result
