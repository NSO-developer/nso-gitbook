<a id="cls-Dp"></a>
# Dp

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

- [Dp(String, Socket)](#m-dp-7585811d2823)
- [Dp(String, Socket, boolean)](#m-dp-a5bd6c16fcf6)
- [Dp(String, Socket, boolean, int, int, long, TimeUnit, BlockingQueue<Runnable>, boolean)](#m-dp-c0bd46f94119)

**Fields**:

- [DATA_REPLY_ERROR](#m-DATA_REPLY_ERROR)
- [DATA_REPLY_OK](#m-DATA_REPLY_OK)
- [DATA_REPLY_VALUE](#m-DATA_REPLY_VALUE)
- [workerThreadPool](#m-workerThreadPool)

**Methods**:

- [allocWorkerSocket(DpTrans)](#m-allocworkersocket-174516f00d50)
- [allocWorkerSocket(DpTrans, Socket)](#m-allocworkersocket-f2a88a81642d)
- [close()](#m-close-8107c6dc012b)
- [closeWorkerSocket(DpTrans)](#m-closeworkersocket-dc01a44ce016)
- [connectWorkerSocket(Socket, int)](#m-connectworkersocket-c43c1ab09de8)
- [createNotifStream(String)](#m-createnotifstream-e828f1b79ea0)
- [createNotifStream(String, DpNotifReplayCallback)](#m-createnotifstream-e4dac93288ec)
- [createNotifStream(String, DpNotifReplayCallback, Socket)](#m-createnotifstream-24ebe812b6ae)
- [createSnmpNotifier(String, String)](#m-createsnmpnotifier-e1bab2519dcd)
- [createSnmpNotifier(String, String, Object)](#m-createsnmpnotifier-89f0d186fc8f)
- [createSnmpNotifier(String, String, Object, Socket)](#m-createsnmpnotifier-666167fa4e78)
- [freeWorkerSocket(DpTrans)](#m-freeworkersocket-7fceeb5a23c4)
- [getActionCallback(String)](#m-getactioncallback-1afe38accd25)
- [getActionCallback(String, int)](#m-getactioncallback-80fd3aa41080)
- [getCtrlSocket()](#m-getctrlsocket-bb621326ae1c)
- [getDaemonId()](#m-getdaemonid-289be546ab2e)
- [getDataCallback(ConfBuf, int)](#m-getdatacallback-41b5ab75fca5)
- [getDbCallback()](#m-getdbcallback-bd46dc259b1a)
- [getErrorMessageFormatter()](#m-geterrormessageformatter-8c75ba6f07e5)
- [getErrorVerbosity()](#m-geterrorverbosity-defe49ca237d)
- [getExceptionReporter()](#m-getexceptionreporter-51bbec6b9ad7)
- [getNanoServiceCallback(ConfBuf, int)](#m-getnanoservicecallback-84fe7cc27c9e)
- [getNsList()](#m-getnslist-0345f486e876)
- [getServiceCallback(ConfBuf, int)](#m-getservicecallback-3eeb502a337a)
- [getServicePointMaapi()](#m-getservicepointmaapi-021836eac222)
- [getServicePointMaapi(DpTrans)](#m-getservicepointmaapi-16637fd1c239)
- [getTransCallback()](#m-gettranscallback-7890d71f94df)
- [getTransValidateCallback()](#m-gettransvalidatecallback-0eaee07d8d43)
- [getUserInfo(int)](#m-getuserinfo-4df0372acaa8)
- [getValpointCallback(ConfBuf, int)](#m-getvalpointcallback-5f5550918feb)
- [getWorkerPool()](#m-getworkerpool-1955a0c55497)
- [getWorkerSocketFd(Socket)](#m-getworkersocketfd-fca29bd0a7bf)
- [read()](#m-read-b28b830b98d6)
- [registerAnnotatedCallbacks(Object)](#m-registerannotatedcallbacks-ffaebadbfc42)
- [registerAnnotatedCallbacks(String, Object)](#m-registerannotatedcallbacks-e4aab67443c6)
- [registerAnnotatedMountedCbs(DpMountIdInterface, Object)](#m-registerannotatedmountedcbs-5bdf889f0774)
- [registerAnnotatedRangeActionCallbacks(Object, ConfValue[], ConfValue[], ConfPath)](#m-registerannotatedrangeactioncallbacks-9933fdc875d2)
- [registerAnnotatedRangeDataCallbacks(Object, ConfValue[], ConfValue[], ConfPath)](#m-registerannotatedrangedatacallbacks-7df2c3b86ab4)
- [registerDone()](#m-registerdone-a7e6840dacc7)
- [removeActionMaapi()](#m-removeactionmaapi-ed4fc28fd600)
- [reRegisterAnnotatedCallbacks(Object)](#m-reregisterannotatedcallbacks-02241c7e25b1)
- [reRegisterAnnotatedCallbacks(String, Object)](#m-reregisterannotatedcallbacks-3db30c25ecf8)
- [reRegisterAnnotatedMountedCbs(DpMountIdInterface, Object)](#m-reregisterannotatedmountedcbs-aafebd57912a)
- [reRegisterAnnotatedRangeActionCallbacks(Object)](#m-reregisterannotatedrangeactioncallbacks-11af42e45a53)
- [reRegisterAnnotatedRangeDataCallbacks(Object)](#m-reregisterannotatedrangedatacallbacks-35f84233e42f)
- [runWithSocket(DpTrans, DpWork, Socket)](#m-runwithsocket-c07b7acd0039)
- [setErrorVerbosity(ErrorVerbosity)](#m-seterrorverbosity-bab7950e55c8)
- [setExceptionReporter(DpExceptionReporter)](#m-setexceptionreporter-d521ed21a6eb)
- [setNumFreeWorkerSockets(int)](#m-setnumfreeworkersockets-1a22360e3897)
- [setRejectedExecutionHandler(RejectedExecutionHandler)](#m-setrejectedexecutionhandler-8f7288278e17)
- [shutDownThreadPool()](#m-shutdownthreadpool-21f99643e601)
- [shutDownThreadPoolNow()](#m-shutdownthreadpoolnow-ad8e642d6ab4)

**Nested Types**:

- [DpWork](Dp/DpWork.md#cls-DpWork)

## Constructors

<a id="m-dp-7585811d2823"></a>
### Dp(String, Socket)

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

<a id="m-dp-a5bd6c16fcf6"></a>
### Dp(String, Socket, boolean)

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

<a id="m-dp-c0bd46f94119"></a>
### Dp(String, Socket, boolean, int, int, long, TimeUnit, BlockingQueue<Runnable>, boolean)

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

<a id="m-DATA_REPLY_ERROR"></a>
### DATA_REPLY_ERROR

**Package-private**

```java
static final int DATA_REPLY_ERROR = 105;
```

<a id="m-DATA_REPLY_OK"></a>
### DATA_REPLY_OK

**Package-private**

```java
static final int DATA_REPLY_OK = 104;
```

<a id="m-DATA_REPLY_VALUE"></a>
### DATA_REPLY_VALUE

**Package-private**

```java
static final int DATA_REPLY_VALUE = 103;
```

<a id="m-workerThreadPool"></a>
### workerThreadPool

```java
protected com.tailf.dp.DpWorkerThreadPool workerThreadPool = null;
```

Types: [DpWorkerThreadPool](DpWorkerThreadPool.md#cls-DpWorkerThreadPool)


## Methods

<a id="m-allocworkersocket-174516f00d50"></a>
### allocWorkerSocket(DpTrans)

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

<a id="m-allocworkersocket-f2a88a81642d"></a>
### allocWorkerSocket(DpTrans, Socket)

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

<a id="m-close-8107c6dc012b"></a>
### close()

```java
public void close()
```

<a id="m-closeworkersocket-dc01a44ce016"></a>
### closeWorkerSocket(DpTrans)

**Package-private**

```java
synchronized void closeWorkerSocket(com.tailf.dp.DpTrans trans)
```

Types: [DpTrans](DpTrans.md#cls-DpTrans)

Close a worker socket and remove from running sockets.

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="m-connectworkersocket-c43c1ab09de8"></a>
### connectWorkerSocket(Socket, int)

**Package-private**

```java
void connectWorkerSocket(java.net.Socket sock, int fd) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#cls-DpException)

Used by allocWorkerSocket() when a new socket is created.

**Parameters**

- `java.net.Socket sock`
- `int fd`

<a id="m-createnotifstream-e828f1b79ea0"></a>
### createNotifStream(String)

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

<a id="m-createnotifstream-e4dac93288ec"></a>
### createNotifStream(String, DpNotifReplayCallback)

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

<a id="m-createnotifstream-24ebe812b6ae"></a>
### createNotifStream(String, DpNotifReplayCallback, Socket)

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

<a id="m-createsnmpnotifier-e1bab2519dcd"></a>
### createSnmpNotifier(String, String)

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

<a id="m-createsnmpnotifier-89f0d186fc8f"></a>
### createSnmpNotifier(String, String, Object)

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

<a id="m-createsnmpnotifier-666167fa4e78"></a>
### createSnmpNotifier(String, String, Object, Socket)

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

<a id="m-freeworkersocket-7fceeb5a23c4"></a>
### freeWorkerSocket(DpTrans)

```java
protected synchronized void freeWorkerSocket(com.tailf.dp.DpTrans trans)
```

Types: [DpTrans](DpTrans.md#cls-DpTrans)

Free up a worker socket, for use on other Transaction.

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="m-getactioncallback-1afe38accd25"></a>
### getActionCallback(String)

**Package-private**

```java
com.tailf.dp.DpActionCallback getActionCallback(String point) throws com.tailf.dp.DpException
```

Types: [DpActionCallback](DpActionCallback.md#cls-DpActionCallback), [DpException](DpException.md#cls-DpException)

Find the action callback for a callpoint.

**Parameters**

- `String point` - An action point name

<a id="m-getactioncallback-80fd3aa41080"></a>
### getActionCallback(String, int)

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

<a id="m-getctrlsocket-bb621326ae1c"></a>
### getCtrlSocket()

```java
public java.net.Socket getCtrlSocket()
```

The control socket which is connected to ConfD/NCS.

**Returns:** Socket the control socket

<a id="m-getdaemonid-289be546ab2e"></a>
### getDaemonId()

```java
public int getDaemonId()
```

The daemon identifier (assigned by ConfD/NCS).

**Returns:** int daemon identifier

<a id="m-getdatacallback-41b5ab75fca5"></a>
### getDataCallback(ConfBuf, int)

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

<a id="m-getdbcallback-bd46dc259b1a"></a>
### getDbCallback()

**Package-private**

```java
com.tailf.dp.DpDbCallback getDbCallback() throws com.tailf.dp.DpException
```

Types: [DpDbCallback](DpDbCallback.md#cls-DpDbCallback), [DpException](DpException.md#cls-DpException)

Gets the registered db callback.

<a id="m-geterrormessageformatter-8c75ba6f07e5"></a>
### getErrorMessageFormatter()

```java
public com.tailf.conf.ErrorMessageFormatter getErrorMessageFormatter()
```

Types: [ErrorMessageFormatter](../conf/ErrorMessageFormatter.md#cls-ErrorMessageFormatter)

Return the errorMessageFormatter for this Dp.

**Returns:** the ErrorMessageFormatter for this Dp.

<a id="m-geterrorverbosity-defe49ca237d"></a>
### getErrorVerbosity()

```java
public com.tailf.conf.ErrorVerbosity getErrorVerbosity()
```

Types: [ErrorVerbosity](../conf/ErrorVerbosity.md#cls-ErrorVerbosity)

Get the local verbosity level for reported errors
 If this verbosity is null the the default level governs the error
 verbosity of this Dp

**Returns:** the current errorVerbosity for this Dp

<a id="m-getexceptionreporter-51bbec6b9ad7"></a>
### getExceptionReporter()

```java
public com.tailf.dp.DpExceptionReporter getExceptionReporter()
```

Types: [DpExceptionReporter](DpExceptionReporter.md#cls-DpExceptionReporter)

<a id="m-getnanoservicecallback-84fe7cc27c9e"></a>
### getNanoServiceCallback(ConfBuf, int)

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

<a id="m-getnslist-0345f486e876"></a>
### getNsList()

```java
public java.util.ArrayList<com.tailf.conf.ConfNamespace> getNsList()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

Get a list of the installed namespaces. The namespace list
 is needed, for example, when creating an object ref.

<a id="m-getservicecallback-3eeb502a337a"></a>
### getServiceCallback(ConfBuf, int)

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

<a id="m-getservicepointmaapi-021836eac222"></a>
### getServicePointMaapi()

```java
public com.tailf.maapi.Maapi getServicePointMaapi() throws java.io.IOException, com.tailf.conf.ConfException
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [ConfException](../conf/ConfException.md#cls-ConfException)

<a id="m-getservicepointmaapi-16637fd1c239"></a>
### getServicePointMaapi(DpTrans)

```java
public synchronized com.tailf.maapi.Maapi getServicePointMaapi(
    com.tailf.dp.DpTrans trans
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [DpTrans](DpTrans.md#cls-DpTrans), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="m-gettranscallback-7890d71f94df"></a>
### getTransCallback()

**Package-private**

```java
com.tailf.dp.DpTransCallback getTransCallback() throws com.tailf.dp.DpException
```

Types: [DpTransCallback](DpTransCallback.md#cls-DpTransCallback), [DpException](DpException.md#cls-DpException)

Get the registered transaction callback.

<a id="m-gettransvalidatecallback-0eaee07d8d43"></a>
### getTransValidateCallback()

**Package-private**

```java
com.tailf.dp.DpTransValidateCallback getTransValidateCallback() throws com.tailf.dp.DpException
```

Types: [DpTransValidateCallback](DpTransValidateCallback.md#cls-DpTransValidateCallback), [DpException](DpException.md#cls-DpException)

Get the registered transaction validate callback.

<a id="m-getuserinfo-4df0372acaa8"></a>
### getUserInfo(int)

```java
public com.tailf.dp.DpUserInfo getUserInfo(int usid)
```

Types: [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)

Retrieves the user information.

**Parameters**

- `int usid` - User identifier

<a id="m-getvalpointcallback-5f5550918feb"></a>
### getValpointCallback(ConfBuf, int)

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

<a id="m-getworkerpool-1955a0c55497"></a>
### getWorkerPool()

```java
public java.util.concurrent.ThreadPoolExecutor getWorkerPool()
```

Get current WorkerThreadPool

**Returns:** WorkerThreadPool

<a id="m-getworkersocketfd-fca29bd0a7bf"></a>
### getWorkerSocketFd(Socket)

```java
protected synchronized Integer getWorkerSocketFd(java.net.Socket workerSocket)
```

Get the internal fd of a worker socket

**Parameters**

- `java.net.Socket workerSocket`

<a id="m-read-b28b830b98d6"></a>
### read()

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

<a id="m-registerannotatedcallbacks-ffaebadbfc42"></a>
### registerAnnotatedCallbacks(Object)

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

<a id="m-registerannotatedcallbacks-e4aab67443c6"></a>
### registerAnnotatedCallbacks(String, Object)

```java
public void registerAnnotatedCallbacks(String mountId, Object obj) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#cls-DpException)

**Parameters**

- `String mountId`
- `Object obj`

<a id="m-registerannotatedmountedcbs-5bdf889f0774"></a>
### registerAnnotatedMountedCbs(DpMountIdInterface, Object)

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

<a id="m-registerannotatedrangeactioncallbacks-9933fdc875d2"></a>
### registerAnnotatedRangeActionCallbacks(Object, ConfValue[], ConfValue[], ConfPath)

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

<a id="m-registerannotatedrangedatacallbacks-7df2c3b86ab4"></a>
### registerAnnotatedRangeDataCallbacks(Object, ConfValue[], ConfValue[], ConfPath)

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

<a id="m-registerdone-a7e6840dacc7"></a>
### registerDone()

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

<a id="m-removeactionmaapi-ed4fc28fd600"></a>
### removeActionMaapi()

```java
public void removeActionMaapi()
```

<a id="m-reregisterannotatedcallbacks-02241c7e25b1"></a>
### reRegisterAnnotatedCallbacks(Object)

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

<a id="m-reregisterannotatedcallbacks-3db30c25ecf8"></a>
### reRegisterAnnotatedCallbacks(String, Object)

```java
public void reRegisterAnnotatedCallbacks(String mountId, Object obj) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#cls-DpException)

**Parameters**

- `String mountId`
- `Object obj`

<a id="m-reregisterannotatedmountedcbs-aafebd57912a"></a>
### reRegisterAnnotatedMountedCbs(DpMountIdInterface, Object)

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

<a id="m-reregisterannotatedrangeactioncallbacks-11af42e45a53"></a>
### reRegisterAnnotatedRangeActionCallbacks(Object)

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

<a id="m-reregisterannotatedrangedatacallbacks-35f84233e42f"></a>
### reRegisterAnnotatedRangeDataCallbacks(Object)

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

<a id="m-runwithsocket-c07b7acd0039"></a>
### runWithSocket(DpTrans, DpWork, Socket)

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

<a id="m-seterrorverbosity-bab7950e55c8"></a>
### setErrorVerbosity(ErrorVerbosity)

```java
public void setErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](../conf/ErrorVerbosity.md#cls-ErrorVerbosity)

set the local verbosity level for reported errors
 If this verbosity is set to null the the default level governs the error
 verbosity of this Dp

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity`

<a id="m-setexceptionreporter-d521ed21a6eb"></a>
### setExceptionReporter(DpExceptionReporter)

```java
public void setExceptionReporter(com.tailf.dp.DpExceptionReporter exReporter)
```

Types: [DpExceptionReporter](DpExceptionReporter.md#cls-DpExceptionReporter)

**Parameters**

- `com.tailf.dp.DpExceptionReporter exReporter`

<a id="m-setnumfreeworkersockets-1a22360e3897"></a>
### setNumFreeWorkerSockets(int)

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

<a id="m-setrejectedexecutionhandler-8f7288278e17"></a>
### setRejectedExecutionHandler(RejectedExecutionHandler)

**Package-private**

```java
void setRejectedExecutionHandler(java.util.concurrent.RejectedExecutionHandler handler)
```

**Parameters**

- `java.util.concurrent.RejectedExecutionHandler handler`

<a id="m-shutdownthreadpool-21f99643e601"></a>
### shutDownThreadPool()

```java
public void shutDownThreadPool()
```

Initiates an orderly shutdown in which previously
 transactions are executed, but no new transactions
 will be accepted.

<a id="m-shutdownthreadpoolnow-ad8e642d6ab4"></a>
### shutDownThreadPoolNow()

```java
public int shutDownThreadPoolNow()
```

Attempts to stop all actively executing transactions,
 halts the processing of waiting transactions, and returns number
 of the tasks that were awaiting execution.

**Returns:** - Number of awaiting transactions that was not executed.


## Nested Types

- [DpWork](Dp/DpWork.md#cls-DpWork)
