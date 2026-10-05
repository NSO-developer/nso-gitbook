<a id="cls-CdbTxId"></a>
# CdbTxId

```java
public class com.tailf.cdb.CdbTxId
```

Data structure received from [`Cdb#getTxId()`](Cdb.md#m-gettxid-1817ce3409ba) method. Represents the
 last known transaction that CDB did. This can be used to compare states for a
 managed object. If configuration needs to be re-read or not, in case of
 restarts.

## Members

**Constructors**:

- [CdbTxId(String, int, int, int)](#m-cdbtxid-e81c281fc8c1)

**Methods**:

- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getNode()](#m-getnode-52e3d8224b48)
- [getS1()](#m-gets1-50b10751fabb)
- [getS2()](#m-gets2-1443594bd6f7)
- [getS3()](#m-gets3-2ee1ddf494a1)
- [hashCode()](#m-hashcode-ef797a217903)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-cdbtxid-e81c281fc8c1"></a>
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

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object anObject)
```

Compares this CdbTxId to the specified object. The result is true if and
 only if the argument is not null and is a CdbTxId object that represents
 the same internal values (e.g timestamp from a node) as this object.

**Parameters**

- `Object anObject` - Object to compare against

<a id="m-getnode-52e3d8224b48"></a>
### getNode()

```java
public String getNode()
```

Get the host node;

**Returns:** String the host node

<a id="m-gets1-50b10751fabb"></a>
### getS1()

```java
public int getS1()
```

Get the s1 part of timestamp

**Returns:** int s1 part of timestamp

<a id="m-gets2-1443594bd6f7"></a>
### getS2()

```java
public int getS2()
```

Get the s2 part of timestamp

**Returns:** int s2 part of timestamp

<a id="m-gets3-2ee1ddf494a1"></a>
### getS3()

```java
public int getS3()
```

Get the s3 part of timestamp

**Returns:** int s3 part of timestamp

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Return a string representation of this object.
