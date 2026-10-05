# PackageJarLoader <a href="#packagejarloader-73ad0f84cd05" id="packagejarloader-73ad0f84cd05"></a>

```java
public class com.tailf.ncs.ctrl.loader.PackageJarLoader
    extends java.net.URLClassLoader
```

## Members

**Constructors**:

- [PackageJarLoader(String, ClassLoader)](#packagejarloader-801a718ab75b)

**Methods**:

- [addURL(String)](#addurl-f2ba0680c96b)
- [getPackageName()](#getpackagename-8e58a29d7a5d)

## Constructors

### PackageJarLoader(String, ClassLoader) <a href="#packagejarloader-801a718ab75b" id="packagejarloader-801a718ab75b"></a>

```java
public PackageJarLoader(String packageName, ClassLoader parent)
```

**Parameters**

- `String packageName`
- `ClassLoader parent`


## Methods

### addURL(String) <a href="#addurl-f2ba0680c96b" id="addurl-f2ba0680c96b"></a>

```java
public void addURL(String url) throws java.net.MalformedURLException, java.net.URISyntaxException
```

**Parameters**

- `String url`

### getPackageName() <a href="#getpackagename-8e58a29d7a5d" id="getpackagename-8e58a29d7a5d"></a>

```java
public String getPackageName()
```
