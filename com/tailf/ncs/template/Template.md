<a id="s-Template"></a>
# Template

```java
public class com.tailf.ncs.template.Template
```

`Template` represents an NCS template, that is a template loaded
 from the directory `templates` of the package.

## Members

**Constructors**:

- [Template(Maapi, String)](#s-Template-1)
- [Template(NavuContext, String)](#s-Template-2)
- [Template(ServiceContext, String)](#s-Template-3)

**Fields**:

- [createShared](#s-createShared)
- [maapi](#s-maapi)
- [tid](#s-tid)

**Methods**:

- [apply(Maapi, int, ConfPath, TemplateVariables)](#s-apply)
- [apply(NavuNode, TemplateVariables)](#s-apply-1)
- [exists(Maapi, String)](#s-exists)
- [exists(NavuContext, String)](#s-exists-1)
- [exists(ServiceContext, String)](#s-exists-2)
- [getCreateShared()](#s-getCreateShared)
- [getTemplates(Maapi)](#s-getTemplates)
- [getTemplates(NavuContext)](#s-getTemplates-1)
- [getTemplates(ServiceContext)](#s-getTemplates-2)
- [getVariables()](#s-getVariables)
- [setCreateShared(boolean)](#s-setCreateShared)

## Constructors

<a id="s-Template-1"></a>
### Template(Maapi, String)

```java
public Template(
    com.tailf.maapi.Maapi aMaapi,
    String aTemplateName
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../../maapi/Maapi.md#s-Maapi), [ConfException](../../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi aMaapi`
- `String aTemplateName`

<a id="s-Template-2"></a>
### Template(NavuContext, String)

```java
public Template(
    com.tailf.navu.NavuContext aContext,
    String aTemplateName
)
    throws com.tailf.conf.ConfException
```

Types: [NavuContext](../../navu/NavuContext.md#s-NavuContext), [ConfException](../../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.navu.NavuContext aContext`
- `String aTemplateName`

<a id="s-Template-3"></a>
### Template(ServiceContext, String)

```java
public Template(
    com.tailf.dp.services.ServiceContext aServiceContext,
    String aTemplateName
)
    throws com.tailf.conf.ConfException
```

Types: [ServiceContext](../../dp/services/ServiceContext.md#s-ServiceContext), [ConfException](../../conf/ConfException.md#s-ConfException)

Construct a Template. Note that the template has to have already been
 loaded by NCS, otherwise an exception is thrown.

**Parameters**

- `com.tailf.dp.services.ServiceContext aServiceContext` - the context is which this call is made.
- `String aTemplateName` - name of the template.


## Fields

<a id="s-createShared"></a>
### createShared

**Package-private**

```java
boolean createShared = null;
```

<a id="s-maapi"></a>
### maapi

**Package-private**

```java
com.tailf.maapi.Maapi maapi = null;
```

Types: [Maapi](../../maapi/Maapi.md#s-Maapi)

<a id="s-tid"></a>
### tid

**Package-private**

```java
int tid = null;
```


## Methods

<a id="s-apply"></a>
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

Types: [Maapi](../../maapi/Maapi.md#s-Maapi), [ConfPath](../../conf/ConfPath.md#s-ConfPath), [TemplateVariables](TemplateVariables.md#s-TemplateVariables), [ConfException](../../conf/ConfException.md#s-ConfException)

Apply a template in the specified context

**Parameters**

- `com.tailf.maapi.Maapi maapi` - a maapi connection to the NCS server
- `int tid` - a transaction id which should be attached to the maapi
            connection
- `com.tailf.conf.ConfPath rootPath` - the initial context and root context for evaluation of
                 XPath expressions
- `com.tailf.ncs.template.TemplateVariables variables` - a set of key value pairs where each key will be
                  an XPath variable.

<a id="s-apply-1"></a>
### apply(NavuNode, TemplateVariables)

```java
public void apply(
    com.tailf.navu.NavuNode root,
    com.tailf.ncs.template.TemplateVariables variables
)
    throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#s-NavuNode), [TemplateVariables](TemplateVariables.md#s-TemplateVariables), [ConfException](../../conf/ConfException.md#s-ConfException)

Apply a template in the specified context

**Parameters**

- `com.tailf.navu.NavuNode root` - the initial context and root context for evaluation of
             XPath expressions
- `com.tailf.ncs.template.TemplateVariables variables` - a set of key value pairs where each key will be
                  an XPath variable.

<a id="s-exists"></a>
### exists(Maapi, String)

```java
public static boolean exists(
    com.tailf.maapi.Maapi maapi,
    String template
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../../maapi/Maapi.md#s-Maapi), [ConfException](../../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `String template`

<a id="s-exists-1"></a>
### exists(NavuContext, String)

```java
public static boolean exists(
    com.tailf.navu.NavuContext context,
    String template
)
    throws com.tailf.conf.ConfException
```

Types: [NavuContext](../../navu/NavuContext.md#s-NavuContext), [ConfException](../../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `String template`

<a id="s-exists-2"></a>
### exists(ServiceContext, String)

```java
public static boolean exists(
    com.tailf.dp.services.ServiceContext context,
    String template
)
    throws com.tailf.conf.ConfException
```

Types: [ServiceContext](../../dp/services/ServiceContext.md#s-ServiceContext), [ConfException](../../conf/ConfException.md#s-ConfException)

Tests for existence of a template.

**Parameters**

- `com.tailf.dp.services.ServiceContext context` - the context in which this call is made.
- `String template` - name of the template.

**Returns:** `true` or `false` depending on whether the
         template is loaded or not.

<a id="s-getCreateShared"></a>
### getCreateShared()

**Package-private**

```java
boolean getCreateShared()
```

Returns the setting of the createShared flag

**Returns:** `true` or `false`.

<a id="s-getTemplates"></a>
### getTemplates(Maapi)

```java
public static java.util.Set<String> getTemplates(
    com.tailf.maapi.Maapi maapi
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../../maapi/Maapi.md#s-Maapi), [ConfException](../../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`

<a id="s-getTemplates-1"></a>
### getTemplates(NavuContext)

```java
public static java.util.Set<String> getTemplates(
    com.tailf.navu.NavuContext context
)
    throws com.tailf.conf.ConfException
```

Types: [NavuContext](../../navu/NavuContext.md#s-NavuContext), [ConfException](../../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.navu.NavuContext context`

<a id="s-getTemplates-2"></a>
### getTemplates(ServiceContext)

```java
public static java.util.Set<String> getTemplates(
    com.tailf.dp.services.ServiceContext aServiceContext
)
    throws com.tailf.conf.ConfException
```

Types: [ServiceContext](../../dp/services/ServiceContext.md#s-ServiceContext), [ConfException](../../conf/ConfException.md#s-ConfException)

Returns a set consisting of the loaded templates.

**Parameters**

- `com.tailf.dp.services.ServiceContext aServiceContext` - the context in which this call is made.

**Returns:** `Set` of loaded templates.

<a id="s-getVariables"></a>
### getVariables()

```java
public String[] getVariables() throws com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#s-ConfException)

<a id="s-setCreateShared"></a>
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
