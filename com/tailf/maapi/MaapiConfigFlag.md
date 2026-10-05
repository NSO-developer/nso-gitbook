<a id="cls-MaapiConfigFlag"></a>
# MaapiConfigFlag

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

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-CISCO_IOS_FORMAT"></a>
### CISCO_IOS_FORMAT

```java
public static final com.tailf.maapi.MaapiConfigFlag CISCO_IOS_FORMAT;
```

Save/Load config flag indicating Cisco IOS style configuration format.

<a id="m-CISCO_XR_FORMAT"></a>
### CISCO_XR_FORMAT

```java
public static final com.tailf.maapi.MaapiConfigFlag CISCO_XR_FORMAT;
```

Save/Load config flag indicating Cisco XR style configuration format.

<a id="m-CONFIG_AUTOCOMMIT"></a>
### CONFIG_AUTOCOMMIT

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_AUTOCOMMIT;
```

The flag can be used together with `#MAAPI_CONFIG_C` and
 `#MAAPI_CONFIG_C_IOS` to mean that a commit should be performed
 after each line

<a id="m-CONFIG_CDB_ONLY"></a>
### CONFIG_CDB_ONLY

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_CDB_ONLY;
```

The output of saveConfig will only include data stored in CDB.

<a id="m-CONFIG_CONTINUE_ON_ERROR"></a>
### CONFIG_CONTINUE_ON_ERROR

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_CONTINUE_ON_ERROR;
```

The flag can be used to indicate that the load should not be aborted
 when an error is encountered.

<a id="m-CONFIG_HIDE_ALL"></a>
### CONFIG_HIDE_ALL

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_HIDE_ALL;
```

Hide all hidden nodes.

<a id="m-CONFIG_NO_PARENTS"></a>
### CONFIG_NO_PARENTS

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_NO_PARENTS;
```

The output of saveConfig will begin at path instead of root.

<a id="m-CONFIG_OPER_ONLY"></a>
### CONFIG_OPER_ONLY

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_OPER_ONLY;
```

The output of saveConfig will only include operational data
 and ancestors to operational data nodes.

<a id="m-CONFIG_REPLACE"></a>
### CONFIG_REPLACE

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_REPLACE;
```

To replace only the part of the configuration that is present in
 the file.

<a id="m-CONFIG_SUPPRESS_ERRORS"></a>
### CONFIG_SUPPRESS_ERRORS

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_SUPPRESS_ERRORS;
```

The flag is used to suppress the long error messages but instead have a
 one line error with the line number.

<a id="m-CONFIG_UNHIDE_ALL"></a>
### CONFIG_UNHIDE_ALL

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_UNHIDE_ALL;
```

Unhide all hidden nodes (see below).

<a id="m-CONFIG_WITH_SERVICE_META"></a>
### CONFIG_WITH_SERVICE_META

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_WITH_SERVICE_META;
```

The flag can be used to request that NCS service-meta-data attributes
 should be included when saving configuration.

<a id="m-CONFIG_XML_LOAD_LAX"></a>
### CONFIG_XML_LOAD_LAX

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_XML_LOAD_LAX;
```

The flag can be used together with `#XML_FORMAT`. Indicates
 that relaxed parsing shall be done. Unknown XML elements are silently
 ignored.

<a id="m-JSON_FORMAT"></a>
### JSON_FORMAT

```java
public static final com.tailf.maapi.MaapiConfigFlag JSON_FORMAT;
```

The configuration format is JSON.

<a id="m-JUNIPER_CLI_CMD_FORMAT"></a>
### JUNIPER_CLI_CMD_FORMAT

```java
public static final com.tailf.maapi.MaapiConfigFlag JUNIPER_CLI_CMD_FORMAT;
```

