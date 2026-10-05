# MaapiConfigFlag <a href="#cls-MaapiConfigFlag" id="cls-MaapiConfigFlag"></a>

```java
public enum com.tailf.maapi.MaapiConfigFlag
```

Types: [MaapiConfigFlag](MaapiConfigFlag.md#cls-MaapiConfigFlag)

Flags used in `Maapi#saveConfig(int,EnumSet,String,Object... )`
 and `Maapi#loadConfig(int,EnumSet,String)`.

## Members

**Enum Constants**:

- [CISCO_IOS_FORMAT](#m-CISCO_IOS_FORMAT)
- [CISCO_XR_FORMAT](#m-CISCO_XR_FORMAT)
- [CONFIG_AUTOCOMMIT](#m-CONFIG_AUTOCOMMIT)
- [CONFIG_CDB_ONLY](#m-CONFIG_CDB_ONLY)
- [CONFIG_CONTINUE_ON_ERROR](#m-CONFIG_CONTINUE_ON_ERROR)
- [CONFIG_HIDE_ALL](#m-CONFIG_HIDE_ALL)
- [CONFIG_NO_PARENTS](#m-CONFIG_NO_PARENTS)
- [CONFIG_OPER_ONLY](#m-CONFIG_OPER_ONLY)
- [CONFIG_REPLACE](#m-CONFIG_REPLACE)
- [CONFIG_SUPPRESS_ERRORS](#m-CONFIG_SUPPRESS_ERRORS)
- [CONFIG_UNHIDE_ALL](#m-CONFIG_UNHIDE_ALL)
- [CONFIG_WITH_SERVICE_META](#m-CONFIG_WITH_SERVICE_META)
- [CONFIG_XML_LOAD_LAX](#m-CONFIG_XML_LOAD_LAX)
- [JSON_FORMAT](#m-JSON_FORMAT)
- [JUNIPER_CLI_CMD_FORMAT](#m-JUNIPER_CLI_CMD_FORMAT)
- [JUNIPER_CLI_FORMAT](#m-JUNIPER_CLI_FORMAT)
- [MAAPI_CONFIG_AUTOCOMMIT](#m-MAAPI_CONFIG_AUTOCOMMIT)
- [MAAPI_CONFIG_C](#m-MAAPI_CONFIG_C)
- [MAAPI_CONFIG_C_IOS](#m-MAAPI_CONFIG_C_IOS)
- [MAAPI_CONFIG_CDB_ONLY](#m-MAAPI_CONFIG_CDB_ONLY)
- [MAAPI_CONFIG_CONTINUE_ON_ERROR](#m-MAAPI_CONFIG_CONTINUE_ON_ERROR)
- [MAAPI_CONFIG_HIDE_ALL](#m-MAAPI_CONFIG_HIDE_ALL)
- [MAAPI_CONFIG_J](#m-MAAPI_CONFIG_J)
- [MAAPI_CONFIG_J_CMD](#m-MAAPI_CONFIG_J_CMD)
- [MAAPI_CONFIG_JSON](#m-MAAPI_CONFIG_JSON)
- [MAAPI_CONFIG_MERGE](#m-MAAPI_CONFIG_MERGE)
- [MAAPI_CONFIG_NO_BACKQUOTE](#m-MAAPI_CONFIG_NO_BACKQUOTE)
- [MAAPI_CONFIG_NO_PARENTS](#m-MAAPI_CONFIG_NO_PARENTS)
- [MAAPI_CONFIG_OPER_ONLY](#m-MAAPI_CONFIG_OPER_ONLY)
- [MAAPI_CONFIG_READ_WRITE_ACCESS_ONLY](#m-MAAPI_CONFIG_READ_WRITE_ACCESS_ONLY)
- [MAAPI_CONFIG_REPLACE](#m-MAAPI_CONFIG_REPLACE)
- [MAAPI_CONFIG_SHOW_DEFAULTS](#m-MAAPI_CONFIG_SHOW_DEFAULTS)
- [MAAPI_CONFIG_SUPPRESS_ERRORS](#m-MAAPI_CONFIG_SUPPRESS_ERRORS)
- [MAAPI_CONFIG_UNHIDE_ALL](#m-MAAPI_CONFIG_UNHIDE_ALL)
- [MAAPI_CONFIG_WITH_DEFAULTS](#m-MAAPI_CONFIG_WITH_DEFAULTS)
- [MAAPI_CONFIG_WITH_OPER](#m-MAAPI_CONFIG_WITH_OPER)
- [MAAPI_CONFIG_WITH_SERVICE_META](#m-MAAPI_CONFIG_WITH_SERVICE_META)
- [MAAPI_CONFIG_XML](#m-MAAPI_CONFIG_XML)
- [MAAPI_CONFIG_XML_LOAD_LAX](#m-MAAPI_CONFIG_XML_LOAD_LAX)
- [MAAPI_CONFIG_XML_PRETTY](#m-MAAPI_CONFIG_XML_PRETTY)
- [MAAPI_CONFIG_XPATH](#m-MAAPI_CONFIG_XPATH)
- [MERGE_CONFIGURATIONS](#m-MERGE_CONFIGURATIONS)
- [SHOW_DEFAULTS](#m-SHOW_DEFAULTS)
- [WITH_DEFAULTS](#m-WITH_DEFAULTS)
- [WITH_OPER](#m-WITH_OPER)
- [XML_FORMAT](#m-XML_FORMAT)
- [XML_PRETTY](#m-XML_PRETTY)
- [XPATH](#m-XPATH)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CISCO_IOS_FORMAT <a href="#m-CISCO_IOS_FORMAT" id="m-CISCO_IOS_FORMAT"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CISCO_IOS_FORMAT;
```

Save/Load config flag indicating Cisco IOS style configuration format.

### CISCO_XR_FORMAT <a href="#m-CISCO_XR_FORMAT" id="m-CISCO_XR_FORMAT"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CISCO_XR_FORMAT;
```

Save/Load config flag indicating Cisco XR style configuration format.

### CONFIG_AUTOCOMMIT <a href="#m-CONFIG_AUTOCOMMIT" id="m-CONFIG_AUTOCOMMIT"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_AUTOCOMMIT;
```

The flag can be used together with [`MAAPI_CONFIG_C`](MaapiConfigFlag.md#m-MAAPI_CONFIG_C) and
 [`MAAPI_CONFIG_C_IOS`](MaapiConfigFlag.md#m-MAAPI_CONFIG_C_IOS) to mean that a commit should be performed
 after each line

### CONFIG_CDB_ONLY <a href="#m-CONFIG_CDB_ONLY" id="m-CONFIG_CDB_ONLY"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_CDB_ONLY;
```

The output of saveConfig will only include data stored in CDB.

### CONFIG_CONTINUE_ON_ERROR <a href="#m-CONFIG_CONTINUE_ON_ERROR" id="m-CONFIG_CONTINUE_ON_ERROR"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_CONTINUE_ON_ERROR;
```

The flag can be used to indicate that the load should not be aborted
 when an error is encountered.

### CONFIG_HIDE_ALL <a href="#m-CONFIG_HIDE_ALL" id="m-CONFIG_HIDE_ALL"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_HIDE_ALL;
```

Hide all hidden nodes.

### CONFIG_NO_PARENTS <a href="#m-CONFIG_NO_PARENTS" id="m-CONFIG_NO_PARENTS"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_NO_PARENTS;
```

The output of saveConfig will begin at path instead of root.

### CONFIG_OPER_ONLY <a href="#m-CONFIG_OPER_ONLY" id="m-CONFIG_OPER_ONLY"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_OPER_ONLY;
```

The output of saveConfig will only include operational data
 and ancestors to operational data nodes.

### CONFIG_REPLACE <a href="#m-CONFIG_REPLACE" id="m-CONFIG_REPLACE"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_REPLACE;
```

To replace only the part of the configuration that is present in
 the file.

### CONFIG_SUPPRESS_ERRORS <a href="#m-CONFIG_SUPPRESS_ERRORS" id="m-CONFIG_SUPPRESS_ERRORS"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_SUPPRESS_ERRORS;
```

The flag is used to suppress the long error messages but instead have a
 one line error with the line number.

### CONFIG_UNHIDE_ALL <a href="#m-CONFIG_UNHIDE_ALL" id="m-CONFIG_UNHIDE_ALL"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_UNHIDE_ALL;
```

Unhide all hidden nodes (see below).

### CONFIG_WITH_SERVICE_META <a href="#m-CONFIG_WITH_SERVICE_META" id="m-CONFIG_WITH_SERVICE_META"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_WITH_SERVICE_META;
```

The flag can be used to request that NCS service-meta-data attributes
 should be included when saving configuration.

### CONFIG_XML_LOAD_LAX <a href="#m-CONFIG_XML_LOAD_LAX" id="m-CONFIG_XML_LOAD_LAX"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_XML_LOAD_LAX;
```

The flag can be used together with [`XML_FORMAT`](MaapiConfigFlag.md#m-XML_FORMAT). Indicates
 that relaxed parsing shall be done. Unknown XML elements are silently
 ignored.

### JSON_FORMAT <a href="#m-JSON_FORMAT" id="m-JSON_FORMAT"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag JSON_FORMAT;
```

The configuration format is JSON.

### JUNIPER_CLI_CMD_FORMAT <a href="#m-JUNIPER_CLI_CMD_FORMAT" id="m-JUNIPER_CLI_CMD_FORMAT"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag JUNIPER_CLI_CMD_FORMAT;
```

The configuration format is Juniper-style set commands.
 Use this flag with [`Maapi#loadConfig`](Maapi.md#m-loadConfig-0cd0ed8a64d0), or
 [`Maapi#loadConfigCmds`](Maapi.md#m-loadConfigCmds-4c47d55451a5) to load
 configuration expressed as Juniper "set" commands.

### JUNIPER_CLI_FORMAT <a href="#m-JUNIPER_CLI_FORMAT" id="m-JUNIPER_CLI_FORMAT"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag JUNIPER_CLI_FORMAT;
```

Save/Load config flag indicating curly brace Juniper CLI configuration
 format.

### MAAPI_CONFIG_AUTOCOMMIT <a href="#m-MAAPI_CONFIG_AUTOCOMMIT" id="m-MAAPI_CONFIG_AUTOCOMMIT"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_AUTOCOMMIT;
```

Same as [`CONFIG_AUTOCOMMIT`](MaapiConfigFlag.md#m-CONFIG_AUTOCOMMIT)

### MAAPI_CONFIG_C <a href="#m-MAAPI_CONFIG_C" id="m-MAAPI_CONFIG_C"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_C;
```

Same as [`CISCO_XR_FORMAT`](MaapiConfigFlag.md#m-CISCO_XR_FORMAT)

### MAAPI_CONFIG_C_IOS <a href="#m-MAAPI_CONFIG_C_IOS" id="m-MAAPI_CONFIG_C_IOS"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_C_IOS;
```

Same as [`CISCO_IOS_FORMAT`](MaapiConfigFlag.md#m-CISCO_IOS_FORMAT)

### MAAPI_CONFIG_CDB_ONLY <a href="#m-MAAPI_CONFIG_CDB_ONLY" id="m-MAAPI_CONFIG_CDB_ONLY"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_CDB_ONLY;
```

Same as [`CONFIG_CDB_ONLY`](MaapiConfigFlag.md#m-CONFIG_CDB_ONLY)

### MAAPI_CONFIG_CONTINUE_ON_ERROR <a href="#m-MAAPI_CONFIG_CONTINUE_ON_ERROR" id="m-MAAPI_CONFIG_CONTINUE_ON_ERROR"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_CONTINUE_ON_ERROR;
```

Same as [`CONFIG_CONTINUE_ON_ERROR`](MaapiConfigFlag.md#m-CONFIG_CONTINUE_ON_ERROR)

### MAAPI_CONFIG_HIDE_ALL <a href="#m-MAAPI_CONFIG_HIDE_ALL" id="m-MAAPI_CONFIG_HIDE_ALL"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_HIDE_ALL;
```

Same as [`CONFIG_HIDE_ALL`](MaapiConfigFlag.md#m-CONFIG_HIDE_ALL)

### MAAPI_CONFIG_J <a href="#m-MAAPI_CONFIG_J" id="m-MAAPI_CONFIG_J"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_J;
```

Same as [`JUNIPER_CLI_FORMAT`](MaapiConfigFlag.md#m-JUNIPER_CLI_FORMAT)

### MAAPI_CONFIG_J_CMD <a href="#m-MAAPI_CONFIG_J_CMD" id="m-MAAPI_CONFIG_J_CMD"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_J_CMD;
```

Same as [`JUNIPER_CLI_CMD_FORMAT`](MaapiConfigFlag.md#m-JUNIPER_CLI_CMD_FORMAT)

### MAAPI_CONFIG_JSON <a href="#m-MAAPI_CONFIG_JSON" id="m-MAAPI_CONFIG_JSON"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_JSON;
```

Same as [`JSON_FORMAT`](MaapiConfigFlag.md#m-JSON_FORMAT)

### MAAPI_CONFIG_MERGE <a href="#m-MAAPI_CONFIG_MERGE" id="m-MAAPI_CONFIG_MERGE"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_MERGE;
```

Same as [`MERGE_CONFIGURATIONS`](MaapiConfigFlag.md#m-MERGE_CONFIGURATIONS)

### MAAPI_CONFIG_NO_BACKQUOTE <a href="#m-MAAPI_CONFIG_NO_BACKQUOTE" id="m-MAAPI_CONFIG_NO_BACKQUOTE"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_NO_BACKQUOTE;
```

Same as [`CONFIG_AUTOCOMMIT`](MaapiConfigFlag.md#m-CONFIG_AUTOCOMMIT)

### MAAPI_CONFIG_NO_PARENTS <a href="#m-MAAPI_CONFIG_NO_PARENTS" id="m-MAAPI_CONFIG_NO_PARENTS"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_NO_PARENTS;
```

Same as [`CONFIG_NO_PARENTS`](MaapiConfigFlag.md#m-CONFIG_NO_PARENTS)

### MAAPI_CONFIG_OPER_ONLY <a href="#m-MAAPI_CONFIG_OPER_ONLY" id="m-MAAPI_CONFIG_OPER_ONLY"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_OPER_ONLY;
```

Same as [`CONFIG_OPER_ONLY`](MaapiConfigFlag.md#m-CONFIG_OPER_ONLY)

### MAAPI_CONFIG_READ_WRITE_ACCESS_ONLY <a href="#m-MAAPI_CONFIG_READ_WRITE_ACCESS_ONLY" id="m-MAAPI_CONFIG_READ_WRITE_ACCESS_ONLY"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_READ_WRITE_ACCESS_ONLY;
```

The output of saveConfig will only include nodes for which the user has
 read_write access.

### MAAPI_CONFIG_REPLACE <a href="#m-MAAPI_CONFIG_REPLACE" id="m-MAAPI_CONFIG_REPLACE"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_REPLACE;
```

Same as [`CONFIG_REPLACE`](MaapiConfigFlag.md#m-CONFIG_REPLACE)

### MAAPI_CONFIG_SHOW_DEFAULTS <a href="#m-MAAPI_CONFIG_SHOW_DEFAULTS" id="m-MAAPI_CONFIG_SHOW_DEFAULTS"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_SHOW_DEFAULTS;
```

Same as [`WITH_DEFAULTS`](MaapiConfigFlag.md#m-WITH_DEFAULTS)

### MAAPI_CONFIG_SUPPRESS_ERRORS <a href="#m-MAAPI_CONFIG_SUPPRESS_ERRORS" id="m-MAAPI_CONFIG_SUPPRESS_ERRORS"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_SUPPRESS_ERRORS;
```

Same as [`CONFIG_SUPPRESS_ERRORS`](MaapiConfigFlag.md#m-CONFIG_SUPPRESS_ERRORS)

### MAAPI_CONFIG_UNHIDE_ALL <a href="#m-MAAPI_CONFIG_UNHIDE_ALL" id="m-MAAPI_CONFIG_UNHIDE_ALL"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_UNHIDE_ALL;
```

Same as [`CONFIG_UNHIDE_ALL`](MaapiConfigFlag.md#m-CONFIG_UNHIDE_ALL)

### MAAPI_CONFIG_WITH_DEFAULTS <a href="#m-MAAPI_CONFIG_WITH_DEFAULTS" id="m-MAAPI_CONFIG_WITH_DEFAULTS"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_WITH_DEFAULTS;
```

Same as [`WITH_DEFAULTS`](MaapiConfigFlag.md#m-WITH_DEFAULTS)

### MAAPI_CONFIG_WITH_OPER <a href="#m-MAAPI_CONFIG_WITH_OPER" id="m-MAAPI_CONFIG_WITH_OPER"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_WITH_OPER;
```

Same as [`WITH_OPER`](MaapiConfigFlag.md#m-WITH_OPER)

### MAAPI_CONFIG_WITH_SERVICE_META <a href="#m-MAAPI_CONFIG_WITH_SERVICE_META" id="m-MAAPI_CONFIG_WITH_SERVICE_META"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_WITH_SERVICE_META;
```

Same as [`CONFIG_WITH_SERVICE_META`](MaapiConfigFlag.md#m-CONFIG_WITH_SERVICE_META)

### MAAPI_CONFIG_XML <a href="#m-MAAPI_CONFIG_XML" id="m-MAAPI_CONFIG_XML"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_XML;
```

Same as [`XML_FORMAT`](MaapiConfigFlag.md#m-XML_FORMAT)

### MAAPI_CONFIG_XML_LOAD_LAX <a href="#m-MAAPI_CONFIG_XML_LOAD_LAX" id="m-MAAPI_CONFIG_XML_LOAD_LAX"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_XML_LOAD_LAX;
```

Same as [`CONFIG_XML_LOAD_LAX`](MaapiConfigFlag.md#m-CONFIG_XML_LOAD_LAX)

### MAAPI_CONFIG_XML_PRETTY <a href="#m-MAAPI_CONFIG_XML_PRETTY" id="m-MAAPI_CONFIG_XML_PRETTY"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_XML_PRETTY;
```

Same as [`XPATH`](MaapiConfigFlag.md#m-XPATH)

### MAAPI_CONFIG_XPATH <a href="#m-MAAPI_CONFIG_XPATH" id="m-MAAPI_CONFIG_XPATH"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_XPATH;
```

Same as [`XPATH`](MaapiConfigFlag.md#m-XPATH)

### MERGE_CONFIGURATIONS <a href="#m-MERGE_CONFIGURATIONS" id="m-MERGE_CONFIGURATIONS"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MERGE_CONFIGURATIONS;
```

Load config flag indicating that current configuration should be merged
 with the loaded data instead of deleted.

### SHOW_DEFAULTS <a href="#m-SHOW_DEFAULTS" id="m-SHOW_DEFAULTS"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag SHOW_DEFAULTS;
```

Save/Load config flag indicating that default values are also included
 next to the real configuration value.

### WITH_DEFAULTS <a href="#m-WITH_DEFAULTS" id="m-WITH_DEFAULTS"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag WITH_DEFAULTS;
```

Save/Load config flag indicating that default values are included as
 part of the configuration.

### WITH_OPER <a href="#m-WITH_OPER" id="m-WITH_OPER"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag WITH_OPER;
```

Load config flag used in conjunction with [`MAAPI_CONFIG_XML`](MaapiConfigFlag.md#m-MAAPI_CONFIG_XML) to
 indicated that operational data should be ignored instead of
 producing an error.

### XML_FORMAT <a href="#m-XML_FORMAT" id="m-XML_FORMAT"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag XML_FORMAT;
```

Save/Load config flag indicating XML configuration format.

### XML_PRETTY <a href="#m-XML_PRETTY" id="m-XML_PRETTY"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag XML_PRETTY;
```

The configuration format is pretty printed XML.

### XPATH <a href="#m-XPATH" id="m-XPATH"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag XPATH;
```

The fmtpath and remaining arguments give an XPath filter instead of a
 keypath. XPath filtering for path to
 `Maapi#saveConfig(int,EnumSet,String,Object... )` can only be
 used with [`MAAPI_CONFIG_XML`](MaapiConfigFlag.md#m-MAAPI_CONFIG_XML) and
 [`MAAPI_CONFIG_XML_PRETTY`](MaapiConfigFlag.md#m-MAAPI_CONFIG_XML_PRETTY).


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.maapi.MaapiConfigFlag valueOf(String name)
```

Types: [MaapiConfigFlag](MaapiConfigFlag.md#cls-MaapiConfigFlag)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.MaapiConfigFlag[] values()
```

Types: [MaapiConfigFlag](MaapiConfigFlag.md#cls-MaapiConfigFlag)
