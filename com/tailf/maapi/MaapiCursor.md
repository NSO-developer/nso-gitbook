<a id="cls-MaapiCursor"></a>
# MaapiCursor

```java
public class com.tailf.maapi.MaapiCursor
    implements AutoCloseable
```

A cursor for iterating over configuration data elements.

 MaapiCursor provides an efficient mechanism for traversing objects in
 the XML tree. The cursor maintains server-side state and supports filtered
 iteration using XPath expressions.



**Basic Usage**


 Cursors are created via [`Maapi#newCursor(int, String, Object...)`](Maapi.md#m-newcursor-8f0d3924978a)
 and used with [`Maapi#getNext(MaapiCursor)`](Maapi.md#m-getnext-94186d85d070) for iteration.


 For example if we have:




```
 module mtest {
   namespace "http://tail-f.com/test/mtest/1.0";
   prefix mtest;

   import ietf-inet-types {
     prefix inet;
   }
   import tailf-common {
     prefix tailf;
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





 We can have the following code which iterates over all 'server'
 instances.




```
 try (MaapiCursor cursor = maapi.newCursor(th,
         "/mtest:mtest/servers/server")) {
     ConfKey key = maapi.getNext(cursor);
     while (key != null) {
         // Process the key
         key = maapi.getNext(cursor);
     }
 }
```






**Filtered Iteration**


 Cursors support XPath filtering for efficient data selection:




```
 try (MaapiCursor cursor = maapi.newCursorWithFilter(th,
         "starts-with(ip, \"10.\") and port > 8000",
         "/servers/server")) {
     // Only servers matching the filter will be returned
     ConfKey key = maapi.getNext(cursor);
     // ...
 }
```






**Performance Optimization**


 For large datasets, secondary indexes can be configured using
 `#setSecondaryIndex(String)` to improve iteration performance.



**Resource Management**


 Cursors maintain server-side resources that are automatically
 cleaned up when:


- The cursor is explicitly closed via `#close()`
- The transaction completes
- There is no reference to the cursor



 **Important:** For optimal resource utilization,
 especially in long-running transactions or when creating many cursors,
 use try-with-resources or explicitly call `#close()` when done.

**See also:** [`Maapi#newCursor(int, String, Object...)`](Maapi.md#m-newcursor-8f0d3924978a), [`Maapi#newCursorWithFilter(int, String, String, Object...)`](Maapi.md#m-newcursorwithfilter-6c2962969949), [`Maapi#getNext(MaapiCursor)`](Maapi.md#m-getnext-94186d85d070)

## Members

**Constructors**:

- [MaapiCursor(Maapi, int, int, String, ConfPath)](#m-maapicursor-422cbcc0b1cb)

**Methods**:

- [close()](#m-close-8107c6dc012b)
- [destroy()](#m-destroy-c06780cdd1bc)
- [getFilter()](#m-getfilter-2b84817e0707)
- [getId()](#m-getid-199a349c70ef)
- [getPath()](#m-getpath-88fb21895561)
- [getPrev()](#m-getprev-f0535db69903)
- [getSecondaryIndex()](#m-getsecondaryindex-8efa1ee57e9c)
- [getTid()](#m-gettid-df82325d69f8)
- [setPrev(ConfEObject)](#m-setprev-ac7a60919bbf)
- [setSecondaryIndex(String)](#m-setsecondaryindex-23774a07debb)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-maapicursor-422cbcc0b1cb"></a>
### MaapiCursor(Maapi, int, int, String, ConfPath)

**Package-private**

```java
MaapiCursor(
    com.tailf.maapi.Maapi maapi,
    int th,
    int id,
    String filter,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](Maapi.md#cls-Maapi), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int th`
- `int id`
- `String filter`
- `com.tailf.conf.ConfPath path`


## Methods

<a id="m-close-8107c6dc012b"></a>
### close()

```java
public void close()
```

Destroy the cursor on the server side.
 *There is normally no need to call this method. Only call it if
 the use pattern below feels familiar.*
 If iteration is ended before all results have been fetched the
 cursor will still be held on to on the server side since it cannot
 know that we are done using the cursor.
 The cursor will be cleaned up on the server side when the transaction
 is finished or the MaapiCursor is garbage collected.
 But, if the transaction is kept open and we create new cursors over and
 over again or perhaps keep them in a list, preventing them from being
 garbage collected, they will still be present on the server side if not
 iterated to the end, effectively creating a resource leak.
 Calling this function explicitly cleans up resources on the server.

<a id="m-destroy-c06780cdd1bc"></a>
### destroy()

```java
public void destroy()
```

Destroys the cursor and releases server-side resources.

**Deprecated:** Use `#close()` instead.

<a id="m-getfilter-2b84817e0707"></a>
### getFilter()

```java
public String getFilter()
```

Returns the XPath filter expression used to constrain cursor iteration.

**Returns:** the XPath filter string, or null if no filter is applied

<a id="m-getid-199a349c70ef"></a>
### getId()

```java
public int getId()
```

Returns the unique cursor identifier assigned by the server.

**Returns:** the cursor identifier

<a id="m-getpath-88fb21895561"></a>
### getPath()

```java
public com.tailf.conf.ConfPath getPath()
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

Returns the configuration path associated with this cursor.

**Returns:** the ConfPath representing the cursor's location in the
  configuration tree

<a id="m-getprev-f0535db69903"></a>
### getPrev()

```java
public com.tailf.proto.ConfEObject getPrev()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

Returns the previous element retrieved during cursor iteration.

**Returns:** the previous ConfEObject, or "first" if no iteration has occurred

<a id="m-getsecondaryindex-8efa1ee57e9c"></a>
### getSecondaryIndex()

```java
public String getSecondaryIndex()
```

Returns the name of the currently configured secondary index.

**Returns:** the secondary index name, or null if none is configured

<a id="m-gettid-df82325d69f8"></a>
### getTid()

```java
public int getTid()
```

Returns the transaction identifier associated with this cursor.

**Returns:** the transaction handle used for this cursor

<a id="m-setprev-ac7a60919bbf"></a>
### setPrev(ConfEObject)

```java
public void setPrev(com.tailf.proto.ConfEObject prev)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

Sets the previous element for cursor iteration tracking.

**Parameters**

- `com.tailf.proto.ConfEObject prev` - the ConfEObject to set as the previous element

<a id="m-setsecondaryindex-23774a07debb"></a>
### setSecondaryIndex(String)

```java
public void setSecondaryIndex(String idx)
```

Configures a secondary index for optimized cursor iteration.
 Secondary indexes can improve performance when iterating over large
 datasets.

**Parameters**

- `String idx` - the name of the secondary index to use for getNext() calls

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Returns a string representation of this cursor for debugging purposes.

**Returns:** a formatted string containing cursor details including
  transaction ID, cursor ID, path, and previous element
