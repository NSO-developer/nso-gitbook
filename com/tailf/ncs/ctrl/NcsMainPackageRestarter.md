# NcsMainPackageRestarter <a href="#cls-NcsMainPackageRestarter" id="cls-NcsMainPackageRestarter"></a>

```java
public class com.tailf.ncs.ctrl.NcsMainPackageRestarter
    implements Runnable
```

Package restarter helper.

## Members

**Constructors**:

- [NcsMainPackageRestarter(NcsMain, int)](#m-NcsMainPackageRestarter-74d9915593e3)

**Methods**:

- [addPackage(String)](#m-addPackage-73f3ce22ecee)
- [run()](#m-run-b6dbda048863)
- [start()](#m-start-79e12dafe9f8)
- [stop()](#m-stop-a62ecc446f97)

## Constructors

### NcsMainPackageRestarter(NcsMain, int) <a href="#m-NcsMainPackageRestarter-74d9915593e3" id="m-NcsMainPackageRestarter-74d9915593e3"></a>

```java
public NcsMainPackageRestarter(com.tailf.ncs.NcsMain main, int coolingTime)
```

Types: [NcsMain](../NcsMain.md#cls-NcsMain)

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `int coolingTime`


## Methods

### addPackage(String) <a href="#m-addPackage-73f3ce22ecee" id="m-addPackage-73f3ce22ecee"></a>

```java
public void addPackage(String packageName)
```

Add a package that should be restarted.

**Parameters**

- `String packageName` - Name of the package to restart

### run() <a href="#m-run-b6dbda048863" id="m-run-b6dbda048863"></a>

```java
public void run()
```

### start() <a href="#m-start-79e12dafe9f8" id="m-start-79e12dafe9f8"></a>

```java
public synchronized void start()
```

Start the package restarter.

### stop() <a href="#m-stop-a62ecc446f97" id="m-stop-a62ecc446f97"></a>

```java
public synchronized void stop()
```

Stop the package restarter.
