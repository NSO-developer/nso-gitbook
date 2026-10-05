<a id="cls-NavuCdbSessionPoolable"></a>
# NavuCdbSessionPoolable

```java
public interface com.tailf.navu.NavuCdbSessionPoolable
```

This `NavuCdbSessionPoolable` interface should be implemented by
 any class whose instance are intended to change the default behavior
 of how CdbSession object is created and used in NAVU.

 When using NAVU in with Cdb (passing Cdb object to constructor of
 the NavuContext ) :


```
 Cdb cdb = ..;
 NavuContext ctx = new NavuContext(cdb);
```


 The argument `cdb` object to the constructor of
 `NavuContext` called the "root Cdb"  by default is
 not used directly. Which means no sessions are created on the root Cdb.


 Instead it acts as a key to a map too look up other Cdb objects that in
 turn starts sessions towards different datastores.


 The default implementation contains a map where the key is the
 "root Cdb" and the value is in turn another map (inner map).

 The "inner map" where its key is of the type `CdbDBType` contains
 mapping between different datastores and a container that
 contains "local `Cdb` objects and corresponding
 `CdbSession`.



```
   MapCdb,MapCdbDBType,SessionContainer map ..
```





```
    class SessionContainer {
       CdbSession localSession;
       Cdb        localCdb;
       ...
    }
```



 When NAVU needs to retrieve a `CdbSession` it calls the static
 `NavuCdbSessionPool.getCdbSession()` which in turn calls the
 current implementation of this interface `getSession` method.

 The `getSession(Cdb,CdbDBType)` or
 `getSession(Cdb,CdbDBType,EnumSetCdbLockType)`
 method must return a `CdbSession` towards the specified the
 datastore specified  by the second parameter.

  The `removeCdbSessions(Cdb)` must release
 the associated Cdb session for the corresponding Cdb, which is the
 corresponding method of `getSession(Cdb,CdbDBType)`.


 Regardless it is left to the implementation which
 `Cdb` this `CdbSession` is originated from.
 The default implementation starts Cdb session from the "local Cdb".
 And what a "release" really means in case of
 `removeCdbSession(Cdb)`.


 The specify that a implementation should be used
 the parameter `com.tailf.navu.cdb.sessionpool`
 should be set to a binary name ( for example com.foo.NavuCdbSessionPoolImpl)
 and should be passed to the jvm at startup:



```
 java -Dcom.tailf.navu.cdb.sessionpool=com.foo.NavuCdbSessionPoolImpl ...
```



 It should be noted that the bytecode of the implementation must be
 available in the system classpath or a exception will be thrown
 and the default implementation that ships with the library will be used.

## Members

**Methods**:

- [getSession(Cdb, CdbDBType, EnumSet<CdbLockType>)](#m-getsession-61014dfb12a7)
- [poolInUse()](#m-poolinuse-8d190a00726a)
- [removeAllForCdb(Cdb)](#m-removeallforcdb-58157efc1de6)
- [removeAllSessions()](#m-removeallsessions-211f72fa9478)

## Methods

<a id="m-getsession-61014dfb12a7"></a>
### getSession(Cdb, CdbDBType, EnumSet<CdbLockType>)

```java
public abstract com.tailf.cdb.CdbSession getSession(
    com.tailf.cdb.Cdb rootCdb,
    com.tailf.cdb.CdbDBType dbType,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> locks
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession), [Cdb](../cdb/Cdb.md#cls-Cdb), [CdbDBType](../cdb/CdbDBType.md#cls-CdbDBType), [CdbLockType](../cdb/CdbLockType.md#cls-CdbLockType), [ConfException](../conf/ConfException.md#cls-ConfException)

Returns a Cdb session to `dbType` datastore with
 the locks `locks` associated with the given Cdb.

**Parameters**

- `com.tailf.cdb.Cdb rootCdb`
- `com.tailf.cdb.CdbDBType dbType`
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

**Returns:** CdbSession for a specific Cdb and CdbDBType

**Throws**

- `IOException` - on I/O failure
- `ConfException` - on protocol error

<a id="m-poolinuse-8d190a00726a"></a>
### poolInUse()

```java
public abstract boolean poolInUse()
```

Returns true if the implementation pool is in use.
  If it return true a NavuException is thrown indicating that
  a implementation is already in use and contains open resources.

**Returns:** true/false whether the implementation pool is in use

<a id="m-removeallforcdb-58157efc1de6"></a>
### removeAllForCdb(Cdb)

```java
public abstract void removeAllForCdb(
    com.tailf.cdb.Cdb rootCdb
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb), [ConfException](../conf/ConfException.md#cls-ConfException)

Removes or closes all CdbSession associated with the supplied Cdb.

 A remove does not necessary means that it should end the
 Cdb session associated with the rootCdb it is up to the
 implementation of what a remove really means. For example
 for CdbSession started towards the operational store could be
 added to a pool of free Cdb oper sessions. It is imported to
 understand that a CdbSession against the configurational data store
 should be as short lived as possible.

**Parameters**

- `com.tailf.cdb.Cdb rootCdb`

**Throws**

- `IOException` - on I/O failure
- `ConfException` - on protocol error

<a id="m-removeallsessions-211f72fa9478"></a>
### removeAllSessions()

```java
public abstract void removeAllSessions() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Removes all established session held by any Cdb.
  A remove on started sessions does not necessarily means
  that all sessions should be closed, instead it is up to
  implementation how a remove should be handled.

**Throws**

- `IOException` - on I/O failure
- `ConfException` - on protocol error
