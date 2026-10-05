<a id="cls-NcsMain"></a>
# NcsMain

```java
public class com.tailf.ncs.NcsMain
    implements Runnable, Thread.UncaughtExceptionHandler
```

Main class for Ncs java vm management and control.
 This class implements the Runnable interface and should be started in a
 thread which becomes the Ncs java vm main thread.
 Normally this thread is instantiated and started by the
 [`NcsJVMLauncher`](NcsJVMLauncher.md#cls-NcsJVMLauncher) which contains a main() method.

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

- [exitOnStop](#m-exitOnStop)
- [TAILF_CLASSLOADER](#m-TAILF_CLASSLOADER)

**Methods**:

- [abortNcsJavaVM(Object)](#m-abortncsjavavm-83777887a888)
- [abortNcsJavaVM(Object, int)](#m-abortncsjavavm-4b9171d8233f)
- [abortNcsJavaVM(Object, int, String)](#m-abortncsjavavm-d4e69c891fdb)
- [deviceKeyPath(String)](#m-devicekeypath-b5a342a26fef)
- [getAddress()](#m-getaddress-08b11cceec4c)
- [getApplicationMuxManager()](#m-getapplicationmuxmanager-c8b034860559)
- [getDPMuxManager()](#m-getdpmuxmanager-d4ac372c0b84)
- [getInstance()](#m-getinstance-54a685332d87)
- [getInstance(SocketAddress)](#m-getinstance-947352e78e29)
- [getInstance(String, int)](#m-getinstance-ca416d27c748)
- [getLocalInstance()](#m-getlocalinstance-f091157c7ceb)
- [getNcsHost()](#m-getncshost-13b45e614659)
- [getNcsPort()](#m-getncsport-ec644cf198c2)
- [getNedMuxManager()](#m-getnedmuxmanager-639a1e227b1b)
- [getResourceManager()](#m-getresourcemanager-eb64f13b2c87)
- [getSinkCentral()](#m-getsinkcentral-92f2bcf80bdb)
- [getSourceCentral()](#m-getsourcecentral-0714ef465cc3)
- [handlePackageException(ClassLoader, Throwable)](#m-handlepackageexception-d43bb265decf)
- [handlePackageException(Object, Throwable)](#m-handlepackageexception-1758c60d1339)
- [handlePackageException(String, Throwable)](#m-handlepackageexception-bee8ca9aca8e)
- [instantiatePackageComponent(NcsPDData)](#m-instantiatepackagecomponent-4137ab775b1c)
- [isAddingPkgs()](#m-isaddingpkgs-cb8b66bb176e)
- [isRunning()](#m-isrunning-02db4ec84a8d)
- [isStarted()](#m-isstarted-5c757faf6088)
- [isUsingTailFClassloader()](#m-isusingtailfclassloader-04efc178552d)
- [redeployPackage(NcsPDData)](#m-redeploypackage-2a23d31f2642)
- [reportPackageException(ClassLoader, Throwable)](#m-reportpackageexception-74c8c471ddc2)
- [reportPackageException(Object, Throwable)](#m-reportpackageexception-746dcb7d1c60)
- [reportPackageException(String, Throwable)](#m-reportpackageexception-20596ab20eca)
- [restartPackage(String)](#m-restartpackage-161b2c0a7b51)
- [restartPackageNow(String)](#m-restartpackagenow-a4a029884619)
- [run()](#m-run-b6dbda048863)
- [shutdown()](#m-shutdown-60c9b1d4b111)
- [submitPackageAlarm(ClassLoader, ConfIdentityRef, PerceivedSeverity, boolean, String)](#m-submitpackagealarm-7e93d8162bbf)
- [submitPackageAlarm(Object, ConfIdentityRef, PerceivedSeverity, boolean, String)](#m-submitpackagealarm-f8db8fb0345e)
- [submitPackageAlarm(String, ConfIdentityRef, PerceivedSeverity, boolean, String)](#m-submitpackagealarm-a0a9b95cab23)
- [uncaughtException(Thread, Throwable)](#m-uncaughtexception-ad07d4154b36)
- [unload()](#m-unload-e055e2ceb016)

## Fields

<a id="m-exitOnStop"></a>
### exitOnStop

**Package-private**

```java
boolean exitOnStop = null;
```

<a id="m-TAILF_CLASSLOADER"></a>
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

<a id="m-abortncsjavavm-83777887a888"></a>
### abortNcsJavaVM(Object)

```java
public static void abortNcsJavaVM(Object obj)
```

Aborts the NCS Java VM.

**Parameters**

- `Object obj` - the object context (unused)

**Deprecated:** Use `#shutdown()` instead.

<a id="m-abortncsjavavm-4b9171d8233f"></a>
### abortNcsJavaVM(Object, int)

```java
public static void abortNcsJavaVM(Object obj, int code)
```

Aborts the NCS Java VM with exit code.

**Parameters**

- `Object obj` - the object context (unused)
- `int code` - the exit code (unused)

**Deprecated:** Use `#shutdown()` instead.

<a id="m-abortncsjavavm-d4e69c891fdb"></a>
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

<a id="m-devicekeypath-b5a342a26fef"></a>
### deviceKeyPath(String)

```java
public static com.tailf.conf.ConfPath deviceKeyPath(
    String devName
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

Builds the keypath of a device list entry from a device name,
 quoting the key so names containing whitespace or other special
 characters produce a valid keypath.

**Parameters**

- `String devName` - the device name

**Returns:** the keypath `/devices/device{<quoted-devName>}`

**Throws**

- `ConfException` - if the keypath cannot be constructed

<a id="m-getaddress-08b11cceec4c"></a>
### getAddress()

```java
public java.net.SocketAddress getAddress()
```

Get the address for the NCS Server.

**Returns:** socket address for the NCS server

<a id="m-getapplicationmuxmanager-c8b034860559"></a>
### getApplicationMuxManager()

```java
public com.tailf.ncs.ctrl.ApplicationMuxManager getApplicationMuxManager()
```

Types: [ApplicationMuxManager](ctrl/ApplicationMuxManager.md#cls-ApplicationMuxManager)

Get the ApplicationMuxManager instance.
 This manager controls all application component threads from all
 packages.

**Returns:** ApplicationMuxManager instance

<a id="m-getdpmuxmanager-d4ac372c0b84"></a>
### getDPMuxManager()

```java
public com.tailf.ncs.ctrl.DpMuxManager getDPMuxManager()
```

Types: [DpMuxManager](ctrl/DpMuxManager.md#cls-DpMuxManager)

Get the DpMuxManager instance.
 This manager controls the DP instances and all registered callback
 components from all packages.

**Returns:** DpMuxManager instance

<a id="m-getinstance-54a685332d87"></a>
### getInstance()

```java
public static com.tailf.ncs.NcsMain getInstance()
```

Types: [NcsMain](NcsMain.md#cls-NcsMain)

Gets the NcsMain instance associated with the current thread.

**Returns:** instance associated with the current thread, or null
         if no instance has been started

<a id="m-getinstance-947352e78e29"></a>
### getInstance(SocketAddress)

```java
public static synchronized com.tailf.ncs.NcsMain getInstance(java.net.SocketAddress address)
```

Types: [NcsMain](NcsMain.md#cls-NcsMain)

Get an instance that should connect to the given address. If an
 instance already exists for the given address it is returned.

**Parameters**

- `java.net.SocketAddress address` - socket address to connect to

**Returns:** an instance that is connected or will connect to the given
         address

<a id="m-getinstance-ca416d27c748"></a>
### getInstance(String, int)

```java
public static com.tailf.ncs.NcsMain getInstance(String host, int port)
```

Types: [NcsMain](NcsMain.md#cls-NcsMain)

Gets the singleton instance of the NcsMain class.

**Parameters**

- `String host` - the NCS host to connect to
- `int port` - the NCS port to connect to

**Returns:** NcsMain instance

**Deprecated:** Use `#getInstance(SocketAddress)` instead.

<a id="m-getlocalinstance-f091157c7ceb"></a>
### getLocalInstance()

```java
public static java.util.Optional<com.tailf.ncs.NcsMain> getLocalInstance()
```

Types: [NcsMain](NcsMain.md#cls-NcsMain)

Gets the NcsMain instance associated with the current thread.

**Returns:** an optional containing the instance associated with the
         current thread, or empty of no instance has been started

<a id="m-getncshost-13b45e614659"></a>
### getNcsHost()

```java
public String getNcsHost()
```

Get the hostname or IP address for the NCS Server.

**Returns:** hostname or IP address for NCS server

**Deprecated:** Use the `#getAddress()` method instead

<a id="m-getncsport-ec644cf198c2"></a>
### getNcsPort()

```java
public int getNcsPort()
```

Get the port number for the NCS Server.

**Returns:** NCS server port

**Deprecated:** Use the `#getAddress()` method instead

<a id="m-getnedmuxmanager-639a1e227b1b"></a>
### getNedMuxManager()

```java
public com.tailf.ncs.ctrl.NedMuxManager getNedMuxManager()
```

Types: [NedMuxManager](ctrl/NedMuxManager.md#cls-NedMuxManager)

Get the NedMuxManager instance.
 This manager controls the NedMux and all registered NED components
 from all packages.

**Returns:** NedMuxManager instance

<a id="m-getresourcemanager-eb64f13b2c87"></a>
### getResourceManager()

```java
public com.tailf.ncs.ResourceManager getResourceManager()
```

Types: [ResourceManager](ResourceManager.md#cls-ResourceManager)

Get the ResourceManager instance.

**Returns:** resource manager for this NCS instance

<a id="m-getsinkcentral-92f2bcf80bdb"></a>
### getSinkCentral()

```java
public com.tailf.ncs.alarmman.producer.AlarmSinkCentral getSinkCentral()
```

Types: [AlarmSinkCentral](alarmman/producer/AlarmSinkCentral.md#cls-AlarmSinkCentral)

Get the NCS AlarmSinkCentral instance.

**Returns:** AlarmSinkCentral instance

<a id="m-getsourcecentral-0714ef465cc3"></a>
### getSourceCentral()

```java
public com.tailf.ncs.alarmman.consumer.AlarmSourceCentral getSourceCentral()
```

Types: [AlarmSourceCentral](alarmman/consumer/AlarmSourceCentral.md#cls-AlarmSourceCentral)

Get the NCS AlarmSourceCentral instance.

**Returns:** AlarmSourceCentral instance

<a id="m-handlepackageexception-d43bb265decf"></a>
### handlePackageException(ClassLoader, Throwable)

```java
public Throwable handlePackageException(ClassLoader cl, Throwable e)
```

Handles exceptions from package components by class loader context.

**Parameters**

- `ClassLoader cl` - the class loader associated with the failing package
- `Throwable e` - the exception to handle

**Returns:** the exception to be thrown

<a id="m-handlepackageexception-1758c60d1339"></a>
### handlePackageException(Object, Throwable)

```java
public Throwable handlePackageException(Object instance, Throwable e)
```

Handles exceptions from package components.

**Parameters**

- `Object instance` - the object instance that threw the exception
- `Throwable e` - the exception to handle

**Returns:** the exception to be thrown

<a id="m-handlepackageexception-bee8ca9aca8e"></a>
### handlePackageException(String, Throwable)

```java
public Throwable handlePackageException(String packageName, Throwable e)
```

Handles exceptions from a specific package by name.

**Parameters**

- `String packageName` - the name of the package that generated the exception
- `Throwable e` - the exception to handle

**Returns:** the exception to be thrown

<a id="m-instantiatepackagecomponent-4137ab775b1c"></a>
### instantiatePackageComponent(NcsPDData)

```java
public void instantiatePackageComponent(com.tailf.ncs.ctrl.NcsPDData pdData) throws Exception
```

Types: [NcsPDData](ctrl/NcsPDData.md#cls-NcsPDData)

Instantiates and registers components for an NCS package.

**Parameters**

- `com.tailf.ncs.ctrl.NcsPDData pdData` - package deployment data containing components to
               instantiate

**Throws**

- `Exception` - if component instantiation fails

<a id="m-isaddingpkgs-cb8b66bb176e"></a>
### isAddingPkgs()

```java
public boolean isAddingPkgs()
```

Checks if packages are being added to the system.

**Returns:** true if packages are currently being added

<a id="m-isrunning-02db4ec84a8d"></a>
### isRunning()

```java
public boolean isRunning()
```

Checks if the NCS main thread is running.

**Returns:** true if the NCS main thread is running

<a id="m-isstarted-5c757faf6088"></a>
### isStarted()

```java
public static boolean isStarted()
```

Checks if the NCS main thread has been started.

**Returns:** true if the NCS main thread is running

**Deprecated:** Use `#isRunning()` instead

<a id="m-isusingtailfclassloader-04efc178552d"></a>
### isUsingTailFClassloader()

```java
public boolean isUsingTailFClassloader()
```

Checks if this instance was started with the Tail-f Jar classloader, as
 opposed to running with the standard java system classloader.
 The default is running with the Tail-f Jar classloader, which is
 necessary to be able to perform component hot re-deploy.

**Returns:** true if the Tail-f Jar classloader is active

<a id="m-redeploypackage-2a23d31f2642"></a>
### redeployPackage(NcsPDData)

```java
public void redeployPackage(com.tailf.ncs.ctrl.NcsPDData pdData) throws Exception
```

Types: [NcsPDData](ctrl/NcsPDData.md#cls-NcsPDData)

Hot redeploy of all components for a package.

**Parameters**

- `com.tailf.ncs.ctrl.NcsPDData pdData` - package deployment data for the package to redeploy

**Throws**

- `Exception` - if redeployment fails

<a id="m-reportpackageexception-74c8c471ddc2"></a>
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

<a id="m-reportpackageexception-746dcb7d1c60"></a>
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

<a id="m-reportpackageexception-20596ab20eca"></a>
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

<a id="m-restartpackage-161b2c0a7b51"></a>
### restartPackage(String)

```java
public void restartPackage(String packageName)
```

Schedules a package for restart.

**Parameters**

- `String packageName` - the name of the package to restart

<a id="m-restartpackagenow-a4a029884619"></a>
### restartPackageNow(String)

```java
public void restartPackageNow(String packageName)
```

Immediately restarts a package

**Parameters**

- `String packageName` - the name of the package to restart

<a id="m-run-b6dbda048863"></a>
### run()

```java
public void run()
```

This method is the Ncs java vm main thread start

<a id="m-shutdown-60c9b1d4b111"></a>
### shutdown()

```java
public void shutdown()
```

shutdown Ncs java vm main thread

<a id="m-submitpackagealarm-7e93d8162bbf"></a>
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

Types: [ConfIdentityRef](../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [PerceivedSeverity](alarmman/common/PerceivedSeverity.md#cls-PerceivedSeverity)

Submits an alarm for a package using its class loader context.

**Parameters**

- `ClassLoader cl` - the class loader of the package generating the alarm
- `com.tailf.conf.ConfIdentityRef alarmType` - the type of alarm to submit
- `com.tailf.ncs.alarmman.common.PerceivedSeverity severity` - the perceived severity of the alarm
- `boolean cleared` - whether the alarm is cleared
- `String alarmText` - descriptive text for the alarm

<a id="m-submitpackagealarm-f8db8fb0345e"></a>
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

Types: [ConfIdentityRef](../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [PerceivedSeverity](alarmman/common/PerceivedSeverity.md#cls-PerceivedSeverity)

Submits an alarm for a package component instance.

**Parameters**

- `Object instance` - the component instance generating the alarm
- `com.tailf.conf.ConfIdentityRef alarmType` - the type of alarm to submit
- `com.tailf.ncs.alarmman.common.PerceivedSeverity severity` - the perceived severity of the alarm
- `boolean cleared` - whether the alarm is cleared
- `String alarmText` - descriptive text for the alarm

<a id="m-submitpackagealarm-a0a9b95cab23"></a>
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

Types: [ConfIdentityRef](../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [PerceivedSeverity](alarmman/common/PerceivedSeverity.md#cls-PerceivedSeverity)

Submits an alarm for a specific package by name.

**Parameters**

- `String packageName` - the name of the package generating the alarm
- `com.tailf.conf.ConfIdentityRef alarmType` - the type of alarm to submit
- `com.tailf.ncs.alarmman.common.PerceivedSeverity severity` - the perceived severity of the alarm
- `boolean cleared` - whether the alarm is cleared
- `String alarmText` - descriptive text for the alarm

<a id="m-uncaughtexception-ad07d4154b36"></a>
### uncaughtException(Thread, Throwable)

```java
public void uncaughtException(Thread t, Throwable e)
```

Handles uncaught exceptions from any thread by initiating system
 shutdown.

**Parameters**

- `Thread t` - the thread that threw the uncaught exception
- `Throwable e` - the uncaught exception

<a id="m-unload-e055e2ceb016"></a>
### unload()

**Package-private**

```java
void unload() throws Exception
```
