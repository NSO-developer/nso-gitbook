# Dp <a href="#cls-Dp" id="cls-Dp"></a>

```java
public class com.tailf.dp.Dp
    implements AutoCloseable
```

This class implements the Data Provider API (DP).
 The purpose of
 this class library is to provide callback hooks so that user-written
 code can be invoked to perform various tasks.

 ***NOTE: For NCS users the `Dp` class should not be used directly.
 Instead written  callbacks  must be packaged in a .jar file and referred to
 by the `package-meta-data.xml`
 file loaded by NCS.***

 The class  library  is  also used to populate items in the YANG model
 which are
 not data or configuration items, such  as  statistics  items.

 The  library  consists of a number of API methods whose purpose is to
 install different callback methods at different  points  in  the  XML
 tree which is the representation of the device configuration. Read more
 about callpoints in `tailf_yang_extensions(5)`.


 There are different types of callbacks that can be registered to perform
 different tasks. Data callbacks are
 used to deliver data that is defined in the data model.
 If the data is statistics data, e.g. `&quot;config = false;&quot;`
 data,
 the callback objects only have to be able to respond to read requests,
 whereas if the data is configuration data, the callback objects must be able
 to also write data to persistent storage.


 To register a data callback in ConfD, we can do:


```
   // int port = Conf.PORT; // ConfD TCP; NCS uses Conf.NCS_PATH (Unix socket)
   Socket ctrl_socket= new Socket(127.0.0.1, port);
   final Dp dp = new Dp(server_daemon, ctrl_socket);
   dp.registerAnnotatedCallbacks(new SimpleTransCb());
   dp.registerAnnotatedCallbacks(new SimpleDataCb());
   dp.registerDone();
   Thread dpTh = new Thread(new Runnable() {
       public void run() {
           try {
               while (true) dp.read();
           } catch (Exception e) {
               e.printStackTrace();
               return;
           }
       }
   });
   dpTh.start();
```



 To register a data callback in NCS , we must package the classes
 in the .jar file and place it in the
 `package/my-package/private-jar` directory
 and reference the annotated callbacks in the
 `package/my-package/package-meta-data.xml`:



```
 ncs-package xmlns="http://tail-f.com/ns/ncs-packages"
   nameMy-package/name
  package-version1.0/package-version
  descriptionAbstraction test/description
  ncs-min-version2.0/ncs-min-version
  component
    nameMyCallbacks/name
    callback
      java-class-name
        com.example.mypackage.SimpleTransCb
      /java-class-name
      java-class-name
        com.example.mypackage.SysDataCb
      /java-class-name
    /callback
  /component
 /ncs-package
```





 Where the two classes MyTransCb and MyDataCb need to be annotated
 to indicate what capabilities they have. The following code
 show the annotation used ( Applies to both ConfD/NCS):



```
 public class MyTransCb {

   TransCallback(callType=TransCBType.INIT)
     public void init(DpTrans trans) throws DpCallbackException {
       trace(init(): userinfo=  + trans.getUserInfo());
     }

   TransCallback(callType=TransCBType.FINISH)
     public void finish(DpTrans trans) throws DpCallbackException {
       trace(finish());
     }
  }
  // And so on ...
```



 The `MyTransCb` methods `init` , `finish`
 get called at the start and finish of each
 transactions. There exists a number of different possible entry
 points within the transaction. See @see TransCBType.
 And the data callbacks that need to be able to deliver the
 actual data. Given a data model that looks looks like:



```

   container servers {
     config false;
     tailf:callpoint simplecp {
     }
     list server {
       key name;
       max-elements 64;
       leaf name {
         type string;
       }
       leaf ip {
         type inet:ip-address;
       }
       leaf port {
         type inet:port-number;
       }
       leaf macaddr {
         type tailf:hex-list;
       }
       leaf snmpref {
         type yang:object-identifier;
         mandatory true;
       }
       leaf prefixmask {
         type tailf:octet-list;
         mandatory true;
       }
     }
   }
```




 The callback class to deliver the data could look like:




