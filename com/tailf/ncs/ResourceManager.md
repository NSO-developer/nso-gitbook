# ResourceManager <a href="#resourcemanager-e87f3c3222f5" id="resourcemanager-e87f3c3222f5"></a>

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

- [ResourceManager(NcsMain)](#resourcemanager-c2228d484dd2)

**Methods**:

- [getCdb(Object, ResourceType, Scope, String)](#getcdb-8c099aecc3b8)
- [getCdbResource(Object, ResourceType, Scope)](#getcdbresource-4756b4b7eac9)
- [getCdbResource(Object, ResourceType, Scope, String)](#getcdbresource-819f805f6524)
- [getMaapi(Object, Scope, String)](#getmaapi-5ce204d2ba92)
- [getMaapiResource(Object, Scope)](#getmaapiresource-fac30372c33b)
- [getMaapiResource(Object, Scope, String)](#getmaapiresource-13adc6401ea3)
- [getResourceManager()](#getresourcemanager-eb64f13b2c87)
- [register(Object)](#register-7aae2d334f99)
- [registerResources(Object)](#registerresources-28726aa911f3)
- [run()](#run-b6dbda048863)
- [start()](#start-79e12dafe9f8)
- [status()](#status-f7d72174690b)
- [stop()](#stop-a62ecc446f97)
- [unregister()](#unregister-638ca6b88803)
- [unregister(Object)](#unregister-f05573abc359)
- [unregister(String)](#unregister-a5b7a2399ff6)
- [unregisterAllResources()](#unregisterallresources-919993219fa3)
- [unregisterResources(Object)](#unregisterresources-03a05b7fe478)
- [unregisterResources(String)](#unregisterresources-8b7efc728279)

## Constructors

### ResourceManager(NcsMain) <a href="#resourcemanager-c2228d484dd2" id="resourcemanager-c2228d484dd2"></a>

```java
public ResourceManager(com.tailf.ncs.NcsMain main)
```

Types: [NcsMain](NcsMain.md#ncsmain-eb814813aed4)

**Parameters**

- `com.tailf.ncs.NcsMain main`


## Methods

### getCdb(Object, ResourceType, Scope, String) <a href="#getcdb-8c099aecc3b8" id="getcdb-8c099aecc3b8"></a>

```java
public com.tailf.cdb.Cdb getCdb(
    Object object,
    com.tailf.ncs.annotations.ResourceType cdbType,
    com.tailf.ncs.annotations.Scope scope,
    String qualifier
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](../cdb/Cdb.md#cdb-cb7fc41768c9), [ResourceType](annotations/ResourceType.md#resourcetype-7c885fa4653a), [Scope](annotations/Scope.md#scope-5971086e8af0), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.ResourceType cdbType`
- `com.tailf.ncs.annotations.Scope scope`
- `String qualifier`

### getCdbResource(Object, ResourceType, Scope) <a href="#getcdbresource-4756b4b7eac9" id="getcdbresource-4756b4b7eac9"></a>

```java
public static com.tailf.cdb.Cdb getCdbResource(
    Object object,
    com.tailf.ncs.annotations.ResourceType cdbType,
    com.tailf.ncs.annotations.Scope scope
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](../cdb/Cdb.md#cdb-cb7fc41768c9), [ResourceType](annotations/ResourceType.md#resourcetype-7c885fa4653a), [Scope](annotations/Scope.md#scope-5971086e8af0), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.ResourceType cdbType`
- `com.tailf.ncs.annotations.Scope scope`

### getCdbResource(Object, ResourceType, Scope, String) <a href="#getcdbresource-819f805f6524" id="getcdbresource-819f805f6524"></a>

```java
public static com.tailf.cdb.Cdb getCdbResource(
    Object object,
    com.tailf.ncs.annotations.ResourceType cdbType,
    com.tailf.ncs.annotations.Scope scope,
    String qualifier
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](../cdb/Cdb.md#cdb-cb7fc41768c9), [ResourceType](annotations/ResourceType.md#resourcetype-7c885fa4653a), [Scope](annotations/Scope.md#scope-5971086e8af0), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.ResourceType cdbType`
- `com.tailf.ncs.annotations.Scope scope`
- `String qualifier`

### getMaapi(Object, Scope, String) <a href="#getmaapi-5ce204d2ba92" id="getmaapi-5ce204d2ba92"></a>

```java
public com.tailf.maapi.Maapi getMaapi(
    Object object,
    com.tailf.ncs.annotations.Scope scope,
    String qualifier
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e), [Scope](annotations/Scope.md#scope-5971086e8af0), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.Scope scope`
- `String qualifier`

### getMaapiResource(Object, Scope) <a href="#getmaapiresource-fac30372c33b" id="getmaapiresource-fac30372c33b"></a>

```java
public static com.tailf.maapi.Maapi getMaapiResource(
    Object object,
    com.tailf.ncs.annotations.Scope scope
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e), [Scope](annotations/Scope.md#scope-5971086e8af0), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.Scope scope`

### getMaapiResource(Object, Scope, String) <a href="#getmaapiresource-13adc6401ea3" id="getmaapiresource-13adc6401ea3"></a>

```java
public static com.tailf.maapi.Maapi getMaapiResource(
    Object object,
    com.tailf.ncs.annotations.Scope scope,
    String qualifier
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e), [Scope](annotations/Scope.md#scope-5971086e8af0), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `Object object`
- `com.tailf.ncs.annotations.Scope scope`
- `String qualifier`

### getResourceManager() <a href="#getresourcemanager-eb64f13b2c87" id="getresourcemanager-eb64f13b2c87"></a>

```java
public static com.tailf.ncs.ResourceManager getResourceManager()
```

Types: [ResourceManager](ResourceManager.md#resourcemanager-e87f3c3222f5)

**Deprecated:** Use [`NcsMain#getResourceManager()`](NcsMain.md#getresourcemanager-eb64f13b2c87) instead.

### register(Object) <a href="#register-7aae2d334f99" id="register-7aae2d334f99"></a>

```java
public void register(
    Object annotatedObject
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `Object annotatedObject`

### registerResources(Object) <a href="#registerresources-28726aa911f3" id="registerresources-28726aa911f3"></a>

```java
public static synchronized void registerResources(
    Object annotatedObject
)
    throws IllegalAccessException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This method will inject resources into annotated fields of
 the object instances passed as argument

**Parameters**

- `Object annotatedObject` - the instance to inject resources into

**Throws**

- `IllegalAccessException`
- `ConfException`
- `IOException`

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```

### start() <a href="#start-79e12dafe9f8" id="start-79e12dafe9f8"></a>

```java
public synchronized void start()
```

### status() <a href="#status-f7d72174690b" id="status-f7d72174690b"></a>

```java
public String[] status()
```

### stop() <a href="#stop-a62ecc446f97" id="stop-a62ecc446f97"></a>

```java
public synchronized void stop()
```

### unregister() <a href="#unregister-638ca6b88803" id="unregister-638ca6b88803"></a>

```java
public synchronized void unregister() throws IllegalAccessException
```

### unregister(Object) <a href="#unregister-f05573abc359" id="unregister-f05573abc359"></a>

```java
public synchronized void unregister(Object annotatedObject) throws IllegalAccessException
```

**Parameters**

- `Object annotatedObject`

### unregister(String) <a href="#unregister-a5b7a2399ff6" id="unregister-a5b7a2399ff6"></a>

```java
public synchronized void unregister(String packageName)
```

**Parameters**

- `String packageName`

### unregisterAllResources() <a href="#unregisterallresources-919993219fa3" id="unregisterallresources-919993219fa3"></a>

```java
public static synchronized void unregisterAllResources() throws IllegalAccessException
```

Unregister all resources

**Throws**

- `IllegalAccessException`

### unregisterResources(Object) <a href="#unregisterresources-03a05b7fe478" id="unregisterresources-03a05b7fe478"></a>

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

### unregisterResources(String) <a href="#unregisterresources-8b7efc728279" id="unregisterresources-8b7efc728279"></a>

```java
public static synchronized void unregisterResources(String packageName)
```

Unregister all resources for a Ncs package.
 If the package have no registered resources, this method is a noop.

**Parameters**

- `String packageName` - name of the Ncs package
