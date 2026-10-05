# NcsDp <a href="#ncsdp-836e17b982f3" id="ncsdp-836e17b982f3"></a>

```java
public class com.tailf.ncs.NcsDp
    extends com.tailf.dp.Dp
```

Types: [Dp](../dp/Dp.md#dp-64c27347820e)

NCS Java vm internal DP dataprovider for stats data etc.

## Members

**Constructors**:

- [NcsDp(String, Socket, int)](#ncsdp-0ef0c19f0db9)

**Fields**:

- [workerThreadPool](../dp/Dp.md#workerthreadpool-c5d6f7ed9a3d) from Dp

**Methods**:

- [close()](../dp/Dp.md#close-8107c6dc012b) from Dp
- [createNotifStream(String)](../dp/Dp.md#createnotifstream-e828f1b79ea0) from Dp
- [createNotifStream(String, DpNotifReplayCallback)](../dp/Dp.md#createnotifstream-e4dac93288ec) from Dp
- [createNotifStream(String, DpNotifReplayCallback, Socket)](../dp/Dp.md#createnotifstream-24ebe812b6ae) from Dp
- [createSnmpNotifier(String, String)](../dp/Dp.md#createsnmpnotifier-e1bab2519dcd) from Dp
- [createSnmpNotifier(String, String, Object)](../dp/Dp.md#createsnmpnotifier-89f0d186fc8f) from Dp
- [createSnmpNotifier(String, String, Object, Socket)](../dp/Dp.md#createsnmpnotifier-666167fa4e78) from Dp
- [freeWorkerSocket(DpTrans)](../dp/Dp.md#freeworkersocket-7fceeb5a23c4) from Dp
- [getCtrlSocket()](../dp/Dp.md#getctrlsocket-bb621326ae1c) from Dp
- [getDaemonId()](../dp/Dp.md#getdaemonid-289be546ab2e) from Dp
- [getDataCallback(ConfBuf, int)](../dp/Dp.md#getdatacallback-41b5ab75fca5) from Dp
- [getErrorMessageFormatter()](../dp/Dp.md#geterrormessageformatter-8c75ba6f07e5) from Dp
- [getErrorVerbosity()](../dp/Dp.md#geterrorverbosity-defe49ca237d) from Dp
- [getExceptionReporter()](../dp/Dp.md#getexceptionreporter-51bbec6b9ad7) from Dp
- [getNanoServiceCallback(ConfBuf, int)](../dp/Dp.md#getnanoservicecallback-84fe7cc27c9e) from Dp
- [getNsList()](../dp/Dp.md#getnslist-0345f486e876) from Dp
- [getServiceCallback(ConfBuf, int)](../dp/Dp.md#getservicecallback-3eeb502a337a) from Dp
- [getServicePointMaapi()](../dp/Dp.md#getservicepointmaapi-021836eac222) from Dp
- [getServicePointMaapi(DpTrans)](../dp/Dp.md#getservicepointmaapi-16637fd1c239) from Dp
- [getThreadPool()](#getthreadpool-dcf9f6700c2b)
- [getUserInfo(int)](../dp/Dp.md#getuserinfo-4df0372acaa8) from Dp
- [getWorkerPool()](../dp/Dp.md#getworkerpool-1955a0c55497) from Dp
- [getWorkerSocketFd(Socket)](../dp/Dp.md#getworkersocketfd-fca29bd0a7bf) from Dp
- [read()](../dp/Dp.md#read-b28b830b98d6) from Dp
- [registerAnnotatedCallbacks(Object)](../dp/Dp.md#registerannotatedcallbacks-ffaebadbfc42) from Dp
- [registerAnnotatedCallbacks(String, Object)](../dp/Dp.md#registerannotatedcallbacks-e4aab67443c6) from Dp
- [registerAnnotatedMountedCbs(DpMountIdInterface, Object)](../dp/Dp.md#registerannotatedmountedcbs-5bdf889f0774) from Dp
- [registerAnnotatedRangeActionCallbacks(Object, ConfValue[], ConfValue[], ConfPath)](../dp/Dp.md#registerannotatedrangeactioncallbacks-9933fdc875d2) from Dp
- [registerAnnotatedRangeDataCallbacks(Object, ConfValue[], ConfValue[], ConfPath)](../dp/Dp.md#registerannotatedrangedatacallbacks-7df2c3b86ab4) from Dp
- [registerDone()](../dp/Dp.md#registerdone-a7e6840dacc7) from Dp
- [removeActionMaapi()](../dp/Dp.md#removeactionmaapi-ed4fc28fd600) from Dp
- [reRegisterAnnotatedCallbacks(Object)](../dp/Dp.md#reregisterannotatedcallbacks-02241c7e25b1) from Dp
- [reRegisterAnnotatedCallbacks(String, Object)](../dp/Dp.md#reregisterannotatedcallbacks-3db30c25ecf8) from Dp
- [reRegisterAnnotatedMountedCbs(DpMountIdInterface, Object)](../dp/Dp.md#reregisterannotatedmountedcbs-aafebd57912a) from Dp
- [reRegisterAnnotatedRangeActionCallbacks(Object)](../dp/Dp.md#reregisterannotatedrangeactioncallbacks-11af42e45a53) from Dp
- [reRegisterAnnotatedRangeDataCallbacks(Object)](../dp/Dp.md#reregisterannotatedrangedatacallbacks-35f84233e42f) from Dp
- [setErrorVerbosity(ErrorVerbosity)](../dp/Dp.md#seterrorverbosity-bab7950e55c8) from Dp
- [setExceptionReporter(DpExceptionReporter)](../dp/Dp.md#setexceptionreporter-d521ed21a6eb) from Dp
- [setNumFreeWorkerSockets(int)](../dp/Dp.md#setnumfreeworkersockets-1a22360e3897) from Dp
- [shutDownThreadPool()](../dp/Dp.md#shutdownthreadpool-21f99643e601) from Dp
- [shutDownThreadPoolNow()](../dp/Dp.md#shutdownthreadpoolnow-ad8e642d6ab4) from Dp

## Constructors

### NcsDp(String, Socket, int) <a href="#ncsdp-0ef0c19f0db9" id="ncsdp-0ef0c19f0db9"></a>

```java
public NcsDp(
    String name,
    java.net.Socket ctrlSocket,
    int queueSize
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String name`
- `java.net.Socket ctrlSocket`
- `int queueSize`


## Methods

### getThreadPool() <a href="#getthreadpool-dcf9f6700c2b" id="getthreadpool-dcf9f6700c2b"></a>

```java
public com.tailf.dp.DpWorkerThreadPool getThreadPool()
```

Types: [DpWorkerThreadPool](../dp/DpWorkerThreadPool.md#dpworkerthreadpool-05106327e3a1)
