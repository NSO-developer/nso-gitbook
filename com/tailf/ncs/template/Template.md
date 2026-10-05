# Template <a href="#cls-Template" id="cls-Template"></a>

```java
public class com.tailf.ncs.template.Template
```

`Template` represents an NCS template, that is a template loaded
 from the directory `templates` of the package.

## Members

**Constructors**:

- [Template(Maapi, String)](#m-Template-b9516245ebda)
- [Template(NavuContext, String)](#m-Template-feaf74f200fb)
- [Template(ServiceContext, String)](#m-Template-0d1b4c642e2d)

**Fields**:

- [createShared](#m-createShared)
- [maapi](#m-maapi)
- [tid](#m-tid)

**Methods**:

- [apply(Maapi, int, ConfPath, TemplateVariables)](#m-apply-4c072cad4101)
- [apply(NavuNode, TemplateVariables)](#m-apply-ea8ea18a91df)
- [exists(Maapi, String)](#m-exists-1e9581ff660e)
- [exists(NavuContext, String)](#m-exists-a77fd90bdc9b)
- [exists(ServiceContext, String)](#m-exists-c68e459f4029)
- [getCreateShared()](#m-getCreateShared-5dab242fc9a3)
- [getTemplates(Maapi)](#m-getTemplates-7e8250894e0f)
- [getTemplates(NavuContext)](#m-getTemplates-1025fddc1c4f)
- [getTemplates(ServiceContext)](#m-getTemplates-d75e5ab7a744)
- [getVariables()](#m-getVariables-94c6f2182e29)
- [setCreateShared(boolean)](#m-setCreateShared-745f84731eb7)

## Constructors

### Template(Maapi, String) <a href="#m-Template-b9516245ebda" id="m-Template-b9516245ebda"></a>

```java
public Template(
    com.tailf.maapi.Maapi aMaapi,
    String aTemplateName
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../../maapi/Maapi.md#cls-Maapi), [ConfException](../../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi aMaapi`
- `String aTemplateName`

### Template(NavuContext, String) <a href="#m-Template-feaf74f200fb" id="m-Template-feaf74f200fb"></a>

```java
public Template(
    com.tailf.navu.NavuContext aContext,
    String aTemplateName
)
    throws com.tailf.conf.ConfException
```

Types: [NavuContext](../../navu/NavuContext.md#cls-NavuContext), [ConfException](../../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.navu.NavuContext aContext`
- `String aTemplateName`

### Template(ServiceContext, String) <a href="#m-Template-0d1b4c642e2d" id="m-Template-0d1b4c642e2d"></a>

```java
public Template(
    com.tailf.dp.services.ServiceContext aServiceContext,
    String aTemplateName
)
    throws com.tailf.conf.ConfException
```

Types: [ServiceContext](../../dp/services/ServiceContext.md#cls-ServiceContext), [ConfException](../../conf/ConfException.md#cls-ConfException)

Construct a Template. Note that the template has to have already been
 loaded by NCS, otherwise an exception is thrown.

**Parameters**

- `com.tailf.dp.services.ServiceContext aServiceContext` - the context is which this call is made.
- `String aTemplateName` - name of the template.


## Fields

### createShared <a href="#m-createShared" id="m-createShared"></a>

**Package-private**

```java
boolean createShared = null;
```

### maapi <a href="#m-maapi" id="m-maapi"></a>

**Package-private**

```java
com.tailf.maapi.Maapi maapi = null;
```

Types: [Maapi](../../maapi/Maapi.md#cls-Maapi)

### tid <a href="#m-tid" id="m-tid"></a>

**Package-private**

```java
int tid = null;
```


## Methods

### apply(Maapi, int, ConfPath, TemplateVariables) <a href="#m-apply-4c072cad4101" id="m-apply-4c072cad4101"></a>

```java
public void apply(
    com.tailf.maapi.Maapi maapi,
    int tid,
    com.tailf.conf.ConfPath rootPath,
    com.tailf.ncs.template.TemplateVariables variables
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../../maapi/Maapi.md#cls-Maapi), [ConfPath](../../conf/ConfPath.md#cls-ConfPath), [TemplateVariables](TemplateVariables.md#cls-TemplateVariables), [ConfException](../../conf/ConfException.md#cls-ConfException)

Apply a template in the specified context

**Parameters**

- `com.tailf.maapi.Maapi maapi` - a maapi connection to the NCS server
- `int tid` - a transaction id which should be attached to the maapi
            connection
- `com.tailf.conf.ConfPath rootPath` - the initial context and root context for evaluation of
                 XPath expressions
- `com.tailf.ncs.template.TemplateVariables variables` - a set of key value pairs where each key will be
                  an XPath variable.

### apply(NavuNode, TemplateVariables) <a href="#m-apply-ea8ea18a91df" id="m-apply-ea8ea18a91df"></a>

```java
public void apply(
    com.tailf.navu.NavuNode root,
    com.tailf.ncs.template.TemplateVariables variables
)
    throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [TemplateVariables](TemplateVariables.md#cls-TemplateVariables), [ConfException](../../conf/ConfException.md#cls-ConfException)

Apply a template in the specified context

**Parameters**

- `com.tailf.navu.NavuNode root` - the initial context and root context for evaluation of
             XPath expressions
- `com.tailf.ncs.template.TemplateVariables variables` - a set of key value pairs where each key will be
                  an XPath variable.

### exists(Maapi, String) <a href="#m-exists-1e9581ff660e" id="m-exists-1e9581ff660e"></a>

```java
public static boolean exists(
    com.tailf.maapi.Maapi maapi,
    String template
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../../maapi/Maapi.md#cls-Maapi), [ConfException](../../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `String template`

### exists(NavuContext, String) <a href="#m-exists-a77fd90bdc9b" id="m-exists-a77fd90bdc9b"></a>

```java
public static boolean exists(
    com.tailf.navu.NavuContext context,
    String template
)
    throws com.tailf.conf.ConfException
```

Types: [NavuContext](../../navu/NavuContext.md#cls-NavuContext), [ConfException](../../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `String template`

### exists(ServiceContext, String) <a href="#m-exists-c68e459f4029" id="m-exists-c68e459f4029"></a>

```java
public static boolean exists(
    com.tailf.dp.services.ServiceContext context,
    String template
)
    throws com.tailf.conf.ConfException
```

Types: [ServiceContext](../../dp/services/ServiceContext.md#cls-ServiceContext), [ConfException](../../conf/ConfException.md#cls-ConfException)

Tests for existence of a template.

**Parameters**

- `com.tailf.dp.services.ServiceContext context` - the context in which this call is made.
- `String template` - name of the template.

**Returns:** `true` or `false` depending on whether the
         template is loaded or not.

### getCreateShared() <a href="#m-getCreateShared-5dab242fc9a3" id="m-getCreateShared-5dab242fc9a3"></a>

**Package-private**

```java
boolean getCreateShared()
```

Returns the setting of the createShared flag

**Returns:** `true` or `false`.

### getTemplates(Maapi) <a href="#m-getTemplates-7e8250894e0f" id="m-getTemplates-7e8250894e0f"></a>

```java
public static java.util.Set<String> getTemplates(
    com.tailf.maapi.Maapi maapi
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../../maapi/Maapi.md#cls-Maapi), [ConfException](../../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`

### getTemplates(NavuContext) <a href="#m-getTemplates-1025fddc1c4f" id="m-getTemplates-1025fddc1c4f"></a>

```java
public static java.util.Set<String> getTemplates(
    com.tailf.navu.NavuContext context
)
    throws com.tailf.conf.ConfException
```

Types: [NavuContext](../../navu/NavuContext.md#cls-NavuContext), [ConfException](../../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.navu.NavuContext context`

### getTemplates(ServiceContext) <a href="#m-getTemplates-d75e5ab7a744" id="m-getTemplates-d75e5ab7a744"></a>

```java
public static java.util.Set<String> getTemplates(
    com.tailf.dp.services.ServiceContext aServiceContext
)
    throws com.tailf.conf.ConfException
```

Types: [ServiceContext](../../dp/services/ServiceContext.md#cls-ServiceContext), [ConfException](../../conf/ConfException.md#cls-ConfException)

Returns a set consisting of the loaded templates.

**Parameters**

- `com.tailf.dp.services.ServiceContext aServiceContext` - the context in which this call is made.

**Returns:** `Set` of loaded templates.

### getVariables() <a href="#m-getVariables-94c6f2182e29" id="m-getVariables-94c6f2182e29"></a>

```java
public String[] getVariables() throws com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#cls-ConfException)

### setCreateShared(boolean) <a href="#m-setCreateShared-745f84731eb7" id="m-setCreateShared-745f84731eb7"></a>

**Package-private**

```java
boolean setCreateShared(boolean newCreateShared)
```

Set the createShared flag. If the flag is set to `true` all
 created elements will be created with a reference counter.

**Parameters**

- `boolean newCreateShared`

**Returns:** The previous setting of createShared
