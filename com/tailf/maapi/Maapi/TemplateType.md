# TemplateType <a href="#cls-TemplateType" id="cls-TemplateType"></a>

```java
public static enum com.tailf.maapi.Maapi.TemplateType
```

Types: [TemplateType](TemplateType.md#cls-TemplateType)

To be used in:
 `ncsGetTemplateVariables(String, TemplateType)`
 Designates informational of template types.

## Members

**Enum Constants**:

- [COMPLIANCE_TEMPLATE](#m-COMPLIANCE_TEMPLATE)
- [DEVICE_TEMPLATE](#m-DEVICE_TEMPLATE)
- [SERVICE_TEMPLATE](#m-SERVICE_TEMPLATE)

**Methods**:

- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### COMPLIANCE_TEMPLATE <a href="#m-COMPLIANCE_TEMPLATE" id="m-COMPLIANCE_TEMPLATE"></a>

```java
public static final com.tailf.maapi.Maapi.TemplateType COMPLIANCE_TEMPLATE;
```

Designates compliance template, compliance template used to verify
 that the configuration on a device conforms to an expected,
 predefined configuration, it also means the specific template
 configuration name under /ncs:compliance/ncs:template.

### DEVICE_TEMPLATE <a href="#m-DEVICE_TEMPLATE" id="m-DEVICE_TEMPLATE"></a>

```java
public static final com.tailf.maapi.Maapi.TemplateType DEVICE_TEMPLATE;
```

Designates device template, device template means the specific
 template configuration name under /ncs:devices/ncs:template.

### SERVICE_TEMPLATE <a href="#m-SERVICE_TEMPLATE" id="m-SERVICE_TEMPLATE"></a>

```java
public static final com.tailf.maapi.Maapi.TemplateType SERVICE_TEMPLATE;
```

Designates service template, service template means the specific
 template configuration name of template loaded from the directory
 templates of the package.


## Methods

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.maapi.Maapi.TemplateType valueOf(String name)
```

Types: [TemplateType](TemplateType.md#cls-TemplateType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.Maapi.TemplateType[] values()
```

Types: [TemplateType](TemplateType.md#cls-TemplateType)
