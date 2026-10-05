<a id="s-PackageJarLoader"></a>
# PackageJarLoader

```java
public class com.tailf.ncs.ctrl.loader.PackageJarLoader
    extends java.net.URLClassLoader
```

## Members

**Constructors**:

- [PackageJarLoader(String, ClassLoader)](#s-PackageJarLoader-1)

**Methods**:

- [addURL(String)](#s-addURL)
- [getPackageName()](#s-getPackageName)

## Constructors

<a id="s-PackageJarLoader-1"></a>
### PackageJarLoader(String, ClassLoader)

```java
public PackageJarLoader(String packageName, ClassLoader parent)
```

**Parameters**

- `String packageName`
- `ClassLoader parent`


## Methods

<a id="s-addURL"></a>
### addURL(String)

```java
public void addURL(String url) throws java.net.MalformedURLException, java.net.URISyntaxException
```

**Parameters**

- `String url`

<a id="s-getPackageName"></a>
### getPackageName()

```java
public String getPackageName()
```
