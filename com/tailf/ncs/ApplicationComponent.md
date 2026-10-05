<a id="s-ApplicationComponent"></a>
# ApplicationComponent

```java
public interface com.tailf.ncs.ApplicationComponent
    extends Runnable
```

User defined Applications should implement this interface that
 extends Runnable, hence also the run() method has to be implemented.
 These applications are registered as components of type
 "application" in a Ncs packages.

 Ncs Java VM will start this application in a separate thread.
 The init() method is called before the thread is started.
 The finish() method is expected to stop the thread. Hence stopping
 the thread is user responsibility

## Members

**Methods**:

- [finish()](#s-finish)
- [init()](#s-init)

## Methods

<a id="s-finish"></a>
### finish()

```java
public abstract void finish() throws Exception
```

This method is called by the Ncs Java vm when the thread
 should be stopped. Stopping the thread is the responsibility of
 this method.

**Throws**

- `Exception` - if the finish operation fails

<a id="s-init"></a>
### init()

```java
public abstract void init() throws Exception
```

This method is called by the Ncs Java vm before the
 thread is started.

**Throws**

- `Exception` - if the initialization fails
