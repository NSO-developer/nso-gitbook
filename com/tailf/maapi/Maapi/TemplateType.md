<a id="s-TemplateType"></a>
# TemplateType

```java
public static enum com.tailf.maapi.Maapi.TemplateType
```

Types: [TemplateType](TemplateType.md#s-TemplateType)

To be used in:
 [`TemplateType`](TemplateType.md#s-TemplateType)
 Designates informational of template types.

**Related classes**

- [TemplateType](TemplateType.md#s-TemplateType)

## Members

**Enum Constants**:

- [COMPLIANCE_TEMPLATE](#s-COMPLIANCE_TEMPLATE)
- [DEVICE_TEMPLATE](#s-DEVICE_TEMPLATE)
- [SERVICE_TEMPLATE](#s-SERVICE_TEMPLATE)

**Methods**:

- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-COMPLIANCE_TEMPLATE"></a>
### COMPLIANCE_TEMPLATE

```java
public static final com.tailf.maapi.Maapi.TemplateType COMPLIANCE_TEMPLATE;
```

Designates compliance template, compliance template used to verify
 that the configuration on a device conforms to an expected,
 predefined configuration, it also means the specific template
 configuration name under /ncs:compliance/ncs:template.

<a id="s-DEVICE_TEMPLATE"></a>
### DEVICE_TEMPLATE

```java
public static final com.tailf.maapi.Maapi.TemplateType DEVICE_TEMPLATE;
```

Designates device template, device template means the specific
 template configuration name under /ncs:devices/ncs:template.

<a id="s-SERVICE_TEMPLATE"></a>
### SERVICE_TEMPLATE

```java
public static final com.tailf.maapi.Maapi.TemplateType SERVICE_TEMPLATE;
```

Designates service template, service template means the specific
 template configuration name of template loaded from the directory
 templates of the package.


## Methods

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.maapi.Maapi.TemplateType valueOf(String name)
```

Types: [TemplateType](TemplateType.md#s-TemplateType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.maapi.Maapi.TemplateType[] values()
```

Types: [TemplateType](TemplateType.md#s-TemplateType)
