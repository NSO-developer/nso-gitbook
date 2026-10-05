# NcsPDData <a href="#ncspddata-37ade94897d4" id="ncspddata-37ade94897d4"></a>

```java
public class com.tailf.ncs.ctrl.NcsPDData
```

Parsed command Package data

## Members

**Constructors**:

- [NcsPDData\(String\)](#ncspddata-91228fd462c6)

**Methods**:

- [addComponent\(NcsComponentData\)](#addcomponent-da8b61146baf)
- [addJar\(String\)](#addjar-8c5412df98d3)
- [clearRestartsCounter\(\)](#clearrestartscounter-4fe6c7d99114)
- [getComponentList\(\)](#getcomponentlist-f61542199fc2)
- [getComponents\(\)](#getcomponents-032334d0acf0)
- [getFirstRestartEpoch\(\)](#getfirstrestartepoch-3acd5fe7731e)
- [getJars\(\)](#getjars-3fd56ade02b6)
- [getPackageClassLoader\(\)](#getpackageclassloader-f15a9d807cf6)
- [getPackageName\(\)](#getpackagename-8e58a29d7a5d)
- [getRestartsCounter\(\)](#getrestartscounter-e7b1d3e6e856)
- [incrementRestartsCounter\(\)](#incrementrestartscounter-9c01c7a82e0f)
- [isRestarting\(\)](#isrestarting-8ada096b33a6)
- [setPackageClassLoader\(ClassLoader\)](#setpackageclassloader-98bb62de5bd1)
- [setRestarting\(boolean\)](#setrestarting-e4cc2e8efccf)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### NcsPDData(String) <a href="#ncspddata-91228fd462c6" id="ncspddata-91228fd462c6"></a>

```java
public NcsPDData(String packageName)
```

**Parameters**

- `String packageName`


## Methods

### addComponent(NcsComponentData) <a href="#addcomponent-da8b61146baf" id="addcomponent-da8b61146baf"></a>

```java
public void addComponent(com.tailf.ncs.ctrl.NcsComponentData component)
```

Types: [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData component`

### addJar(String) <a href="#addjar-8c5412df98d3" id="addjar-8c5412df98d3"></a>

```java
public void addJar(String jarName)
```

**Parameters**

- `String jarName`

### clearRestartsCounter() <a href="#clearrestartscounter-4fe6c7d99114" id="clearrestartscounter-4fe6c7d99114"></a>

```java
public void clearRestartsCounter()
```

### getComponentList() <a href="#getcomponentlist-f61542199fc2" id="getcomponentlist-f61542199fc2"></a>

```java
public java.util.List<com.tailf.ncs.ctrl.NcsComponentData> getComponentList()
```

Types: [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

Retrieve the components that this package contains
 as an List.

### getComponents() <a href="#getcomponents-032334d0acf0" id="getcomponents-032334d0acf0"></a>

```java
public com.tailf.ncs.ctrl.NcsComponentData[] getComponents()
```

Types: [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

Retrieve the components that this package contains
 as an array.

### getFirstRestartEpoch() <a href="#getfirstrestartepoch-3acd5fe7731e" id="getfirstrestartepoch-3acd5fe7731e"></a>

```java
public long getFirstRestartEpoch()
```

### getJars() <a href="#getjars-3fd56ade02b6" id="getjars-3fd56ade02b6"></a>

```java
public String[] getJars()
```

### getPackageClassLoader() <a href="#getpackageclassloader-f15a9d807cf6" id="getpackageclassloader-f15a9d807cf6"></a>

```java
public ClassLoader getPackageClassLoader()
```

### getPackageName() <a href="#getpackagename-8e58a29d7a5d" id="getpackagename-8e58a29d7a5d"></a>

```java
public String getPackageName()
```

Retrieve the name of the package as specified
 in package-meta.xml

### getRestartsCounter() <a href="#getrestartscounter-e7b1d3e6e856" id="getrestartscounter-e7b1d3e6e856"></a>

```java
public int getRestartsCounter()
```

### incrementRestartsCounter() <a href="#incrementrestartscounter-9c01c7a82e0f" id="incrementrestartscounter-9c01c7a82e0f"></a>

```java
public void incrementRestartsCounter()
```

### isRestarting() <a href="#isrestarting-8ada096b33a6" id="isrestarting-8ada096b33a6"></a>

```java
public boolean isRestarting()
```

### setPackageClassLoader(ClassLoader) <a href="#setpackageclassloader-98bb62de5bd1" id="setpackageclassloader-98bb62de5bd1"></a>

```java
public void setPackageClassLoader(ClassLoader packageClassLoader)
```

**Parameters**

- `ClassLoader packageClassLoader`

### setRestarting(boolean) <a href="#setrestarting-e4cc2e8efccf" id="setrestarting-e4cc2e8efccf"></a>

```java
public void setRestarting(boolean restarting)
```

**Parameters**

- `boolean restarting`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
