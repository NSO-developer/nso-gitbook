<a id="s-Dp"></a>
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

 `Dp` delivers a task ([`DpTrans`](DpTrans.md#s-DpTrans),[`DpValidateTrans`](DpValidateTrans.md#s-DpValidateTrans),
 [`DpActionTrans`](DpActionTrans.md#s-DpActionTrans) to worker threads when requests comes
 from controller socket.
 '
 The worker threads could either wait for task to arrive to them or
 they could be started when needed.  `Dp` provides constructor for
 setting various parameters to tune the behavior of threads pool

**Related classes**

- [NcsDp](../ncs/NcsDp.md#s-NcsDp)

**See also:** `java.util.concurrent.ThreadPoolExecutor,for information how the
 ExecutorService could be configured.`, [`ActionCBType`](proto/ActionCBType.md#s-ActionCBType), [`DBCBType`](proto/DBCBType.md#s-DBCBType), [`DataCBType`](proto/DataCBType.md#s-DataCBType), [`SnmpInformResponseCBType`](proto/SnmpInformResponseCBType.md#s-SnmpInformResponseCBType), [`TransCBType`](proto/TransCBType.md#s-TransCBType), [`TransValidateCBType`](proto/TransValidateCBType.md#s-TransValidateCBType), [`ValidateCBType`](proto/ValidateCBType.md#s-ValidateCBType)

## Members

**Constructors**:

- [Dp(String, Socket)](#s-Dp-1)
- [Dp(String, Socket, boolean)](#s-Dp-2)
- [Dp(String, Socket, boolean, int, int, long, TimeUnit, BlockingQueue<Runnable>, boolean)](#s-Dp-3)

**Fields**:

- [DATA_REPLY_ERROR](#s-DATA_REPLY_ERROR)
- [DATA_REPLY_OK](#s-DATA_REPLY_OK)
- [DATA_REPLY_VALUE](#s-DATA_REPLY_VALUE)
- [workerThreadPool](#s-workerThreadPool)

**Methods**:

- [allocWorkerSocket(DpTrans)](#s-allocWorkerSocket)
- [allocWorkerSocket(DpTrans, Socket)](#s-allocWorkerSocket-1)
- [close()](#s-close)
- [closeWorkerSocket(DpTrans)](#s-closeWorkerSocket)
- [connectWorkerSocket(Socket, int)](#s-connectWorkerSocket)
- [createNotifStream(String)](#s-createNotifStream)
- [createNotifStream(String, DpNotifReplayCallback)](#s-createNotifStream-1)
- [createNotifStream(String, DpNotifReplayCallback, Socket)](#s-createNotifStream-2)
- [createSnmpNotifier(String, String)](#s-createSnmpNotifier)
- [createSnmpNotifier(String, String, Object)](#s-createSnmpNotifier-1)
- [createSnmpNotifier(String, String, Object, Socket)](#s-createSnmpNotifier-2)
- [freeWorkerSocket(DpTrans)](#s-freeWorkerSocket)
- [getActionCallback(String)](#s-getActionCallback)
- [getActionCallback(String, int)](#s-getActionCallback-1)
- [getCtrlSocket()](#s-getCtrlSocket)
- [getDaemonId()](#s-getDaemonId)
- [getDataCallback(ConfBuf, int)](#s-getDataCallback)
- [getDbCallback()](#s-getDbCallback)
- [getErrorMessageFormatter()](#s-getErrorMessageFormatter)
- [getErrorVerbosity()](#s-getErrorVerbosity)
- [getExceptionReporter()](#s-getExceptionReporter)
- [getNanoServiceCallback(ConfBuf, int)](#s-getNanoServiceCallback)
- [getNsList()](#s-getNsList)
- [getServiceCallback(ConfBuf, int)](#s-getServiceCallback)
- [getServicePointMaapi()](#s-getServicePointMaapi)
- [getServicePointMaapi(DpTrans)](#s-getServicePointMaapi-1)
- [getTransCallback()](#s-getTransCallback)
- [getTransValidateCallback()](#s-getTransValidateCallback)
- [getUserInfo(int)](#s-getUserInfo)
- [getValpointCallback(ConfBuf, int)](#s-getValpointCallback)
- [getWorkerPool()](#s-getWorkerPool)
- [getWorkerSocketFd(Socket)](#s-getWorkerSocketFd)
- [read()](#s-read)
- [registerAnnotatedCallbacks(Object)](#s-registerAnnotatedCallbacks)
- [registerAnnotatedCallbacks(String, Object)](#s-registerAnnotatedCallbacks-1)
- [registerAnnotatedMountedCbs(DpMountIdInterface, Object)](#s-registerAnnotatedMountedCbs)
- [registerAnnotatedRangeActionCallbacks(Object, ConfValue[], ConfValue[], ConfPath)](#s-registerAnnotatedRangeActionCallbacks)
- [registerAnnotatedRangeDataCallbacks(Object, ConfValue[], ConfValue[], ConfPath)](#s-registerAnnotatedRangeDataCallbacks)
- [registerDone()](#s-registerDone)
- [removeActionMaapi()](#s-removeActionMaapi)
- [reRegisterAnnotatedCallbacks(Object)](#s-reRegisterAnnotatedCallbacks)
- [reRegisterAnnotatedCallbacks(String, Object)](#s-reRegisterAnnotatedCallbacks-1)
- [reRegisterAnnotatedMountedCbs(DpMountIdInterface, Object)](#s-reRegisterAnnotatedMountedCbs)
- [reRegisterAnnotatedRangeActionCallbacks(Object)](#s-reRegisterAnnotatedRangeActionCallbacks)
- [reRegisterAnnotatedRangeDataCallbacks(Object)](#s-reRegisterAnnotatedRangeDataCallbacks)
- [runWithSocket(DpTrans, DpWork, Socket)](#s-runWithSocket)
- [setErrorVerbosity(ErrorVerbosity)](#s-setErrorVerbosity)
- [setExceptionReporter(DpExceptionReporter)](#s-setExceptionReporter)
- [setNumFreeWorkerSockets(int)](#s-setNumFreeWorkerSockets)
- [setRejectedExecutionHandler(RejectedExecutionHandler)](#s-setRejectedExecutionHandler)
- [shutDownThreadPool()](#s-shutDownThreadPool)
- [shutDownThreadPoolNow()](#s-shutDownThreadPoolNow)

**Nested Types**:

- [DpWork](Dp/DpWork.md#s-DpWork)

## Constructors

<a id="s-Dp-1"></a>
### Dp(String, Socket)

```java
public Dp(
    String name,
    java.net.Socket socket
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-Dp-2"></a>
### Dp(String, Socket, boolean)

```java
public Dp(
    String name,
    java.net.Socket ctrlSocket,
    boolean isNcs
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-Dp-3"></a>
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

Types: [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-DATA_REPLY_ERROR"></a>
### DATA_REPLY_ERROR

**Package-private**

```java
static final int DATA_REPLY_ERROR = 105;
```

<a id="s-DATA_REPLY_OK"></a>
### DATA_REPLY_OK

**Package-private**

```java
static final int DATA_REPLY_OK = 104;
```

<a id="s-DATA_REPLY_VALUE"></a>
### DATA_REPLY_VALUE

**Package-private**

```java
static final int DATA_REPLY_VALUE = 103;
```

<a id="s-workerThreadPool"></a>
### workerThreadPool

```java
protected com.tailf.dp.DpWorkerThreadPool workerThreadPool = null;
```

Types: [DpWorkerThreadPool](DpWorkerThreadPool.md#s-DpWorkerThreadPool)


## Methods

<a id="s-allocWorkerSocket"></a>
### allocWorkerSocket(DpTrans)

**Package-private**

```java
synchronized java.net.Socket allocWorkerSocket(
    com.tailf.dp.DpTrans trans
)
    throws com.tailf.dp.DpException, java.io.IOException
```

Types: [DpTrans](DpTrans.md#s-DpTrans), [DpException](DpException.md#s-DpException)

Allocate a new worker socket from a pool of open sockets.
 The returned socket is connected to ConfD/NCS.

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="s-allocWorkerSocket-1"></a>
### allocWorkerSocket(DpTrans, Socket)

**Package-private**

```java
synchronized java.net.Socket allocWorkerSocket(
    com.tailf.dp.DpTrans trans,
    java.net.Socket workerSocket
)
    throws com.tailf.dp.DpException
```

Types: [DpTrans](DpTrans.md#s-DpTrans), [DpException](DpException.md#s-DpException)

This method is invoked from setSocket when user provides his own
 Socket. In this case we still need to make a fake file descriptor.

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `java.net.Socket workerSocket`

<a id="s-close"></a>
### close()

```java
public void close()
```

<a id="s-closeWorkerSocket"></a>
### closeWorkerSocket(DpTrans)

**Package-private**

```java
synchronized void closeWorkerSocket(com.tailf.dp.DpTrans trans)
```

Types: [DpTrans](DpTrans.md#s-DpTrans)

Close a worker socket and remove from running sockets.

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="s-connectWorkerSocket"></a>
### connectWorkerSocket(Socket, int)

**Package-private**

```java
void connectWorkerSocket(java.net.Socket sock, int fd) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#s-DpException)

Used by allocWorkerSocket() when a new socket is created.

**Parameters**

- `java.net.Socket sock`
- `int fd`

<a id="s-createNotifStream"></a>
### createNotifStream(String)

```java
public com.tailf.dp.DpNotifStream createNotifStream(
    String name
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [DpNotifStream](DpNotifStream.md#s-DpNotifStream), [ConfException](../conf/ConfException.md#s-ConfException)

Creates (and registers) a notifications stream with ConfD/NCS.
 This can be used for
 sending notifications to ConfD/NCS.

**Parameters**

- `String name` - A name that uniquely identifies the notification stream

**Throws**

- `DpCallbackException` - Callback method failed.
- `IOException` - Failed to read from notification socket.
- `ConfException` - Failed to decode or other internal failure.

**See also:** [`DpNotifStream`](DpNotifStream.md#s-DpNotifStream)

<a id="s-createNotifStream-1"></a>
### createNotifStream(String, DpNotifReplayCallback)

```java
public com.tailf.dp.DpNotifStream createNotifStream(
    String name,
    com.tailf.dp.DpNotifReplayCallback replayCb
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [DpNotifStream](DpNotifStream.md#s-DpNotifStream), [DpNotifReplayCallback](DpNotifReplayCallback.md#s-DpNotifReplayCallback), [ConfException](../conf/ConfException.md#s-ConfException)

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

**See also:** [`DpNotifStream`](DpNotifStream.md#s-DpNotifStream)

<a id="s-createNotifStream-2"></a>
### createNotifStream(String, DpNotifReplayCallback, Socket)

```java
public com.tailf.dp.DpNotifStream createNotifStream(
    String name,
    com.tailf.dp.DpNotifReplayCallback replayCb,
    java.net.Socket socket
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [DpNotifStream](DpNotifStream.md#s-DpNotifStream), [DpNotifReplayCallback](DpNotifReplayCallback.md#s-DpNotifReplayCallback), [ConfException](../conf/ConfException.md#s-ConfException)

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

**See also:** [`DpNotifStream`](DpNotifStream.md#s-DpNotifStream)

<a id="s-createSnmpNotifier"></a>
### createSnmpNotifier(String, String)

```java
public com.tailf.dp.DpSnmpNotifier createSnmpNotifier(
    String name,
    String contextName
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [DpSnmpNotifier](DpSnmpNotifier.md#s-DpSnmpNotifier), [ConfException](../conf/ConfException.md#s-ConfException)

Creates (and registers) a SNMP Notifer @see [`DpSnmpNotifier`](DpSnmpNotifier.md#s-DpSnmpNotifier).

**Parameters**

- `String name` - a name uniquely identifying the SNMP notifier.
- `String contextName` - the SNMP context.

**Throws**

- `IOException` - Failed to read from notification socket.
- `ConfException` - Failed to decode or other internal failure.

**See also:** [`DpSnmpNotifier`](DpSnmpNotifier.md#s-DpSnmpNotifier)

<a id="s-createSnmpNotifier-1"></a>
### createSnmpNotifier(String, String, Object)

```java
public com.tailf.dp.DpSnmpNotifier createSnmpNotifier(
    String notifyName,
    String contextName,
    Object informCb
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [DpSnmpNotifier](DpSnmpNotifier.md#s-DpSnmpNotifier), [ConfException](../conf/ConfException.md#s-ConfException)

Creates (and registers) a SNMP Notifier @see [`DpSnmpNotifier`](DpSnmpNotifier.md#s-DpSnmpNotifier).

**Parameters**

- `String notifyName` - a name uniquely identifying the SNMP notifier.
- `String contextName` - the SNMP context.
- `Object informCb` - the callback to be called for Inform Responses.

**Throws**

- `IOException` - Failed to read from notification socket.
- `ConfException` - Failed to decode or other internal failure.

**See also:** [`DpSnmpNotifier`](DpSnmpNotifier.md#s-DpSnmpNotifier)

<a id="s-createSnmpNotifier-2"></a>
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

Types: [DpSnmpNotifier](DpSnmpNotifier.md#s-DpSnmpNotifier), [ConfException](../conf/ConfException.md#s-ConfException)

Creates (and registers) a SNMP Notifier see [`DpSnmpNotifier`](DpSnmpNotifier.md#s-DpSnmpNotifier).

**Parameters**

- `String notifyName` - a name uniquely identifying the SNMP notifier.
- `String contextName` - the SNMP context.
- `Object informCb` - the callback to be called for Inform Responses.
- `java.net.Socket socket` - socket to be used by [`DpSnmpNotifier`](DpSnmpNotifier.md#s-DpSnmpNotifier) as
 worker socket.

**Throws**

- `IOException` - Failed to read from notification socket.
- `ConfException` - Failed to decode or other internal failure.

**See also:** [`DpSnmpNotifier`](DpSnmpNotifier.md#s-DpSnmpNotifier)

<a id="s-freeWorkerSocket"></a>
### freeWorkerSocket(DpTrans)

```java
protected synchronized void freeWorkerSocket(com.tailf.dp.DpTrans trans)
```

Types: [DpTrans](DpTrans.md#s-DpTrans)

Free up a worker socket, for use on other Transaction.

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="s-getActionCallback"></a>
### getActionCallback(String)

**Package-private**

```java
com.tailf.dp.DpActionCallback getActionCallback(String point) throws com.tailf.dp.DpException
```

Types: [DpActionCallback](DpActionCallback.md#s-DpActionCallback), [DpException](DpException.md#s-DpException)

Find the action callback for a callpoint.

**Parameters**

- `String point` - An action point name

<a id="s-getActionCallback-1"></a>
### getActionCallback(String, int)

**Package-private**

```java
com.tailf.dp.DpActionCallback getActionCallback(
    String point,
    int index
)
    throws com.tailf.dp.DpException
```

Types: [DpActionCallback](DpActionCallback.md#s-DpActionCallback), [DpException](DpException.md#s-DpException)

Find the action callback for a callpoint.

**Parameters**

- `String point` - An action point name
- `int index` - Index for position in actionpoint array

<a id="s-getCtrlSocket"></a>
### getCtrlSocket()

```java
public java.net.Socket getCtrlSocket()
```

The control socket which is connected to ConfD/NCS.

**Returns:** Socket the control socket

<a id="s-getDaemonId"></a>
### getDaemonId()

```java
public int getDaemonId()
```

The daemon identifier (assigned by ConfD/NCS).

**Returns:** int daemon identifier

<a id="s-getDataCallback"></a>
### getDataCallback(ConfBuf, int)

```java
protected com.tailf.dp.DpDataCallback getDataCallback(
    com.tailf.conf.ConfBuf callpoint,
    int index
)
    throws com.tailf.dp.DpException
```

Types: [DpDataCallback](DpDataCallback.md#s-DpDataCallback), [ConfBuf](../conf/ConfBuf.md#s-ConfBuf), [DpException](DpException.md#s-DpException)

Get the registered data callback with specified name and at index.

**Parameters**

- `com.tailf.conf.ConfBuf callpoint` - The name of the callpoint
- `int index` - The index of callpoint

<a id="s-getDbCallback"></a>
### getDbCallback()

**Package-private**

```java
com.tailf.dp.DpDbCallback getDbCallback() throws com.tailf.dp.DpException
```

Types: [DpDbCallback](DpDbCallback.md#s-DpDbCallback), [DpException](DpException.md#s-DpException)

Gets the registered db callback.

<a id="s-getErrorMessageFormatter"></a>
### getErrorMessageFormatter()

```java
public com.tailf.conf.ErrorMessageFormatter getErrorMessageFormatter()
```

Types: [ErrorMessageFormatter](../conf/ErrorMessageFormatter.md#s-ErrorMessageFormatter)

Return the errorMessageFormatter for this Dp.

**Returns:** the ErrorMessageFormatter for this Dp.

<a id="s-getErrorVerbosity"></a>
### getErrorVerbosity()

```java
public com.tailf.conf.ErrorVerbosity getErrorVerbosity()
```

Types: [ErrorVerbosity](../conf/ErrorVerbosity.md#s-ErrorVerbosity)

Get the local verbosity level for reported errors
 If this verbosity is null the the default level governs the error
 verbosity of this Dp

**Returns:** the current errorVerbosity for this Dp

<a id="s-getExceptionReporter"></a>
### getExceptionReporter()

```java
public com.tailf.dp.DpExceptionReporter getExceptionReporter()
```

Types: [DpExceptionReporter](DpExceptionReporter.md#s-DpExceptionReporter)

<a id="s-getNanoServiceCallback"></a>
### getNanoServiceCallback(ConfBuf, int)

```java
protected com.tailf.dp.DpNanoServiceCallback getNanoServiceCallback(
    com.tailf.conf.ConfBuf servicepoint,
    int index
)
    throws com.tailf.dp.DpException
```

Types: [DpNanoServiceCallback](DpNanoServiceCallback.md#s-DpNanoServiceCallback), [ConfBuf](../conf/ConfBuf.md#s-ConfBuf), [DpException](DpException.md#s-DpException)

**Parameters**

- `com.tailf.conf.ConfBuf servicepoint`
- `int index`

<a id="s-getNsList"></a>
### getNsList()

```java
public java.util.ArrayList<com.tailf.conf.ConfNamespace> getNsList()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace)

Get a list of the installed namespaces. The namespace list
 is needed, for example, when creating an object ref.

<a id="s-getServiceCallback"></a>
### getServiceCallback(ConfBuf, int)

```java
protected com.tailf.dp.DpServiceCallback getServiceCallback(
    com.tailf.conf.ConfBuf servicepoint,
    int index
)
    throws com.tailf.dp.DpException
```

Types: [DpServiceCallback](DpServiceCallback.md#s-DpServiceCallback), [ConfBuf](../conf/ConfBuf.md#s-ConfBuf), [DpException](DpException.md#s-DpException)

Get the registered service callback with specified name and at index.

**Parameters**

- `com.tailf.conf.ConfBuf servicepoint` - The name of the servicepoint
- `int index` - The index of servicepoint

<a id="s-getServicePointMaapi"></a>
### getServicePointMaapi()

```java
public com.tailf.maapi.Maapi getServicePointMaapi() throws java.io.IOException, com.tailf.conf.ConfException
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi), [ConfException](../conf/ConfException.md#s-ConfException)

<a id="s-getServicePointMaapi-1"></a>
### getServicePointMaapi(DpTrans)

```java
public synchronized com.tailf.maapi.Maapi getServicePointMaapi(
    com.tailf.dp.DpTrans trans
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi), [DpTrans](DpTrans.md#s-DpTrans), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="s-getTransCallback"></a>
### getTransCallback()

**Package-private**

```java
com.tailf.dp.DpTransCallback getTransCallback() throws com.tailf.dp.DpException
```

Types: [DpTransCallback](DpTransCallback.md#s-DpTransCallback), [DpException](DpException.md#s-DpException)

Get the registered transaction callback.

<a id="s-getTransValidateCallback"></a>
### getTransValidateCallback()

**Package-private**

```java
com.tailf.dp.DpTransValidateCallback getTransValidateCallback() throws com.tailf.dp.DpException
```

Types: [DpTransValidateCallback](DpTransValidateCallback.md#s-DpTransValidateCallback), [DpException](DpException.md#s-DpException)

Get the registered transaction validate callback.

<a id="s-getUserInfo"></a>
### getUserInfo(int)

```java
public com.tailf.dp.DpUserInfo getUserInfo(int usid)
```

Types: [DpUserInfo](DpUserInfo.md#s-DpUserInfo)

Retrieves the user information.

**Parameters**

- `int usid` - User identifier

<a id="s-getValpointCallback"></a>
### getValpointCallback(ConfBuf, int)

**Package-private**

```java
com.tailf.dp.DpValpointCallback getValpointCallback(
    com.tailf.conf.ConfBuf point,
    int index
)
    throws com.tailf.dp.DpException
```

Types: [DpValpointCallback](DpValpointCallback.md#s-DpValpointCallback), [ConfBuf](../conf/ConfBuf.md#s-ConfBuf), [DpException](DpException.md#s-DpException)

Finds the valpoint callback.

**Parameters**

- `com.tailf.conf.ConfBuf point` - A valpoint name
- `int index` - Index for position in valpoint array

<a id="s-getWorkerPool"></a>
### getWorkerPool()

```java
public java.util.concurrent.ThreadPoolExecutor getWorkerPool()
```

Get current WorkerThreadPool

**Returns:** WorkerThreadPool

<a id="s-getWorkerSocketFd"></a>
### getWorkerSocketFd(Socket)

```java
protected synchronized Integer getWorkerSocketFd(java.net.Socket workerSocket)
```

Get the internal fd of a worker socket

**Parameters**

- `java.net.Socket workerSocket`

<a id="s-read"></a>
### read()

```java
public void read() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Receives data on the control socket which is connected to ConfD/NCS.
 Performs a blocking read. If a socket timeout value has been configured
 for the control socket, this method will (eventually) throw a
 SocketTimeoutException which the caller must handle.

**Throws**

- `ConfException` - Failed to decode.
- `SocketTimeoutException` - The control socket timed out.
- `IOException` - Failed to read from control socket.

<a id="s-registerAnnotatedCallbacks"></a>
### registerAnnotatedCallbacks(Object)

```java
public void registerAnnotatedCallbacks(Object obj) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#s-DpException)

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


- [`DataCBType`](proto/DataCBType.md#s-DataCBType)
- [`TransCBType`](proto/TransCBType.md#s-TransCBType)
- [`ActionCBType`](proto/ActionCBType.md#s-ActionCBType)
- [`ValidateCBType`](proto/ValidateCBType.md#s-ValidateCBType)
- [`TransValidateCBType`](proto/TransValidateCBType.md#s-TransValidateCBType)
- [`DBCBType`](proto/DBCBType.md#s-DBCBType)
- [`AuthCBType`](proto/AuthCBType.md#s-AuthCBType)
- [`ServiceCBType`](proto/ServiceCBType.md#s-ServiceCBType)

**Parameters**

- `Object obj` - object to register as callback

**Throws**

- `DpException`

<a id="s-registerAnnotatedCallbacks-1"></a>
### registerAnnotatedCallbacks(String, Object)

```java
public void registerAnnotatedCallbacks(String mountId, Object obj) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#s-DpException)

**Parameters**

- `String mountId`
- `Object obj`

<a id="s-registerAnnotatedMountedCbs"></a>
### registerAnnotatedMountedCbs(DpMountIdInterface, Object)

```java
public void registerAnnotatedMountedCbs(
    com.tailf.dp.DpMountIdInterface mountIdMethod,
    Object obj
)
    throws com.tailf.dp.DpException
```

Types: [DpMountIdInterface](DpMountIdInterface.md#s-DpMountIdInterface), [DpException](DpException.md#s-DpException)

**Parameters**

- `com.tailf.dp.DpMountIdInterface mountIdMethod`
- `Object obj`

<a id="s-registerAnnotatedRangeActionCallbacks"></a>
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

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [ConfPath](../conf/ConfPath.md#s-ConfPath), [DpException](DpException.md#s-DpException)

**Parameters**

- `Object obj`
- `com.tailf.conf.ConfValue[] lower`
- `com.tailf.conf.ConfValue[] higher`
- `com.tailf.conf.ConfPath path`

<a id="s-registerAnnotatedRangeDataCallbacks"></a>
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

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [ConfPath](../conf/ConfPath.md#s-ConfPath), [DpException](DpException.md#s-DpException)

DataCallbacks can be registered for a range of values using this method

**Parameters**

- `Object obj` - object to register as callback
- `com.tailf.conf.ConfValue[] lower` - Array of lower bound key values
- `com.tailf.conf.ConfValue[] higher` - Array of higher bound key values
- `com.tailf.conf.ConfPath path` - A path

**Throws**

- `DpException` - Failed to register range data callback.

<a id="s-registerDone"></a>
### registerDone()

```java
public void registerDone() throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#s-DpException)

When we have registered all the callbacks for a daemon
 we must call this function to synchronize with ConfD/NCS.
 No callbacks will be invoked until it has been called,
 and after the call, no further registrations are allowed.

**Throws**

- `DpException` - Failed with registerDone()

<a id="s-removeActionMaapi"></a>
### removeActionMaapi()

```java
public void removeActionMaapi()
```

<a id="s-reRegisterAnnotatedCallbacks"></a>
### reRegisterAnnotatedCallbacks(Object)

```java
public void reRegisterAnnotatedCallbacks(Object obj) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#s-DpException)

reRegisters an existing callback.
 This implies that the current callback is exchanged
 If the current callback is not existing this is an noop

**Parameters**

- `Object obj`

**Throws**

- `DpException`

<a id="s-reRegisterAnnotatedCallbacks-1"></a>
### reRegisterAnnotatedCallbacks(String, Object)

```java
public void reRegisterAnnotatedCallbacks(String mountId, Object obj) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#s-DpException)

**Parameters**

- `String mountId`
- `Object obj`

<a id="s-reRegisterAnnotatedMountedCbs"></a>
### reRegisterAnnotatedMountedCbs(DpMountIdInterface, Object)

```java
public void reRegisterAnnotatedMountedCbs(
    com.tailf.dp.DpMountIdInterface mountIdMethod,
    Object obj
)
    throws com.tailf.dp.DpException
```

Types: [DpMountIdInterface](DpMountIdInterface.md#s-DpMountIdInterface), [DpException](DpException.md#s-DpException)

**Parameters**

- `com.tailf.dp.DpMountIdInterface mountIdMethod`
- `Object obj`

<a id="s-reRegisterAnnotatedRangeActionCallbacks"></a>
### reRegisterAnnotatedRangeActionCallbacks(Object)

```java
public void reRegisterAnnotatedRangeActionCallbacks(Object obj) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#s-DpException)

reRegisters an existing callback.
 This implies that the current callback is exchanged
 If the current callback is not existing this is an noop
 Note that the range cannot be changed and can therefore not be supplied
 in this call

**Parameters**

- `Object obj`

**Throws**

- `DpException`

<a id="s-reRegisterAnnotatedRangeDataCallbacks"></a>
### reRegisterAnnotatedRangeDataCallbacks(Object)

```java
public void reRegisterAnnotatedRangeDataCallbacks(Object obj) throws com.tailf.dp.DpException
```

Types: [DpException](DpException.md#s-DpException)

reRegisters an existing callback.
 This implies that the current callback is exchanged
 If the current callback is not existing this is an noop
 Note that the range cannot be changed and can therefore not be supplied
 in this call

**Parameters**

- `Object obj`

**Throws**

- `DpException`

<a id="s-runWithSocket"></a>
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

Types: [DpTrans](DpTrans.md#s-DpTrans), [DpWork](Dp/DpWork.md#s-DpWork)

The purpose of this method is to make sure the socket is still connected
 to ConfD/NCS before executing the callback.

 If the socket is disconnected, remove the socket from the pool and
 allocate a new socket that is connected to ConfD/NCS for the callback.

**Parameters**

- `com.tailf.dp.DpTrans dp`
- `com.tailf.dp.Dp.DpWork dpWork`
- `java.net.Socket socket`

<a id="s-setErrorVerbosity"></a>
### setErrorVerbosity(ErrorVerbosity)

```java
public void setErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](../conf/ErrorVerbosity.md#s-ErrorVerbosity)

set the local verbosity level for reported errors
 If this verbosity is set to null the the default level governs the error
 verbosity of this Dp

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity`

<a id="s-setExceptionReporter"></a>
### setExceptionReporter(DpExceptionReporter)

```java
public void setExceptionReporter(com.tailf.dp.DpExceptionReporter exReporter)
```

Types: [DpExceptionReporter](DpExceptionReporter.md#s-DpExceptionReporter)

**Parameters**

- `com.tailf.dp.DpExceptionReporter exReporter`

<a id="s-setNumFreeWorkerSockets"></a>
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

<a id="s-setRejectedExecutionHandler"></a>
### setRejectedExecutionHandler(RejectedExecutionHandler)

**Package-private**

```java
void setRejectedExecutionHandler(java.util.concurrent.RejectedExecutionHandler handler)
```

**Parameters**

- `java.util.concurrent.RejectedExecutionHandler handler`

<a id="s-shutDownThreadPool"></a>
### shutDownThreadPool()

```java
public void shutDownThreadPool()
```

Initiates an orderly shutdown in which previously
 transactions are executed, but no new transactions
 will be accepted.

<a id="s-shutDownThreadPoolNow"></a>
### shutDownThreadPoolNow()

```java
public int shutDownThreadPoolNow()
```

Attempts to stop all actively executing transactions,
 halts the processing of waiting transactions, and returns number
 of the tasks that were awaiting execution.

**Returns:** - Number of awaiting transactions that was not executed.


## Nested Types

- [DpWork](Dp/DpWork.md)
