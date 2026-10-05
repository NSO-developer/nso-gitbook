<a id="s-CdbTxId"></a>
# CdbTxId

```java
public class com.tailf.cdb.CdbTxId
```

Data structure received from [`Cdb`](Cdb.md#s-Cdb) method. Represents the
 last known transaction that CDB did. This can be used to compare states for a
 managed object. If configuration needs to be re-read or not, in case of
 restarts.

## Members

**Constructors**:

- [CdbTxId(String, int, int, int)](#s-CdbTxId-1)

**Methods**:

- [equals(Object)](#s-equals)
- [getNode()](#s-getNode)
- [getS1()](#s-getS1)
- [getS2()](#s-getS2)
- [getS3()](#s-getS3)
- [hashCode()](#s-hashCode)
- [toString()](#s-toString)

## Constructors

<a id="s-CdbTxId-1"></a>
### CdbTxId(String, int, int, int)

**Package-private**

```java
CdbTxId(String node, int s1, int s2, int s3)
```

Constructor

**Parameters**

- `String node`
- `int s1`
- `int s2`
- `int s3`


## Methods

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object anObject)
```

Compares this CdbTxId to the specified object. The result is true if and
 only if the argument is not null and is a CdbTxId object that represents
 the same internal values (e.g timestamp from a node) as this object.

**Parameters**

- `Object anObject` - Object to compare against

<a id="s-getNode"></a>
### getNode()

```java
public String getNode()
```

Get the host node;

**Returns:** String the host node

<a id="s-getS1"></a>
### getS1()

```java
public int getS1()
```

Get the s1 part of timestamp

**Returns:** int s1 part of timestamp

<a id="s-getS2"></a>
### getS2()

```java
public int getS2()
```

Get the s2 part of timestamp

**Returns:** int s2 part of timestamp

<a id="s-getS3"></a>
### getS3()

```java
public int getS3()
```

Get the s3 part of timestamp

**Returns:** int s3 part of timestamp

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Return a string representation of this object.
