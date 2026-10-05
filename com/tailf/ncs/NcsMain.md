# NcsMain <a href="#ncsmain-eb814813aed4" id="ncsmain-eb814813aed4"></a>

```java
public class com.tailf.ncs.NcsMain
    implements Runnable, Thread.UncaughtExceptionHandler
```

Main class for Ncs java vm management and control.
 This class implements the Runnable interface and should be started in a
 thread which becomes the Ncs java vm main thread.
 Normally this thread is instantiated and started by the
 [`NcsJVMLauncher`](NcsJVMLauncher.md#ncsjvmlauncher-6aa61d944532) which contains a main() method.

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

- [exitOnStop](#exitonstop-2c913a9aedcf)
- [TAILF_CLASSLOADER](#tailf_classloader-840f58ebf9fd)

**Methods**:

- [abortNcsJavaVM(Object)](#abortncsjavavm-83777887a888)
- [abortNcsJavaVM(Object, int)](#abortncsjavavm-4b9171d8233f)
- [abortNcsJavaVM(Object, int, String)](#abortncsjavavm-d4e69c891fdb)
- [deviceKeyPath(String)](#devicekeypath-b5a342a26fef)
- [getAddress()](#getaddress-08b11cceec4c)
- [getApplicationMuxManager()](#getapplicationmuxmanager-c8b034860559)
- [getDPMuxManager()](#getdpmuxmanager-d4ac372c0b84)
- [getInstance()](#getinstance-54a685332d87)
- [getInstance(SocketAddress)](#getinstance-947352e78e29)
- [getInstance(String, int)](#getinstance-ca416d27c748)
- [getLocalInstance()](#getlocalinstance-f091157c7ceb)
- [getNcsHost()](#getncshost-13b45e614659)
- [getNcsPort()](#getncsport-ec644cf198c2)
- [getNedMuxManager()](#getnedmuxmanager-639a1e227b1b)
- [getResourceManager()](#getresourcemanager-eb64f13b2c87)
- [getSinkCentral()](#getsinkcentral-92f2bcf80bdb)
- [getSourceCentral()](#getsourcecentral-0714ef465cc3)
- [handlePackageException(ClassLoader, Throwable)](#handlepackageexception-d43bb265decf)
- [handlePackageException(Object, Throwable)](#handlepackageexception-1758c60d1339)
- [handlePackageException(String, Throwable)](#handlepackageexception-bee8ca9aca8e)
- [instantiatePackageComponent(NcsPDData)](#instantiatepackagecomponent-4137ab775b1c)
- [isAddingPkgs()](#isaddingpkgs-cb8b66bb176e)
- [isRunning()](#isrunning-02db4ec84a8d)
- [isStarted()](#isstarted-5c757faf6088)
- [isUsingTailFClassloader()](#isusingtailfclassloader-04efc178552d)
- [redeployPackage(NcsPDData)](#redeploypackage-2a23d31f2642)
- [reportPackageException(ClassLoader, Throwable)](#reportpackageexception-74c8c471ddc2)
- [reportPackageException(Object, Throwable)](#reportpackageexception-746dcb7d1c60)
- [reportPackageException(String, Throwable)](#reportpackageexception-20596ab20eca)
- [restartPackage(String)](#restartpackage-161b2c0a7b51)
- [restartPackageNow(String)](#restartpackagenow-a4a029884619)
- [run()](#run-b6dbda048863)
- [shutdown()](#shutdown-60c9b1d4b111)
- [submitPackageAlarm(ClassLoader, ConfIdentityRef, PerceivedSeverity, boolean, String)](#submitpackagealarm-7e93d8162bbf)
- [submitPackageAlarm(Object, ConfIdentityRef, PerceivedSeverity, boolean, String)](#submitpackagealarm-f8db8fb0345e)
- [submitPackageAlarm(String, ConfIdentityRef, PerceivedSeverity, boolean, String)](#submitpackagealarm-a0a9b95cab23)
- [uncaughtException(Thread, Throwable)](#uncaughtexception-ad07d4154b36)
- [unload()](#unload-e055e2ceb016)

## Fields

### exitOnStop <a href="#exitonstop-2c913a9aedcf" id="exitonstop-2c913a9aedcf"></a>

**Package-private**

```java
boolean exitOnStop = null;
```

### TAILF_CLASSLOADER <a href="#tailf_classloader-840f58ebf9fd" id="tailf_classloader-840f58ebf9fd"></a>

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

### abortNcsJavaVM(Object) <a href="#abortncsjavavm-83777887a888" id="abortncsjavavm-83777887a888"></a>

```java
public static void abortNcsJavaVM(Object obj)
```

Aborts the NCS Java VM.

**Parameters**

- `Object obj` - the object context (unused)

**Deprecated:** Use [`shutdown()`](NcsMain.md#shutdown-60c9b1d4b111) instead.

### abortNcsJavaVM(Object, int) <a href="#abortncsjavavm-4b9171d8233f" id="abortncsjavavm-4b9171d8233f"></a>

```java
public static void abortNcsJavaVM(Object obj, int code)
```

Aborts the NCS Java VM with exit code.

**Parameters**

- `Object obj` - the object context (unused)
- `int code` - the exit code (unused)

**Deprecated:** Use [`shutdown()`](NcsMain.md#shutdown-60c9b1d4b111) instead.

### abortNcsJavaVM(Object, int, String) <a href="#abortncsjavavm-d4e69c891fdb" id="abortncsjavavm-d4e69c891fdb"></a>

```java
public static void abortNcsJavaVM(Object obj, int code, String message)
```

Abort Ncs Java VM

**Parameters**

- `Object obj` - the object context (unused)
- `int code` - the exit code (unused)
- `String message` - the error message (unused)

**Deprecated:** Use [`shutdown()`](NcsMain.md#shutdown-60c9b1d4b111) instead.

### deviceKeyPath(String) <a href="#devicekeypath-b5a342a26fef" id="devicekeypath-b5a342a26fef"></a>

```java
public static com.tailf.conf.ConfPath deviceKeyPath(
    String devName
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Builds the keypath of a device list entry from a device name,
 quoting the key so names containing whitespace or other special
 characters produce a valid keypath.

**Parameters**

- `String devName` - the device name

**Returns:** the keypath `/devices/device{<quoted-devName>}`

**Throws**

- `ConfException` - if the keypath cannot be constructed

### getAddress() <a href="#getaddress-08b11cceec4c" id="getaddress-08b11cceec4c"></a>

```java
public java.net.SocketAddress getAddress()
```

Get the address for the NCS Server.

**Returns:** socket address for the NCS server

### getApplicationMuxManager() <a href="#getapplicationmuxmanager-c8b034860559" id="getapplicationmuxmanager-c8b034860559"></a>

```java
public com.tailf.ncs.ctrl.ApplicationMuxManager getApplicationMuxManager()
```

Types: [ApplicationMuxManager](ctrl/ApplicationMuxManager.md#applicationmuxmanager-1cb698beb331)

Get the ApplicationMuxManager instance.
 This manager controls all application component threads from all
 packages.

**Returns:** ApplicationMuxManager instance

### getDPMuxManager() <a href="#getdpmuxmanager-d4ac372c0b84" id="getdpmuxmanager-d4ac372c0b84"></a>

```java
public com.tailf.ncs.ctrl.DpMuxManager getDPMuxManager()
```

Types: [DpMuxManager](ctrl/DpMuxManager.md#dpmuxmanager-a830918ce722)

Get the DpMuxManager instance.
 This manager controls the DP instances and all registered callback
 components from all packages.

**Returns:** DpMuxManager instance

### getInstance() <a href="#getinstance-54a685332d87" id="getinstance-54a685332d87"></a>

```java
public static com.tailf.ncs.NcsMain getInstance()
```

Types: [NcsMain](NcsMain.md#ncsmain-eb814813aed4)

Gets the NcsMain instance associated with the current thread.

**Returns:** instance associated with the current thread, or null
         if no instance has been started

### getInstance(SocketAddress) <a href="#getinstance-947352e78e29" id="getinstance-947352e78e29"></a>

```java
public static synchronized com.tailf.ncs.NcsMain getInstance(java.net.SocketAddress address)
```

Types: [NcsMain](NcsMain.md#ncsmain-eb814813aed4)

Get an instance that should connect to the given address. If an
 instance already exists for the given address it is returned.

**Parameters**

- `java.net.SocketAddress address` - socket address to connect to

**Returns:** an instance that is connected or will connect to the given
         address

### getInstance(String, int) <a href="#getinstance-ca416d27c748" id="getinstance-ca416d27c748"></a>

```java
public static com.tailf.ncs.NcsMain getInstance(String host, int port)
```

Types: [NcsMain](NcsMain.md#ncsmain-eb814813aed4)

Gets the singleton instance of the NcsMain class.

**Parameters**

- `String host` - the NCS host to connect to
- `int port` - the NCS port to connect to

**Returns:** NcsMain instance

**Deprecated:** Use [`getInstance(SocketAddress)`](NcsMain.md#getinstance-947352e78e29) instead.

### getLocalInstance() <a href="#getlocalinstance-f091157c7ceb" id="getlocalinstance-f091157c7ceb"></a>

```java
public static java.util.Optional<com.tailf.ncs.NcsMain> getLocalInstance()
```

Types: [NcsMain](NcsMain.md#ncsmain-eb814813aed4)

Gets the NcsMain instance associated with the current thread.

**Returns:** an optional containing the instance associated with the
         current thread, or empty of no instance has been started

### getNcsHost() <a href="#getncshost-13b45e614659" id="getncshost-13b45e614659"></a>

```java
public String getNcsHost()
```

Get the hostname or IP address for the NCS Server.

**Returns:** hostname or IP address for NCS server

**Deprecated:** Use the [`getAddress()`](NcsMain.md#getaddress-08b11cceec4c) method instead

### getNcsPort() <a href="#getncsport-ec644cf198c2" id="getncsport-ec644cf198c2"></a>

```java
public int getNcsPort()
```

Get the port number for the NCS Server.

**Returns:** NCS server port

**Deprecated:** Use the [`getAddress()`](NcsMain.md#getaddress-08b11cceec4c) method instead

### getNedMuxManager() <a href="#getnedmuxmanager-639a1e227b1b" id="getnedmuxmanager-639a1e227b1b"></a>

```java
public com.tailf.ncs.ctrl.NedMuxManager getNedMuxManager()
```

Types: [NedMuxManager](ctrl/NedMuxManager.md#nedmuxmanager-2d9fb7e9f093)

Get the NedMuxManager instance.
 This manager controls the NedMux and all registered NED components
 from all packages.

**Returns:** NedMuxManager instance

### getResourceManager() <a href="#getresourcemanager-eb64f13b2c87" id="getresourcemanager-eb64f13b2c87"></a>

```java
public com.tailf.ncs.ResourceManager getResourceManager()
```

Types: [ResourceManager](ResourceManager.md#resourcemanager-e87f3c3222f5)

Get the ResourceManager instance.

**Returns:** resource manager for this NCS instance

### getSinkCentral() <a href="#getsinkcentral-92f2bcf80bdb" id="getsinkcentral-92f2bcf80bdb"></a>

```java
public com.tailf.ncs.alarmman.producer.AlarmSinkCentral getSinkCentral()
```

Types: [AlarmSinkCentral](alarmman/producer/AlarmSinkCentral.md#alarmsinkcentral-a7b03cb7fde1)

Get the NCS AlarmSinkCentral instance.

**Returns:** AlarmSinkCentral instance

### getSourceCentral() <a href="#getsourcecentral-0714ef465cc3" id="getsourcecentral-0714ef465cc3"></a>

```java
public com.tailf.ncs.alarmman.consumer.AlarmSourceCentral getSourceCentral()
```

Types: [AlarmSourceCentral](alarmman/consumer/AlarmSourceCentral.md#alarmsourcecentral-bdfee4422149)

Get the NCS AlarmSourceCentral instance.

**Returns:** AlarmSourceCentral instance

### handlePackageException(ClassLoader, Throwable) <a href="#handlepackageexception-d43bb265decf" id="handlepackageexception-d43bb265decf"></a>

```java
public Throwable handlePackageException(ClassLoader cl, Throwable e)
```

Handles exceptions from package components by class loader context.

**Parameters**

- `ClassLoader cl` - the class loader associated with the failing package
- `Throwable e` - the exception to handle

**Returns:** the exception to be thrown

### handlePackageException(Object, Throwable) <a href="#handlepackageexception-1758c60d1339" id="handlepackageexception-1758c60d1339"></a>

```java
public Throwable handlePackageException(Object instance, Throwable e)
```

Handles exceptions from package components.

**Parameters**

- `Object instance` - the object instance that threw the exception
- `Throwable e` - the exception to handle

**Returns:** the exception to be thrown

### handlePackageException(String, Throwable) <a href="#handlepackageexception-bee8ca9aca8e" id="handlepackageexception-bee8ca9aca8e"></a>

```java
public Throwable handlePackageException(String packageName, Throwable e)
```

Handles exceptions from a specific package by name.

**Parameters**

- `String packageName` - the name of the package that generated the exception
- `Throwable e` - the exception to handle

**Returns:** the exception to be thrown

### instantiatePackageComponent(NcsPDData) <a href="#instantiatepackagecomponent-4137ab775b1c" id="instantiatepackagecomponent-4137ab775b1c"></a>

```java
public void instantiatePackageComponent(com.tailf.ncs.ctrl.NcsPDData pdData) throws Exception
```

Types: [NcsPDData](ctrl/NcsPDData.md#ncspddata-37ade94897d4)

Instantiates and registers components for an NCS package.

**Parameters**

- `com.tailf.ncs.ctrl.NcsPDData pdData` - package deployment data containing components to
               instantiate

**Throws**

- `Exception` - if component instantiation fails

### isAddingPkgs() <a href="#isaddingpkgs-cb8b66bb176e" id="isaddingpkgs-cb8b66bb176e"></a>

```java
public boolean isAddingPkgs()
```

Checks if packages are being added to the system.

**Returns:** true if packages are currently being added

### isRunning() <a href="#isrunning-02db4ec84a8d" id="isrunning-02db4ec84a8d"></a>

```java
public boolean isRunning()
```

Checks if the NCS main thread is running.

**Returns:** true if the NCS main thread is running

### isStarted() <a href="#isstarted-5c757faf6088" id="isstarted-5c757faf6088"></a>

```java
public static boolean isStarted()
```

Checks if the NCS main thread has been started.

**Returns:** true if the NCS main thread is running

**Deprecated:** Use [`isRunning()`](NcsMain.md#isrunning-02db4ec84a8d) instead

### isUsingTailFClassloader() <a href="#isusingtailfclassloader-04efc178552d" id="isusingtailfclassloader-04efc178552d"></a>

```java
public boolean isUsingTailFClassloader()
```

Checks if this instance was started with the Tail-f Jar classloader, as
 opposed to running with the standard java system classloader.
 The default is running with the Tail-f Jar classloader, which is
 necessary to be able to perform component hot re-deploy.

**Returns:** true if the Tail-f Jar classloader is active

### redeployPackage(NcsPDData) <a href="#redeploypackage-2a23d31f2642" id="redeploypackage-2a23d31f2642"></a>

```java
public void redeployPackage(com.tailf.ncs.ctrl.NcsPDData pdData) throws Exception
```

Types: [NcsPDData](ctrl/NcsPDData.md#ncspddata-37ade94897d4)

Hot redeploy of all components for a package.

**Parameters**

- `com.tailf.ncs.ctrl.NcsPDData pdData` - package deployment data for the package to redeploy

**Throws**

- `Exception` - if redeployment fails

### reportPackageException(ClassLoader, Throwable) <a href="#reportpackageexception-74c8c471ddc2" id="reportpackageexception-74c8c471ddc2"></a>

```java
public static Throwable reportPackageException(ClassLoader cl, Throwable e)
```

Reports package exceptions using class loader context.

**Parameters**

- `ClassLoader cl` - the class loader of the failing package
- `Throwable e` - the exception to report

**Returns:** the processed exception

**Deprecated:** Use [`handlePackageException(ClassLoader, Throwable)`](NcsMain.md#handlepackageexception-d43bb265decf)
             instead.

### reportPackageException(Object, Throwable) <a href="#reportpackageexception-746dcb7d1c60" id="reportpackageexception-746dcb7d1c60"></a>

```java
public static Throwable reportPackageException(Object instance, Throwable e)
```

Reports package exceptions and initiates restart handling.

**Parameters**

- `Object instance` - the component instance that threw the exception
- `Throwable e` - the exception to report

**Returns:** the processed exception

**Deprecated:** Use [`handlePackageException(Object, Throwable)`](NcsMain.md#handlepackageexception-1758c60d1339)
             instead.

### reportPackageException(String, Throwable) <a href="#reportpackageexception-20596ab20eca" id="reportpackageexception-20596ab20eca"></a>

```java
public static Throwable reportPackageException(String packageName, Throwable e)
```

Reports package exceptions by package name.

**Parameters**

- `String packageName` - the name of the failing package
- `Throwable e` - the exception to report

**Returns:** the processed exception

**Deprecated:** Use [`handlePackageException(String, Throwable)`](NcsMain.md#handlepackageexception-bee8ca9aca8e)
             instead.

### restartPackage(String) <a href="#restartpackage-161b2c0a7b51" id="restartpackage-161b2c0a7b51"></a>

```java
public void restartPackage(String packageName)
```

Schedules a package for restart.

**Parameters**

- `String packageName` - the name of the package to restart

### restartPackageNow(String) <a href="#restartpackagenow-a4a029884619" id="restartpackagenow-a4a029884619"></a>

```java
public void restartPackageNow(String packageName)
```

Immediately restarts a package

**Parameters**

- `String packageName` - the name of the package to restart

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```

This method is the Ncs java vm main thread start

### shutdown() <a href="#shutdown-60c9b1d4b111" id="shutdown-60c9b1d4b111"></a>

```java
public void shutdown()
```

shutdown Ncs java vm main thread

### submitPackageAlarm(ClassLoader, ConfIdentityRef, PerceivedSeverity, boolean, String) <a href="#submitpackagealarm-7e93d8162bbf" id="submitpackagealarm-7e93d8162bbf"></a>

```java
public static void submitPackageAlarm(
    ClassLoader cl,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.PerceivedSeverity severity,
    boolean cleared,
    String alarmText
)
```

Types: [ConfIdentityRef](../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [PerceivedSeverity](alarmman/common/PerceivedSeverity.md#perceivedseverity-80ffc24a94f2)

Submits an alarm for a package using its class loader context.

**Parameters**

- `ClassLoader cl` - the class loader of the package generating the alarm
- `com.tailf.conf.ConfIdentityRef alarmType` - the type of alarm to submit
- `com.tailf.ncs.alarmman.common.PerceivedSeverity severity` - the perceived severity of the alarm
- `boolean cleared` - whether the alarm is cleared
- `String alarmText` - descriptive text for the alarm

### submitPackageAlarm(Object, ConfIdentityRef, PerceivedSeverity, boolean, String) <a href="#submitpackagealarm-f8db8fb0345e" id="submitpackagealarm-f8db8fb0345e"></a>

```java
public static void submitPackageAlarm(
    Object instance,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.PerceivedSeverity severity,
    boolean cleared,
    String alarmText
)
```

Types: [ConfIdentityRef](../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [PerceivedSeverity](alarmman/common/PerceivedSeverity.md#perceivedseverity-80ffc24a94f2)

Submits an alarm for a package component instance.

**Parameters**

- `Object instance` - the component instance generating the alarm
- `com.tailf.conf.ConfIdentityRef alarmType` - the type of alarm to submit
- `com.tailf.ncs.alarmman.common.PerceivedSeverity severity` - the perceived severity of the alarm
- `boolean cleared` - whether the alarm is cleared
- `String alarmText` - descriptive text for the alarm

### submitPackageAlarm(String, ConfIdentityRef, PerceivedSeverity, boolean, String) <a href="#submitpackagealarm-a0a9b95cab23" id="submitpackagealarm-a0a9b95cab23"></a>

```java
public static void submitPackageAlarm(
    String packageName,
    com.tailf.conf.ConfIdentityRef alarmType,
    com.tailf.ncs.alarmman.common.PerceivedSeverity severity,
    boolean cleared,
    String alarmText
)
```

Types: [ConfIdentityRef](../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [PerceivedSeverity](alarmman/common/PerceivedSeverity.md#perceivedseverity-80ffc24a94f2)

Submits an alarm for a specific package by name.

**Parameters**

- `String packageName` - the name of the package generating the alarm
- `com.tailf.conf.ConfIdentityRef alarmType` - the type of alarm to submit
- `com.tailf.ncs.alarmman.common.PerceivedSeverity severity` - the perceived severity of the alarm
- `boolean cleared` - whether the alarm is cleared
- `String alarmText` - descriptive text for the alarm

### uncaughtException(Thread, Throwable) <a href="#uncaughtexception-ad07d4154b36" id="uncaughtexception-ad07d4154b36"></a>

```java
public void uncaughtException(Thread t, Throwable e)
```

Handles uncaught exceptions from any thread by initiating system
 shutdown.

**Parameters**

- `Thread t` - the thread that threw the uncaught exception
- `Throwable e` - the uncaught exception

### unload() <a href="#unload-e055e2ceb016" id="unload-e055e2ceb016"></a>

**Package-private**

```java
void unload() throws Exception
```
