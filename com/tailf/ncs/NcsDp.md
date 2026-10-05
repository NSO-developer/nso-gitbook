<a id="s-NcsDp"></a>
# NcsDp

```java
public class com.tailf.ncs.NcsDp
    extends com.tailf.dp.Dp
```

Types: [Dp](../dp/Dp.md#s-Dp)

NCS Java vm internal DP dataprovider for stats data etc.

## Members

**Constructors**:

- [NcsDp(String, Socket, int)](#s-NcsDp-1)

**Fields**:

- [workerThreadPool](../dp/Dp.md#s-workerThreadPool) from Dp

**Methods**:

- [close()](../dp/Dp.md#s-close) from Dp
- [createNotifStream(String)](../dp/Dp.md#s-createNotifStream) from Dp
- [createNotifStream(String, DpNotifReplayCallback)](../dp/Dp.md#s-createNotifStream-1) from Dp
- [createNotifStream(String, DpNotifReplayCallback, Socket)](../dp/Dp.md#s-createNotifStream-2) from Dp
- [createSnmpNotifier(String, String)](../dp/Dp.md#s-createSnmpNotifier) from Dp
- [createSnmpNotifier(String, String, Object)](../dp/Dp.md#s-createSnmpNotifier-1) from Dp
- [createSnmpNotifier(String, String, Object, Socket)](../dp/Dp.md#s-createSnmpNotifier-2) from Dp
- [freeWorkerSocket(DpTrans)](../dp/Dp.md#s-freeWorkerSocket) from Dp
- [getCtrlSocket()](../dp/Dp.md#s-getCtrlSocket) from Dp
- [getDaemonId()](../dp/Dp.md#s-getDaemonId) from Dp
- [getDataCallback(ConfBuf, int)](../dp/Dp.md#s-getDataCallback) from Dp
- [getErrorMessageFormatter()](../dp/Dp.md#s-getErrorMessageFormatter) from Dp
- [getErrorVerbosity()](../dp/Dp.md#s-getErrorVerbosity) from Dp
- [getExceptionReporter()](../dp/Dp.md#s-getExceptionReporter) from Dp
- [getNanoServiceCallback(ConfBuf, int)](../dp/Dp.md#s-getNanoServiceCallback) from Dp
- [getNsList()](../dp/Dp.md#s-getNsList) from Dp
- [getServiceCallback(ConfBuf, int)](../dp/Dp.md#s-getServiceCallback) from Dp
- [getServicePointMaapi()](../dp/Dp.md#s-getServicePointMaapi) from Dp
- [getServicePointMaapi(DpTrans)](../dp/Dp.md#s-getServicePointMaapi-1) from Dp
- [getThreadPool()](#s-getThreadPool)
- [getUserInfo(int)](../dp/Dp.md#s-getUserInfo) from Dp
- [getWorkerPool()](../dp/Dp.md#s-getWorkerPool) from Dp
- [getWorkerSocketFd(Socket)](../dp/Dp.md#s-getWorkerSocketFd) from Dp
- [read()](../dp/Dp.md#s-read) from Dp
- [registerAnnotatedCallbacks(Object)](../dp/Dp.md#s-registerAnnotatedCallbacks) from Dp
- [registerAnnotatedCallbacks(String, Object)](../dp/Dp.md#s-registerAnnotatedCallbacks-1) from Dp
- [registerAnnotatedMountedCbs(DpMountIdInterface, Object)](../dp/Dp.md#s-registerAnnotatedMountedCbs) from Dp
- [registerAnnotatedRangeActionCallbacks(Object, ConfValue[], ConfValue[], ConfPath)](../dp/Dp.md#s-registerAnnotatedRangeActionCallbacks) from Dp
- [registerAnnotatedRangeDataCallbacks(Object, ConfValue[], ConfValue[], ConfPath)](../dp/Dp.md#s-registerAnnotatedRangeDataCallbacks) from Dp
- [registerDone()](../dp/Dp.md#s-registerDone) from Dp
- [removeActionMaapi()](../dp/Dp.md#s-removeActionMaapi) from Dp
- [reRegisterAnnotatedCallbacks(Object)](../dp/Dp.md#s-reRegisterAnnotatedCallbacks) from Dp
- [reRegisterAnnotatedCallbacks(String, Object)](../dp/Dp.md#s-reRegisterAnnotatedCallbacks-1) from Dp
- [reRegisterAnnotatedMountedCbs(DpMountIdInterface, Object)](../dp/Dp.md#s-reRegisterAnnotatedMountedCbs) from Dp
- [reRegisterAnnotatedRangeActionCallbacks(Object)](../dp/Dp.md#s-reRegisterAnnotatedRangeActionCallbacks) from Dp
- [reRegisterAnnotatedRangeDataCallbacks(Object)](../dp/Dp.md#s-reRegisterAnnotatedRangeDataCallbacks) from Dp
- [setErrorVerbosity(ErrorVerbosity)](../dp/Dp.md#s-setErrorVerbosity) from Dp
- [setExceptionReporter(DpExceptionReporter)](../dp/Dp.md#s-setExceptionReporter) from Dp
- [setNumFreeWorkerSockets(int)](../dp/Dp.md#s-setNumFreeWorkerSockets) from Dp
- [shutDownThreadPool()](../dp/Dp.md#s-shutDownThreadPool) from Dp
- [shutDownThreadPoolNow()](../dp/Dp.md#s-shutDownThreadPoolNow) from Dp

## Constructors

<a id="s-NcsDp-1"></a>
### NcsDp(String, Socket, int)

```java
public NcsDp(
    String name,
    java.net.Socket ctrlSocket,
    int queueSize
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `String name`
- `java.net.Socket ctrlSocket`
- `int queueSize`


## Methods

<a id="s-getThreadPool"></a>
### getThreadPool()

```java
public com.tailf.dp.DpWorkerThreadPool getThreadPool()
```

Types: [DpWorkerThreadPool](../dp/DpWorkerThreadPool.md#s-DpWorkerThreadPool)
