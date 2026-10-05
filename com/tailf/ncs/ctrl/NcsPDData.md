<a id="cls-NcsPDData"></a>
# NcsPDData

```java
public class com.tailf.ncs.ctrl.NcsPDData
```

Parsed command Package data

## Members

**Constructors**:

- [NcsPDData(String)](#m-ncspddata-91228fd462c6)

**Methods**:

- [addComponent(NcsComponentData)](#m-addcomponent-da8b61146baf)
- [addJar(String)](#m-addjar-8c5412df98d3)
- [clearRestartsCounter()](#m-clearrestartscounter-4fe6c7d99114)
- [getComponentList()](#m-getcomponentlist-f61542199fc2)
- [getComponents()](#m-getcomponents-032334d0acf0)
- [getFirstRestartEpoch()](#m-getfirstrestartepoch-3acd5fe7731e)
- [getJars()](#m-getjars-3fd56ade02b6)
- [getPackageClassLoader()](#m-getpackageclassloader-f15a9d807cf6)
- [getPackageName()](#m-getpackagename-8e58a29d7a5d)
- [getRestartsCounter()](#m-getrestartscounter-e7b1d3e6e856)
- [incrementRestartsCounter()](#m-incrementrestartscounter-9c01c7a82e0f)
- [isRestarting()](#m-isrestarting-8ada096b33a6)
- [setPackageClassLoader(ClassLoader)](#m-setpackageclassloader-98bb62de5bd1)
- [setRestarting(boolean)](#m-setrestarting-e4cc2e8efccf)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-ncspddata-91228fd462c6"></a>
### NcsPDData(String)

```java
public NcsPDData(String packageName)
```

**Parameters**

- `String packageName`


## Methods

<a id="m-addcomponent-da8b61146baf"></a>
### addComponent(NcsComponentData)

```java
public void addComponent(com.tailf.ncs.ctrl.NcsComponentData component)
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData component`

<a id="m-addjar-8c5412df98d3"></a>
### addJar(String)

```java
public void addJar(String jarName)
```

**Parameters**

- `String jarName`

<a id="m-clearrestartscounter-4fe6c7d99114"></a>
### clearRestartsCounter()

```java
public void clearRestartsCounter()
```

<a id="m-getcomponentlist-f61542199fc2"></a>
### getComponentList()

```java
public java.util.List<com.tailf.ncs.ctrl.NcsComponentData> getComponentList()
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Retrieve the components that this package contains
 as an List.

<a id="m-getcomponents-032334d0acf0"></a>
### getComponents()

```java
public com.tailf.ncs.ctrl.NcsComponentData[] getComponents()
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Retrieve the components that this package contains
 as an array.

<a id="m-getfirstrestartepoch-3acd5fe7731e"></a>
### getFirstRestartEpoch()

```java
public long getFirstRestartEpoch()
```

<a id="m-getjars-3fd56ade02b6"></a>
### getJars()

```java
public String[] getJars()
```

<a id="m-getpackageclassloader-f15a9d807cf6"></a>
### getPackageClassLoader()

```java
public ClassLoader getPackageClassLoader()
```

<a id="m-getpackagename-8e58a29d7a5d"></a>
### getPackageName()

```java
public String getPackageName()
```

Retrieve the name of the package as specified
 in package-meta.xml

<a id="m-getrestartscounter-e7b1d3e6e856"></a>
### getRestartsCounter()

```java
public int getRestartsCounter()
```

<a id="m-incrementrestartscounter-9c01c7a82e0f"></a>
### incrementRestartsCounter()

```java
public void incrementRestartsCounter()
```

<a id="m-isrestarting-8ada096b33a6"></a>
### isRestarting()

```java
public boolean isRestarting()
```

<a id="m-setpackageclassloader-98bb62de5bd1"></a>
### setPackageClassLoader(ClassLoader)

```java
public void setPackageClassLoader(ClassLoader packageClassLoader)
```

**Parameters**

- `ClassLoader packageClassLoader`

<a id="m-setrestarting-e4cc2e8efccf"></a>
### setRestarting(boolean)

```java
public void setRestarting(boolean restarting)
```

**Parameters**

- `boolean restarting`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
