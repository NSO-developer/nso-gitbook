# CdbTxId <a href="#cdbtxid-d5b5c859de80" id="cdbtxid-d5b5c859de80"></a>

```java
public class com.tailf.cdb.CdbTxId
```

Data structure received from [`Cdb#getTxId()`](Cdb.md#gettxid-1817ce3409ba) method. Represents the
 last known transaction that CDB did. This can be used to compare states for a
 managed object. If configuration needs to be re-read or not, in case of
 restarts.

## Members

**Constructors**:

- [CdbTxId(String, int, int, int)](#cdbtxid-e81c281fc8c1)

**Methods**:

- [equals(Object)](#equals-fcd6492e0d6c)
- [getNode()](#getnode-52e3d8224b48)
- [getS1()](#gets1-50b10751fabb)
- [getS2()](#gets2-1443594bd6f7)
- [getS3()](#gets3-2ee1ddf494a1)
- [hashCode()](#hashcode-ef797a217903)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### CdbTxId(String, int, int, int) <a href="#cdbtxid-e81c281fc8c1" id="cdbtxid-e81c281fc8c1"></a>

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

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object anObject)
```

Compares this CdbTxId to the specified object. The result is true if and
 only if the argument is not null and is a CdbTxId object that represents
 the same internal values (e.g timestamp from a node) as this object.

**Parameters**

- `Object anObject` - Object to compare against

### getNode() <a href="#getnode-52e3d8224b48" id="getnode-52e3d8224b48"></a>

```java
public String getNode()
```

Get the host node;

**Returns:** String the host node

### getS1() <a href="#gets1-50b10751fabb" id="gets1-50b10751fabb"></a>

```java
public int getS1()
```

Get the s1 part of timestamp

**Returns:** int s1 part of timestamp

### getS2() <a href="#gets2-1443594bd6f7" id="gets2-1443594bd6f7"></a>

```java
public int getS2()
```

Get the s2 part of timestamp

**Returns:** int s2 part of timestamp

### getS3() <a href="#gets3-2ee1ddf494a1" id="gets3-2ee1ddf494a1"></a>

```java
public int getS3()
```

Get the s3 part of timestamp

**Returns:** int s3 part of timestamp

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Return a string representation of this object.
