<a id="s-ResourceManager"></a>
# ResourceManager

```java
public class com.tailf.ncs.ResourceManager
    implements Runnable
```

The NCS resource manager able to create Maapi and Cdb objects
 connected to the NCS server. The resource manager will then
 inject these to annotated fields in known java class instances.
 Known instances are either from classes that are referred to in
 package component meta data, or instances that are passed to the
 ResourceManager via the registerResources method.

 An example of an cdb instance which is a unique instance for
 every object instance of the container class:



```
 public class MyContainerClass {

     @Resource(type=ResourceType.CDB, scope=Scope.INSTANCE)
     private Cdb cdb;
     ...
 }
```



 If this class is not referred to in a package-meta-data.xml for
 some Ncs package, then the resource manager registration has to be
 manual:



```
 MyContainerClass myC = new MyContainerClass();
 ResourceManager.registerResources(myC);
```



 It is also possible have the same resource shared by several container
 instances within the same NCS package.
 In this case the resource should be of type CONTEXT and have
 a qualifier name which can be used as reference:



```
 public class MyContainerClass1 {

     @Resource(type=ResourceType.MAAPI,
               scope=Scope.CONTEXT, qualifier="MyMaapi")
     private Maapi theMaapi;
     ...
 }

 public class MyContainerClass2 {

     @Resource(type=ResourceType.MAAPI,
               scope=Scope.CONTEXT, qualifier="MyMaapi")
     private Maapi aMaapi;
     ...
 }
```



 In this case all instances of both class MyContainerClass1 and
 MyContainerClass2 will share the same unique Maapi instance.

## Members

**Constructors**:

