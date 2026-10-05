# NcsJVMLauncher <a href="#cls-NcsJVMLauncher" id="cls-NcsJVMLauncher"></a>

```java
public class com.tailf.ncs.NcsJVMLauncher
```

Helper class implementing a java main() method which
 will start the Ncs java vm main thread

## Members

**Constructors**:

- [NcsJVMLauncher()](#m-NcsJVMLauncher-da3644742c99)

**Fields**:

- [SYSTEM_EXIT_ON_STOP](#m-SYSTEM_EXIT_ON_STOP)
- [TAILF_SOCKET_FACTORY_CB](#m-TAILF_SOCKET_FACTORY_CB)

**Methods**:

- [main(String[])](#m-main-1503518a8568)

## Constructors

### NcsJVMLauncher() <a href="#m-NcsJVMLauncher-da3644742c99" id="m-NcsJVMLauncher-da3644742c99"></a>

```java
public NcsJVMLauncher()
```


## Fields

### SYSTEM_EXIT_ON_STOP <a href="#m-SYSTEM_EXIT_ON_STOP" id="m-SYSTEM_EXIT_ON_STOP"></a>

```java
public static final String SYSTEM_EXIT_ON_STOP = "SYSTEM_EXIT_ON_STOP";
```

This field represents a system property controlling how the
 NcsJVMLauncher should stop. If a System.exit() should not be called
 this property should be set to "false". The default is true;
 Example:

 java -cp ... -DSYSTEM_EXIT_ON_STOP=false  com...NcsJVMLauncher

### TAILF_SOCKET_FACTORY_CB <a href="#m-TAILF_SOCKET_FACTORY_CB" id="m-TAILF_SOCKET_FACTORY_CB"></a>

```java
public static final String TAILF_SOCKET_FACTORY_CB = "TAILF_SOCKET_FACTORY_CB";
```

This field represents a system property that allows for a customized
 SocketFactory callback controlling all socket creation for
 the Ncs java vm. This callback should implement the
 [`SocketFactoryCallback`](../conf/SocketFactoryCallback.md#cls-SocketFactoryCallback) interface.
 If not set the default factory is used.
 Example:

 java -DTAILF_SOCKET_FACTORY_CB=com.example.myfactory ...


## Methods

### main(String[]) <a href="#m-main-1503518a8568" id="m-main-1503518a8568"></a>

```java
public static void main(String[] arg)
```

**Parameters**

- `String[] arg`
