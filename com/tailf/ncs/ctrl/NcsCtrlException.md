<a id="s-NcsCtrlException"></a>
# NcsCtrlException

```java
public class com.tailf.ncs.ctrl.NcsCtrlException
    extends com.tailf.ncs.NcsException
```

Types: [NcsException](../NcsException.md#s-NcsException)

Ncs exception capable of storing multiple exception causes.

## Members

**Constructors**:

- [NcsCtrlException(String)](#s-NcsCtrlException-1)

**Methods**:

- [addCause(Throwable)](#s-addCause)
- [getCauseList()](#s-getCauseList)
- [getErrorCode()](../../conf/ConfException.md#s-getErrorCode) from ConfException
- [getMessage()](#s-getMessage)
- [getOpaque()](../../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](../../conf/ConfException.md#s-mk) from ConfException
- [mk(ConfResponse, ConfPath)](../../conf/ConfException.md#s-mk-1) from ConfException

## Constructors

<a id="s-NcsCtrlException-1"></a>
### NcsCtrlException(String)

```java
public NcsCtrlException(String msg)
```

**Parameters**

- `String msg`


## Methods

<a id="s-addCause"></a>
### addCause(Throwable)

```java
public void addCause(Throwable e)
```

**Parameters**

- `Throwable e`

<a id="s-getCauseList"></a>
### getCauseList()

```java
public java.util.List<Throwable> getCauseList()
```

<a id="s-getMessage"></a>
### getMessage()

```java
public String getMessage()
```
