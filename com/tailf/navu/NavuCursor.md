# NavuCursor <a href="#cls-NavuCursor" id="cls-NavuCursor"></a>

```java
public class com.tailf.navu.NavuCursor
```

The NavuCursor is a helper class used within NAVU to simplify the
 MAAPI cursor handling.

## Members

**Constructors**:

- [NavuCursor(CdbSession, NavuNode, String, Object[])](#m-NavuCursor-a2344014c2ea)
- [NavuCursor(NavuContext, NavuNode, String, Object[])](#m-NavuCursor-94fad5f61492)

**Fields**:

- [keys](#m-keys)

**Methods**:

- [getKeys()](#m-getKeys-a24b9d377db7)

## Constructors

### NavuCursor(CdbSession, NavuNode, String, Object[]) <a href="#m-NavuCursor-a2344014c2ea" id="m-NavuCursor-a2344014c2ea"></a>

```java
public NavuCursor(
    com.tailf.cdb.CdbSession cdbSession,
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] arguments
)
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession), [NavuNode](NavuNode.md#cls-NavuNode)

Constructor to be used when in CDB mode.

**Parameters**

- `com.tailf.cdb.CdbSession cdbSession` - an active CDB session.
- `com.tailf.navu.NavuNode node` - a NAVU node holding info regarding the schema.
- `String fmt` - a list node string keypath
- `Object[] arguments` - zero or more Object arguments to be substituted in fmt

### NavuCursor(NavuContext, NavuNode, String, Object[]) <a href="#m-NavuCursor-94fad5f61492" id="m-NavuCursor-94fad5f61492"></a>

```java
protected NavuCursor(
    com.tailf.navu.NavuContext context,
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] arguments
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContext](NavuContext.md#cls-NavuContext), [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

Creates and reads all elements of a list node.

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.navu.NavuNode node`
- `String fmt` - - the absolute keypath of the cursor.
- `Object[] arguments` - zero or more Object arguments to be substituted in fmt

**Throws**

- `IOException` - if any socket failure occurs.
- `ConfException` - if any maapi errors occur.


## Fields

### keys <a href="#m-keys" id="m-keys"></a>

```java
protected java.util.List<com.tailf.conf.ConfKey> keys = null;
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey)


## Methods

### getKeys() <a href="#m-getKeys-a24b9d377db7" id="m-getKeys-a24b9d377db7"></a>

```java
public Iterable<com.tailf.conf.ConfKey> getKeys()
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey)

Returns an iterable item

**Returns:** an iterable item container all keys of the cursor.