```

 public class SimpleDataCb  {


     DataCallback(callPoint=simplecp,
                        callType=DataCBType.ITERATOR)
     public IteratorObject iterator(DpTrans trans, ConfObject[] kp)
      throws DpCallbackException {
      return Foobar.iterator();
     }

     DataCallback(callPoint=simplecp,
                        callType=DataCBType.GET_NEXT)
     public ConfKey getKey(DpTrans trans, ConfObject[] kp, Object obj)
      throws DpCallbackException {
      Server s = (Server) obj;
      return new ConfKey( new ConfObject[] { new ConfBuf(s.name) });
     }


     DataCallback(callPoint=simplecp,
                        callType=DataCBType.GET_ELEM)
     public ConfValue getElem(DpTrans trans, ConfObject[] kp)
      throws DpCallbackException {
         return Foobar.get(kp);
     }

     DataCallback(callPoint=simplecp,
                        callType=DataCBType.GET_OBJECT)
     public ConfValue[] getObject(DpTrans trans, ConfObject[] kp)
         throws DpCallbackException {
      String name = ((ConfKey) kp[0]).elementAt(0).toString();
      Server s = Foobar.findServer( name );
      if (s == null) return null;
      return getObject(trans, kp, s);
     }

     DataCallback(callPoint=simplecp,
     callType=DataCBType.GET_NEXT_OBJECT)
     public ConfValue[] getObject(DpTrans trans, ConfObject[] kp, Object obj)
      throws DpCallbackException {
      Server s = (Server) obj;
      return new ConfValue[] {
          new ConfBuf(s.name),
          new ConfIPv4( s.addr),
          new ConfUInt16( s.port),
          new ConfHexList( s.macaddr ),
     }
 }
```




 `Dp` uses `ThreadPoolExecutor` as managing its
 internal worker threads. `Dp` could be configured to prestart
 worker threads so the overhead of creating and starting threads is minimized.

 `Dp` delivers a task ([`DpTrans`](DpTrans.md#cls-DpTrans),[`DpValidateTrans`](DpValidateTrans.md#cls-DpValidateTrans),
 [`DpActionTrans`](DpActionTrans.md#cls-DpActionTrans) to worker threads when requests comes
 from controller socket.
 '
 The worker threads could either wait for task to arrive to them or
 they could be started when needed.  `Dp` provides constructor for
 setting various parameters to tune the behavior of threads pool

**Related classes**

- [NcsDp](../ncs/NcsDp.md#cls-NcsDp)

**See also:** `java.util.concurrent.ThreadPoolExecutor,for information how the
 ExecutorService could be configured.`, [`ActionCBType`](proto/ActionCBType.md#cls-ActionCBType), [`DBCBType`](proto/DBCBType.md#cls-DBCBType), [`DataCBType`](proto/DataCBType.md#cls-DataCBType), [`SnmpInformResponseCBType`](proto/SnmpInformResponseCBType.md#cls-SnmpInformResponseCBType), [`TransCBType`](proto/TransCBType.md#cls-TransCBType), [`TransValidateCBType`](proto/TransValidateCBType.md#cls-TransValidateCBType), [`ValidateCBType`](proto/ValidateCBType.md#cls-ValidateCBType)

## Members

**Constructors**:

- [Dp(String, Socket)](#m-Dp-7585811d2823)
- [Dp(String, Socket, boolean)](#m-Dp-a5bd6c16fcf6)
- [Dp(String, Socket, boolean, int, int, long, TimeUnit, BlockingQueue<Runnable>, boolean)](#m-Dp-c0bd46f94119)

**Fields**:

- [DATA_REPLY_ERROR](#m-DATA_REPLY_ERROR)
- [DATA_REPLY_OK](#m-DATA_REPLY_OK)
- [DATA_REPLY_VALUE](#m-DATA_REPLY_VALUE)
- [workerThreadPool](#m-workerThreadPool)

**Methods**:

- [allocWorkerSocket(DpTrans)](#m-allocWorkerSocket-174516f00d50)
- [allocWorkerSocket(DpTrans, Socket)](#m-allocWorkerSocket-f2a88a81642d)
- [close()](#m-close-8107c6dc012b)
- [closeWorkerSocket(DpTrans)](#m-closeWorkerSocket-dc01a44ce016)
- [connectWorkerSocket(Socket, int)](#m-connectWorkerSocket-c43c1ab09de8)
- [createNotifStream(String)](#m-createNotifStream-e828f1b79ea0)
- [createNotifStream(String, DpNotifReplayCallback)](#m-createNotifStream-e4dac93288ec)
- [createNotifStream(String, DpNotifReplayCallback, Socket)](#m-createNotifStream-24ebe812b6ae)
- [createSnmpNotifier(String, String)](#m-createSnmpNotifier-e1bab2519dcd)
- [createSnmpNotifier(String, String, Object)](#m-createSnmpNotifier-89f0d186fc8f)
- [createSnmpNotifier(String, String, Object, Socket)](#m-createSnmpNotifier-666167fa4e78)
- [freeWorkerSocket(DpTrans)](#m-freeWorkerSocket-7fceeb5a23c4)
- [getActionCallback(String)](#m-getActionCallback-1afe38accd25)
- [getActionCallback(String, int)](#m-getActionCallback-80fd3aa41080)
- [getCtrlSocket()](#m-getCtrlSocket-bb621326ae1c)
- [getDaemonId()](#m-getDaemonId-289be546ab2e)
- [getDataCallback(ConfBuf, int)](#m-getDataCallback-41b5ab75fca5)
- [getDbCallback()](#m-getDbCallback-bd46dc259b1a)
- [getErrorMessageFormatter()](#m-getErrorMessageFormatter-8c75ba6f07e5)
- [getErrorVerbosity()](#m-getErrorVerbosity-defe49ca237d)
- [getExceptionReporter()](#m-getExceptionReporter-51bbec6b9ad7)
- [getNanoServiceCallback(ConfBuf, int)](#m-getNanoServiceCallback-84fe7cc27c9e)
- [getNsList()](#m-getNsList-0345f486e876)
- [getServiceCallback(ConfBuf, int)](#m-getServiceCallback-3eeb502a337a)
- [getServicePointMaapi()](#m-getServicePointMaapi-021836eac222)
- [getServicePointMaapi(DpTrans)](#m-getServicePointMaapi-16637fd1c239)
- [getTransCallback()](#m-getTransCallback-7890d71f94df)
- [getTransValidateCallback()](#m-getTransValidateCallback-0eaee07d8d43)
- [getUserInfo(int)](#m-getUserInfo-4df0372acaa8)
- [getValpointCallback(ConfBuf, int)](#m-getValpointCallback-5f5550918feb)
- [getWorkerPool()](#m-getWorkerPool-1955a0c55497)
- [getWorkerSocketFd(Socket)](#m-getWorkerSocketFd-fca29bd0a7bf)
- [read()](#m-read-b28b830b98d6)
- [registerAnnotatedCallbacks(Object)](#m-registerAnnotatedCallbacks-ffaebadbfc42)
- [registerAnnotatedCallbacks(String, Object)](#m-registerAnnotatedCallbacks-e4aab67443c6)
- [registerAnnotatedMountedCbs(DpMountIdInterface, Object)](#m-registerAnnotatedMountedCbs-5bdf889f0774)
- [registerAnnotatedRangeActionCallbacks(Object, ConfValue[], ConfValue[], ConfPath)](#m-registerAnnotatedRangeActionCallbacks-9933fdc875d2)
- [registerAnnotatedRangeDataCallbacks(Object, ConfValue[], ConfValue[], ConfPath)](#m-registerAnnotatedRangeDataCallbacks-7df2c3b86ab4)
- [registerDone()](#m-registerDone-a7e6840dacc7)
- [removeActionMaapi()](#m-removeActionMaapi-ed4fc28fd600)
- [reRegisterAnnotatedCallbacks(Object)](#m-reRegisterAnnotatedCallbacks-02241c7e25b1)
- [reRegisterAnnotatedCallbacks(String, Object)](#m-reRegisterAnnotatedCallbacks-3db30c25ecf8)
- [reRegisterAnnotatedMountedCbs(DpMountIdInterface, Object)](#m-reRegisterAnnotatedMountedCbs-aafebd57912a)
- [reRegisterAnnotatedRangeActionCallbacks(Object)](#m-reRegisterAnnotatedRangeActionCallbacks-11af42e45a53)
- [reRegisterAnnotatedRangeDataCallbacks(Object)](#m-reRegisterAnnotatedRangeDataCallbacks-35f84233e42f)
- [runWithSocket(DpTrans, DpWork, Socket)](#m-runWithSocket-c07b7acd0039)
- [setErrorVerbosity(ErrorVerbosity)](#m-setErrorVerbosity-bab7950e55c8)
- [setExceptionReporter(DpExceptionReporter)](#m-setExceptionReporter-d521ed21a6eb)
- [setNumFreeWorkerSockets(int)](#m-setNumFreeWorkerSockets-1a22360e3897)
- [setRejectedExecutionHandler(RejectedExecutionHandler)](#m-setRejectedExecutionHandler-8f7288278e17)
- [shutDownThreadPool()](#m-shutDownThreadPool-21f99643e601)
- [shutDownThreadPoolNow()](#m-shutDownThreadPoolNow-ad8e642d6ab4)

**Nested Types**:

- [DpWork](Dp/DpWork.md#cls-DpWork)

## Constructors

### Dp(String, Socket) <a href="#m-Dp-7585811d2823" id="m-Dp-7585811d2823"></a>

```java
public Dp(
    String name,
    java.net.Socket socket
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

This constructor will initialize the Dp class library and connect to
 ConfD/NCS on the provided control socket.
 The name parameter is used in various debug printouts and
 and is also used to uniquely identify the daemon.

 Since the ConfD/NCS daemon expects initialization within
 5 seconds after a new socket is established this constructor should be
 called directly for a new socket. For instance:

 `
 // int port = Conf.PORT; // ConfD TCP;
 //   NCS uses Conf.NCS_PATH (Unix socket)
 Dp dp = new Dp("xyz", new Socket("localhost", port));
 `

 If encrypted communication towards ConfD/NCS is desired,
 an environment variable "CONFD_IPC_ACCESS_FILE" or "NCS_IPC_ACCESS_FILE"
 need to be set.
 This variable is expected to point to a file containing a secret salt.
  example:
     export CONFD_IPC_ACCESS_FILE=./secret_file.txt
 An alternative to the environment variable is to set an java system
 property with the same name pointing to the file.

**Parameters**

- `String name` - A name that uniquely identifies the daemon
- `java.net.Socket socket` - A control socket connected to ConfD/NCS.

**Throws**

- `DpException` - Failed to initialize connection.
- `DpCallbackException` - Callback method failed.
- `IOException` - Failed to read from control socket.
- `ConfException` - Failed to decode or other internal failure.

### Dp(String, Socket, boolean) <a href="#m-Dp-a5bd6c16fcf6" id="m-Dp-a5bd6c16fcf6"></a>

```java
public Dp(
    String name,
    java.net.Socket ctrlSocket,
    boolean isNcs
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

This constructor will initialize the Dp class library and connect to
 ConfD/NCS on the provided control socket.
 The name parameter is used in various debug printouts and
 and is also used to uniquely identify the daemon.

 Since the ConfD/NCS daemon expects initialization within
 5 seconds after a new socket is established this constructor should be
 called directly for a new socket.

 If encrypted communication towards ConfD/NCS is desired,
 an environment variable "CONFD_IPC_ACCESS_FILE" or "NCS_IPC_ACCESS_FILE"
 need to be set.
 This variable is expected to point to a file containing a secret salt.
  example:
     export CONFD_IPC_ACCESS_FILE=./secret_file.txt
 An alternative to the environment variable is to set an java system
 property with the same name pointing to the file.

 The thread pool behavior is that it prestarts 5 worker threads
 and poolsize could max grow to 256 working threads. Keep alive
 time is set to 60 sec.

 The keepAlive time is the idle time
 of a thread before it is terminated. This value is only in
 effect when current thread is greater than corePoolSize.
 The default Queue is ArrayBlockingQueue with a queue size
 of 10. When more than 10 elements is in the queue then
 additional threads will be created.

**Parameters**

- `String name` - A name that uniquely identifies the daemon
- `java.net.Socket ctrlSocket` - The control socket connected to ConfD/NCS.
- `boolean isNcs` - set to true if the data provider is managed by NcsDpMux

**Throws**

- `DpException` - Failed to initialize connection to ConfD/NCS.
- `DpCallbackException` - Callback method failed.
- `IOException` - Failed to read from control socket.
- `ConfException` - Failed to decode or other internal failure.

### Dp(String, Socket, boolean, int, int, long, TimeUnit, BlockingQueue<Runnable>, boolean) <a href="#m-Dp-c0bd46f94119" id="m-Dp-c0bd46f94119"></a>

```java
public Dp(
    String name,
    java.net.Socket ctrlSocket,
    boolean isNcs,
    int minThreadPoolSize,
    int maxThreadPoolSize,
    long keepAliveTime,
    java.util.concurrent.TimeUnit unit,
    java.util.concurrent.BlockingQueue<Runnable> queue,
    boolean prestartCoreThreads
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

This constructor will initialize the Dp class library and connect to
 ConfD/NCS on the provided control socket.
 The name parameter is used in various debug printouts and
 and is also used to uniquely identify the daemon.

 Since the ConfD/NCS daemon expects initialization within
 5 seconds after a new socket is established this constructor should be
 called directly for a new socket.

 If encrypted communication towards ConfD/NCS is desired,
 an environment variable "CONFD_IPC_ACCESS_FILE" or "NCS_IPC_ACCESS_FILE"
 need to be set.
 This variable is expected to point to a file containing a secret salt.
  example:
     export CONFD_IPC_ACCESS_FILE=./secret_file.txt
 An alternative to the environment variable is to set an java system
 property with the same name pointing to the file.

 Various parameters for tuning the worker thread pool could be
 specified here.


 The thread pool behavior is that it prestarts minThreadPoolSize
 worker threads if prestartCoreThreads is set to true.

 The poolsize could max grow to maxThreadPoolSize threads. Keep alive
 time is set to keepAliveTime units time.

 The keepAlive time is the idle time of a thread before it is terminated.
 This value is only in effect when current thread is greater than
 corePoolSize.

 The queue could be specified as bounded or not bounded which will
 interact with the poolsize.

**Parameters**

- `String name` - A name that uniquely identifies the daemon
- `java.net.Socket ctrlSocket` - The control socket connected to ConfD/NCS.
- `boolean isNcs` - set to true if the data provider is managed by NcsDpMux
- `int minThreadPoolSize` - Minimum worker thread in the worker pool
- `int maxThreadPoolSize` - Maximum worker thread in the worker pool. This parameter
       works only when queue is bounded
- `long keepAliveTime` - idle time for a thread before it is terminated
- `java.util.concurrent.TimeUnit unit` - keepAlive units time
- `java.util.concurrent.BlockingQueue<Runnable> queue` - Queue that holds tasks. The use of this queue
       interacts with pool sizing.
- `boolean prestartCoreThreads`

**Throws**

- `DpException` - Failed to initialize connection to ConfD/NCS.
- `DpCallbackException` - Callback method failed.
- `IOException` - Failed to read from control socket.
- `ConfException` - Failed to decode or other internal failure.


## Fields

### DATA_REPLY_ERROR <a href="#m-DATA_REPLY_ERROR" id="m-DATA_REPLY_ERROR"></a>

**Package-private**

```java
static final int DATA_REPLY_ERROR = 105;
```

### DATA_REPLY_OK <a href="#m-DATA_REPLY_OK" id="m-DATA_REPLY_OK"></a>

**Package-private**

```java
static final int DATA_REPLY_OK = 104;
```

### DATA_REPLY_VALUE <a href="#m-DATA_REPLY_VALUE" id="m-DATA_REPLY_VALUE"></a>

**Package-private**

```java
static final int DATA_REPLY_VALUE = 103;
```

### workerThreadPool <a href="#m-workerThreadPool" id="m-workerThreadPool"></a>

```java
protected com.tailf.dp.DpWorkerThreadPool workerThreadPool = null;
```

Types: [DpWorkerThreadPool](DpWorkerThreadPool.md#cls-DpWorkerThreadPool)


## Methods

### allocWorkerSocket(DpTrans) <a href="#m-allocWorkerSocket-174516f00d50" id="m-allocWorkerSocket-174516f00d50"></a>

**Package-private**

```java
synchronized java.net.Socket allocWorkerSocket(
    com.tailf.dp.DpTrans trans
)
    throws com.tailf.dp.DpException, java.io.IOException
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [DpException](DpException.md#cls-DpException)

Allocate a new worker socket from a pool of open sockets.
 The returned socket is connected to ConfD/NCS.

**Parameters**

- `com.tailf.dp.DpTrans trans`

### allocWorkerSocket(DpTrans, Socket) <a href="#m-allocWorkerSocket-f2a88a81642d" id="m-allocWorkerSocket-f2a88a81642d"></a>

**Package-private**

```java
synchronized java.net.Socket allocWorkerSocket(
    com.tailf.dp.DpTrans trans,
    java.net.Socket workerSocket
)
    throws com.tailf.dp.DpException
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [DpException](DpException.md#cls-DpException)

This method is invoked from setSocket when user provides his own
 Socket. In this case we still need to make a fake file descriptor.

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `java.net.Socket workerSocket`

### close() <a href="#m-close-8107c6dc012b" id="m-close-8107c6dc012b"></a>

```java
public void close()
```

### closeWorkerSocket(DpTrans) <a href="#m-closeWorkerSocket-dc01a44ce016" id="m-closeWorkerSocket-dc01a44ce016"></a>

**Package-private**

```java
synchronized void closeWorkerSocket(com.tailf.dp.DpTrans trans)
```

Types: [DpTrans](DpTrans.md#cls-DpTrans)

Close a worker socket and remove from running sockets.

**Parameters**

- `com.tailf.dp.DpTrans trans`

### connectWorkerSocket(Socket, int) <a href="#m-connectWorkerSocket-c43c1ab09de8" id="m-connectWorkerSocket-c43c1ab09de8"></a>

**Package-private**

```java
void connectWorkerSocket(java.net.Socket sock, int fd) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#cls-DpException)

Used by allocWorkerSocket() when a new socket is created.

**Parameters**

- `java.net.Socket sock`
- `int fd`

### createNotifStream(String) <a href="#m-createNotifStream-e828f1b79ea0" id="m-createNotifStream-e828f1b79ea0"></a>

```java
public com.tailf.dp.DpNotifStream createNotifStream(
    String name
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [DpNotifStream](DpNotifStream.md#cls-DpNotifStream), [ConfException](../conf/ConfException.md#cls-ConfException)

Creates (and registers) a notifications stream with ConfD/NCS.
 This can be used for
 sending notifications to ConfD/NCS.

**Parameters**

- `String name` - A name that uniquely identifies the notification stream

**Throws**

- `DpCallbackException` - Callback method failed.
- `IOException` - Failed to read from notification socket.
- `ConfException` - Failed to decode or other internal failure.

**See also:** [`DpNotifStream`](DpNotifStream.md#cls-DpNotifStream)

### createNotifStream(String, DpNotifReplayCallback) <a href="#m-createNotifStream-e4dac93288ec" id="m-createNotifStream-e4dac93288ec"></a>

```java
public com.tailf.dp.DpNotifStream createNotifStream(
    String name,
    com.tailf.dp.DpNotifReplayCallback replayCb
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [DpNotifStream](DpNotifStream.md#cls-DpNotifStream), [DpNotifReplayCallback](DpNotifReplayCallback.md#cls-DpNotifReplayCallback), [ConfException](../conf/ConfException.md#cls-ConfException)

Creates (and registers) a notifications stream with ConfD/NCS.
 This can be used for
 sending notifications to ConfD/NCS.

**Parameters**

- `String name` - A name that uniquely identifies the notification stream
- `com.tailf.dp.DpNotifReplayCallback replayCb` - A callback that implements 'replay' functionality.
 (optional)

**Throws**

- `DpCallbackException` - Callback method failed.
- `IOException` - Failed to read from notification socket.
- `ConfException` - Failed to decode or other internal failure.

**See also:** [`DpNotifStream`](DpNotifStream.md#cls-DpNotifStream)

### createNotifStream(String, DpNotifReplayCallback, Socket) <a href="#m-createNotifStream-24ebe812b6ae" id="m-createNotifStream-24ebe812b6ae"></a>

```java
public com.tailf.dp.DpNotifStream createNotifStream(
    String name,
    com.tailf.dp.DpNotifReplayCallback replayCb,
    java.net.Socket socket
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [DpNotifStream](DpNotifStream.md#cls-DpNotifStream), [DpNotifReplayCallback](DpNotifReplayCallback.md#cls-DpNotifReplayCallback), [ConfException](../conf/ConfException.md#cls-ConfException)

Creates (and registers) a notifications stream with ConfD/NCS.
 This can be used for
 sending notifications to ConfD/NCS.

**Parameters**

- `String name` - A name that uniquely identifies the notification stream
- `com.tailf.dp.DpNotifReplayCallback replayCb` - A callback that implements 'replay' functionality.
 (optional)
- `java.net.Socket socket` - A worker socket to send notification on (optional)

**Throws**

- `DpCallbackException` - Callback method failed.
- `IOException` - Failed to read from notification socket.
- `ConfException` - Failed to decode or other internal failure.

**See also:** [`DpNotifStream`](DpNotifStream.md#cls-DpNotifStream)

### createSnmpNotifier(String, String) <a href="#m-createSnmpNotifier-e1bab2519dcd" id="m-createSnmpNotifier-e1bab2519dcd"></a>

```java
public com.tailf.dp.DpSnmpNotifier createSnmpNotifier(
    String name,
    String contextName
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [DpSnmpNotifier](DpSnmpNotifier.md#cls-DpSnmpNotifier), [ConfException](../conf/ConfException.md#cls-ConfException)

Creates (and registers) a SNMP Notifer @see [`DpSnmpNotifier`](DpSnmpNotifier.md#cls-DpSnmpNotifier).

**Parameters**

- `String name` - a name uniquely identifying the SNMP notifier.
- `String contextName` - the SNMP context.

**Throws**

- `IOException` - Failed to read from notification socket.
- `ConfException` - Failed to decode or other internal failure.

**See also:** [`DpSnmpNotifier`](DpSnmpNotifier.md#cls-DpSnmpNotifier)

### createSnmpNotifier(String, String, Object) <a href="#m-createSnmpNotifier-89f0d186fc8f" id="m-createSnmpNotifier-89f0d186fc8f"></a>

```java
public com.tailf.dp.DpSnmpNotifier createSnmpNotifier(
    String notifyName,
    String contextName,
    Object informCb
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [DpSnmpNotifier](DpSnmpNotifier.md#cls-DpSnmpNotifier), [ConfException](../conf/ConfException.md#cls-ConfException)

Creates (and registers) a SNMP Notifier @see [`DpSnmpNotifier`](DpSnmpNotifier.md#cls-DpSnmpNotifier).

**Parameters**

- `String notifyName` - a name uniquely identifying the SNMP notifier.
- `String contextName` - the SNMP context.
- `Object informCb` - the callback to be called for Inform Responses.

**Throws**

- `IOException` - Failed to read from notification socket.
- `ConfException` - Failed to decode or other internal failure.

**See also:** [`DpSnmpNotifier`](DpSnmpNotifier.md#cls-DpSnmpNotifier)

### createSnmpNotifier(String, String, Object, Socket) <a href="#m-createSnmpNotifier-666167fa4e78" id="m-createSnmpNotifier-666167fa4e78"></a>

```java
public com.tailf.dp.DpSnmpNotifier createSnmpNotifier(
    String notifyName,
    String contextName,
    Object informCb,
    java.net.Socket socket
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [DpSnmpNotifier](DpSnmpNotifier.md#cls-DpSnmpNotifier), [ConfException](../conf/ConfException.md#cls-ConfException)

Creates (and registers) a SNMP Notifier see [`DpSnmpNotifier`](DpSnmpNotifier.md#cls-DpSnmpNotifier).

**Parameters**

- `String notifyName` - a name uniquely identifying the SNMP notifier.
- `String contextName` - the SNMP context.
- `Object informCb` - the callback to be called for Inform Responses.
- `java.net.Socket socket` - socket to be used by [`DpSnmpNotifier`](DpSnmpNotifier.md#cls-DpSnmpNotifier) as
 worker socket.

**Throws**

- `IOException` - Failed to read from notification socket.
- `ConfException` - Failed to decode or other internal failure.

**See also:** [`DpSnmpNotifier`](DpSnmpNotifier.md#cls-DpSnmpNotifier)

### freeWorkerSocket(DpTrans) <a href="#m-freeWorkerSocket-7fceeb5a23c4" id="m-freeWorkerSocket-7fceeb5a23c4"></a>

```java
protected synchronized void freeWorkerSocket(com.tailf.dp.DpTrans trans)
```

Types: [DpTrans](DpTrans.md#cls-DpTrans)

Free up a worker socket, for use on other Transaction.

**Parameters**

- `com.tailf.dp.DpTrans trans`

### getActionCallback(String) <a href="#m-getActionCallback-1afe38accd25" id="m-getActionCallback-1afe38accd25"></a>

**Package-private**

```java
com.tailf.dp.DpActionCallback getActionCallback(String point) throws com.tailf.dp.DpException
```

Types: [DpActionCallback](DpActionCallback.md#cls-DpActionCallback), [DpException](DpException.md#cls-DpException)

Find the action callback for a callpoint.

**Parameters**

- `String point` - An action point name

### getActionCallback(String, int) <a href="#m-getActionCallback-80fd3aa41080" id="m-getActionCallback-80fd3aa41080"></a>

**Package-private**

```java
com.tailf.dp.DpActionCallback getActionCallback(
    String point,
    int index
)
    throws com.tailf.dp.DpException
```

Types: [DpActionCallback](DpActionCallback.md#cls-DpActionCallback), [DpException](DpException.md#cls-DpException)

Find the action callback for a callpoint.

**Parameters**

- `String point` - An action point name
- `int index` - Index for position in actionpoint array

### getCtrlSocket() <a href="#m-getCtrlSocket-bb621326ae1c" id="m-getCtrlSocket-bb621326ae1c"></a>

```java
public java.net.Socket getCtrlSocket()
```

The control socket which is connected to ConfD/NCS.

**Returns:** Socket the control socket

### getDaemonId() <a href="#m-getDaemonId-289be546ab2e" id="m-getDaemonId-289be546ab2e"></a>

```java
public int getDaemonId()
```

The daemon identifier (assigned by ConfD/NCS).

**Returns:** int daemon identifier

### getDataCallback(ConfBuf, int) <a href="#m-getDataCallback-41b5ab75fca5" id="m-getDataCallback-41b5ab75fca5"></a>

```java
protected com.tailf.dp.DpDataCallback getDataCallback(
    com.tailf.conf.ConfBuf callpoint,
    int index
)
    throws com.tailf.dp.DpException
```

Types: [DpDataCallback](DpDataCallback.md#cls-DpDataCallback), [ConfBuf](../conf/ConfBuf.md#cls-ConfBuf), [DpException](DpException.md#cls-DpException)

Get the registered data callback with specified name and at index.

**Parameters**

- `com.tailf.conf.ConfBuf callpoint` - The name of the callpoint
- `int index` - The index of callpoint

### getDbCallback() <a href="#m-getDbCallback-bd46dc259b1a" id="m-getDbCallback-bd46dc259b1a"></a>

**Package-private**

```java
com.tailf.dp.DpDbCallback getDbCallback() throws com.tailf.dp.DpException
```

Types: [DpDbCallback](DpDbCallback.md#cls-DpDbCallback), [DpException](DpException.md#cls-DpException)

Gets the registered db callback.

### getErrorMessageFormatter() <a href="#m-getErrorMessageFormatter-8c75ba6f07e5" id="m-getErrorMessageFormatter-8c75ba6f07e5"></a>

```java
public com.tailf.conf.ErrorMessageFormatter getErrorMessageFormatter()
```

Types: [ErrorMessageFormatter](../conf/ErrorMessageFormatter.md#cls-ErrorMessageFormatter)

Return the errorMessageFormatter for this Dp.

**Returns:** the ErrorMessageFormatter for this Dp.

### getErrorVerbosity() <a href="#m-getErrorVerbosity-defe49ca237d" id="m-getErrorVerbosity-defe49ca237d"></a>

```java
public com.tailf.conf.ErrorVerbosity getErrorVerbosity()
```

Types: [ErrorVerbosity](../conf/ErrorVerbosity.md#cls-ErrorVerbosity)

Get the local verbosity level for reported errors
 If this verbosity is null the the default level governs the error
 verbosity of this Dp

**Returns:** the current errorVerbosity for this Dp

### getExceptionReporter() <a href="#m-getExceptionReporter-51bbec6b9ad7" id="m-getExceptionReporter-51bbec6b9ad7"></a>

```java
public com.tailf.dp.DpExceptionReporter getExceptionReporter()
```

Types: [DpExceptionReporter](DpExceptionReporter.md#cls-DpExceptionReporter)

### getNanoServiceCallback(ConfBuf, int) <a href="#m-getNanoServiceCallback-84fe7cc27c9e" id="m-getNanoServiceCallback-84fe7cc27c9e"></a>

```java
protected com.tailf.dp.DpNanoServiceCallback getNanoServiceCallback(
    com.tailf.conf.ConfBuf servicepoint,
    int index
)
    throws com.tailf.dp.DpException
```

Types: [DpNanoServiceCallback](DpNanoServiceCallback.md#cls-DpNanoServiceCallback), [ConfBuf](../conf/ConfBuf.md#cls-ConfBuf), [DpException](DpException.md#cls-DpException)

**Parameters**

- `com.tailf.conf.ConfBuf servicepoint`
- `int index`

### getNsList() <a href="#m-getNsList-0345f486e876" id="m-getNsList-0345f486e876"></a>

```java
public java.util.ArrayList<com.tailf.conf.ConfNamespace> getNsList()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

Get a list of the installed namespaces. The namespace list
 is needed, for example, when creating an object ref.

### getServiceCallback(ConfBuf, int) <a href="#m-getServiceCallback-3eeb502a337a" id="m-getServiceCallback-3eeb502a337a"></a>

```java
protected com.tailf.dp.DpServiceCallback getServiceCallback(
    com.tailf.conf.ConfBuf servicepoint,
    int index
)
    throws com.tailf.dp.DpException
```

Types: [DpServiceCallback](DpServiceCallback.md#cls-DpServiceCallback), [ConfBuf](../conf/ConfBuf.md#cls-ConfBuf), [DpException](DpException.md#cls-DpException)

Get the registered service callback with specified name and at index.

**Parameters**

- `com.tailf.conf.ConfBuf servicepoint` - The name of the servicepoint
- `int index` - The index of servicepoint

### getServicePointMaapi() <a href="#m-getServicePointMaapi-021836eac222" id="m-getServicePointMaapi-021836eac222"></a>

```java
public com.tailf.maapi.Maapi getServicePointMaapi() throws java.io.IOException, com.tailf.conf.ConfException
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [ConfException](../conf/ConfException.md#cls-ConfException)

### getServicePointMaapi(DpTrans) <a href="#m-getServicePointMaapi-16637fd1c239" id="m-getServicePointMaapi-16637fd1c239"></a>

```java
public synchronized com.tailf.maapi.Maapi getServicePointMaapi(
    com.tailf.dp.DpTrans trans
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [DpTrans](DpTrans.md#cls-DpTrans), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

### getTransCallback() <a href="#m-getTransCallback-7890d71f94df" id="m-getTransCallback-7890d71f94df"></a>

**Package-private**

```java
com.tailf.dp.DpTransCallback getTransCallback() throws com.tailf.dp.DpException
```

Types: [DpTransCallback](DpTransCallback.md#cls-DpTransCallback), [DpException](DpException.md#cls-DpException)

Get the registered transaction callback.

### getTransValidateCallback() <a href="#m-getTransValidateCallback-0eaee07d8d43" id="m-getTransValidateCallback-0eaee07d8d43"></a>

**Package-private**

```java
com.tailf.dp.DpTransValidateCallback getTransValidateCallback() throws com.tailf.dp.DpException
```

Types: [DpTransValidateCallback](DpTransValidateCallback.md#cls-DpTransValidateCallback), [DpException](DpException.md#cls-DpException)

Get the registered transaction validate callback.

### getUserInfo(int) <a href="#m-getUserInfo-4df0372acaa8" id="m-getUserInfo-4df0372acaa8"></a>

```java
public com.tailf.dp.DpUserInfo getUserInfo(int usid)
```

Types: [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)

Retrieves the user information.

**Parameters**

- `int usid` - User identifier

### getValpointCallback(ConfBuf, int) <a href="#m-getValpointCallback-5f5550918feb" id="m-getValpointCallback-5f5550918feb"></a>

**Package-private**

```java
com.tailf.dp.DpValpointCallback getValpointCallback(
    com.tailf.conf.ConfBuf point,
    int index
)
    throws com.tailf.dp.DpException
```

Types: [DpValpointCallback](DpValpointCallback.md#cls-DpValpointCallback), [ConfBuf](../conf/ConfBuf.md#cls-ConfBuf), [DpException](DpException.md#cls-DpException)

Finds the valpoint callback.

**Parameters**

- `com.tailf.conf.ConfBuf point` - A valpoint name
- `int index` - Index for position in valpoint array

### getWorkerPool() <a href="#m-getWorkerPool-1955a0c55497" id="m-getWorkerPool-1955a0c55497"></a>

```java
public java.util.concurrent.ThreadPoolExecutor getWorkerPool()
```

Get current WorkerThreadPool

**Returns:** WorkerThreadPool

### getWorkerSocketFd(Socket) <a href="#m-getWorkerSocketFd-fca29bd0a7bf" id="m-getWorkerSocketFd-fca29bd0a7bf"></a>

```java
protected synchronized Integer getWorkerSocketFd(java.net.Socket workerSocket)
```

Get the internal fd of a worker socket

**Parameters**

- `java.net.Socket workerSocket`

### read() <a href="#m-read-b28b830b98d6" id="m-read-b28b830b98d6"></a>

```java
public void read() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Receives data on the control socket which is connected to ConfD/NCS.
 Performs a blocking read. If a socket timeout value has been configured
 for the control socket, this method will (eventually) throw a
 SocketTimeoutException which the caller must handle.

**Throws**

- `ConfException` - Failed to decode.
- `SocketTimeoutException` - The control socket timed out.
- `IOException` - Failed to read from control socket.

### registerAnnotatedCallbacks(Object) <a href="#m-registerAnnotatedCallbacks-ffaebadbfc42" id="m-registerAnnotatedCallbacks-ffaebadbfc42"></a>

```java
public void registerAnnotatedCallbacks(Object obj) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#cls-DpException)

All Data, Trans, Action, Validate, TransValidate and DB callbacks
 are registered using this method.
 The callback is any class having annotated callback methods.
 All annotated methods with correct signature
 are registered. The method name is arbitrary.


 Example of a DataCallback:


```
 final class cbDataDemo {
    DataCallback(callPoint="abc", callType=DataCBType.ITERATOR)
    public IteratorObject abc(DpTrans trans, ConfObject[] kp) {
        // Change this to the real implementation
        return null;
    }

    DataCallback(callPoint="abc", callType=DataCBType.GET_NEXT)
    public ConfKey getKey(DpTrans trans, ConfObject[] kp, Object obj) {
        // Change this to the real implementation
        return null;
    }
    // And so on ...
 }
```



 The respective annotations are


- DataCallback
- TransCallback
- ActionCallback
- ValidateCallback
- TransValidateCallback
- DBCallback
- AuthCallback
- ServiceCallback



 The callType defines the callback method and each
 annotation has an Enum of legal values


- [`DataCBType`](proto/DataCBType.md#cls-DataCBType)
- [`TransCBType`](proto/TransCBType.md#cls-TransCBType)
- [`ActionCBType`](proto/ActionCBType.md#cls-ActionCBType)
- [`ValidateCBType`](proto/ValidateCBType.md#cls-ValidateCBType)
- [`TransValidateCBType`](proto/TransValidateCBType.md#cls-TransValidateCBType)
- [`DBCBType`](proto/DBCBType.md#cls-DBCBType)
- [`AuthCBType`](proto/AuthCBType.md#cls-AuthCBType)
- [`ServiceCBType`](proto/ServiceCBType.md#cls-ServiceCBType)

**Parameters**

- `Object obj` - object to register as callback

**Throws**

- `DpException`

### registerAnnotatedCallbacks(String, Object) <a href="#m-registerAnnotatedCallbacks-e4aab67443c6" id="m-registerAnnotatedCallbacks-e4aab67443c6"></a>

```java
public void registerAnnotatedCallbacks(String mountId, Object obj) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#cls-DpException)

**Parameters**

- `String mountId`
- `Object obj`

### registerAnnotatedMountedCbs(DpMountIdInterface, Object) <a href="#m-registerAnnotatedMountedCbs-5bdf889f0774" id="m-registerAnnotatedMountedCbs-5bdf889f0774"></a>

```java
public void registerAnnotatedMountedCbs(
    com.tailf.dp.DpMountIdInterface mountIdMethod,
    Object obj
)
    throws com.tailf.dp.DpException
```

Types: [DpMountIdInterface](DpMountIdInterface.md#cls-DpMountIdInterface), [DpException](DpException.md#cls-DpException)

**Parameters**

- `com.tailf.dp.DpMountIdInterface mountIdMethod`
- `Object obj`

### registerAnnotatedRangeActionCallbacks(Object, ConfValue[], ConfValue[], ConfPath) <a href="#m-registerAnnotatedRangeActionCallbacks-9933fdc875d2" id="m-registerAnnotatedRangeActionCallbacks-9933fdc875d2"></a>

```java
public void registerAnnotatedRangeActionCallbacks(
    Object obj,
    com.tailf.conf.ConfValue[] lower,
    com.tailf.conf.ConfValue[] higher,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.dp.DpException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [DpException](DpException.md#cls-DpException)

**Parameters**

- `Object obj`
- `com.tailf.conf.ConfValue[] lower`
- `com.tailf.conf.ConfValue[] higher`
- `com.tailf.conf.ConfPath path`

### registerAnnotatedRangeDataCallbacks(Object, ConfValue[], ConfValue[], ConfPath) <a href="#m-registerAnnotatedRangeDataCallbacks-7df2c3b86ab4" id="m-registerAnnotatedRangeDataCallbacks-7df2c3b86ab4"></a>

```java
public void registerAnnotatedRangeDataCallbacks(
    Object obj,
    com.tailf.conf.ConfValue[] lower,
    com.tailf.conf.ConfValue[] higher,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.dp.DpException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [DpException](DpException.md#cls-DpException)

DataCallbacks can be registered for a range of values using this method

**Parameters**

- `Object obj` - object to register as callback
- `com.tailf.conf.ConfValue[] lower` - Array of lower bound key values
- `com.tailf.conf.ConfValue[] higher` - Array of higher bound key values
- `com.tailf.conf.ConfPath path` - A path

**Throws**

- `DpException` - Failed to register range data callback.

### registerDone() <a href="#m-registerDone-a7e6840dacc7" id="m-registerDone-a7e6840dacc7"></a>

```java
public void registerDone() throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#cls-DpException)

When we have registered all the callbacks for a daemon
 we must call this function to synchronize with ConfD/NCS.
 No callbacks will be invoked until it has been called,
 and after the call, no further registrations are allowed.

**Throws**

- `DpException` - Failed with registerDone()

### removeActionMaapi() <a href="#m-removeActionMaapi-ed4fc28fd600" id="m-removeActionMaapi-ed4fc28fd600"></a>

```java
public void removeActionMaapi()
```

### reRegisterAnnotatedCallbacks(Object) <a href="#m-reRegisterAnnotatedCallbacks-02241c7e25b1" id="m-reRegisterAnnotatedCallbacks-02241c7e25b1"></a>

```java
public void reRegisterAnnotatedCallbacks(Object obj) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#cls-DpException)

reRegisters an existing callback.
 This implies that the current callback is exchanged
 If the current callback is not existing this is an noop

**Parameters**

- `Object obj`

**Throws**

- `DpException`

### reRegisterAnnotatedCallbacks(String, Object) <a href="#m-reRegisterAnnotatedCallbacks-3db30c25ecf8" id="m-reRegisterAnnotatedCallbacks-3db30c25ecf8"></a>

```java
public void reRegisterAnnotatedCallbacks(String mountId, Object obj) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#cls-DpException)

**Parameters**

- `String mountId`
- `Object obj`

### reRegisterAnnotatedMountedCbs(DpMountIdInterface, Object) <a href="#m-reRegisterAnnotatedMountedCbs-aafebd57912a" id="m-reRegisterAnnotatedMountedCbs-aafebd57912a"></a>

```java
public void reRegisterAnnotatedMountedCbs(
    com.tailf.dp.DpMountIdInterface mountIdMethod,
    Object obj
)
    throws com.tailf.dp.DpException
```

Types: [DpMountIdInterface](DpMountIdInterface.md#cls-DpMountIdInterface), [DpException](DpException.md#cls-DpException)

**Parameters**

- `com.tailf.dp.DpMountIdInterface mountIdMethod`
- `Object obj`

### reRegisterAnnotatedRangeActionCallbacks(Object) <a href="#m-reRegisterAnnotatedRangeActionCallbacks-11af42e45a53" id="m-reRegisterAnnotatedRangeActionCallbacks-11af42e45a53"></a>

```java
public void reRegisterAnnotatedRangeActionCallbacks(Object obj) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#cls-DpException)

reRegisters an existing callback.
 This implies that the current callback is exchanged
 If the current callback is not existing this is an noop
 Note that the range cannot be changed and can therefore not be supplied
 in this call

**Parameters**

- `Object obj`

**Throws**

- `DpException`

### reRegisterAnnotatedRangeDataCallbacks(Object) <a href="#m-reRegisterAnnotatedRangeDataCallbacks-35f84233e42f" id="m-reRegisterAnnotatedRangeDataCallbacks-35f84233e42f"></a>

```java
public void reRegisterAnnotatedRangeDataCallbacks(Object obj) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#cls-DpException)

reRegisters an existing callback.
 This implies that the current callback is exchanged
 If the current callback is not existing this is an noop
 Note that the range cannot be changed and can therefore not be supplied
 in this call

**Parameters**

- `Object obj`

**Throws**

- `DpException`

### runWithSocket(DpTrans, DpWork, Socket) <a href="#m-runWithSocket-c07b7acd0039" id="m-runWithSocket-c07b7acd0039"></a>

**Package-private**

```java
java.net.Socket runWithSocket(
    com.tailf.dp.DpTrans dp,
    com.tailf.dp.Dp.DpWork dpWork,
    java.net.Socket socket
)
    throws Throwable
```

Types: [DpTrans](DpTrans.md#cls-DpTrans), [DpWork](Dp/DpWork.md#cls-DpWork)

The purpose of this method is to make sure the socket is still connected
 to ConfD/NCS before executing the callback.

 If the socket is disconnected, remove the socket from the pool and
 allocate a new socket that is connected to ConfD/NCS for the callback.

**Parameters**

- `com.tailf.dp.DpTrans dp`
- `com.tailf.dp.Dp.DpWork dpWork`
- `java.net.Socket socket`

### setErrorVerbosity(ErrorVerbosity) <a href="#m-setErrorVerbosity-bab7950e55c8" id="m-setErrorVerbosity-bab7950e55c8"></a>

```java
public void setErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](../conf/ErrorVerbosity.md#cls-ErrorVerbosity)

set the local verbosity level for reported errors
 If this verbosity is set to null the the default level governs the error
 verbosity of this Dp

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity`

### setExceptionReporter(DpExceptionReporter) <a href="#m-setExceptionReporter-d521ed21a6eb" id="m-setExceptionReporter-d521ed21a6eb"></a>

```java
public void setExceptionReporter(com.tailf.dp.DpExceptionReporter exReporter)
```

Types: [DpExceptionReporter](DpExceptionReporter.md#cls-DpExceptionReporter)

**Parameters**

- `com.tailf.dp.DpExceptionReporter exReporter`

### setNumFreeWorkerSockets(int) <a href="#m-setNumFreeWorkerSockets-1a22360e3897" id="m-setNumFreeWorkerSockets-1a22360e3897"></a>

```java
public synchronized void setNumFreeWorkerSockets(int numSockets)
```

This method is used to control the number of workersockets that
 should be keept open for reuse.
 This can be used for tuning purposes, normally this should not be
 necessary.
 The default number of open sockets are 4.

 Negative values for numSockets are threated as 0.

**Parameters**

- `int numSockets` - number of sockets.

### setRejectedExecutionHandler(RejectedExecutionHandler) <a href="#m-setRejectedExecutionHandler-8f7288278e17" id="m-setRejectedExecutionHandler-8f7288278e17"></a>

**Package-private**

```java
void setRejectedExecutionHandler(java.util.concurrent.RejectedExecutionHandler handler)
```

**Parameters**

- `java.util.concurrent.RejectedExecutionHandler handler`

### shutDownThreadPool() <a href="#m-shutDownThreadPool-21f99643e601" id="m-shutDownThreadPool-21f99643e601"></a>

```java
public void shutDownThreadPool()
```

Initiates an orderly shutdown in which previously
 transactions are executed, but no new transactions
 will be accepted.

### shutDownThreadPoolNow() <a href="#m-shutDownThreadPoolNow-ad8e642d6ab4" id="m-shutDownThreadPoolNow-ad8e642d6ab4"></a>

```java
public int shutDownThreadPoolNow()
```

Attempts to stop all actively executing transactions,
 halts the processing of waiting transactions, and returns number
 of the tasks that were awaiting execution.

**Returns:** - Number of awaiting transactions that was not executed.


## Nested Types

- [DpWork](Dp/DpWork.md#cls-DpWork)
