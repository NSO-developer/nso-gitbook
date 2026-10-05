# Template <a href="#template-fa42c02ac672" id="template-fa42c02ac672"></a>

```java
public class com.tailf.ncs.template.Template
```

`Template` represents an NCS template, that is a template loaded
 from the directory `templates` of the package.

## Members

**Constructors**:

- [Template\(Maapi, String\)](#template-b9516245ebda)
- [Template\(NavuContext, String\)](#template-feaf74f200fb)
- [Template\(ServiceContext, String\)](#template-0d1b4c642e2d)

**Fields**:

- [createShared](#createshared-6cf725a255e3)
- [maapi](#maapi-492cd18b148d)
- [tid](#tid-9d6f3ca62aca)

**Methods**:

- [apply\(Maapi, int, ConfPath, TemplateVariables\)](#apply-4c072cad4101)
- [apply\(NavuNode, TemplateVariables\)](#apply-ea8ea18a91df)
- [exists\(Maapi, String\)](#exists-1e9581ff660e)
- [exists\(NavuContext, String\)](#exists-a77fd90bdc9b)
- [exists\(ServiceContext, String\)](#exists-c68e459f4029)
- [getCreateShared\(\)](#getcreateshared-5dab242fc9a3)
- [getTemplates\(Maapi\)](#gettemplates-7e8250894e0f)
- [getTemplates\(NavuContext\)](#gettemplates-1025fddc1c4f)
- [getTemplates\(ServiceContext\)](#gettemplates-d75e5ab7a744)
- [getVariables\(\)](#getvariables-94c6f2182e29)
- [setCreateShared\(boolean\)](#setcreateshared-745f84731eb7)

## Constructors

### Template(Maapi, String) <a href="#template-b9516245ebda" id="template-b9516245ebda"></a>

```java
public Template(
    com.tailf.maapi.Maapi aMaapi,
    String aTemplateName
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../../maapi/Maapi.md#maapi-67bcbe89c42e), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.maapi.Maapi aMaapi`
- `String aTemplateName`

### Template(NavuContext, String) <a href="#template-feaf74f200fb" id="template-feaf74f200fb"></a>

```java
public Template(
    com.tailf.navu.NavuContext aContext,
    String aTemplateName
)
    throws com.tailf.conf.ConfException
```

Types: [NavuContext](../../navu/NavuContext.md#navucontext-2974e9f92a9e), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.navu.NavuContext aContext`
- `String aTemplateName`

### Template(ServiceContext, String) <a href="#template-0d1b4c642e2d" id="template-0d1b4c642e2d"></a>

```java
public Template(
    com.tailf.dp.services.ServiceContext aServiceContext,
    String aTemplateName
)
    throws com.tailf.conf.ConfException
```

Types: [ServiceContext](../../dp/services/ServiceContext.md#servicecontext-f7734df4f22b), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Construct a Template. Note that the template has to have already been
 loaded by NCS, otherwise an exception is thrown.

**Parameters**

- `com.tailf.dp.services.ServiceContext aServiceContext` - the context is which this call is made.
- `String aTemplateName` - name of the template.


## Fields

### createShared <a href="#createshared-6cf725a255e3" id="createshared-6cf725a255e3"></a>

**Package-private**

```java
boolean createShared = null;
```

### maapi <a href="#maapi-492cd18b148d" id="maapi-492cd18b148d"></a>

**Package-private**

```java
com.tailf.maapi.Maapi maapi = null;
```

Types: [Maapi](../../maapi/Maapi.md#maapi-67bcbe89c42e)

### tid <a href="#tid-9d6f3ca62aca" id="tid-9d6f3ca62aca"></a>

**Package-private**

```java
int tid = null;
```


## Methods

### apply(Maapi, int, ConfPath, TemplateVariables) <a href="#apply-4c072cad4101" id="apply-4c072cad4101"></a>

```java
public void apply(
    com.tailf.maapi.Maapi maapi,
    int tid,
    com.tailf.conf.ConfPath rootPath,
    com.tailf.ncs.template.TemplateVariables variables
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../../maapi/Maapi.md#maapi-67bcbe89c42e), [ConfPath](../../conf/ConfPath.md#confpath-327831c6fc7d), [TemplateVariables](TemplateVariables.md#templatevariables-712ebc3b9438), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Apply a template in the specified context

**Parameters**

- `com.tailf.maapi.Maapi maapi` - a maapi connection to the NCS server
- `int tid` - a transaction id which should be attached to the maapi
            connection
- `com.tailf.conf.ConfPath rootPath` - the initial context and root context for evaluation of
                 XPath expressions
- `com.tailf.ncs.template.TemplateVariables variables` - a set of key value pairs where each key will be
                  an XPath variable.

### apply(NavuNode, TemplateVariables) <a href="#apply-ea8ea18a91df" id="apply-ea8ea18a91df"></a>

```java
public void apply(
    com.tailf.navu.NavuNode root,
    com.tailf.ncs.template.TemplateVariables variables
)
    throws com.tailf.conf.ConfException
```

Types: [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [TemplateVariables](TemplateVariables.md#templatevariables-712ebc3b9438), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Apply a template in the specified context

**Parameters**

- `com.tailf.navu.NavuNode root` - the initial context and root context for evaluation of
             XPath expressions
- `com.tailf.ncs.template.TemplateVariables variables` - a set of key value pairs where each key will be
                  an XPath variable.

### exists(Maapi, String) <a href="#exists-1e9581ff660e" id="exists-1e9581ff660e"></a>

```java
public static boolean exists(
    com.tailf.maapi.Maapi maapi,
    String template
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../../maapi/Maapi.md#maapi-67bcbe89c42e), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `String template`

### exists(NavuContext, String) <a href="#exists-a77fd90bdc9b" id="exists-a77fd90bdc9b"></a>

```java
public static boolean exists(
    com.tailf.navu.NavuContext context,
    String template
)
    throws com.tailf.conf.ConfException
```

Types: [NavuContext](../../navu/NavuContext.md#navucontext-2974e9f92a9e), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `String template`

### exists(ServiceContext, String) <a href="#exists-c68e459f4029" id="exists-c68e459f4029"></a>

```java
public static boolean exists(
    com.tailf.dp.services.ServiceContext context,
    String template
)
    throws com.tailf.conf.ConfException
```

Types: [ServiceContext](../../dp/services/ServiceContext.md#servicecontext-f7734df4f22b), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Tests for existence of a template.

**Parameters**

- `com.tailf.dp.services.ServiceContext context` - the context in which this call is made.
- `String template` - name of the template.

**Returns:** `true` or `false` depending on whether the
         template is loaded or not.

### getCreateShared() <a href="#getcreateshared-5dab242fc9a3" id="getcreateshared-5dab242fc9a3"></a>

**Package-private**

```java
boolean getCreateShared()
```

Returns the setting of the createShared flag

**Returns:** `true` or `false`.

### getTemplates(Maapi) <a href="#gettemplates-7e8250894e0f" id="gettemplates-7e8250894e0f"></a>

```java
public static java.util.Set<String> getTemplates(
    com.tailf.maapi.Maapi maapi
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../../maapi/Maapi.md#maapi-67bcbe89c42e), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.maapi.Maapi maapi`

### getTemplates(NavuContext) <a href="#gettemplates-1025fddc1c4f" id="gettemplates-1025fddc1c4f"></a>

```java
public static java.util.Set<String> getTemplates(
    com.tailf.navu.NavuContext context
)
    throws com.tailf.conf.ConfException
```

Types: [NavuContext](../../navu/NavuContext.md#navucontext-2974e9f92a9e), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.navu.NavuContext context`

### getTemplates(ServiceContext) <a href="#gettemplates-d75e5ab7a744" id="gettemplates-d75e5ab7a744"></a>

```java
public static java.util.Set<String> getTemplates(
    com.tailf.dp.services.ServiceContext aServiceContext
)
    throws com.tailf.conf.ConfException
```

Types: [ServiceContext](../../dp/services/ServiceContext.md#servicecontext-f7734df4f22b), [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Returns a set consisting of the loaded templates.

**Parameters**

- `com.tailf.dp.services.ServiceContext aServiceContext` - the context in which this call is made.

**Returns:** `Set` of loaded templates.

### getVariables() <a href="#getvariables-94c6f2182e29" id="getvariables-94c6f2182e29"></a>

```java
public String[] getVariables() throws com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

### setCreateShared(boolean) <a href="#setcreateshared-745f84731eb7" id="setcreateshared-745f84731eb7"></a>

**Package-private**

```java
boolean setCreateShared(boolean newCreateShared)
```

Set the createShared flag. If the flag is set to `true` all
 created elements will be created with a reference counter.

**Parameters**

- `boolean newCreateShared`

**Returns:** The previous setting of createShared
