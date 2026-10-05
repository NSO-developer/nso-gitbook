# NcsLogger <a href="#ncslogger-0139fac936a2" id="ncslogger-0139fac936a2"></a>

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

- [config\(SocketAddress\)](#config-27b84e0fef53)
- [config\(SocketAddress, boolean\)](#config-ecb3e9b393e2)
- [config\(String, int\)](#config-1ba577c4f8cb)
- [config\(String, int, boolean\)](#config-69cc5a37a307)
- [run\(\)](#run-b6dbda048863)
- [stop\(\)](#stop-a62ecc446f97)

**Nested Types**:

- [LoggConfigurator](NcsLogger/LoggConfigurator.md#loggconfigurator-94c239f258ab)
- [LogIter](NcsLogger/LogIter.md#logiter-ecede56df6fd)
- [NedIdIter](NcsLogger/NedIdIter.md#nediditer-c9ce7eb389da)
- [VerbosityIter](NcsLogger/VerbosityIter.md#verbosityiter-e51c846079ee)

## Methods

### config(SocketAddress) <a href="#config-27b84e0fef53" id="config-27b84e0fef53"></a>

```java
public static void config(java.net.SocketAddress address)
```

**Parameters**

- `java.net.SocketAddress address`

### config(SocketAddress, boolean) <a href="#config-ecb3e9b393e2" id="config-ecb3e9b393e2"></a>

```java
public static void config(java.net.SocketAddress address, boolean readConfig)
```

**Parameters**

- `java.net.SocketAddress address`
- `boolean readConfig`

### config(String, int) <a href="#config-1ba577c4f8cb" id="config-1ba577c4f8cb"></a>

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

### config(String, int, boolean) <a href="#config-69cc5a37a307" id="config-69cc5a37a307"></a>

```java
public static void config(String host, int port, boolean readConfig)
```

**Parameters**

- `String host`
- `int port`
- `boolean readConfig`

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```

### stop() <a href="#stop-a62ecc446f97" id="stop-a62ecc446f97"></a>

```java
public static void stop()
```


## Nested Types

- [LoggConfigurator](NcsLogger/LoggConfigurator.md#loggconfigurator-94c239f258ab)
- [LogIter](NcsLogger/LogIter.md#logiter-ecede56df6fd)
- [NedIdIter](NcsLogger/NedIdIter.md#nediditer-c9ce7eb389da)
- [VerbosityIter](NcsLogger/VerbosityIter.md#verbosityiter-e51c846079ee)
