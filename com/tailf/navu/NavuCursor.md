<a id="s-NavuCursor"></a>
# NavuCursor

```java
public class com.tailf.navu.NavuCursor
```

The NavuCursor is a helper class used within NAVU to simplify the
 MAAPI cursor handling.

## Members

**Constructors**:

- [NavuCursor(CdbSession, NavuNode, String, Object[])](#s-NavuCursor-1)
- [NavuCursor(NavuContext, NavuNode, String, Object[])](#s-NavuCursor-2)

**Fields**:

- [keys](#s-keys)

**Methods**:

- [getKeys()](#s-getKeys)

## Constructors

<a id="s-NavuCursor-1"></a>
### NavuCursor(CdbSession, NavuNode, String, Object[])

```java
public NavuCursor(
    com.tailf.cdb.CdbSession cdbSession,
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] arguments
)
```

Types: [CdbSession](../cdb/CdbSession.md#s-CdbSession), [NavuNode](NavuNode.md#s-NavuNode)

Constructor to be used when in CDB mode.

**Parameters**

- `com.tailf.cdb.CdbSession cdbSession` - an active CDB session.
- `com.tailf.navu.NavuNode node` - a NAVU node holding info regarding the schema.
- `String fmt` - a list node string keypath
- `Object[] arguments` - zero or more Object arguments to be substituted in fmt

<a id="s-NavuCursor-2"></a>
### NavuCursor(NavuContext, NavuNode, String, Object[])

```java
protected NavuCursor(
    com.tailf.navu.NavuContext context,
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] arguments
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContext](NavuContext.md#s-NavuContext), [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

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

<a id="s-keys"></a>
### keys

```java
protected java.util.List<com.tailf.conf.ConfKey> keys = null;
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey)


## Methods

<a id="s-getKeys"></a>
### getKeys()

```java
public Iterable<com.tailf.conf.ConfKey> getKeys()
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey)

Returns an iterable item

**Returns:** an iterable item container all keys of the cursor.
