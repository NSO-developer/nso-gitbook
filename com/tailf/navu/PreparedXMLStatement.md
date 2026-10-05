# PreparedXMLStatement <a href="#preparedxmlstatement-abf8aaf04b3a" id="preparedxmlstatement-abf8aaf04b3a"></a>

```java
public class com.tailf.navu.PreparedXMLStatement
```

This class represents a parsed XML-string, optionally with parameterized
 values. The string ? denotes a value that is unknown at the
 time when the XML-string is parsed. The ?-strings
 can be replaced by actual values at a later time.


 The `put()` method is used to replace a ? parameter
 with its actual `ConfValue`. The parameter index is zero-based.


 When all ? parameters have been replaced,
 `setValues()` can be issued which will insert or replace
 (if values already exist) the configuration tree specified by the
 XML-string at the location where `prepareXMLCall` was
 called.


 If a parameter is not replaced by a value before a `setValues()`
 occurs, the value is treated as a [`ConfDefault`](../conf/ConfDefault.md#confdefault-2e2c2aa1733d).


 No validation of data types occurs when `put()` is called, but
 `setValues()` will fail if a parameter is set to a type other
 than the one mandated by the YANG-model.





```
 module mtest {
   namespace "http://tail-f.com/test/mtest/1.0";
   prefix mtest;

   import ietf-inet-types {
     prefix inet;
   }

   container mtest {
     container servers {
       list server {
         key name;
         max-elements 64;
         leaf name {
           type string;
         }
         leaf ip {
           type inet:host;
           mandatory true;
         }
         leaf port {
           type inet:port-number;
           default 80;
         }
         list interface {
           key name;
           max-elements 8;
           leaf name {
             type string;
           }
           leaf mtu {
             type int64;
             default 1500;
           }
         }
       }
     }
   }
 }
```





```

 PreparedXMLStatement xmlst =
     serversNavuNode.prepareXMLCall("<server>"
                                    + "<name>?</name>"
                                    + "<ip>?</ip>"
                                    + "<port>?</port>"
                                    + "</server>");

 xmlst.put(0, "www1");
 xmlst.put(1, new ConfIPv4("192.168.10.12"));
 xmlst.put(2, new ConfUInt16(80));
 xmlst.setValues();
```

## Members

**Constructors**:

- [PreparedXMLStatement(ConfXMLParam[], Map<Integer,Object[]>, NavuNode)](#preparedxmlstatement-c488490cc518)

**Methods**:

- [put(int, ConfObject)](#put-472f1342b5b7)
- [put(int, String)](#put-f549d0ea766e)
- [reset()](#reset-6927918ac70a)
- [setValues()](#setvalues-da0bc3c468bf)
- [setValues(NavuContext)](#setvalues-24042b0e5576)
- [setValues(NavuNode)](#setvalues-5afe5d05dd50)
- [sharedSetValues()](#sharedsetvalues-d34ed76578b4)
- [sharedSetValues(NavuContext)](#sharedsetvalues-ccc5cc08315b)
- [sharedSetValues(NavuNode)](#sharedsetvalues-28aec52d6350)

## Constructors

### PreparedXMLStatement(ConfXMLParam[], Map&lt;Integer,Object[]&gt;, NavuNode) <a href="#preparedxmlstatement-c488490cc518" id="preparedxmlstatement-c488490cc518"></a>

```java
public PreparedXMLStatement(
    com.tailf.conf.ConfXMLParam[] params,
    java.util.Map<Integer,Object[]> paramInfoMap,
    com.tailf.navu.NavuNode node
)
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuNode](NavuNode.md#navunode-73944820c8db)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `java.util.Map<Integer,Object[]> paramInfoMap`
- `com.tailf.navu.NavuNode node`


## Methods

### put(int, ConfObject) <a href="#put-472f1342b5b7" id="put-472f1342b5b7"></a>

```java
public void put(int index, com.tailf.conf.ConfObject val)
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

Populate the parameterized value at position `index`
 with the value `val`. The first parameter has index 0.

**Parameters**

- `int index` - zero-based index of the parameter
- `com.tailf.conf.ConfObject val` - the value to give to the parameter

### put(int, String) <a href="#put-f549d0ea766e" id="put-f549d0ea766e"></a>

```java
public void put(int index, String strval)
```

Populate the parameterized value at position `index` with
 the value `strval`. The first parameter has index 0. The
 input string is converted to the appropriate data type as specified
 by the current schema.

**Parameters**

- `int index` - zero-based index of the parameter
- `String strval` - string representation of the value to give to the parameter

### reset() <a href="#reset-6927918ac70a" id="reset-6927918ac70a"></a>

```java
public void reset()
```

### setValues() <a href="#setvalues-da0bc3c468bf" id="setvalues-da0bc3c468bf"></a>

```java
public void setValues() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

When all of the parameterized values have been filled in,
 this method is intended to be invoked for a
 final set operation with the given values.

### setValues(NavuContext) <a href="#setvalues-24042b0e5576" id="setvalues-24042b0e5576"></a>

```java
public void setValues(com.tailf.navu.NavuContext context) throws com.tailf.navu.NavuException
```

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

When all of the parameterized values have been filled in,
 this method is intended to be invoked for a
 final set operation with the given values.

**Parameters**

- `com.tailf.navu.NavuContext context` - NavuContext object that the setValues() operation should
                use

### setValues(NavuNode) <a href="#setvalues-5afe5d05dd50" id="setvalues-5afe5d05dd50"></a>

```java
public void setValues(com.tailf.navu.NavuNode node) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Similar to `setValues(NavuContext)` but uses the context of
 the supplied node.

**Parameters**

- `com.tailf.navu.NavuNode node` - node containing the NavuContext to use

### sharedSetValues() <a href="#sharedsetvalues-d34ed76578b4" id="sharedsetvalues-d34ed76578b4"></a>

```java
public void sharedSetValues() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Variant of [`setValues()`](PreparedXMLStatement.md#setvalues-da0bc3c468bf) with FastMap support.

### sharedSetValues(NavuContext) <a href="#sharedsetvalues-ccc5cc08315b" id="sharedsetvalues-ccc5cc08315b"></a>

```java
public void sharedSetValues(com.tailf.navu.NavuContext context) throws com.tailf.navu.NavuException
```

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Variant of `setValues(NavuContext)` with FastMap support.

**Parameters**

- `com.tailf.navu.NavuContext context` - NavuContext object that the sharedSetValues()
                operation should use

### sharedSetValues(NavuNode) <a href="#sharedsetvalues-28aec52d6350" id="sharedsetvalues-28aec52d6350"></a>

```java
public void sharedSetValues(com.tailf.navu.NavuNode node) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Variant of `setValues(NavuNode)` with FastMap support.

**Parameters**

- `com.tailf.navu.NavuNode node` - node containing the NavuContext to use
