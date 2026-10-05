# NcsDpMux <a href="#ncsdpmux-e720f4e4e4fe" id="ncsdpmux-e720f4e4e4fe"></a>

```java
public class com.tailf.ncs.ctrl.NcsDpMux
    implements Runnable, com.tailf.dp.DpExceptionReporter, com.tailf.dp.DpMountIdInterface
```

Types: [DpExceptionReporter](../../dp/DpExceptionReporter.md#dpexceptionreporter-09e497589a12), [DpMountIdInterface](../../dp/DpMountIdInterface.md#dpmountidinterface-265f1e5d05e4)

Ncs abstraction layer for Dp class.
 Each Package needs its own Dp daemon with own control socket and
 unique daemon name.
 This class handles these assignments as well as the thread
 which receives the callback requests.

## Members

**Constructors**:

- [NcsDpMux(NcsMain, String, String)](#ncsdpmux-c6e608d90ef5)
- [NcsDpMux(NcsMain, String, String, int)](#ncsdpmux-24f0ec39e19a)

**Methods**:

- [finish()](#finish-8c785ae2e6bb)
- [getDpThread()](#getdpthread-0a74c4d6b35b)
- [register(Object)](#register-7aae2d334f99)
- [reportException(Throwable)](#reportexception-f2030dd5aa98)
- [reRegister(Object)](#reregister-ec513c61f987)
- [retrieveMountId(Object)](#retrievemountid-c38b7bcdc149)
- [run()](#run-b6dbda048863)
- [setReportExceptionsToNcsMain()](#setreportexceptionstoncsmain-2320b0a0719c)

## Constructors

### NcsDpMux(NcsMain, String, String) <a href="#ncsdpmux-c6e608d90ef5" id="ncsdpmux-c6e608d90ef5"></a>

```java
public NcsDpMux(com.tailf.ncs.NcsMain main, String packageName, String componentName)
```

Types: [NcsMain](../NcsMain.md#ncsmain-eb814813aed4)

Constructor for NCS Dp abstraction class

**Parameters**

- `com.tailf.ncs.NcsMain main` - the NCS instance to use
- `String packageName` - name of the package for this Dp Daemon
- `String componentName` - name of the component for this Dp Daemon

### NcsDpMux(NcsMain, String, String, int) <a href="#ncsdpmux-24f0ec39e19a" id="ncsdpmux-24f0ec39e19a"></a>

```java
public NcsDpMux(
    com.tailf.ncs.NcsMain main,
    String packageName,
    String componentName,
    int threadPoolQueueSize
)
```

Types: [NcsMain](../NcsMain.md#ncsmain-eb814813aed4)

Constructor for NCS Dp abstraction class

**Parameters**

- `com.tailf.ncs.NcsMain main` - the NCS instance to use
- `String packageName` - name of the package for this Dp Daemon
- `String componentName` - name of the component for this Dp Daemon
- `int threadPoolQueueSize` - initial size of the dp worker threadpool


## Methods

### finish() <a href="#finish-8c785ae2e6bb" id="finish-8c785ae2e6bb"></a>

```java
public void finish()
```

stop and clear the Dp and control socket

### getDpThread() <a href="#getdpthread-0a74c4d6b35b" id="getdpthread-0a74c4d6b35b"></a>

```java
public Thread getDpThread()
```

### register(Object) <a href="#register-7aae2d334f99" id="register-7aae2d334f99"></a>

```java
public void register(Object o)
```

Register a callback into this dp.

**Parameters**

- `Object o` - callback instance

### reportException(Throwable) <a href="#reportexception-f2030dd5aa98" id="reportexception-f2030dd5aa98"></a>

```java
public boolean reportException(Throwable e)
```

**Parameters**

- `Throwable e`

### reRegister(Object) <a href="#reregister-ec513c61f987" id="reregister-ec513c61f987"></a>

```java
public void reRegister(Object o)
```

Register a callback into this dp.

**Parameters**

- `Object o` - callback instance

### retrieveMountId(Object) <a href="#retrievemountid-c38b7bcdc149" id="retrievemountid-c38b7bcdc149"></a>

```java
public String retrieveMountId(Object obj) throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../../dp/DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `Object obj`

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```

Dp Thread run method

### setReportExceptionsToNcsMain() <a href="#setreportexceptionstoncsmain-2320b0a0719c" id="setreportexceptionstoncsmain-2320b0a0719c"></a>

```java
public void setReportExceptionsToNcsMain()
```
