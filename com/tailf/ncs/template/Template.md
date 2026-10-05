<a id="cls-Template"></a>
# Template

```java
public class com.tailf.ncs.template.Template
```

`Template` represents an NCS template, that is a template loaded
 from the directory `templates` of the package.

## Members

**Constructors**:

- [Template(Maapi, String)](#m-template-b9516245ebda)
- [Template(NavuContext, String)](#m-template-feaf74f200fb)
- [Template(ServiceContext, String)](#m-template-0d1b4c642e2d)

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
- [getCreateShared()](#m-getcreateshared-5dab242fc9a3)
- [getTemplates(Maapi)](#m-gettemplates-7e8250894e0f)
- [getTemplates(NavuContext)](#m-gettemplates-1025fddc1c4f)
- [getTemplates(ServiceContext)](#m-gettemplates-d75e5ab7a744)
- [getVariables()](#m-getvariables-94c6f2182e29)
- [setCreateShared(boolean)](#m-setcreateshared-745f84731eb7)

## Constructors

<a id="m-template-b9516245ebda"></a>
### Template(Maapi, String)

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

<a id="m-template-feaf74f200fb"></a>
### Template(NavuContext, String)

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

<a id="m-template-0d1b4c642e2d"></a>
### Template(ServiceContext, String)

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

<a id="m-createShared"></a>
### createShared

**Package-private**

```java
boolean createShared = null;
```

<a id="m-maapi"></a>
### maapi

**Package-private**

```java
com.tailf.maapi.Maapi maapi = null;
```

Types: [Maapi](../../maapi/Maapi.md#cls-Maapi)

<a id="m-tid"></a>
### tid

**Package-private**

```java
int tid = null;
```


## Methods

<a id="m-apply-4c072cad4101"></a>
### apply(Maapi, int, ConfPath, TemplateVariables)

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

<a id="m-apply-ea8ea18a91df"></a>
### apply(NavuNode, TemplateVariables)

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

<a id="m-exists-1e9581ff660e"></a>
### exists(Maapi, String)

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

<a id="m-exists-a77fd90bdc9b"></a>
### exists(NavuContext, String)

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

<a id="m-exists-c68e459f4029"></a>
### exists(ServiceContext, String)

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

<a id="m-getcreateshared-5dab242fc9a3"></a>
### getCreateShared()

**Package-private**

```java
boolean getCreateShared()
```

Returns the setting of the createShared flag

**Returns:** `true` or `false`.

<a id="m-gettemplates-7e8250894e0f"></a>
### getTemplates(Maapi)

```java
public static java.util.Set<String> getTemplates(
    com.tailf.maapi.Maapi maapi
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../../maapi/Maapi.md#cls-Maapi), [ConfException](../../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`

<a id="m-gettemplates-1025fddc1c4f"></a>
### getTemplates(NavuContext)

```java
public static java.util.Set<String> getTemplates(
    com.tailf.navu.NavuContext context
)
    throws com.tailf.conf.ConfException
```

Types: [NavuContext](../../navu/NavuContext.md#cls-NavuContext), [ConfException](../../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.navu.NavuContext context`

<a id="m-gettemplates-d75e5ab7a744"></a>
### getTemplates(ServiceContext)

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

<a id="m-getvariables-94c6f2182e29"></a>
### getVariables()

```java
public String[] getVariables() throws com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#cls-ConfException)

<a id="m-setcreateshared-745f84731eb7"></a>
### setCreateShared(boolean)

**Package-private**

```java
boolean setCreateShared(boolean newCreateShared)
```

Set the createShared flag. If the flag is set to `true` all
 created elements will be created with a reference counter.

**Parameters**

- `boolean newCreateShared`

**Returns:** The previous setting of createShared
