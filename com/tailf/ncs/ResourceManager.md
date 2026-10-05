<a id="cls-ResourceManager"></a>
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

- [ResourceManager(NcsMain)](#m-resourcemanager-c2228d484dd2)

**Methods**:

- [getCdb(Object, ResourceType, Scope, String)](#m-getcdb-8c099aecc3b8)
- [getCdbResource(Object, ResourceType, Scope)](#m-getcdbresource-4756b4b7eac9)
- [getCdbResource(Object, ResourceType, Scope, String)](#m-getcdbresource-819f805f6524)
- [getMaapi(Object, Scope, String)](#m-getmaapi-5ce204d2ba92)
- [getMaapiResource(Object, Scope)](#m-getmaapiresource-fac30372c33b)
- [getMaapiResource(Object, Scope, String)](#m-getmaapiresource-13adc6401ea3)
- [getResourceManager()](#m-getresourcemanager-eb64f13b2c87)
- [register(Object)](#m-register-7aae2d334f99)
- [registerResources(Object)](#m-registerresources-28726aa911f3)
- [run()](#m-run-b6dbda048863)
- [start()](#m-start-79e12dafe9f8)
- [status()](#m-status-f7d72174690b)
- [stop()](#m-stop-a62ecc446f97)
- [unregister()](#m-unregister-638ca6b88803)
- [unregister(Object)](#m-unregister-f05573abc359)
- [unregister(String)](#m-unregister-a5b7a2399ff6)
- [unregisterAllResources()](#m-unregisterallresources-919993219fa3)
- [unregisterResources(Object)](#m-unregisterresources-03a05b7fe478)
- [unregisterResources(String)](#m-unregisterresources-8b7efc728279)

## Constructors

<a id="m-resourcemanager-c2228d484dd2"></a>
### ResourceManager(NcsMain)

```java
public ResourceManager(com.tailf.ncs.NcsMain main)
```

Types: [NcsMain](NcsMain.md#cls-NcsMain)

**Parameters**

- `com.tailf.ncs.NcsMain main`


## Methods

<a id="m-getcdb-8c099aecc3b8"></a>
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

Types: [Cdb](../cdb/Cdb.md#cls-Cdb), [ResourceType](annotations/ResourceType.md#cls-ResourceType), [Scope](annotations/Scope.md#cls-Scope), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.ResourceType cdbType`
- `com.tailf.ncs.annotations.Scope scope`
- `String qualifier`

<a id="m-getcdbresource-4756b4b7eac9"></a>
### getCdbResource(Object, ResourceType, Scope)

```java
public static com.tailf.cdb.Cdb getCdbResource(
    Object object,
    com.tailf.ncs.annotations.ResourceType cdbType,
    com.tailf.ncs.annotations.Scope scope
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb), [ResourceType](annotations/ResourceType.md#cls-ResourceType), [Scope](annotations/Scope.md#cls-Scope), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.ResourceType cdbType`
- `com.tailf.ncs.annotations.Scope scope`

<a id="m-getcdbresource-819f805f6524"></a>
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

Types: [Cdb](../cdb/Cdb.md#cls-Cdb), [ResourceType](annotations/ResourceType.md#cls-ResourceType), [Scope](annotations/Scope.md#cls-Scope), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.ResourceType cdbType`
- `com.tailf.ncs.annotations.Scope scope`
- `String qualifier`

<a id="m-getmaapi-5ce204d2ba92"></a>
### getMaapi(Object, Scope, String)

```java
public com.tailf.maapi.Maapi getMaapi(
    Object object,
    com.tailf.ncs.annotations.Scope scope,
    String qualifier
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [Scope](annotations/Scope.md#cls-Scope), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.Scope scope`
- `String qualifier`

<a id="m-getmaapiresource-fac30372c33b"></a>
### getMaapiResource(Object, Scope)

```java
public static com.tailf.maapi.Maapi getMaapiResource(
    Object object,
    com.tailf.ncs.annotations.Scope scope
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [Scope](annotations/Scope.md#cls-Scope), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.Scope scope`

<a id="m-getmaapiresource-13adc6401ea3"></a>
### getMaapiResource(Object, Scope, String)

```java
public static com.tailf.maapi.Maapi getMaapiResource(
    Object object,
    com.tailf.ncs.annotations.Scope scope,
    String qualifier
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [Scope](annotations/Scope.md#cls-Scope), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.Scope scope`
- `String qualifier`

<a id="m-getresourcemanager-eb64f13b2c87"></a>
### getResourceManager()

```java
public static com.tailf.ncs.ResourceManager getResourceManager()
```

Types: [ResourceManager](ResourceManager.md#cls-ResourceManager)

**Deprecated:** Use [`NcsMain#getResourceManager()`](NcsMain.md#m-getresourcemanager-eb64f13b2c87) instead.

<a id="m-register-7aae2d334f99"></a>
### register(Object)

```java
public void register(
    Object annotatedObject
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `Object annotatedObject`

<a id="m-registerresources-28726aa911f3"></a>
### registerResources(Object)

```java
public static synchronized void registerResources(
    Object annotatedObject
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

This method will inject resources into annotated fields of
 the object instances passed as argument

**Parameters**

- `Object annotatedObject` - the instance to inject resources into

**Throws**

- `IllegalAccessException`
- `ConfException`
- `IOException`

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

<a id="m-status-f7d72174690b"></a>
### status()

```java
public String[] status()
```

<a id="m-stop-a62ecc446f97"></a>
### stop()

```java
public synchronized void stop()
```

<a id="m-unregister-638ca6b88803"></a>
### unregister()

```java
public synchronized void unregister() throws IllegalAccessException
```

<a id="m-unregister-f05573abc359"></a>
### unregister(Object)

```java
public synchronized void unregister(Object annotatedObject) throws IllegalAccessException
```

**Parameters**

- `Object annotatedObject`

<a id="m-unregister-a5b7a2399ff6"></a>
### unregister(String)

```java
public synchronized void unregister(String packageName)
```

**Parameters**

- `String packageName`

<a id="m-unregisterallresources-919993219fa3"></a>
### unregisterAllResources()

```java
public static synchronized void unregisterAllResources() throws IllegalAccessException
```

Unregister all resources

**Throws**

- `IllegalAccessException`

<a id="m-unregisterresources-03a05b7fe478"></a>
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

<a id="m-unregisterresources-8b7efc728279"></a>
### unregisterResources(String)

```java
public static synchronized void unregisterResources(String packageName)
```

Unregister all resources for a Ncs package.
 If the package have no registered resources, this method is a noop.

**Parameters**

- `String packageName` - name of the Ncs package
