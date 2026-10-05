<a id="cls-DpDbContext"></a>
# DpDbContext

```java
public class com.tailf.dp.DpDbContext
```

Database context. Given as argument to many of the DpDbCallback methods.

## Members

**Constructors**:

- [DpDbContext(int, int, int, DpUserInfo)](#m-dpdbcontext-36dd5cf5f227)

**Methods**:

- [getDId()](#m-getdid-0727cf9e0fd9)
- [getLastOp()](#m-getlastop-8d68ee764339)
- [getQRef()](#m-getqref-ee1c8f107982)
- [getUserInfo()](#m-getuserinfo-3ecef1f24d3d)

## Constructors

<a id="m-dpdbcontext-36dd5cf5f227"></a>
### DpDbContext(int, int, int, DpUserInfo)

```java
public DpDbContext(int qref, int did, int op, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)

**Parameters**

- `int qref`
- `int did`
- `int op`
- `com.tailf.dp.DpUserInfo uinfo`


## Methods

<a id="m-getdid-0727cf9e0fd9"></a>
### getDId()

```java
public int getDId()
```

<a id="m-getlastop-8d68ee764339"></a>
### getLastOp()

```java
public int getLastOp()
```

<a id="m-getqref-ee1c8f107982"></a>
### getQRef()

```java
public int getQRef()
```

<a id="m-getuserinfo-3ecef1f24d3d"></a>
### getUserInfo()

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)
