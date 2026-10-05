<a id="cls-NcsDpMux"></a>
# NcsDpMux

```java
public class com.tailf.ncs.ctrl.NcsDpMux
    implements Runnable, com.tailf.dp.DpExceptionReporter, com.tailf.dp.DpMountIdInterface
```

Types: [DpExceptionReporter](../../dp/DpExceptionReporter.md#cls-DpExceptionReporter), [DpMountIdInterface](../../dp/DpMountIdInterface.md#cls-DpMountIdInterface)

Ncs abstraction layer for Dp class.
 Each Package needs its own Dp daemon with own control socket and
 unique daemon name.
 This class handles these assignments as well as the thread
 which receives the callback requests.

## Members

**Constructors**:

- [NcsDpMux(NcsMain, String, String)](#m-ncsdpmux-c6e608d90ef5)
- [NcsDpMux(NcsMain, String, String, int)](#m-ncsdpmux-24f0ec39e19a)

**Methods**:

- [finish()](#m-finish-8c785ae2e6bb)
- [getDpThread()](#m-getdpthread-0a74c4d6b35b)
- [register(Object)](#m-register-7aae2d334f99)
- [reportException(Throwable)](#m-reportexception-f2030dd5aa98)
- [reRegister(Object)](#m-reregister-ec513c61f987)
- [retrieveMountId(Object)](#m-retrievemountid-c38b7bcdc149)
- [run()](#m-run-b6dbda048863)
- [setReportExceptionsToNcsMain()](#m-setreportexceptionstoncsmain-2320b0a0719c)

## Constructors

<a id="m-ncsdpmux-c6e608d90ef5"></a>
### NcsDpMux(NcsMain, String, String)

```java
public NcsDpMux(com.tailf.ncs.NcsMain main, String packageName, String componentName)
```

Types: [NcsMain](../NcsMain.md#cls-NcsMain)

Constructor for NCS Dp abstraction class

**Parameters**

- `com.tailf.ncs.NcsMain main` - the NCS instance to use
- `String packageName` - name of the package for this Dp Daemon
- `String componentName` - name of the component for this Dp Daemon

<a id="m-ncsdpmux-24f0ec39e19a"></a>
### NcsDpMux(NcsMain, String, String, int)

```java
public NcsDpMux(
    com.tailf.ncs.NcsMain main,
    String packageName,
    String componentName,
    int threadPoolQueueSize
)
```

Types: [NcsMain](../NcsMain.md#cls-NcsMain)

Constructor for NCS Dp abstraction class

**Parameters**

- `com.tailf.ncs.NcsMain main` - the NCS instance to use
- `String packageName` - name of the package for this Dp Daemon
- `String componentName` - name of the component for this Dp Daemon
- `int threadPoolQueueSize` - initial size of the dp worker threadpool


## Methods

<a id="m-finish-8c785ae2e6bb"></a>
### finish()

```java
public void finish()
```

stop and clear the Dp and control socket

<a id="m-getdpthread-0a74c4d6b35b"></a>
### getDpThread()

```java
public Thread getDpThread()
```

<a id="m-register-7aae2d334f99"></a>
### register(Object)

```java
public void register(Object o)
```

Register a callback into this dp.

**Parameters**

- `Object o` - callback instance

<a id="m-reportexception-f2030dd5aa98"></a>
### reportException(Throwable)

```java
public boolean reportException(Throwable e)
```

**Parameters**

- `Throwable e`

<a id="m-reregister-ec513c61f987"></a>
### reRegister(Object)

```java
public void reRegister(Object o)
```

Register a callback into this dp.

**Parameters**

- `Object o` - callback instance

<a id="m-retrievemountid-c38b7bcdc149"></a>
### retrieveMountId(Object)

```java
public String retrieveMountId(Object obj) throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../../dp/DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `Object obj`

<a id="m-run-b6dbda048863"></a>
### run()

```java
public void run()
```

Dp Thread run method

<a id="m-setreportexceptionstoncsmain-2320b0a0719c"></a>
### setReportExceptionsToNcsMain()

```java
public void setReportExceptionsToNcsMain()
```
