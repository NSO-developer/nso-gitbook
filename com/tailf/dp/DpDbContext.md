# DpDbContext <a href="#dpdbcontext-37347e4f266f" id="dpdbcontext-37347e4f266f"></a>

```java
public class com.tailf.dp.DpDbContext
```

Database context. Given as argument to many of the DpDbCallback methods.

## Members

**Constructors**:

- [DpDbContext\(int, int, int, DpUserInfo\)](#dpdbcontext-36dd5cf5f227)

**Methods**:

- [getDId\(\)](#getdid-0727cf9e0fd9)
- [getLastOp\(\)](#getlastop-8d68ee764339)
- [getQRef\(\)](#getqref-ee1c8f107982)
- [getUserInfo\(\)](#getuserinfo-3ecef1f24d3d)

## Constructors

### DpDbContext(int, int, int, DpUserInfo) <a href="#dpdbcontext-36dd5cf5f227" id="dpdbcontext-36dd5cf5f227"></a>

```java
public DpDbContext(int qref, int did, int op, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](DpUserInfo.md#dpuserinfo-c59746285a6e)

**Parameters**

- `int qref`
- `int did`
- `int op`
- `com.tailf.dp.DpUserInfo uinfo`


## Methods

### getDId() <a href="#getdid-0727cf9e0fd9" id="getdid-0727cf9e0fd9"></a>

```java
public int getDId()
```

### getLastOp() <a href="#getlastop-8d68ee764339" id="getlastop-8d68ee764339"></a>

```java
public int getLastOp()
```

### getQRef() <a href="#getqref-ee1c8f107982" id="getqref-ee1c8f107982"></a>

```java
public int getQRef()
```

### getUserInfo() <a href="#getuserinfo-3ecef1f24d3d" id="getuserinfo-3ecef1f24d3d"></a>

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](DpUserInfo.md#dpuserinfo-c59746285a6e)
