# TemplateType <a href="#templatetype-08e95c149f38" id="templatetype-08e95c149f38"></a>

```java
public static enum com.tailf.maapi.Maapi.TemplateType
```

Types: [TemplateType](TemplateType.md#templatetype-08e95c149f38)

To be used in:
 `ncsGetTemplateVariables(String, TemplateType)`
 Designates informational of template types.

## Members

**Enum Constants**:

- [COMPLIANCE_TEMPLATE](#compliance_template-1930b800dedf)
- [DEVICE_TEMPLATE](#device_template-52f2db4b5c80)
- [SERVICE_TEMPLATE](#service_template-7bffc291c10d)

**Methods**:

- [valueOf(String)](#valueof-ac61b3547613)
- [values()](#values-406dfe3ca270)

## Enum Constants

### COMPLIANCE_TEMPLATE <a href="#compliance_template-1930b800dedf" id="compliance_template-1930b800dedf"></a>

```java
public static final com.tailf.maapi.Maapi.TemplateType COMPLIANCE_TEMPLATE;
```

Designates compliance template, compliance template used to verify
 that the configuration on a device conforms to an expected,
 predefined configuration, it also means the specific template
 configuration name under /ncs:compliance/ncs:template.

### DEVICE_TEMPLATE <a href="#device_template-52f2db4b5c80" id="device_template-52f2db4b5c80"></a>

```java
public static final com.tailf.maapi.Maapi.TemplateType DEVICE_TEMPLATE;
```

Designates device template, device template means the specific
 template configuration name under /ncs:devices/ncs:template.

### SERVICE_TEMPLATE <a href="#service_template-7bffc291c10d" id="service_template-7bffc291c10d"></a>

```java
public static final com.tailf.maapi.Maapi.TemplateType SERVICE_TEMPLATE;
```

Designates service template, service template means the specific
 template configuration name of template loaded from the directory
 templates of the package.


## Methods

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.maapi.Maapi.TemplateType valueOf(String name)
```

Types: [TemplateType](TemplateType.md#templatetype-08e95c149f38)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.Maapi.TemplateType[] values()
```

Types: [TemplateType](TemplateType.md#templatetype-08e95c149f38)
