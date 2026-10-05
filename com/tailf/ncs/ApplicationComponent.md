# ApplicationComponent <a href="#applicationcomponent-05ae0996aaa3" id="applicationcomponent-05ae0996aaa3"></a>

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

- [finish\(\)](#finish-8c785ae2e6bb)
- [init\(\)](#init-e3919b885d98)

## Methods

### finish() <a href="#finish-8c785ae2e6bb" id="finish-8c785ae2e6bb"></a>

```java
public abstract void finish() throws Exception
```

This method is called by the Ncs Java vm when the thread
 should be stopped. Stopping the thread is the responsibility of
 this method.

**Throws**

- `Exception` - if the finish operation fails

### init() <a href="#init-e3919b885d98" id="init-e3919b885d98"></a>

```java
public abstract void init() throws Exception
```

This method is called by the Ncs Java vm before the
 thread is started.

**Throws**

- `Exception` - if the initialization fails