- [ResourceManager(NcsMain)](#s-ResourceManager-1)

**Methods**:

- [getCdb(Object, ResourceType, Scope, String)](#s-getCdb)
- [getCdbResource(Object, ResourceType, Scope)](#s-getCdbResource)
- [getCdbResource(Object, ResourceType, Scope, String)](#s-getCdbResource-1)
- [getMaapi(Object, Scope, String)](#s-getMaapi)
- [getMaapiResource(Object, Scope)](#s-getMaapiResource)
- [getMaapiResource(Object, Scope, String)](#s-getMaapiResource-1)
- [getResourceManager()](#s-getResourceManager)
- [register(Object)](#s-register)
- [registerResources(Object)](#s-registerResources)
- [run()](#s-run)
- [start()](#s-start)
- [status()](#s-status)
- [stop()](#s-stop)
- [unregister()](#s-unregister)
- [unregister(Object)](#s-unregister-1)
- [unregister(String)](#s-unregister-2)
- [unregisterAllResources()](#s-unregisterAllResources)
- [unregisterResources(Object)](#s-unregisterResources)
- [unregisterResources(String)](#s-unregisterResources-1)

## Constructors

<a id="s-ResourceManager-1"></a>
### ResourceManager(NcsMain)

```java
public ResourceManager(com.tailf.ncs.NcsMain main)
```

Types: [NcsMain](NcsMain.md#s-NcsMain)

**Parameters**

- `com.tailf.ncs.NcsMain main`


## Methods

<a id="s-getCdb"></a>
### getCdb(Object, ResourceType, Scope, String)

```java
public com.tailf.cdb.Cdb getCdb(
    Object object,
    com.tailf.ncs.annotations.ResourceType cdbType,
    com.tailf.ncs.annotations.Scope scope,
    String qualifier
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](../cdb/Cdb.md#s-Cdb), [ResourceType](annotations/ResourceType.md#s-ResourceType), [Scope](annotations/Scope.md#s-Scope), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.ResourceType cdbType`
- `com.tailf.ncs.annotations.Scope scope`
- `String qualifier`

<a id="s-getCdbResource"></a>
### getCdbResource(Object, ResourceType, Scope)

```java
public static com.tailf.cdb.Cdb getCdbResource(
    Object object,
    com.tailf.ncs.annotations.ResourceType cdbType,
    com.tailf.ncs.annotations.Scope scope
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](../cdb/Cdb.md#s-Cdb), [ResourceType](annotations/ResourceType.md#s-ResourceType), [Scope](annotations/Scope.md#s-Scope), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.ResourceType cdbType`
- `com.tailf.ncs.annotations.Scope scope`

<a id="s-getCdbResource-1"></a>
### getCdbResource(Object, ResourceType, Scope, String)

```java
public static com.tailf.cdb.Cdb getCdbResource(
    Object object,
    com.tailf.ncs.annotations.ResourceType cdbType,
    com.tailf.ncs.annotations.Scope scope,
    String qualifier
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](../cdb/Cdb.md#s-Cdb), [ResourceType](annotations/ResourceType.md#s-ResourceType), [Scope](annotations/Scope.md#s-Scope), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.ResourceType cdbType`
- `com.tailf.ncs.annotations.Scope scope`
- `String qualifier`

<a id="s-getMaapi"></a>
### getMaapi(Object, Scope, String)

```java
public com.tailf.maapi.Maapi getMaapi(
    Object object,
    com.tailf.ncs.annotations.Scope scope,
    String qualifier
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi), [Scope](annotations/Scope.md#s-Scope), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.Scope scope`
- `String qualifier`

<a id="s-getMaapiResource"></a>
### getMaapiResource(Object, Scope)

```java
public static com.tailf.maapi.Maapi getMaapiResource(
    Object object,
    com.tailf.ncs.annotations.Scope scope
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi), [Scope](annotations/Scope.md#s-Scope), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.Scope scope`

<a id="s-getMaapiResource-1"></a>
### getMaapiResource(Object, Scope, String)

```java
public static com.tailf.maapi.Maapi getMaapiResource(
    Object object,
    com.tailf.ncs.annotations.Scope scope,
    String qualifier
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi), [Scope](annotations/Scope.md#s-Scope), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.Scope scope`
- `String qualifier`

<a id="s-getResourceManager"></a>
### getResourceManager()

```java
public static com.tailf.ncs.ResourceManager getResourceManager()
```

Types: [ResourceManager](ResourceManager.md#s-ResourceManager)

**Deprecated:** Use [`NcsMain`](NcsMain.md#s-NcsMain) instead.

<a id="s-register"></a>
### register(Object)

```java
public void register(
    Object annotatedObject
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `Object annotatedObject`

<a id="s-registerResources"></a>
### registerResources(Object)

```java
public static synchronized void registerResources(
    Object annotatedObject
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

This method will inject resources into annotated fields of
 the object instances passed as argument

**Parameters**

- `Object annotatedObject` - the instance to inject resources into

**Throws**

- `IllegalAccessException`
- `ConfException`
- `IOException`

<a id="s-run"></a>
### run()

```java
public void run()
```

<a id="s-start"></a>
### start()

```java
public synchronized void start()
```

<a id="s-status"></a>
### status()

```java
public String[] status()
```

<a id="s-stop"></a>
### stop()

```java
public synchronized void stop()
```

<a id="s-unregister"></a>
### unregister()

```java
public synchronized void unregister() throws IllegalAccessException
```

<a id="s-unregister-1"></a>
### unregister(Object)

```java
public synchronized void unregister(Object annotatedObject) throws IllegalAccessException
```

**Parameters**

- `Object annotatedObject`

<a id="s-unregister-2"></a>
### unregister(String)

```java
public synchronized void unregister(String packageName)
```

**Parameters**

- `String packageName`

<a id="s-unregisterAllResources"></a>
### unregisterAllResources()

```java
public static synchronized void unregisterAllResources() throws IllegalAccessException
```

Unregister all resources

**Throws**

- `IllegalAccessException`

<a id="s-unregisterResources"></a>
### unregisterResources(Object)

```java
public static synchronized void unregisterResources(
    Object annotatedObject
)
    throws IllegalAccessException
```

Unregister all resources for an object instance.
 If the instance have no registered resources, this method is a noop
 meaning it will return without affecting the
 `annotatedObject`.

**Parameters**

- `Object annotatedObject` - the instance which has registered resources
 through annotation @Resource(..)

**Throws**

- `IllegalAccessException`

<a id="s-unregisterResources-1"></a>
### unregisterResources(String)

```java
public static synchronized void unregisterResources(String packageName)
```

Unregister all resources for a Ncs package.
 If the package have no registered resources, this method is a noop.

**Parameters**

- `String packageName` - name of the Ncs package