The configuration format is Juniper-style set commands.
 Use this flag with [`Maapi#loadConfig`](Maapi.md#m-loadconfig-0cd0ed8a64d0), or
 [`Maapi#loadConfigCmds`](Maapi.md#m-loadconfigcmds-4c47d55451a5) to load
 configuration expressed as Juniper "set" commands.

<a id="m-JUNIPER_CLI_FORMAT"></a>
### JUNIPER_CLI_FORMAT

```java
public static final com.tailf.maapi.MaapiConfigFlag JUNIPER_CLI_FORMAT;
```

Save/Load config flag indicating curly brace Juniper CLI configuration
 format.

<a id="m-MAAPI_CONFIG_AUTOCOMMIT"></a>
### MAAPI_CONFIG_AUTOCOMMIT

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_AUTOCOMMIT;
```

Same as `#CONFIG_AUTOCOMMIT`

<a id="m-MAAPI_CONFIG_C"></a>
### MAAPI_CONFIG_C

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_C;
```

Same as `#CISCO_XR_FORMAT`

<a id="m-MAAPI_CONFIG_C_IOS"></a>
### MAAPI_CONFIG_C_IOS

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_C_IOS;
```

Same as `#CISCO_IOS_FORMAT`

<a id="m-MAAPI_CONFIG_CDB_ONLY"></a>
### MAAPI_CONFIG_CDB_ONLY

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_CDB_ONLY;
```

Same as `#CONFIG_CDB_ONLY`

<a id="m-MAAPI_CONFIG_CONTINUE_ON_ERROR"></a>
### MAAPI_CONFIG_CONTINUE_ON_ERROR

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_CONTINUE_ON_ERROR;
```

Same as `#CONFIG_CONTINUE_ON_ERROR`

<a id="m-MAAPI_CONFIG_HIDE_ALL"></a>
### MAAPI_CONFIG_HIDE_ALL

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_HIDE_ALL;
```

Same as `#CONFIG_HIDE_ALL`

<a id="m-MAAPI_CONFIG_J"></a>
### MAAPI_CONFIG_J

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_J;
```

Same as `#JUNIPER_CLI_FORMAT`

<a id="m-MAAPI_CONFIG_J_CMD"></a>
### MAAPI_CONFIG_J_CMD

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_J_CMD;
```

Same as `#JUNIPER_CLI_CMD_FORMAT`

<a id="m-MAAPI_CONFIG_JSON"></a>
### MAAPI_CONFIG_JSON

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_JSON;
```

Same as `#JSON_FORMAT`

<a id="m-MAAPI_CONFIG_MERGE"></a>
### MAAPI_CONFIG_MERGE

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_MERGE;
```

Same as `#MERGE_CONFIGURATIONS`

<a id="m-MAAPI_CONFIG_NO_BACKQUOTE"></a>
### MAAPI_CONFIG_NO_BACKQUOTE

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_NO_BACKQUOTE;
```

Same as `#CONFIG_AUTOCOMMIT`

<a id="m-MAAPI_CONFIG_NO_PARENTS"></a>
### MAAPI_CONFIG_NO_PARENTS

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_NO_PARENTS;
```

Same as `#CONFIG_NO_PARENTS`

<a id="m-MAAPI_CONFIG_OPER_ONLY"></a>
### MAAPI_CONFIG_OPER_ONLY

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_OPER_ONLY;
```

Same as `#CONFIG_OPER_ONLY`

<a id="m-MAAPI_CONFIG_READ_WRITE_ACCESS_ONLY"></a>
### MAAPI_CONFIG_READ_WRITE_ACCESS_ONLY

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_READ_WRITE_ACCESS_ONLY;
```

The output of saveConfig will only include nodes for which the user has
 read_write access.

<a id="m-MAAPI_CONFIG_REPLACE"></a>
### MAAPI_CONFIG_REPLACE

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_REPLACE;
```

Same as `#CONFIG_REPLACE`

<a id="m-MAAPI_CONFIG_SHOW_DEFAULTS"></a>
### MAAPI_CONFIG_SHOW_DEFAULTS

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_SHOW_DEFAULTS;
```

Same as `#WITH_DEFAULTS`

<a id="m-MAAPI_CONFIG_SUPPRESS_ERRORS"></a>
### MAAPI_CONFIG_SUPPRESS_ERRORS

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_SUPPRESS_ERRORS;
```

Same as `#CONFIG_SUPPRESS_ERRORS`

<a id="m-MAAPI_CONFIG_UNHIDE_ALL"></a>
### MAAPI_CONFIG_UNHIDE_ALL

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_UNHIDE_ALL;
```

Same as `#CONFIG_UNHIDE_ALL`

<a id="m-MAAPI_CONFIG_WITH_DEFAULTS"></a>
### MAAPI_CONFIG_WITH_DEFAULTS

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_WITH_DEFAULTS;
```

Same as `#WITH_DEFAULTS`

<a id="m-MAAPI_CONFIG_WITH_OPER"></a>
### MAAPI_CONFIG_WITH_OPER

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_WITH_OPER;
```

Same as `#WITH_OPER`

<a id="m-MAAPI_CONFIG_WITH_SERVICE_META"></a>
### MAAPI_CONFIG_WITH_SERVICE_META

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_WITH_SERVICE_META;
```

Same as `#CONFIG_WITH_SERVICE_META`

<a id="m-MAAPI_CONFIG_XML"></a>
### MAAPI_CONFIG_XML

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_XML;
```

Same as `#XML_FORMAT`

<a id="m-MAAPI_CONFIG_XML_LOAD_LAX"></a>
### MAAPI_CONFIG_XML_LOAD_LAX

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_XML_LOAD_LAX;
```

Same as `#CONFIG_XML_LOAD_LAX`

<a id="m-MAAPI_CONFIG_XML_PRETTY"></a>
### MAAPI_CONFIG_XML_PRETTY

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_XML_PRETTY;
```

Same as `#XPATH`

<a id="m-MAAPI_CONFIG_XPATH"></a>
### MAAPI_CONFIG_XPATH

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_XPATH;
```

Same as `#XPATH`

<a id="m-MERGE_CONFIGURATIONS"></a>
### MERGE_CONFIGURATIONS

```java
public static final com.tailf.maapi.MaapiConfigFlag MERGE_CONFIGURATIONS;
```

Load config flag indicating that current configuration should be merged
 with the loaded data instead of deleted.

<a id="m-SHOW_DEFAULTS"></a>
### SHOW_DEFAULTS

```java
public static final com.tailf.maapi.MaapiConfigFlag SHOW_DEFAULTS;
```

Save/Load config flag indicating that default values are also included
 next to the real configuration value.

<a id="m-WITH_DEFAULTS"></a>
### WITH_DEFAULTS

```java
public static final com.tailf.maapi.MaapiConfigFlag WITH_DEFAULTS;
```

Save/Load config flag indicating that default values are included as
 part of the configuration.

<a id="m-WITH_OPER"></a>
### WITH_OPER

```java
public static final com.tailf.maapi.MaapiConfigFlag WITH_OPER;
```

Load config flag used in conjunction with `#MAAPI_CONFIG_XML` to
 indicated that operational data should be ignored instead of
 producing an error.

<a id="m-XML_FORMAT"></a>
### XML_FORMAT

```java
public static final com.tailf.maapi.MaapiConfigFlag XML_FORMAT;
```

Save/Load config flag indicating XML configuration format.

<a id="m-XML_PRETTY"></a>
### XML_PRETTY

```java
public static final com.tailf.maapi.MaapiConfigFlag XML_PRETTY;
```

The configuration format is pretty printed XML.

<a id="m-XPATH"></a>
### XPATH

```java
public static final com.tailf.maapi.MaapiConfigFlag XPATH;
```

The fmtpath and remaining arguments give an XPath filter instead of a
 keypath. XPath filtering for path to
 `Maapi#saveConfig(int,EnumSet,String,Object... )` can only be
 used with `#MAAPI_CONFIG_XML` and
 `#MAAPI_CONFIG_XML_PRETTY`.


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.maapi.MaapiConfigFlag valueOf(String name)
```

Types: [MaapiConfigFlag](MaapiConfigFlag.md#cls-MaapiConfigFlag)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.maapi.MaapiConfigFlag[] values()
```

Types: [MaapiConfigFlag](MaapiConfigFlag.md#cls-MaapiConfigFlag)
