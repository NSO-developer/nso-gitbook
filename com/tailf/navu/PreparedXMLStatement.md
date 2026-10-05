# PreparedXMLStatement <a href="#cls-PreparedXMLStatement" id="cls-PreparedXMLStatement"></a>

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
 occurs, the value is treated as a [`ConfDefault`](../conf/ConfDefault.md#cls-ConfDefault).


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

- [PreparedXMLStatement(ConfXMLParam[], Map<Integer,Object[]>, NavuNode)](#m-PreparedXMLStatement-c488490cc518)

**Methods**:

- [put(int, ConfObject)](#m-put-472f1342b5b7)
- [put(int, String)](#m-put-f549d0ea766e)
- [reset()](#m-reset-6927918ac70a)
- [setValues()](#m-setValues-da0bc3c468bf)
- [setValues(NavuContext)](#m-setValues-24042b0e5576)
- [setValues(NavuNode)](#m-setValues-5afe5d05dd50)
- [sharedSetValues()](#m-sharedSetValues-d34ed76578b4)
- [sharedSetValues(NavuContext)](#m-sharedSetValues-ccc5cc08315b)
- [sharedSetValues(NavuNode)](#m-sharedSetValues-28aec52d6350)

## Constructors

### PreparedXMLStatement(ConfXMLParam[], Map<Integer,Object[]>, NavuNode) <a href="#m-PreparedXMLStatement-c488490cc518" id="m-PreparedXMLStatement-c488490cc518"></a>

```java
public PreparedXMLStatement(
    com.tailf.conf.ConfXMLParam[] params,
    java.util.Map<Integer,Object[]> paramInfoMap,
    com.tailf.navu.NavuNode node
)
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `java.util.Map<Integer,Object[]> paramInfoMap`
- `com.tailf.navu.NavuNode node`


## Methods

### put(int, ConfObject) <a href="#m-put-472f1342b5b7" id="m-put-472f1342b5b7"></a>

```java
public void put(int index, com.tailf.conf.ConfObject val)
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

Populate the parameterized value at position `index`
 with the value `val`. The first parameter has index 0.

**Parameters**

- `int index` - zero-based index of the parameter
- `com.tailf.conf.ConfObject val` - the value to give to the parameter

### put(int, String) <a href="#m-put-f549d0ea766e" id="m-put-f549d0ea766e"></a>

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

### reset() <a href="#m-reset-6927918ac70a" id="m-reset-6927918ac70a"></a>

```java
public void reset()
```

### setValues() <a href="#m-setValues-da0bc3c468bf" id="m-setValues-da0bc3c468bf"></a>

```java
public void setValues() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

When all of the parameterized values have been filled in,
 this method is intended to be invoked for a
 final set operation with the given values.

### setValues(NavuContext) <a href="#m-setValues-24042b0e5576" id="m-setValues-24042b0e5576"></a>

```java
public void setValues(com.tailf.navu.NavuContext context) throws com.tailf.navu.NavuException
```

Types: [NavuContext](NavuContext.md#cls-NavuContext), [NavuException](NavuException.md#cls-NavuException)

When all of the parameterized values have been filled in,
 this method is intended to be invoked for a
 final set operation with the given values.

**Parameters**

- `com.tailf.navu.NavuContext context` - NavuContext object that the setValues() operation should
                use

### setValues(NavuNode) <a href="#m-setValues-5afe5d05dd50" id="m-setValues-5afe5d05dd50"></a>

```java
public void setValues(com.tailf.navu.NavuNode node) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

Similar to `setValues(NavuContext)` but uses the context of
 the supplied node.

**Parameters**

- `com.tailf.navu.NavuNode node` - node containing the NavuContext to use

### sharedSetValues() <a href="#m-sharedSetValues-d34ed76578b4" id="m-sharedSetValues-d34ed76578b4"></a>

```java
public void sharedSetValues() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Variant of [`setValues()`](PreparedXMLStatement.md#m-setValues-da0bc3c468bf) with FastMap support.

### sharedSetValues(NavuContext) <a href="#m-sharedSetValues-ccc5cc08315b" id="m-sharedSetValues-ccc5cc08315b"></a>

```java
public void sharedSetValues(com.tailf.navu.NavuContext context) throws com.tailf.navu.NavuException
```

Types: [NavuContext](NavuContext.md#cls-NavuContext), [NavuException](NavuException.md#cls-NavuException)

Variant of `setValues(NavuContext)` with FastMap support.

**Parameters**

- `com.tailf.navu.NavuContext context` - NavuContext object that the sharedSetValues()
                operation should use

### sharedSetValues(NavuNode) <a href="#m-sharedSetValues-28aec52d6350" id="m-sharedSetValues-28aec52d6350"></a>

```java
public void sharedSetValues(com.tailf.navu.NavuNode node) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

Variant of `setValues(NavuNode)` with FastMap support.

**Parameters**

- `com.tailf.navu.NavuNode node` - node containing the NavuContext to use
