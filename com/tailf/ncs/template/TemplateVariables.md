# TemplateVariables <a href="#templatevariables-712ebc3b9438" id="templatevariables-712ebc3b9438"></a>

```java
public class com.tailf.ncs.template.TemplateVariables
    extends java.util.Properties
```

`TemplateVariables` holds a set of defined XPath variables

## Members

**Constructors**:

- [TemplateVariables\(\)](#templatevariables-3563335fc6a2)

**Methods**:

- [putQuoted\(String, String\)](#putquoted-6dd8179b4b5e)

## Constructors

### TemplateVariables() <a href="#templatevariables-3563335fc6a2" id="templatevariables-3563335fc6a2"></a>

```java
public TemplateVariables()
```


## Methods

### putQuoted(String, String) <a href="#putquoted-6dd8179b4b5e" id="putquoted-6dd8179b4b5e"></a>

```java
public Object putQuoted(String key, String value)
```

Assigns a string value to an XPath variable. The assigned value is
 enclosed by single quotes or duoble quotes and set using
 `TemplateVariables#setProperty(String, String)`. In XPath
 there is no quoting mechanism. Strings are enclosed by either
 single quotes or double quotes. If value contains both
 single and double quotes the double quotes are replaced by
 single quotes and the string is enclosed by double quotes.
 If this is not the desired behavior use the method
 `TemplateVariables#setProperty(String, String)` instead.
 Neither key nor the value can be `null`.

**Parameters**

- `String key` - the name of the XPath variable. The variable can be
              used in XPath expressions as $key
- `String value` - key will be assigned the value enclosed in single quotes
              thus represented as an XPath string.

**Returns:** value

**Throws**

- `NullPointerException` - if the key or value is
              `null`
