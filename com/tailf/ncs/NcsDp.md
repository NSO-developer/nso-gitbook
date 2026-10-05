# NcsDp <a href="#cls-NcsDp" id="cls-NcsDp"></a>

```java
public class com.tailf.ncs.NcsDp
    extends com.tailf.dp.Dp
```

Types: [Dp](../dp/Dp.md#cls-Dp)

NCS Java vm internal DP dataprovider for stats data etc.

## Members

**Constructors**:

- [NcsDp(String, Socket, int)](#m-NcsDp-0ef0c19f0db9)

**Fields**:

- [workerThreadPool](../dp/Dp.md#m-workerThreadPool) from Dp

**Methods**:

- [close()](../dp/Dp.md#m-close-8107c6dc012b) from Dp
- [createNotifStream(String)](../dp/Dp.md#m-createNotifStream-e828f1b79ea0) from Dp
- [createNotifStream(String, DpNotifReplayCallback)](../dp/Dp.md#m-createNotifStream-e4dac93288ec) from Dp
- [createNotifStream(String, DpNotifReplayCallback, Socket)](../dp/Dp.md#m-createNotifStream-24ebe812b6ae) from Dp
- [createSnmpNotifier(String, String)](../dp/Dp.md#m-createSnmpNotifier-e1bab2519dcd) from Dp
- [createSnmpNotifier(String, String, Object)](../dp/Dp.md#m-createSnmpNotifier-89f0d186fc8f) from Dp
- [createSnmpNotifier(String, String, Object, Socket)](../dp/Dp.md#m-createSnmpNotifier-666167fa4e78) from Dp
- [freeWorkerSocket(DpTrans)](../dp/Dp.md#m-freeWorkerSocket-7fceeb5a23c4) from Dp
- [getCtrlSocket()](../dp/Dp.md#m-getCtrlSocket-bb621326ae1c) from Dp
- [getDaemonId()](../dp/Dp.md#m-getDaemonId-289be546ab2e) from Dp
- [getDataCallback(ConfBuf, int)](../dp/Dp.md#m-getDataCallback-41b5ab75fca5) from Dp
- [getErrorMessageFormatter()](../dp/Dp.md#m-getErrorMessageFormatter-8c75ba6f07e5) from Dp
- [getErrorVerbosity()](../dp/Dp.md#m-getErrorVerbosity-defe49ca237d) from Dp
- [getExceptionReporter()](../dp/Dp.md#m-getExceptionReporter-51bbec6b9ad7) from Dp
- [getNanoServiceCallback(ConfBuf, int)](../dp/Dp.md#m-getNanoServiceCallback-84fe7cc27c9e) from Dp
- [getNsList()](../dp/Dp.md#m-getNsList-0345f486e876) from Dp
- [getServiceCallback(ConfBuf, int)](../dp/Dp.md#m-getServiceCallback-3eeb502a337a) from Dp
- [getServicePointMaapi()](../dp/Dp.md#m-getServicePointMaapi-021836eac222) from Dp
- [getServicePointMaapi(DpTrans)](../dp/Dp.md#m-getServicePointMaapi-16637fd1c239) from Dp
- [getThreadPool()](#m-getThreadPool-dcf9f6700c2b)
- [getUserInfo(int)](../dp/Dp.md#m-getUserInfo-4df0372acaa8) from Dp
- [getWorkerPool()](../dp/Dp.md#m-getWorkerPool-1955a0c55497) from Dp
- [getWorkerSocketFd(Socket)](../dp/Dp.md#m-getWorkerSocketFd-fca29bd0a7bf) from Dp
- [read()](../dp/Dp.md#m-read-b28b830b98d6) from Dp
- [registerAnnotatedCallbacks(Object)](../dp/Dp.md#m-registerAnnotatedCallbacks-ffaebadbfc42) from Dp
- [registerAnnotatedCallbacks(String, Object)](../dp/Dp.md#m-registerAnnotatedCallbacks-e4aab67443c6) from Dp
- [registerAnnotatedMountedCbs(DpMountIdInterface, Object)](../dp/Dp.md#m-registerAnnotatedMountedCbs-5bdf889f0774) from Dp
- [registerAnnotatedRangeActionCallbacks(Object, ConfValue[], ConfValue[], ConfPath)](../dp/Dp.md#m-registerAnnotatedRangeActionCallbacks-9933fdc875d2) from Dp
- [registerAnnotatedRangeDataCallbacks(Object, ConfValue[], ConfValue[], ConfPath)](../dp/Dp.md#m-registerAnnotatedRangeDataCallbacks-7df2c3b86ab4) from Dp
- [registerDone()](../dp/Dp.md#m-registerDone-a7e6840dacc7) from Dp
- [removeActionMaapi()](../dp/Dp.md#m-removeActionMaapi-ed4fc28fd600) from Dp
- [reRegisterAnnotatedCallbacks(Object)](../dp/Dp.md#m-reRegisterAnnotatedCallbacks-02241c7e25b1) from Dp
- [reRegisterAnnotatedCallbacks(String, Object)](../dp/Dp.md#m-reRegisterAnnotatedCallbacks-3db30c25ecf8) from Dp
- [reRegisterAnnotatedMountedCbs(DpMountIdInterface, Object)](../dp/Dp.md#m-reRegisterAnnotatedMountedCbs-aafebd57912a) from Dp
- [reRegisterAnnotatedRangeActionCallbacks(Object)](../dp/Dp.md#m-reRegisterAnnotatedRangeActionCallbacks-11af42e45a53) from Dp
- [reRegisterAnnotatedRangeDataCallbacks(Object)](../dp/Dp.md#m-reRegisterAnnotatedRangeDataCallbacks-35f84233e42f) from Dp
- [setErrorVerbosity(ErrorVerbosity)](../dp/Dp.md#m-setErrorVerbosity-bab7950e55c8) from Dp
- [setExceptionReporter(DpExceptionReporter)](../dp/Dp.md#m-setExceptionReporter-d521ed21a6eb) from Dp
- [setNumFreeWorkerSockets(int)](../dp/Dp.md#m-setNumFreeWorkerSockets-1a22360e3897) from Dp
- [shutDownThreadPool()](../dp/Dp.md#m-shutDownThreadPool-21f99643e601) from Dp
- [shutDownThreadPoolNow()](../dp/Dp.md#m-shutDownThreadPoolNow-ad8e642d6ab4) from Dp

## Constructors

### NcsDp(String, Socket, int) <a href="#m-NcsDp-0ef0c19f0db9" id="m-NcsDp-0ef0c19f0db9"></a>

```java
public NcsDp(
    String name,
    java.net.Socket ctrlSocket,
    int queueSize
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `String name`
- `java.net.Socket ctrlSocket`
- `int queueSize`


## Methods

### getThreadPool() <a href="#m-getThreadPool-dcf9f6700c2b" id="m-getThreadPool-dcf9f6700c2b"></a>

```java
public com.tailf.dp.DpWorkerThreadPool getThreadPool()
```

Types: [DpWorkerThreadPool](../dp/DpWorkerThreadPool.md#cls-DpWorkerThreadPool)
