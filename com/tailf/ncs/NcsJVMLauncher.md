<a id="s-NcsJVMLauncher"></a>
# NcsJVMLauncher

```java
public class com.tailf.ncs.NcsJVMLauncher
```

Helper class implementing a java main() method which
 will start the Ncs java vm main thread

## Members

**Constructors**:

- [NcsJVMLauncher()](#s-NcsJVMLauncher-1)

**Fields**:

- [SYSTEM_EXIT_ON_STOP](#s-SYSTEM_EXIT_ON_STOP)
- [TAILF_SOCKET_FACTORY_CB](#s-TAILF_SOCKET_FACTORY_CB)

**Methods**:

- [main(String[])](#s-main)

## Constructors

<a id="s-NcsJVMLauncher-1"></a>
### NcsJVMLauncher()

```java
public NcsJVMLauncher()
```


## Fields

<a id="s-SYSTEM_EXIT_ON_STOP"></a>
### SYSTEM_EXIT_ON_STOP

```java
public static final String SYSTEM_EXIT_ON_STOP = "SYSTEM_EXIT_ON_STOP";
```

This field represents a system property controlling how the
 NcsJVMLauncher should stop. If a System.exit() should not be called
 this property should be set to "false". The default is true;
 Example:

 java -cp ... -DSYSTEM_EXIT_ON_STOP=false  com...NcsJVMLauncher

<a id="s-TAILF_SOCKET_FACTORY_CB"></a>
### TAILF_SOCKET_FACTORY_CB

```java
public static final String TAILF_SOCKET_FACTORY_CB = "TAILF_SOCKET_FACTORY_CB";
```

This field represents a system property that allows for a customized
 SocketFactory callback controlling all socket creation for
 the Ncs java vm. This callback should implement the
 [`SocketFactoryCallback`](../conf/SocketFactoryCallback.md#s-SocketFactoryCallback) interface.
 If not set the default factory is used.
 Example:

 java -DTAILF_SOCKET_FACTORY_CB=com.example.myfactory ...


## Methods

<a id="s-main"></a>
### main(String[])

```java
public static void main(String[] arg)
```

**Parameters**

- `String[] arg`
