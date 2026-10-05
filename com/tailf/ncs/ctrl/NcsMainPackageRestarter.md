<a id="cls-NcsMainPackageRestarter"></a>
# NcsMainPackageRestarter

```java
public class com.tailf.ncs.ctrl.NcsMainPackageRestarter
    implements Runnable
```

Package restarter helper.

## Members

**Constructors**:

- [NcsMainPackageRestarter(NcsMain, int)](#m-ncsmainpackagerestarter-74d9915593e3)

**Methods**:

- [addPackage(String)](#m-addpackage-73f3ce22ecee)
- [run()](#m-run-b6dbda048863)
- [start()](#m-start-79e12dafe9f8)
- [stop()](#m-stop-a62ecc446f97)

## Constructors

<a id="m-ncsmainpackagerestarter-74d9915593e3"></a>
### NcsMainPackageRestarter(NcsMain, int)

```java
public NcsMainPackageRestarter(com.tailf.ncs.NcsMain main, int coolingTime)
```

Types: [NcsMain](../NcsMain.md#cls-NcsMain)

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `int coolingTime`


## Methods

<a id="m-addpackage-73f3ce22ecee"></a>
### addPackage(String)

```java
public void addPackage(String packageName)
```

Add a package that should be restarted.

**Parameters**

- `String packageName` - Name of the package to restart

<a id="m-run-b6dbda048863"></a>
### run()

```java
public void run()
```

<a id="m-start-79e12dafe9f8"></a>
### start()

```java
public synchronized void start()
```

Start the package restarter.

<a id="m-stop-a62ecc446f97"></a>
### stop()

```java
public synchronized void stop()
```

Stop the package restarter.
