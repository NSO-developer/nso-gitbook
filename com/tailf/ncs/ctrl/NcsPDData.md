<a id="s-NcsPDData"></a>
# NcsPDData

```java
public class com.tailf.ncs.ctrl.NcsPDData
```

Parsed command Package data

## Members

**Constructors**:

- [NcsPDData(String)](#s-NcsPDData-1)

**Methods**:

- [addComponent(NcsComponentData)](#s-addComponent)
- [addJar(String)](#s-addJar)
- [clearRestartsCounter()](#s-clearRestartsCounter)
- [getComponentList()](#s-getComponentList)
- [getComponents()](#s-getComponents)
- [getFirstRestartEpoch()](#s-getFirstRestartEpoch)
- [getJars()](#s-getJars)
- [getPackageClassLoader()](#s-getPackageClassLoader)
- [getPackageName()](#s-getPackageName)
- [getRestartsCounter()](#s-getRestartsCounter)
- [incrementRestartsCounter()](#s-incrementRestartsCounter)
- [isRestarting()](#s-isRestarting)
- [setPackageClassLoader(ClassLoader)](#s-setPackageClassLoader)
- [setRestarting(boolean)](#s-setRestarting)
- [toString()](#s-toString)

## Constructors

<a id="s-NcsPDData-1"></a>
### NcsPDData(String)

```java
public NcsPDData(String packageName)
```

**Parameters**

- `String packageName`


## Methods

<a id="s-addComponent"></a>
### addComponent(NcsComponentData)

```java
public void addComponent(com.tailf.ncs.ctrl.NcsComponentData component)
```

Types: [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData component`

<a id="s-addJar"></a>
### addJar(String)

```java
public void addJar(String jarName)
```

**Parameters**

- `String jarName`

<a id="s-clearRestartsCounter"></a>
### clearRestartsCounter()

```java
public void clearRestartsCounter()
```

<a id="s-getComponentList"></a>
### getComponentList()

```java
public java.util.List<com.tailf.ncs.ctrl.NcsComponentData> getComponentList()
```

Types: [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

Retrieve the components that this package contains
 as an List.

<a id="s-getComponents"></a>
### getComponents()

```java
public com.tailf.ncs.ctrl.NcsComponentData[] getComponents()
```

Types: [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

Retrieve the components that this package contains
 as an array.

<a id="s-getFirstRestartEpoch"></a>
### getFirstRestartEpoch()

```java
public long getFirstRestartEpoch()
```

<a id="s-getJars"></a>
### getJars()

```java
public String[] getJars()
```

<a id="s-getPackageClassLoader"></a>
### getPackageClassLoader()

```java
public ClassLoader getPackageClassLoader()
```

<a id="s-getPackageName"></a>
### getPackageName()

```java
public String getPackageName()
```

Retrieve the name of the package as specified
 in package-meta.xml

<a id="s-getRestartsCounter"></a>
### getRestartsCounter()

```java
public int getRestartsCounter()
```

<a id="s-incrementRestartsCounter"></a>
### incrementRestartsCounter()

```java
public void incrementRestartsCounter()
```

<a id="s-isRestarting"></a>
### isRestarting()

```java
public boolean isRestarting()
```

<a id="s-setPackageClassLoader"></a>
### setPackageClassLoader(ClassLoader)

```java
public void setPackageClassLoader(ClassLoader packageClassLoader)
```

**Parameters**

- `ClassLoader packageClassLoader`

<a id="s-setRestarting"></a>
### setRestarting(boolean)

```java
public void setRestarting(boolean restarting)
```

**Parameters**

- `boolean restarting`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
