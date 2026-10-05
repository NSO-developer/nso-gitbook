# NcsJVMLauncher <a href="#ncsjvmlauncher-6aa61d944532" id="ncsjvmlauncher-6aa61d944532"></a>

```java
public class com.tailf.ncs.NcsJVMLauncher
```

Helper class implementing a java main() method which
 will start the Ncs java vm main thread

## Members

**Constructors**:

- [NcsJVMLauncher()](#ncsjvmlauncher-da3644742c99)

**Fields**:

- [SYSTEM_EXIT_ON_STOP](#system_exit_on_stop-213faca30ffa)
- [TAILF_SOCKET_FACTORY_CB](#tailf_socket_factory_cb-e3406d68f218)

**Methods**:

- [main(String[])](#main-1503518a8568)

## Constructors

### NcsJVMLauncher() <a href="#ncsjvmlauncher-da3644742c99" id="ncsjvmlauncher-da3644742c99"></a>

```java
public NcsJVMLauncher()
```


## Fields

### SYSTEM_EXIT_ON_STOP <a href="#system_exit_on_stop-213faca30ffa" id="system_exit_on_stop-213faca30ffa"></a>

```java
public static final String SYSTEM_EXIT_ON_STOP = "SYSTEM_EXIT_ON_STOP";
```

This field represents a system property controlling how the
 NcsJVMLauncher should stop. If a System.exit() should not be called
 this property should be set to "false". The default is true;
 Example:

 java -cp ... -DSYSTEM_EXIT_ON_STOP=false  com...NcsJVMLauncher

### TAILF_SOCKET_FACTORY_CB <a href="#tailf_socket_factory_cb-e3406d68f218" id="tailf_socket_factory_cb-e3406d68f218"></a>

```java
public static final String TAILF_SOCKET_FACTORY_CB = "TAILF_SOCKET_FACTORY_CB";
```

This field represents a system property that allows for a customized
 SocketFactory callback controlling all socket creation for
 the Ncs java vm. This callback should implement the
 [`SocketFactoryCallback`](../conf/SocketFactoryCallback.md#socketfactorycallback-4ebb017096f5) interface.
 If not set the default factory is used.
 Example:

 java -DTAILF_SOCKET_FACTORY_CB=com.example.myfactory ...


## Methods

### main(String[]) <a href="#main-1503518a8568" id="main-1503518a8568"></a>

```java
public static void main(String[] arg)
```

**Parameters**

- `String[] arg`
