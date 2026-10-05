# NcsPDData <a href="#cls-NcsPDData" id="cls-NcsPDData"></a>

```java
public class com.tailf.ncs.ctrl.NcsPDData
```

Parsed command Package data

## Members

**Constructors**:

- [NcsPDData(String)](#m-NcsPDData-91228fd462c6)

**Methods**:

- [addComponent(NcsComponentData)](#m-addComponent-da8b61146baf)
- [addJar(String)](#m-addJar-8c5412df98d3)
- [clearRestartsCounter()](#m-clearRestartsCounter-4fe6c7d99114)
- [getComponentList()](#m-getComponentList-f61542199fc2)
- [getComponents()](#m-getComponents-032334d0acf0)
- [getFirstRestartEpoch()](#m-getFirstRestartEpoch-3acd5fe7731e)
- [getJars()](#m-getJars-3fd56ade02b6)
- [getPackageClassLoader()](#m-getPackageClassLoader-f15a9d807cf6)
- [getPackageName()](#m-getPackageName-8e58a29d7a5d)
- [getRestartsCounter()](#m-getRestartsCounter-e7b1d3e6e856)
- [incrementRestartsCounter()](#m-incrementRestartsCounter-9c01c7a82e0f)
- [isRestarting()](#m-isRestarting-8ada096b33a6)
- [setPackageClassLoader(ClassLoader)](#m-setPackageClassLoader-98bb62de5bd1)
- [setRestarting(boolean)](#m-setRestarting-e4cc2e8efccf)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### NcsPDData(String) <a href="#m-NcsPDData-91228fd462c6" id="m-NcsPDData-91228fd462c6"></a>

```java
public NcsPDData(String packageName)
```

**Parameters**

- `String packageName`


## Methods

### addComponent(NcsComponentData) <a href="#m-addComponent-da8b61146baf" id="m-addComponent-da8b61146baf"></a>

```java
public void addComponent(com.tailf.ncs.ctrl.NcsComponentData component)
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData component`

### addJar(String) <a href="#m-addJar-8c5412df98d3" id="m-addJar-8c5412df98d3"></a>

```java
public void addJar(String jarName)
```

**Parameters**

- `String jarName`

### clearRestartsCounter() <a href="#m-clearRestartsCounter-4fe6c7d99114" id="m-clearRestartsCounter-4fe6c7d99114"></a>

```java
public void clearRestartsCounter()
```

### getComponentList() <a href="#m-getComponentList-f61542199fc2" id="m-getComponentList-f61542199fc2"></a>

```java
public java.util.List<com.tailf.ncs.ctrl.NcsComponentData> getComponentList()
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Retrieve the components that this package contains
 as an List.

### getComponents() <a href="#m-getComponents-032334d0acf0" id="m-getComponents-032334d0acf0"></a>

```java
public com.tailf.ncs.ctrl.NcsComponentData[] getComponents()
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Retrieve the components that this package contains
 as an array.

### getFirstRestartEpoch() <a href="#m-getFirstRestartEpoch-3acd5fe7731e" id="m-getFirstRestartEpoch-3acd5fe7731e"></a>

```java
public long getFirstRestartEpoch()
```

### getJars() <a href="#m-getJars-3fd56ade02b6" id="m-getJars-3fd56ade02b6"></a>

```java
public String[] getJars()
```

### getPackageClassLoader() <a href="#m-getPackageClassLoader-f15a9d807cf6" id="m-getPackageClassLoader-f15a9d807cf6"></a>

```java
public ClassLoader getPackageClassLoader()
```

### getPackageName() <a href="#m-getPackageName-8e58a29d7a5d" id="m-getPackageName-8e58a29d7a5d"></a>

```java
public String getPackageName()
```

Retrieve the name of the package as specified
 in package-meta.xml

### getRestartsCounter() <a href="#m-getRestartsCounter-e7b1d3e6e856" id="m-getRestartsCounter-e7b1d3e6e856"></a>

```java
public int getRestartsCounter()
```

### incrementRestartsCounter() <a href="#m-incrementRestartsCounter-9c01c7a82e0f" id="m-incrementRestartsCounter-9c01c7a82e0f"></a>

```java
public void incrementRestartsCounter()
```

### isRestarting() <a href="#m-isRestarting-8ada096b33a6" id="m-isRestarting-8ada096b33a6"></a>

```java
public boolean isRestarting()
```

### setPackageClassLoader(ClassLoader) <a href="#m-setPackageClassLoader-98bb62de5bd1" id="m-setPackageClassLoader-98bb62de5bd1"></a>

```java
public void setPackageClassLoader(ClassLoader packageClassLoader)
```

**Parameters**

- `ClassLoader packageClassLoader`

### setRestarting(boolean) <a href="#m-setRestarting-e4cc2e8efccf" id="m-setRestarting-e4cc2e8efccf"></a>

```java
public void setRestarting(boolean restarting)
```

**Parameters**

- `boolean restarting`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
