<a id="cls-NcsCtrlException"></a>
# NcsCtrlException

```java
public class com.tailf.ncs.ctrl.NcsCtrlException
    extends com.tailf.ncs.NcsException
```

Types: [NcsException](../NcsException.md#cls-NcsException)

Ncs exception capable of storing multiple exception causes.

## Members

**Constructors**:

- [NcsCtrlException(String)](#m-ncsctrlexception-221a6565f48e)

**Methods**:

- [addCause(Throwable)](#m-addcause-351e6181965d)
- [getCauseList()](#m-getcauselist-b2e766c8dc20)
- [getErrorCode()](../../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getMessage()](#m-getmessage-77b7dae8469e)
- [getOpaque()](../../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](../../conf/ConfException.md#m-mk-de1cedfc6ea8) from ConfException
- [mk(ConfResponse, ConfPath)](../../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

<a id="m-ncsctrlexception-221a6565f48e"></a>
### NcsCtrlException(String)

```java
public NcsCtrlException(String msg)
```

**Parameters**

- `String msg`


## Methods

<a id="m-addcause-351e6181965d"></a>
### addCause(Throwable)

```java
public void addCause(Throwable e)
```

**Parameters**

- `Throwable e`

<a id="m-getcauselist-b2e766c8dc20"></a>
### getCauseList()

```java
public java.util.List<Throwable> getCauseList()
```

<a id="m-getmessage-77b7dae8469e"></a>
### getMessage()

```java
public String getMessage()
```
