<a id="s-MaapiCursor"></a>
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


 Cursors are created via [`Maapi`](Maapi.md#s-Maapi)
 and used with [`Maapi`](Maapi.md#s-Maapi) for iteration.


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

**See also:** [`Maapi#newCursor(int, String, Object...)`](Maapi.md#s-newCursor-1), [`Maapi#newCursorWithFilter(int, String, String, Object...)`](Maapi.md#s-newCursorWithFilter-1), [`Maapi#getNext(MaapiCursor)`](Maapi.md#s-getNext)

## Members

**Constructors**:

- [MaapiCursor(Maapi, int, int, String, ConfPath)](#s-MaapiCursor-1)

**Methods**:

- [close()](#s-close)
- [destroy()](#s-destroy)
- [getFilter()](#s-getFilter)
- [getId()](#s-getId)
- [getPath()](#s-getPath)
- [getPrev()](#s-getPrev)
- [getSecondaryIndex()](#s-getSecondaryIndex)
- [getTid()](#s-getTid)
- [setPrev(ConfEObject)](#s-setPrev)
- [setSecondaryIndex(String)](#s-setSecondaryIndex)
- [toString()](#s-toString)

## Constructors

<a id="s-MaapiCursor-1"></a>
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

Types: [Maapi](Maapi.md#s-Maapi), [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int th`
- `int id`
- `String filter`
- `com.tailf.conf.ConfPath path`


## Methods

<a id="s-close"></a>
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

<a id="s-destroy"></a>
### destroy()

```java
public void destroy()
```

Destroys the cursor and releases server-side resources.

**Deprecated:** Use `#close()` instead.

<a id="s-getFilter"></a>
### getFilter()

```java
public String getFilter()
```

Returns the XPath filter expression used to constrain cursor iteration.

**Returns:** the XPath filter string, or null if no filter is applied

<a id="s-getId"></a>
### getId()

```java
public int getId()
```

Returns the unique cursor identifier assigned by the server.

**Returns:** the cursor identifier

<a id="s-getPath"></a>
### getPath()

```java
public com.tailf.conf.ConfPath getPath()
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath)

Returns the configuration path associated with this cursor.

**Returns:** the ConfPath representing the cursor's location in the
  configuration tree

<a id="s-getPrev"></a>
### getPrev()

```java
public com.tailf.proto.ConfEObject getPrev()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

Returns the previous element retrieved during cursor iteration.

**Returns:** the previous ConfEObject, or "first" if no iteration has occurred

<a id="s-getSecondaryIndex"></a>
### getSecondaryIndex()

```java
public String getSecondaryIndex()
```

Returns the name of the currently configured secondary index.

**Returns:** the secondary index name, or null if none is configured

<a id="s-getTid"></a>
### getTid()

```java
public int getTid()
```

Returns the transaction identifier associated with this cursor.

**Returns:** the transaction handle used for this cursor

<a id="s-setPrev"></a>
### setPrev(ConfEObject)

```java
public void setPrev(com.tailf.proto.ConfEObject prev)
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

Sets the previous element for cursor iteration tracking.

**Parameters**

- `com.tailf.proto.ConfEObject prev` - the ConfEObject to set as the previous element

<a id="s-setSecondaryIndex"></a>
### setSecondaryIndex(String)

```java
public void setSecondaryIndex(String idx)
```

Configures a secondary index for optimized cursor iteration.
 Secondary indexes can improve performance when iterating over large
 datasets.

**Parameters**

- `String idx` - the name of the secondary index to use for getNext() calls

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Returns a string representation of this cursor for debugging purposes.

**Returns:** a formatted string containing cursor details including
  transaction ID, cursor ID, path, and previous element
