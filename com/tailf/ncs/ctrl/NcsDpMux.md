# NcsDpMux <a href="#cls-NcsDpMux" id="cls-NcsDpMux"></a>

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

- [NcsDpMux(NcsMain, String, String)](#m-NcsDpMux-c6e608d90ef5)
- [NcsDpMux(NcsMain, String, String, int)](#m-NcsDpMux-24f0ec39e19a)

**Methods**:

- [finish()](#m-finish-8c785ae2e6bb)
- [getDpThread()](#m-getDpThread-0a74c4d6b35b)
- [register(Object)](#m-register-7aae2d334f99)
- [reportException(Throwable)](#m-reportException-f2030dd5aa98)
- [reRegister(Object)](#m-reRegister-ec513c61f987)
- [retrieveMountId(Object)](#m-retrieveMountId-c38b7bcdc149)
- [run()](#m-run-b6dbda048863)
- [setReportExceptionsToNcsMain()](#m-setReportExceptionsToNcsMain-2320b0a0719c)

## Constructors

### NcsDpMux(NcsMain, String, String) <a href="#m-NcsDpMux-c6e608d90ef5" id="m-NcsDpMux-c6e608d90ef5"></a>

```java
public NcsDpMux(com.tailf.ncs.NcsMain main, String packageName, String componentName)
```

Types: [NcsMain](../NcsMain.md#cls-NcsMain)

Constructor for NCS Dp abstraction class

**Parameters**

- `com.tailf.ncs.NcsMain main` - the NCS instance to use
- `String packageName` - name of the package for this Dp Daemon
- `String componentName` - name of the component for this Dp Daemon

### NcsDpMux(NcsMain, String, String, int) <a href="#m-NcsDpMux-24f0ec39e19a" id="m-NcsDpMux-24f0ec39e19a"></a>

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

### finish() <a href="#m-finish-8c785ae2e6bb" id="m-finish-8c785ae2e6bb"></a>

```java
public void finish()
```

stop and clear the Dp and control socket

### getDpThread() <a href="#m-getDpThread-0a74c4d6b35b" id="m-getDpThread-0a74c4d6b35b"></a>

```java
public Thread getDpThread()
```

### register(Object) <a href="#m-register-7aae2d334f99" id="m-register-7aae2d334f99"></a>

```java
public void register(Object o)
```

Register a callback into this dp.

**Parameters**

- `Object o` - callback instance

### reportException(Throwable) <a href="#m-reportException-f2030dd5aa98" id="m-reportException-f2030dd5aa98"></a>

```java
public boolean reportException(Throwable e)
```

**Parameters**

- `Throwable e`

### reRegister(Object) <a href="#m-reRegister-ec513c61f987" id="m-reRegister-ec513c61f987"></a>

```java
public void reRegister(Object o)
```

Register a callback into this dp.

**Parameters**

- `Object o` - callback instance

### retrieveMountId(Object) <a href="#m-retrieveMountId-c38b7bcdc149" id="m-retrieveMountId-c38b7bcdc149"></a>

```java
public String retrieveMountId(Object obj) throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](../../dp/DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `Object obj`

### run() <a href="#m-run-b6dbda048863" id="m-run-b6dbda048863"></a>

```java
public void run()
```

Dp Thread run method

### setReportExceptionsToNcsMain() <a href="#m-setReportExceptionsToNcsMain-2320b0a0719c" id="m-setReportExceptionsToNcsMain-2320b0a0719c"></a>

```java
public void setReportExceptionsToNcsMain()
```
