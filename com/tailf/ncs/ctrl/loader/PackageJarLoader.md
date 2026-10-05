# PackageJarLoader <a href="#cls-PackageJarLoader" id="cls-PackageJarLoader"></a>

```java
public class com.tailf.ncs.ctrl.loader.PackageJarLoader
    extends java.net.URLClassLoader
```

## Members

**Constructors**:

- [PackageJarLoader(String, ClassLoader)](#m-PackageJarLoader-801a718ab75b)

**Methods**:

- [addURL(String)](#m-addURL-f2ba0680c96b)
- [getPackageName()](#m-getPackageName-8e58a29d7a5d)

## Constructors

### PackageJarLoader(String, ClassLoader) <a href="#m-PackageJarLoader-801a718ab75b" id="m-PackageJarLoader-801a718ab75b"></a>

```java
public PackageJarLoader(String packageName, ClassLoader parent)
```

**Parameters**

- `String packageName`
- `ClassLoader parent`


## Methods

### addURL(String) <a href="#m-addURL-f2ba0680c96b" id="m-addURL-f2ba0680c96b"></a>

```java
public void addURL(String url) throws java.net.MalformedURLException, java.net.URISyntaxException
```

**Parameters**

- `String url`

### getPackageName() <a href="#m-getPackageName-8e58a29d7a5d" id="m-getPackageName-8e58a29d7a5d"></a>

```java
public String getPackageName()
```
