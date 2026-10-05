# MaapiConfigFlag <a href="#maapiconfigflag-53df41e9a7b7" id="maapiconfigflag-53df41e9a7b7"></a>

```java
public enum com.tailf.maapi.MaapiConfigFlag
```

Flags used in `Maapi#saveConfig(int,EnumSet,String,Object... )`
 and `Maapi#loadConfig(int,EnumSet,String)`.

## Members

**Enum Constants**:

- [CISCO\_IOS\_FORMAT](#cisco_ios_format-a2224e97faa1)
- [CISCO\_XR\_FORMAT](#cisco_xr_format-95c530ea77b0)
- [CONFIG\_AUTOCOMMIT](#config_autocommit-8c94644b466d)
- [CONFIG\_CDB\_ONLY](#config_cdb_only-14a717b83df3)
- [CONFIG\_CONTINUE\_ON\_ERROR](#config_continue_on_error-b33ec1fca49d)
- [CONFIG\_HIDE\_ALL](#config_hide_all-5f78b54eb612)
- [CONFIG\_NO\_PARENTS](#config_no_parents-70482f5db198)
- [CONFIG\_OPER\_ONLY](#config_oper_only-c1f1cc9f2f2d)
- [CONFIG\_REPLACE](#config_replace-a1c6f235599b)
- [CONFIG\_SUPPRESS\_ERRORS](#config_suppress_errors-fc6a518d13c0)
- [CONFIG\_UNHIDE\_ALL](#config_unhide_all-d8d7940eac43)
- [CONFIG\_WITH\_SERVICE\_META](#config_with_service_meta-1d973f1ba025)
- [CONFIG\_XML\_LOAD\_LAX](#config_xml_load_lax-ff4dabb7ea34)
- [JSON\_FORMAT](#json_format-178bf951b22d)
- [JUNIPER\_CLI\_CMD\_FORMAT](#juniper_cli_cmd_format-b1175f2cf62b)
- [JUNIPER\_CLI\_FORMAT](#juniper_cli_format-861be2804daf)
- [MAAPI\_CONFIG\_AUTOCOMMIT](#maapi_config_autocommit-51f70a6e1477)
- [MAAPI\_CONFIG\_C](#maapi_config_c-2ee924bb806a)
- [MAAPI\_CONFIG\_C\_IOS](#maapi_config_c_ios-5908ad7c1e08)
- [MAAPI\_CONFIG\_CDB\_ONLY](#maapi_config_cdb_only-bf39f574655b)
- [MAAPI\_CONFIG\_CONTINUE\_ON\_ERROR](#maapi_config_continue_on_error-6e636c4055ce)
- [MAAPI\_CONFIG\_HIDE\_ALL](#maapi_config_hide_all-161f42eaba86)
- [MAAPI\_CONFIG\_J](#maapi_config_j-fcd7daaed20b)
- [MAAPI\_CONFIG\_J\_CMD](#maapi_config_j_cmd-84a4e8b8957c)
- [MAAPI\_CONFIG\_JSON](#maapi_config_json-b51203378e16)
- [MAAPI\_CONFIG\_MERGE](#maapi_config_merge-b85720c4efea)
- [MAAPI\_CONFIG\_NO\_BACKQUOTE](#maapi_config_no_backquote-6c598a928427)
- [MAAPI\_CONFIG\_NO\_PARENTS](#maapi_config_no_parents-465a62b97522)
- [MAAPI\_CONFIG\_OPER\_ONLY](#maapi_config_oper_only-67aef56f15f7)
- [MAAPI\_CONFIG\_READ\_WRITE\_ACCESS\_ONLY](#maapi_config_read_write_access_only-e9540ee0b76c)
- [MAAPI\_CONFIG\_REPLACE](#maapi_config_replace-633c751ba3ec)
- [MAAPI\_CONFIG\_SHOW\_DEFAULTS](#maapi_config_show_defaults-2328f9974c9c)
- [MAAPI\_CONFIG\_SUPPRESS\_ERRORS](#maapi_config_suppress_errors-82d208211cbe)
- [MAAPI\_CONFIG\_UNHIDE\_ALL](#maapi_config_unhide_all-6db0d84095d7)
- [MAAPI\_CONFIG\_WITH\_DEFAULTS](#maapi_config_with_defaults-199d7d94d931)
- [MAAPI\_CONFIG\_WITH\_OPER](#maapi_config_with_oper-e9ea7e3958f1)
- [MAAPI\_CONFIG\_WITH\_SERVICE\_META](#maapi_config_with_service_meta-262400830f06)
- [MAAPI\_CONFIG\_XML](#maapi_config_xml-5293149632cc)
- [MAAPI\_CONFIG\_XML\_LOAD\_LAX](#maapi_config_xml_load_lax-ee0929bebaf5)
- [MAAPI\_CONFIG\_XML\_PRETTY](#maapi_config_xml_pretty-6e369993cec8)
- [MAAPI\_CONFIG\_XPATH](#maapi_config_xpath-1457dd10cb74)
- [MERGE\_CONFIGURATIONS](#merge_configurations-31b94a3713f5)
- [SHOW\_DEFAULTS](#show_defaults-b8c48c4cee5e)
- [WITH\_DEFAULTS](#with_defaults-e9932c88bf13)
- [WITH\_OPER](#with_oper-3283e53d6412)
- [XML\_FORMAT](#xml_format-96c70b32b8b4)
- [XML\_PRETTY](#xml_pretty-eb9cabeb3345)
- [XPATH](#xpath-9a88fbc67981)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### CISCO_IOS_FORMAT <a href="#cisco_ios_format-a2224e97faa1" id="cisco_ios_format-a2224e97faa1"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CISCO_IOS_FORMAT;
```

Save/Load config flag indicating Cisco IOS style configuration format.

### CISCO_XR_FORMAT <a href="#cisco_xr_format-95c530ea77b0" id="cisco_xr_format-95c530ea77b0"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CISCO_XR_FORMAT;
```

Save/Load config flag indicating Cisco XR style configuration format.

### CONFIG_AUTOCOMMIT <a href="#config_autocommit-8c94644b466d" id="config_autocommit-8c94644b466d"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_AUTOCOMMIT;
```

The flag can be used together with [`MAAPI_CONFIG_C`](MaapiConfigFlag.md#maapi_config_c-2ee924bb806a) and
 [`MAAPI_CONFIG_C_IOS`](MaapiConfigFlag.md#maapi_config_c_ios-5908ad7c1e08) to mean that a commit should be performed
 after each line

### CONFIG_CDB_ONLY <a href="#config_cdb_only-14a717b83df3" id="config_cdb_only-14a717b83df3"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_CDB_ONLY;
```

The output of saveConfig will only include data stored in CDB.

### CONFIG_CONTINUE_ON_ERROR <a href="#config_continue_on_error-b33ec1fca49d" id="config_continue_on_error-b33ec1fca49d"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_CONTINUE_ON_ERROR;
```

The flag can be used to indicate that the load should not be aborted
 when an error is encountered.

### CONFIG_HIDE_ALL <a href="#config_hide_all-5f78b54eb612" id="config_hide_all-5f78b54eb612"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_HIDE_ALL;
```

Hide all hidden nodes.

### CONFIG_NO_PARENTS <a href="#config_no_parents-70482f5db198" id="config_no_parents-70482f5db198"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_NO_PARENTS;
```

The output of saveConfig will begin at path instead of root.

### CONFIG_OPER_ONLY <a href="#config_oper_only-c1f1cc9f2f2d" id="config_oper_only-c1f1cc9f2f2d"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_OPER_ONLY;
```

The output of saveConfig will only include operational data
 and ancestors to operational data nodes.

### CONFIG_REPLACE <a href="#config_replace-a1c6f235599b" id="config_replace-a1c6f235599b"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_REPLACE;
```

To replace only the part of the configuration that is present in
 the file.

### CONFIG_SUPPRESS_ERRORS <a href="#config_suppress_errors-fc6a518d13c0" id="config_suppress_errors-fc6a518d13c0"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_SUPPRESS_ERRORS;
```

The flag is used to suppress the long error messages but instead have a
 one line error with the line number.

### CONFIG_UNHIDE_ALL <a href="#config_unhide_all-d8d7940eac43" id="config_unhide_all-d8d7940eac43"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_UNHIDE_ALL;
```

Unhide all hidden nodes (see below).

### CONFIG_WITH_SERVICE_META <a href="#config_with_service_meta-1d973f1ba025" id="config_with_service_meta-1d973f1ba025"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_WITH_SERVICE_META;
```

The flag can be used to request that NCS service-meta-data attributes
 should be included when saving configuration.

### CONFIG_XML_LOAD_LAX <a href="#config_xml_load_lax-ff4dabb7ea34" id="config_xml_load_lax-ff4dabb7ea34"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag CONFIG_XML_LOAD_LAX;
```

The flag can be used together with [`XML_FORMAT`](MaapiConfigFlag.md#xml_format-96c70b32b8b4). Indicates
 that relaxed parsing shall be done. Unknown XML elements are silently
 ignored.

### JSON_FORMAT <a href="#json_format-178bf951b22d" id="json_format-178bf951b22d"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag JSON_FORMAT;
```

The configuration format is JSON.

### JUNIPER_CLI_CMD_FORMAT <a href="#juniper_cli_cmd_format-b1175f2cf62b" id="juniper_cli_cmd_format-b1175f2cf62b"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag JUNIPER_CLI_CMD_FORMAT;
```

The configuration format is Juniper-style set commands.
 Use this flag with [`Maapi#loadConfig`](Maapi.md#loadconfig-0cd0ed8a64d0), or
 [`Maapi#loadConfigCmds`](Maapi.md#loadconfigcmds-4c47d55451a5) to load
 configuration expressed as Juniper "set" commands.

### JUNIPER_CLI_FORMAT <a href="#juniper_cli_format-861be2804daf" id="juniper_cli_format-861be2804daf"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag JUNIPER_CLI_FORMAT;
```

Save/Load config flag indicating curly brace Juniper CLI configuration
 format.

### MAAPI_CONFIG_AUTOCOMMIT <a href="#maapi_config_autocommit-51f70a6e1477" id="maapi_config_autocommit-51f70a6e1477"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_AUTOCOMMIT;
```

Same as [`CONFIG_AUTOCOMMIT`](MaapiConfigFlag.md#config_autocommit-8c94644b466d)

### MAAPI_CONFIG_C <a href="#maapi_config_c-2ee924bb806a" id="maapi_config_c-2ee924bb806a"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_C;
```

Same as [`CISCO_XR_FORMAT`](MaapiConfigFlag.md#cisco_xr_format-95c530ea77b0)

### MAAPI_CONFIG_C_IOS <a href="#maapi_config_c_ios-5908ad7c1e08" id="maapi_config_c_ios-5908ad7c1e08"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_C_IOS;
```

Same as [`CISCO_IOS_FORMAT`](MaapiConfigFlag.md#cisco_ios_format-a2224e97faa1)

### MAAPI_CONFIG_CDB_ONLY <a href="#maapi_config_cdb_only-bf39f574655b" id="maapi_config_cdb_only-bf39f574655b"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_CDB_ONLY;
```

Same as [`CONFIG_CDB_ONLY`](MaapiConfigFlag.md#config_cdb_only-14a717b83df3)

### MAAPI_CONFIG_CONTINUE_ON_ERROR <a href="#maapi_config_continue_on_error-6e636c4055ce" id="maapi_config_continue_on_error-6e636c4055ce"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_CONTINUE_ON_ERROR;
```

Same as [`CONFIG_CONTINUE_ON_ERROR`](MaapiConfigFlag.md#config_continue_on_error-b33ec1fca49d)

### MAAPI_CONFIG_HIDE_ALL <a href="#maapi_config_hide_all-161f42eaba86" id="maapi_config_hide_all-161f42eaba86"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_HIDE_ALL;
```

Same as [`CONFIG_HIDE_ALL`](MaapiConfigFlag.md#config_hide_all-5f78b54eb612)

### MAAPI_CONFIG_J <a href="#maapi_config_j-fcd7daaed20b" id="maapi_config_j-fcd7daaed20b"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_J;
```

Same as [`JUNIPER_CLI_FORMAT`](MaapiConfigFlag.md#juniper_cli_format-861be2804daf)

### MAAPI_CONFIG_J_CMD <a href="#maapi_config_j_cmd-84a4e8b8957c" id="maapi_config_j_cmd-84a4e8b8957c"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_J_CMD;
```

Same as [`JUNIPER_CLI_CMD_FORMAT`](MaapiConfigFlag.md#juniper_cli_cmd_format-b1175f2cf62b)

### MAAPI_CONFIG_JSON <a href="#maapi_config_json-b51203378e16" id="maapi_config_json-b51203378e16"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_JSON;
```

Same as [`JSON_FORMAT`](MaapiConfigFlag.md#json_format-178bf951b22d)

### MAAPI_CONFIG_MERGE <a href="#maapi_config_merge-b85720c4efea" id="maapi_config_merge-b85720c4efea"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_MERGE;
```

Same as [`MERGE_CONFIGURATIONS`](MaapiConfigFlag.md#merge_configurations-31b94a3713f5)

### MAAPI_CONFIG_NO_BACKQUOTE <a href="#maapi_config_no_backquote-6c598a928427" id="maapi_config_no_backquote-6c598a928427"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_NO_BACKQUOTE;
```

Same as [`CONFIG_AUTOCOMMIT`](MaapiConfigFlag.md#config_autocommit-8c94644b466d)

### MAAPI_CONFIG_NO_PARENTS <a href="#maapi_config_no_parents-465a62b97522" id="maapi_config_no_parents-465a62b97522"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_NO_PARENTS;
```

Same as [`CONFIG_NO_PARENTS`](MaapiConfigFlag.md#config_no_parents-70482f5db198)

### MAAPI_CONFIG_OPER_ONLY <a href="#maapi_config_oper_only-67aef56f15f7" id="maapi_config_oper_only-67aef56f15f7"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_OPER_ONLY;
```

Same as [`CONFIG_OPER_ONLY`](MaapiConfigFlag.md#config_oper_only-c1f1cc9f2f2d)

### MAAPI_CONFIG_READ_WRITE_ACCESS_ONLY <a href="#maapi_config_read_write_access_only-e9540ee0b76c" id="maapi_config_read_write_access_only-e9540ee0b76c"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_READ_WRITE_ACCESS_ONLY;
```

The output of saveConfig will only include nodes for which the user has
 read_write access.

### MAAPI_CONFIG_REPLACE <a href="#maapi_config_replace-633c751ba3ec" id="maapi_config_replace-633c751ba3ec"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_REPLACE;
```

Same as [`CONFIG_REPLACE`](MaapiConfigFlag.md#config_replace-a1c6f235599b)

### MAAPI_CONFIG_SHOW_DEFAULTS <a href="#maapi_config_show_defaults-2328f9974c9c" id="maapi_config_show_defaults-2328f9974c9c"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_SHOW_DEFAULTS;
```

Same as [`WITH_DEFAULTS`](MaapiConfigFlag.md#with_defaults-e9932c88bf13)

### MAAPI_CONFIG_SUPPRESS_ERRORS <a href="#maapi_config_suppress_errors-82d208211cbe" id="maapi_config_suppress_errors-82d208211cbe"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_SUPPRESS_ERRORS;
```

Same as [`CONFIG_SUPPRESS_ERRORS`](MaapiConfigFlag.md#config_suppress_errors-fc6a518d13c0)

### MAAPI_CONFIG_UNHIDE_ALL <a href="#maapi_config_unhide_all-6db0d84095d7" id="maapi_config_unhide_all-6db0d84095d7"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_UNHIDE_ALL;
```

Same as [`CONFIG_UNHIDE_ALL`](MaapiConfigFlag.md#config_unhide_all-d8d7940eac43)

### MAAPI_CONFIG_WITH_DEFAULTS <a href="#maapi_config_with_defaults-199d7d94d931" id="maapi_config_with_defaults-199d7d94d931"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_WITH_DEFAULTS;
```

Same as [`WITH_DEFAULTS`](MaapiConfigFlag.md#with_defaults-e9932c88bf13)

### MAAPI_CONFIG_WITH_OPER <a href="#maapi_config_with_oper-e9ea7e3958f1" id="maapi_config_with_oper-e9ea7e3958f1"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_WITH_OPER;
```

Same as [`WITH_OPER`](MaapiConfigFlag.md#with_oper-3283e53d6412)

### MAAPI_CONFIG_WITH_SERVICE_META <a href="#maapi_config_with_service_meta-262400830f06" id="maapi_config_with_service_meta-262400830f06"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_WITH_SERVICE_META;
```

Same as [`CONFIG_WITH_SERVICE_META`](MaapiConfigFlag.md#config_with_service_meta-1d973f1ba025)

### MAAPI_CONFIG_XML <a href="#maapi_config_xml-5293149632cc" id="maapi_config_xml-5293149632cc"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_XML;
```

Same as [`XML_FORMAT`](MaapiConfigFlag.md#xml_format-96c70b32b8b4)

### MAAPI_CONFIG_XML_LOAD_LAX <a href="#maapi_config_xml_load_lax-ee0929bebaf5" id="maapi_config_xml_load_lax-ee0929bebaf5"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_XML_LOAD_LAX;
```

Same as [`CONFIG_XML_LOAD_LAX`](MaapiConfigFlag.md#config_xml_load_lax-ff4dabb7ea34)

### MAAPI_CONFIG_XML_PRETTY <a href="#maapi_config_xml_pretty-6e369993cec8" id="maapi_config_xml_pretty-6e369993cec8"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_XML_PRETTY;
```

Same as [`XPATH`](MaapiConfigFlag.md#xpath-9a88fbc67981)

### MAAPI_CONFIG_XPATH <a href="#maapi_config_xpath-1457dd10cb74" id="maapi_config_xpath-1457dd10cb74"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MAAPI_CONFIG_XPATH;
```

Same as [`XPATH`](MaapiConfigFlag.md#xpath-9a88fbc67981)

### MERGE_CONFIGURATIONS <a href="#merge_configurations-31b94a3713f5" id="merge_configurations-31b94a3713f5"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag MERGE_CONFIGURATIONS;
```

Load config flag indicating that current configuration should be merged
 with the loaded data instead of deleted.

### SHOW_DEFAULTS <a href="#show_defaults-b8c48c4cee5e" id="show_defaults-b8c48c4cee5e"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag SHOW_DEFAULTS;
```

Save/Load config flag indicating that default values are also included
 next to the real configuration value.

### WITH_DEFAULTS <a href="#with_defaults-e9932c88bf13" id="with_defaults-e9932c88bf13"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag WITH_DEFAULTS;
```

Save/Load config flag indicating that default values are included as
 part of the configuration.

### WITH_OPER <a href="#with_oper-3283e53d6412" id="with_oper-3283e53d6412"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag WITH_OPER;
```

Load config flag used in conjunction with [`MAAPI_CONFIG_XML`](MaapiConfigFlag.md#maapi_config_xml-5293149632cc) to
 indicated that operational data should be ignored instead of
 producing an error.

### XML_FORMAT <a href="#xml_format-96c70b32b8b4" id="xml_format-96c70b32b8b4"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag XML_FORMAT;
```

Save/Load config flag indicating XML configuration format.

### XML_PRETTY <a href="#xml_pretty-eb9cabeb3345" id="xml_pretty-eb9cabeb3345"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag XML_PRETTY;
```

The configuration format is pretty printed XML.

### XPATH <a href="#xpath-9a88fbc67981" id="xpath-9a88fbc67981"></a>

```java
public static final com.tailf.maapi.MaapiConfigFlag XPATH;
```

The fmtpath and remaining arguments give an XPath filter instead of a
 keypath. XPath filtering for path to
 `Maapi#saveConfig(int,EnumSet,String,Object... )` can only be
 used with [`MAAPI_CONFIG_XML`](MaapiConfigFlag.md#maapi_config_xml-5293149632cc) and
 [`MAAPI_CONFIG_XML_PRETTY`](MaapiConfigFlag.md#maapi_config_xml_pretty-6e369993cec8).


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.maapi.MaapiConfigFlag valueOf(String name)
```

Types: [MaapiConfigFlag](MaapiConfigFlag.md#maapiconfigflag-53df41e9a7b7)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.MaapiConfigFlag[] values()
```

Types: [MaapiConfigFlag](MaapiConfigFlag.md#maapiconfigflag-53df41e9a7b7)
