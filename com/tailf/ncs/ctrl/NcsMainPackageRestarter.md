# NcsMainPackageRestarter <a href="#ncsmainpackagerestarter-41a8f297c8c2" id="ncsmainpackagerestarter-41a8f297c8c2"></a>

```java
public class com.tailf.ncs.ctrl.NcsMainPackageRestarter
    implements Runnable
```

Package restarter helper.

## Members

**Constructors**:

- [NcsMainPackageRestarter(NcsMain, int)](#ncsmainpackagerestarter-74d9915593e3)

**Methods**:

- [addPackage(String)](#addpackage-73f3ce22ecee)
- [run()](#run-b6dbda048863)
- [start()](#start-79e12dafe9f8)
- [stop()](#stop-a62ecc446f97)

## Constructors

### NcsMainPackageRestarter(NcsMain, int) <a href="#ncsmainpackagerestarter-74d9915593e3" id="ncsmainpackagerestarter-74d9915593e3"></a>

```java
public NcsMainPackageRestarter(com.tailf.ncs.NcsMain main, int coolingTime)
```

Types: [NcsMain](../NcsMain.md#ncsmain-eb814813aed4)

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `int coolingTime`


## Methods

### addPackage(String) <a href="#addpackage-73f3ce22ecee" id="addpackage-73f3ce22ecee"></a>

```java
public void addPackage(String packageName)
```

Add a package that should be restarted.

**Parameters**

- `String packageName` - Name of the package to restart

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```

### start() <a href="#start-79e12dafe9f8" id="start-79e12dafe9f8"></a>

```java
public synchronized void start()
```

Start the package restarter.

### stop() <a href="#stop-a62ecc446f97" id="stop-a62ecc446f97"></a>

```java
public synchronized void stop()
```

Stop the package restarter.
