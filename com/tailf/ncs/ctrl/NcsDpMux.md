<a id="s-NcsDpMux"></a>
# NcsDpMux

```java
public class com.tailf.ncs.ctrl.NcsDpMux
    implements Runnable, com.tailf.dp.DpExceptionReporter, com.tailf.dp.DpMountIdInterface
```

Types: [DpExceptionReporter](../../dp/DpExceptionReporter.md#s-DpExceptionReporter), [DpMountIdInterface](../../dp/DpMountIdInterface.md#s-DpMountIdInterface)

Ncs abstraction layer for Dp class.
 Each Package needs its own Dp daemon with own control socket and
 unique daemon name.
 This class handles these assignments as well as the thread
 which receives the callback requests.

## Members

**Constructors**:

- [NcsDpMux(NcsMain, String, String)](#s-NcsDpMux-1)
- [NcsDpMux(NcsMain, String, String, int)](#s-NcsDpMux-2)

**Methods**:

- [finish()](#s-finish)
- [getDpThread()](#s-getDpThread)
- [register(Object)](#s-register)
- [reportException(Throwable)](#s-reportException)
- [reRegister(Object)](#s-reRegister)
- [retrieveMountId(Object)](#s-retrieveMountId)
- [run()](#s-run)
- [setReportExceptionsToNcsMain()](#s-setReportExceptionsToNcsMain)

## Constructors

<a id="s-NcsDpMux-1"></a>
### NcsDpMux(NcsMain, String, String)

```java
public NcsDpMux(com.tailf.ncs.NcsMain main, String packageName, String componentName)
```

Types: [NcsMain](../NcsMain.md#s-NcsMain)

Constructor for NCS Dp abstraction class

**Parameters**

- `com.tailf.ncs.NcsMain main` - the NCS instance to use
- `String packageName` - name of the package for this Dp Daemon
- `String componentName` - name of the component for this Dp Daemon

<a id="s-NcsDpMux-2"></a>
### NcsDpMux(NcsMain, String, String, int)

```java
public NcsDpMux(
    com.tailf.ncs.NcsMain main,
    String packageName,
    String componentName,
    int threadPoolQueueSize
)
```

Types: [NcsMain](../NcsMain.md#s-NcsMain)

Constructor for NCS Dp abstraction class

**Parameters**

- `com.tailf.ncs.NcsMain main` - the NCS instance to use
- `String packageName` - name of the package for this Dp Daemon
- `String componentName` - name of the component for this Dp Daemon
- `int threadPoolQueueSize` - initial size of the dp worker threadpool


## Methods

<a id="s-finish"></a>
### finish()

```java
public void finish()
```

stop and clear the Dp and control socket

<a id="s-getDpThread"></a>
### getDpThread()

```java
public Thread getDpThread()
```

<a id="s-register"></a>
### register(Object)

```java
public void register(Object o)
```

Register a callback into this dp.

**Parameters**

- `Object o` - callback instance

<a id="s-reportException"></a>
### reportException(Throwable)

```java
public boolean reportException(Throwable e)
```

**Parameters**

- `Throwable e`

<a id="s-reRegister"></a>
### reRegister(Object)

```java
public void reRegister(Object o)
```

Register a callback into this dp.

**Parameters**

- `Object o` - callback instance

<a id="s-retrieveMountId"></a>
### retrieveMountId(Object)

```java
public String retrieveMountId(Object obj) throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../../dp/DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `Object obj`

<a id="s-run"></a>
### run()

```java
public void run()
```

Dp Thread run method

<a id="s-setReportExceptionsToNcsMain"></a>
### setReportExceptionsToNcsMain()

```java
public void setReportExceptionsToNcsMain()
```
