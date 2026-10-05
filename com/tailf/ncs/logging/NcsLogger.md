<a id="s-NcsLogger"></a>
# NcsLogger

```java
public class com.tailf.ncs.logging.NcsLogger
    implements Runnable
```

NCS Logging Management.

 Handles the logging functionality in NCS.
 By default all tailf loggers is set to level-warn
 (Only com.tailf.ncs.NcsMain is set to level-info)
 this is done when parsing the com/tailf/ncs/logging/log4j2.xml
 in ncs.jar.

 This class reads the NCS initial configuration from
 the resource @ com/tailf/ncs/logging/log4j2.xml if the user did not
 provide log4j2.xml file in his cp at start-up to setup the initial
 levels. After reading the log4j2.xml it applies the log levels
 which is stored in Cdb thus overriding the initial values.

 This class sets up a configuration subscription
 so that logging configuration changes take effect immediately after
 commit changes in CLI.

## Members

**Methods**:

- [config(SocketAddress)](#s-config)
- [config(SocketAddress, boolean)](#s-config-1)
- [config(String, int)](#s-config-2)
- [config(String, int, boolean)](#s-config-3)
- [run()](#s-run)
- [stop()](#s-stop)

**Nested Types**:

- [LoggConfigurator](NcsLogger/LoggConfigurator.md#s-LoggConfigurator)
- [LogIter](NcsLogger/LogIter.md#s-LogIter)
- [NedIdIter](NcsLogger/NedIdIter.md#s-NedIdIter)
- [VerbosityIter](NcsLogger/VerbosityIter.md#s-VerbosityIter)

## Methods

<a id="s-config"></a>
### config(SocketAddress)

```java
public static void config(java.net.SocketAddress address)
```

**Parameters**

- `java.net.SocketAddress address`

<a id="s-config-1"></a>
### config(SocketAddress, boolean)

```java
public static void config(java.net.SocketAddress address, boolean readConfig)
```

**Parameters**

- `java.net.SocketAddress address`
- `boolean readConfig`

<a id="s-config-2"></a>
### config(String, int)

```java
public static void config(String host, int port)
```

Creates and setup a subscriber that listen on changes
 of log levels in "/ncs:java-vm/java-logging/logger".

 The method creates a subscriber that listen for changes in loggers
 levels at runtime. One can change a loggers level at runtime by
 setting a level for a specific logger.

 ex.
 %> set java-vm java-logging logger com.mypkg.MyCls level level-info
 %> commit
 will change the the log4j logger com.mypkg.MyCls to log4jLevel
 info.

**Parameters**

- `String host` - hostname or ip for ncs
- `int port` - port number

<a id="s-config-3"></a>
### config(String, int, boolean)

```java
public static void config(String host, int port, boolean readConfig)
```

**Parameters**

- `String host`
- `int port`
- `boolean readConfig`

<a id="s-run"></a>
### run()

```java
public void run()
```

<a id="s-stop"></a>
### stop()

```java
public static void stop()
```


## Nested Types

- [LoggConfigurator](NcsLogger/LoggConfigurator.md)
- [LogIter](NcsLogger/LogIter.md)
- [NedIdIter](NcsLogger/NedIdIter.md)
- [VerbosityIter](NcsLogger/VerbosityIter.md)
