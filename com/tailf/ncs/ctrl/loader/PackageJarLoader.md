<a id="cls-PackageJarLoader"></a>
# PackageJarLoader

```java
public class com.tailf.ncs.ctrl.loader.PackageJarLoader
    extends java.net.URLClassLoader
```

## Members

**Constructors**:

- [PackageJarLoader(String, ClassLoader)](#m-packagejarloader-801a718ab75b)

**Methods**:

- [addURL(String)](#m-addurl-f2ba0680c96b)
- [getPackageName()](#m-getpackagename-8e58a29d7a5d)

## Constructors

<a id="m-packagejarloader-801a718ab75b"></a>
### PackageJarLoader(String, ClassLoader)

```java
public PackageJarLoader(String packageName, ClassLoader parent)
```

**Parameters**

- `String packageName`
- `ClassLoader parent`


## Methods

<a id="m-addurl-f2ba0680c96b"></a>
### addURL(String)

```java
public void addURL(String url) throws java.net.MalformedURLException, java.net.URISyntaxException
```

**Parameters**

- `String url`

<a id="m-getpackagename-8e58a29d7a5d"></a>
### getPackageName()

```java
public String getPackageName()
```
