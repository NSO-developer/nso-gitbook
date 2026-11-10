# NavuCursor <a href="#navucursor-11e7b4ede514" id="navucursor-11e7b4ede514"></a>

```java
public class com.tailf.navu.NavuCursor
```

The NavuCursor is a helper class used within NAVU to simplify the
 MAAPI cursor handling.

## Members

**Constructors**:

- [NavuCursor\(CdbSession, NavuNode, String, Object\.\.\.\)](#navucursor-37a8d707ea7c)
- [NavuCursor\(NavuContext, NavuNode, String, Object\.\.\.\)](#navucursor-9ebaccdc65ab)

**Fields**:

- [keys](#keys-b408c92f97e4)

**Methods**:

- [getKeys\(\)](#getkeys-a24b9d377db7)

## Constructors

### NavuCursor(CdbSession, NavuNode, String, Object...) <a href="#navucursor-37a8d707ea7c" id="navucursor-37a8d707ea7c"></a>

```java
public NavuCursor(
    com.tailf.cdb.CdbSession cdbSession,
    com.tailf.navu.NavuNode node,
    String fmt,
    Object... arguments
)
```

Types: [CdbSession](../cdb/CdbSession.md#cdbsession-9ffa54666283), [NavuNode](NavuNode.md#navunode-73944820c8db)

Constructor to be used when in CDB mode.

**Parameters**

- `com.tailf.cdb.CdbSession cdbSession` - an active CDB session.
- `com.tailf.navu.NavuNode node` - a NAVU node holding info regarding the schema.
- `String fmt` - a list node string keypath
- `Object... arguments` - zero or more Object arguments to be substituted in fmt

### NavuCursor(NavuContext, NavuNode, String, Object...) <a href="#navucursor-9ebaccdc65ab" id="navucursor-9ebaccdc65ab"></a>

```java
protected NavuCursor(
    com.tailf.navu.NavuContext context,
    com.tailf.navu.NavuNode node,
    String fmt,
    Object... arguments
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Creates and reads all elements of a list node.

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.navu.NavuNode node`
- `String fmt` - \- the absolute keypath of the cursor.
- `Object... arguments` - zero or more Object arguments to be substituted in fmt

**Throws**

- `java.io.IOException` - if any socket failure occurs.
- `com.tailf.conf.ConfException` - if any maapi errors occur.


## Fields

### keys <a href="#keys-b408c92f97e4" id="keys-b408c92f97e4"></a>

```java
protected java.util.List<com.tailf.conf.ConfKey> keys;
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867)


## Methods

### getKeys() <a href="#getkeys-a24b9d377db7" id="getkeys-a24b9d377db7"></a>

```java
public Iterable<com.tailf.conf.ConfKey> getKeys()
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867)

Returns an iterable item

**Returns:** an iterable item container all keys of the cursor.
