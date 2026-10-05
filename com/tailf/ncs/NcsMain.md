<a id="s-NcsMain"></a>
# NcsMain

```java
public class com.tailf.ncs.NcsMain
    implements Runnable, Thread.UncaughtExceptionHandler
```

Main class for Ncs java vm management and control.
 This class implements the Runnable interface and should be started in a
 thread which becomes the Ncs java vm main thread.
 Normally this thread is instantiated and started by the
 [`NcsJVMLauncher`](NcsJVMLauncher.md#s-NcsJVMLauncher) which contains a main() method.

 It is however possible to embed and start the NcsMain thread from any
 other java program by inserting the following code snippet:



```
 NcsMain ncs = NcsMain.getInstance(host, port);
 Thread ncsThread = new Thread(ncs);
 ncsThread.start();
```



 The Ncs java vm main thread will connect to the Ncs Server and
 start negotiation of which packages/components that should be instantiated
 registered and started.
 No manual registration is necessary.

## Members

**Fields**:

- [exitOnStop](#s-exitOnStop)
- [TAILF_CLASSLOADER](#s-TAILF_CLASSLOADER)

**Methods**:

- [abortNcsJavaVM(Object)](#s-abortNcsJavaVM)
- [abortNcsJavaVM(Object, int)](#s-abortNcsJavaVM-1)
- [abortNcsJavaVM(Object, int, String)](#s-abortNcsJavaVM-2)
- [deviceKeyPath(String)](#s-deviceKeyPath)
- [getAddress()](#s-getAddress)
- [getApplicationMuxManager()](#s-getApplicationMuxManager)
- [getDPMuxManager()](#s-getDPMuxManager)
- [getInstance()](#s-getInstance)
- [getInstance(SocketAddress)](#s-getInstance-1)
- [getInstance(String, int)](#s-getInstance-2)
- [getLocalInstance()](#s-getLocalInstance)
- [getNcsHost()](#s-getNcsHost)
- [getNcsPDData(String)](#s-getNcsPDData)
- [getNcsPort()](#s-getNcsPort)
- [getNedMuxManager()](#s-getNedMuxManager)
- [getResourceManager()](#s-getResourceManager)
- [getSinkCentral()](#s-getSinkCentral)
- [getSourceCentral()](#s-getSourceCentral)
- [getStartNotifierThread()](#s-getStartNotifierThread)
- [getStartupNotifierThread()](#s-getStartupNotifierThread)
- [handlePackageException(ClassLoader, Throwable)](#s-handlePackageException)
- [handlePackageException(Object, Throwable)](#s-handlePackageException-1)
- [handlePackageException(String, Throwable)](#s-handlePackageException-2)
- [instantiatePackageComponent(NcsPDData)](#s-instantiatePackageComponent)
- [isAddingPkgs()](#s-isAddingPkgs)
- [isRunning()](#s-isRunning)
- [isStarted()](#s-isStarted)
- [isUsingTailFClassloader()](#s-isUsingTailFClassloader)
- [redeployPackage(NcsPDData)](#s-redeployPackage)
- [reportPackageException(ClassLoader, Throwable)](#s-reportPackageException)
- [reportPackageException(Object, Throwable)](#s-reportPackageException-1)
- [reportPackageException(String, Throwable)](#s-reportPackageException-2)
- [restartPackage(String)](#s-restartPackage)
- [restartPackageNow(String)](#s-restartPackageNow)
- [run()](#s-run)
- [shutdown()](#s-shutdown)
- [submitPackageAlarm(ClassLoader, ConfIdentityRef, PerceivedSeverity, boolean, String)](#s-submitPackageAlarm)
- [submitPackageAlarm(Object, ConfIdentityRef, PerceivedSeverity, boolean, String)](#s-submitPackageAlarm-1)
- [submitPackageAlarm(String, ConfIdentityRef, PerceivedSeverity, boolean, String)](#s-submitPackageAlarm-2)
- [uncaughtException(Thread, Throwable)](#s-uncaughtException)
- [unload()](#s-unload)

## Fields

<a id="s-exitOnStop"></a>
### exitOnStop

**Package-private**

```java
boolean exitOnStop = null;
```

<a id="s-TAILF_CLASSLOADER"></a>
### TAILF_CLASSLOADER

```java
public static final String TAILF_CLASSLOADER = "TAILF_CLASSLOADER";
```

This field represents a system property controlling which classloader
 the Ncs java vm should use. If the system classloader is preferred
 this property should be set "false". The default is true
 If the system classloader is used, redeployment is not possible
 Example:

 java -cp ... -DTAILF_CLASSLOADER=false  com...NcsJVMLauncher


## Methods

<a id="s-abortNcsJavaVM"></a>
### abortNcsJavaVM(Object)

```java
public static void abortNcsJavaVM(Object obj)
```

Aborts the NCS Java VM.

**Parameters**

- `Object obj` - the object context (unused)

**Deprecated:** Use `#shutdown()` instead.

<a id="s-abortNcsJavaVM-1"></a>
### abortNcsJavaVM(Object, int)

```java
public static void abortNcsJavaVM(Object obj, int code)
```

Aborts the NCS Java VM with exit code.

**Parameters**

- `Object obj` - the object context (unused)
- `int code` - the exit code (unused)

**Deprecated:** Use `#shutdown()` instead.

<a id="s-abortNcsJavaVM-2"></a>
### abortNcsJavaVM(Object, int, String)

```java
public static void abortNcsJavaVM(Object obj, int code, String message)
```

Abort Ncs Java VM

**Parameters**

- `Object obj` - the object context (unused)
- `int code` - the exit code (unused)
- `String message` - the error message (unused)

**Deprecated:** Use `#shutdown()` instead.

<a id="s-deviceKeyPath"></a>
### deviceKeyPath(String)

```java
public static com.tailf.conf.ConfPath deviceKeyPath(
    String devName
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

Builds the keypath of a device list entry from a device name,
 quoting the key so names containing whitespace or other special
 characters produce a valid keypath.

**Parameters**

- `String devName` - the device name

**Returns:** the keypath `/devices/device{<quoted-devName>}`

**Throws**

- `ConfException` - if the keypath cannot be constructed

<a id="s-getAddress"></a>
### getAddress()

```java
public java.net.SocketAddress getAddress()
```

Get the address for the NCS Server.

**Returns:** socket address for the NCS server

<a id="s-getApplicationMuxManager"></a>
### getApplicationMuxManager()

```java
public com.tailf.ncs.ctrl.ApplicationMuxManager getApplicationMuxManager()
```

Types: [ApplicationMuxManager](ctrl/ApplicationMuxManager.md#s-ApplicationMuxManager)

Get the ApplicationMuxManager instance.
 This manager controls all application component threads from all
 packages.

**Returns:** ApplicationMuxManager instance

<a id="s-getDPMuxManager"></a>
### getDPMuxManager()

```java
public com.tailf.ncs.ctrl.DpMuxManager getDPMuxManager()
```

Types: [DpMuxManager](ctrl/DpMuxManager.md#s-DpMuxManager)

Get the DpMuxManager instance.
 This manager controls the DP instances and all registered callback
 components from all packages.

**Returns:** DpMuxManager instance

<a id="s-getInstance"></a>
### getInstance()

```java
public static com.tailf.ncs.NcsMain getInstance()
```

Types: [NcsMain](NcsMain.md#s-NcsMain)

Gets the NcsMain instance associated with the current thread.

**Returns:** instance associated with the current thread, or null
         if no instance has been started

<a id="s-getInstance-1"></a>
### getInstance(SocketAddress)

```java
public static synchronized com.tailf.ncs.NcsMain getInstance(java.net.SocketAddress address)
```

Types: [NcsMain](NcsMain.md#s-NcsMain)

Get an instance that should connect to the given address. If an
 instance already exists for the given address it is returned.

**Parameters**

- `java.net.SocketAddress address` - socket address to connect to

**Returns:** an instance that is connected or will connect to the given
         address

<a id="s-getInstance-2"></a>
### getInstance(String, int)

```java
public static com.tailf.ncs.NcsMain getInstance(String host, int port)
```

Types: [NcsMain](NcsMain.md#s-NcsMain)

Gets the singleton instance of the NcsMain class.

**Parameters**

- `String host` - the NCS host to connect to
- `int port` - the NCS port to connect to

**Returns:** NcsMain instance

**Deprecated:** Use `#getInstance(SocketAddress)` instead.

<a id="s-getLocalInstance"></a>
### getLocalInstance()

```java
public static java.util.Optional<com.tailf.ncs.NcsMain> getLocalInstance()
```

Types: [NcsMain](NcsMain.md#s-NcsMain)

Gets the NcsMain instance associated with the current thread.

**Returns:** an optional containing the instance associated with the
         current thread, or empty of no instance has been started

<a id="s-getNcsHost"></a>
### getNcsHost()

```java
public String getNcsHost()
```

Get the hostname or IP address for the NCS Server.

**Returns:** hostname or IP address for NCS server

**Deprecated:** Use the `#getAddress()` method instead

<a id="s-getNcsPDData"></a>
### getNcsPDData(String)

```java
public com.tailf.ncs.ctrl.NcsPDData getNcsPDData(String name)
```

Types: [NcsPDData](ctrl/NcsPDData.md#s-NcsPDData)

Retrieves package deployment data by name.

**Parameters**

- `String name` - the package name to retrieve

**Returns:** NcsPDData for the named package

<a id="s-getNcsPort"></a>
### getNcsPort()

```java
public int getNcsPort()
```

Get the port number for the NCS Server.

**Returns:** NCS server port

**Deprecated:** Use the `#getAddress()` method instead

<a id="s-getNedMuxManager"></a>
### getNedMuxManager()

```java
public com.tailf.ncs.ctrl.NedMuxManager getNedMuxManager()
```

Types: [NedMuxManager](ctrl/NedMuxManager.md#s-NedMuxManager)

Get the NedMuxManager instance.
 This manager controls the NedMux and all registered NED components
 from all packages.

**Returns:** NedMuxManager instance

<a id="s-getResourceManager"></a>
### getResourceManager()

```java
public com.tailf.ncs.ResourceManager getResourceManager()
```

Types: [ResourceManager](ResourceManager.md#s-ResourceManager)

Get the ResourceManager instance.

**Returns:** resource manager for this NCS instance

<a id="s-getSinkCentral"></a>
### getSinkCentral()

```java
public com.tailf.ncs.alarmman.producer.AlarmSinkCentral getSinkCentral()
```

Types: [AlarmSinkCentral](alarmman/producer/AlarmSinkCentral.md#s-AlarmSinkCentral)

Get the NCS AlarmSinkCentral instance.

**Returns:** AlarmSinkCentral instance

<a id="s-getSourceCentral"></a>
### getSourceCentral()

```java
public com.tailf.ncs.alarmman.consumer.AlarmSourceCentral getSourceCentral()
```

Types: [AlarmSourceCentral](alarmman/consumer/AlarmSourceCentral.md#s-AlarmSourceCentral)

Get the NCS AlarmSourceCentral instance.

**Returns:** AlarmSourceCentral instance

<a id="s-getStartNotifierThread"></a>
### getStartNotifierThread()

```java
public static Thread getStartNotifierThread()
```

**Returns:** the start notifier thread instance

**Deprecated:** Use `#getStartupNotifierThread()` instead.

<a id="s-getStartupNotifierThread"></a>
### getStartupNotifierThread()

```java
public Thread getStartupNotifierThread()
```

Retrieves the startup notifier thread instance.

**Returns:** the startup notifier thread

<a id="s-handlePackageException"></a>
### handlePackageException(ClassLoader, Throwable)

```java
public Throwable handlePackageException(ClassLoader cl, Throwable e)
```

Handles exceptions from package components by class loader context.

**Parameters**

- `ClassLoader cl` - the class loader associated with the failing package
- `Throwable e` - the exception to handle

**Returns:** the exception to be thrown

<a id="s-handlePackageException-1"></a>
### handlePackageException(Object, Throwable)

```java
public Throwable handlePackageException(Object instance, Throwable e)
```

Handles exceptions from package components.

**Parameters**

- `Object instance` - the object instance that threw the exception
- `Throwable e` - the exception to handle

**Returns:** the exception to be thrown

<a id="s-handlePackageException-2"></a>
### handlePackageException(String, Throwable)

```java
public Throwable handlePackageException(String packageName, Throwable e)
```

Handles exceptions from a specific package by name.

**Parameters**

- `String packageName` - the name of the package that generated the exception
- `Throwable e` - the exception to handle

**Returns:** the exception to be thrown

<a id="s-instantiatePackageComponent"></a>
### instantiatePackageComponent(NcsPDData)

```java
public void instantiatePackageComponent(com.tailf.ncs.ctrl.NcsPDData pdData) throws Exception
```

Types: [NcsPDData](ctrl/NcsPDData.md#s-NcsPDData)

Instantiates and registers components for an NCS package.

**Parameters**

- `com.tailf.ncs.ctrl.NcsPDData pdData` - package deployment data containing components to
               instantiate

**Throws**

- `Exception` - if component instantiation fails

<a id="s-isAddingPkgs"></a>
### isAddingPkgs()

```java
public boolean isAddingPkgs()
```

Checks if packages are being added to the system.

**Returns:** true if packages are currently being added

<a id="s-isRunning"></a>
### isRunning()

```java
public boolean isRunning()
```

Checks if the NCS main thread is running.

**Returns:** true if the NCS main thread is running

<a id="s-isStarted"></a>
### isStarted()

```java
public static boolean isStarted()
```

Checks if the NCS main thread has been started.

**Returns:** true if the NCS main thread is running

**Deprecated:** Use `#isRunning()` instead

<a id="s-isUsingTailFClassloader"></a>
### isUsingTailFClassloader()

```java
public boolean isUsingTailFClassloader()
```

Checks if this instance was started with the Tail-f Jar classloader, as
 opposed to running with the standard java system classloader.
 The default is running with the Tail-f Jar classloader, which is
 necessary to be able to perform component hot re-deploy.

**Returns:** true if the Tail-f Jar classloader is active

<a id="s-redeployPackage"></a>
### redeployPackage(NcsPDData)

```java
public void redeployPackage(com.tailf.ncs.ctrl.NcsPDData pdData) throws Exception
```

Types: [NcsPDData](ctrl/NcsPDData.md#s-NcsPDData)

Hot redeploy of all components for a package.

**Parameters**

- `com.tailf.ncs.ctrl.NcsPDData pdData` - package deployment data for the package to redeploy

**Throws**

- `Exception` - if redeployment fails

<a id="s-reportPackageException"></a>
### reportPackageException(ClassLoader, Throwable)

```java
public static Throwable reportPackageException(ClassLoader cl, Throwable e)
```

Reports package exceptions using class loader context.

**Parameters**

- `ClassLoader cl` - the class loader of the failing package
- `Throwable e` - the exception to report

**Returns:** the processed exception

**Deprecated:** Use `#handlePackageException(ClassLoader, Throwable)`
             instead.

<a id="s-reportPackageException-1"></a>
### reportPackageException(Object, Throwable)

```java
public static Throwable reportPackageException(Object instance, Throwable e)
```

Reports package exceptions and initiates restart handling.

**Parameters**

- `Object instance` - the component instance that threw the exception
- `Throwable e` - the exception to report

**Returns:** the processed exception

**Deprecated:** Use `#handlePackageException(Object, Throwable)`
             instead.

<a id="s-reportPackageException-2"></a>
### reportPackageException(String, Throwable)

```java
public static Throwable reportPackageException(String packageName, Throwable e)
```

Reports package exceptions by package name.

**Parameters**

- `String packageName` - the name of the failing package
- `Throwable e` - the exception to report

**Returns:** the processed exception

**Deprecated:** Use `#handlePackageException(String, Throwable)`
             instead.

<a id="s-restartPackage"></a>
### restartPackage(String)

```java
public void restartPackage(String packageName)
```

Schedules a package for restart.

**Parameters**

- `String packageName` - the name of the package to restart

<a id="s-restartPackageNow"></a>
### restartPackageNow(String)

```java
public void restartPackageNow(String packageName)
```

Immediately restarts a package

**Parameters**

- `String packageName` - the name of the package to restart

<a id="s-run"></a>
### run()

```java
public void run()
```

This method is the Ncs java vm main thread start

<a id="s-shutdown"></a>
### shutdown()

```java
public void shutdown()
```

shutdown Ncs java vm main thread

<a id="s-submitPackageAlarm"></a>
### submitPackageAlarm(ClassLoader, ConfIdentityRef, PerceivedSeverity, boolean, String)

```java
public static void submitPackageAlarm(
    ClassLoader cl,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.PerceivedSeverity severity,
    boolean cleared,
    String alarmText
)
```

Types: [ConfIdentityRef](../conf/ConfIdentityRef.md#s-ConfIdentityRef), [PerceivedSeverity](alarmman/common/PerceivedSeverity.md#s-PerceivedSeverity)

Submits an alarm for a package using its class loader context.

**Parameters**

- `ClassLoader cl` - the class loader of the package generating the alarm
- `com.tailf.conf.ConfIdentityRef alarmType` - the type of alarm to submit
- `com.tailf.ncs.alarmman.common.PerceivedSeverity severity` - the perceived severity of the alarm
- `boolean cleared` - whether the alarm is cleared
- `String alarmText` - descriptive text for the alarm

<a id="s-submitPackageAlarm-1"></a>
### submitPackageAlarm(Object, ConfIdentityRef, PerceivedSeverity, boolean, String)

```java
public static void submitPackageAlarm(
    Object instance,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.PerceivedSeverity severity,
    boolean cleared,
    String alarmText
)
```

Types: [ConfIdentityRef](../conf/ConfIdentityRef.md#s-ConfIdentityRef), [PerceivedSeverity](alarmman/common/PerceivedSeverity.md#s-PerceivedSeverity)

Submits an alarm for a package component instance.

**Parameters**

- `Object instance` - the component instance generating the alarm
- `com.tailf.conf.ConfIdentityRef alarmType` - the type of alarm to submit
- `com.tailf.ncs.alarmman.common.PerceivedSeverity severity` - the perceived severity of the alarm
- `boolean cleared` - whether the alarm is cleared
- `String alarmText` - descriptive text for the alarm

<a id="s-submitPackageAlarm-2"></a>
### submitPackageAlarm(String, ConfIdentityRef, PerceivedSeverity, boolean, String)

```java
public static void submitPackageAlarm(
    String packageName,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.PerceivedSeverity severity,
    boolean cleared,
    String alarmText
)
```

Types: [ConfIdentityRef](../conf/ConfIdentityRef.md#s-ConfIdentityRef), [PerceivedSeverity](alarmman/common/PerceivedSeverity.md#s-PerceivedSeverity)

Submits an alarm for a specific package by name.

**Parameters**

- `String packageName` - the name of the package generating the alarm
- `com.tailf.conf.ConfIdentityRef alarmType` - the type of alarm to submit
- `com.tailf.ncs.alarmman.common.PerceivedSeverity severity` - the perceived severity of the alarm
- `boolean cleared` - whether the alarm is cleared
- `String alarmText` - descriptive text for the alarm

<a id="s-uncaughtException"></a>
### uncaughtException(Thread, Throwable)

```java
public void uncaughtException(Thread t, Throwable e)
```

Handles uncaught exceptions from any thread by initiating system
 shutdown.

**Parameters**

- `Thread t` - the thread that threw the uncaught exception
- `Throwable e` - the uncaught exception

<a id="s-unload"></a>
### unload()

**Package-private**

```java
void unload() throws Exception
```
