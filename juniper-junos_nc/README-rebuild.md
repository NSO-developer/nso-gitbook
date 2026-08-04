# Table of contents
-------------------
```
  1. General
    1.1 Overview
    1.2 Using the Built-in Tool For YANG Download
    1.3 Rebuild the NED With the Downloaded YANG Models
    1.4 Reload the NED Package in NSO
  2. Cleaning And Resetting the NED Package
    2.1 Removing All Downloaded YANG Models
    2.2 Resetting NED Package To Its Original Initial State
  3. Using the Built-in Downloader Tool For a Custom Download
    3.1 Creating a Custom Download
  4. Alternative Download Methods
    4.1 Copy the Files Into the NED Source Directory
  5. Rebuilding the NED Using a Custom NED-ID
    5.1 Rebuild With a Custom NED-ID
    5.2 Exporting the Rebuilt NED Package
  6. YANG Fixes Applied When Rebuilding the NED
    6.1 General
    6.2 Fixes Listed by Schema Paths
    6.3 Fixes Listed by YANG File Paths
    6.4 Other Fixes
  7. Advanced: Repairing Third-Party YANG Modules
    7.1 Types of YANG Related Issues
    7.2 Compile-time Issues
    7.3 Run-time Issues
  8. Advanced: Customizing Third-Party YANG Schemas
    8.1 Scope Filtering
    8.2 Trim Filtering
    8.3 Auto-config Filtering
  9. Advanced: Issues Solvable with Schema Customization
    9.1 Excessive RPCs Leading to Unresponsive NSO CLI
    9.2 Removing Deprecated Nodes from the Schema
    9.3 Identifying Problematic XPath Expressions Causing Performance Degradation in NSO
    9.4 Solving Issues Related to the NSO Brownfield Feature
  10. Advanced: How to Determine When a NED Upgrade is Required
    10.1 Example
    10.2 Analysing the Incompatibilities
    10.3 Suppressing Alarms for YANG Revision Mismatches
  11. Rebuild with Automatic Expansion of JunOS vlan-id Lists
    11.1 Activation
```


# 1. General
------------

## 1.1 Overview

The juniper-junos_nc NED is delivered without any YANG models included in the package.

To make the NED fully operational, you must first download the required models, then rebuild and reload the package.

This NED provides an optional built-in tool to simplify the download of device models.

Alternatively, you can download the models manually, as described in chapter **4**.

Before using the downloader tool, ensure that the NED package (without device models) is properly configured in a running NSO environment. Complete the steps outlined in Chapters **1.1** through **1.3** of the [README.md](README.md) before proceeding.

## 1.2 Using the Built-in Tool for Simple YANG Download

The downloader tool is implemented as an NSO RPC, which can be invoked, for example, from the NSO CLI.

When executed, the tool causes the NED to automatically connect to the target device to download the necessary YANG models. During this process, the NED requests the device to provide a list of supported models by probing its capabilities.

This list serves as the basis for downloading the models. Additionally, the tool scans each downloaded YANG file for further dependencies specified by import or include statements and attempts to download all such dependent YANG files as well.

  When using the NETCONF protocol the YANG models can normally be downloaded directly from the device.

### Simple Usage

  The downloader tool is pre-configured with following profiles:

  ```
  all-models-from-device : Download all YANG models with dependencies directly from the device.
  ```

  Do as follows in the NSO CLI to download the files using the `all-models-from-device profile:

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules profile all-models-from-device
  ```

  or just:

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules
  ```

**Note:** If a built-in profile is selected and the user specifies additional `module-include-regex` and/or `module-exclude-regex` options on the command line, the tool will merge the profile's regex patterns with those provided by the user.

For more advanced options when using the downloader tool, see Chapter **3**.

Chapter **5** ("rpc get-modules") of the [README.md](README.md) provides more details about the downloader tool, including a complete list of available command line arguments.

## 1.3 Rebuild the NED With the Downloaded YANG Models
The NED must be rebuilt after the device models have been successfully downloaded and stored.

It is common to encounter issues when building device YANG models. Such issues can result in compiler errors or unexpected runtime behaviors in NSO.

To address this, the NED is configured to handle all currently known build and runtime issues. It automatically patches problematic files to ensure they build correctly for NSO, using a set of YANG build recipes included with the NED package.

Please note that adapting the YANG build recipes is an ongoing process. If new issues are discovered, the Cisco NSO NED team will update the recipes and release a new version of the NED as needed.

**End users are strongly encouraged to report any new YANG build issues to the Cisco NSO NED team through a support request.**

The NED offers two options for rebuilding: you can either use the built-in tool within NSO, or run `gnu make` in an external shell.



### Rebuild Using the Built-in Tool

The built-in RPC command `rebuild-package` rebuilds the NED package by automatically invoking `gnu make` in the source directory of the package installation root.

**Example usage:**

```
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package
```

**Note:** This RPC may take a significant amount of time to complete, as compiling YANG models is a time-consuming process.

**Additional Arguments:**

- **verbose**: Prints the full output returned from gnu make. By default, output is shown only if errors occur.
- **profile**: Applies a specified build profile during the rebuild process.
- **ned-id**: Parameters for customizing the NED ID. For more information, see Chapter **5**.
- **create-namespace-files:** Builds Python and Java namespace files representing the nodes in the rebuilt schema.



### Rebuild Using a Separate Shell

The NED must be rebuilt from within the NED package installation root (i.e., `$NED_ROOT_DIR` as configured in Chapter **1.1** of the [README.md](README.md)).

To rebuild the NED, follow these steps:

```
> cd $NED_ROOT_DIR/src
> make clean all
```



## 1.4 Reload the NED Package In NSO

After the NED has been successfully rebuilt with the device models, it is necessary to reload the package in NSO.

To reload, use the following NSO CLI command:

```
admin@ncs# packages reload
```

**Note:** If the NED package has been rebuilt with a new NED-ID (as described in Chapter **5**), you must add the `force` option to the reload command:

```
admin@ncs# packages reload force
```



# 2. Cleaning And Resetting the NED Package


## 2.1 Removing All Downloaded YANG Models

If you plan to download a new set of YANG models for an already installed and reloaded NED, it is mandatory to first remove all old device YANG models from the previous download. Failing to do so may result in unintended mixing of different YANG models.

### Clean Using the Built-in Tool

```
admin@ncs# devices device dev-1 rpc rpc-clean-package clean-package
```

### Clean Using a Separate Shell

```
> cd $NED_ROOT_DIR/src
> make distclean
```


## 2.2 Resetting NED Package to Its Original Initial State

If you have rebuilt the NED with downloaded YANG files and a custom ned-id, the original default ned-id is no longer available. To reset the NED package to its original state, follow the steps below.

### Reset Using the Built-in Tool

1. Remove the downloaded YANG files:

   ```
   admin@ncs# devices device dev-1 rpc rpc-clean-package clean-package
   ```

2. Rebuild NED package without any additional arguments. This will reset the NED-ID to its original initial state:

   ```
   admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package
   ```

### Reset Using a Separate Shell

```
> cd $NED_ROOT_DIR/src
> make distclean clean all
```



# 3. Using the Built-in Downloader Tool For a Custom Download

Using a pre-configured download profile is the easiest way to download device YANG models.

If this approach is not suitable, the downloader tool offers several additional arguments for customizing the download-for example, by limiting the scope of the YANG models to be downloaded.

## 3.1 Creating a Custom Download

To customize the download scope, use the `module-include-regex` and `module-exclude-regex` arguments. Both should be specified as regular expressions.

The easiest way to determine the correct arguments is by using the RPC command `list-modules`.

  Example:

  Start with fetching a full list of the YANG models supported by the device:

  ```
  # devices device dev-1 rpc rpc-list-modules list-modules
  ```

  Limit the scope to only include some models, by specifying a simply regular expression for the argument `module-include-regex`:

  ```
  # devices device dev-1 rpc rpc-list-modules list-modules module-include-regex "(junos-conf-.+)"
  ```

  Now use the argument `module-exclude-regex` to exclude some of the files matching the `module-include-regex`:

  ```
  # devices device dev-1 rpc rpc-list-modules list-modules module-exclude-regex "(junos-conf-vmhost.+)"
  ```

  When the `list-modules` RPC returns only the models of interest you can use the same arguments for the `get-modules` RPC.

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules module-include-regex "(junos-conf-.+)" module-exclude-regex "(junos-conf-vmhost.+)" <additional arguments>
  ```

For more details about the `get-modules` and `list-modules` RPC commands, see Chapter **5** in the [README.md](README.md).



# 4. Alternative Download Methods

Device models can also be downloaded manually. To use this option, the NED package must first be unpacked. Complete the steps described in Chapter **1.1** of the [README.md](README.md) beforehand. It is also recommended to follow the steps in Chapters **1.2** and **1.3** for best results.


## 4.1 Copy the Files Into the NED Source Directory

When YANG models have been downloaded manually, all files must be copied into the source directory of the NED installation:

```
> cp <path to directory with the YANG files>/*.yang  $NED_ROOT_DIR/src/yang
```

**Note:**

YANG files named in the format `<module name>@<date revision>.`yang must be renamed to `<module name>.yang`. This is due to a limitation in the current NED make system.

This manual procedure is equivalent to using the downloader tool with a path to a local directory as the remote source. For more information, see Chapter **5** ("rpc get-modules") in the [README.md](README.md).

**Important:**

Do not remove any of the YANG files used internally by the NED in `$NED_ROOT_DIR/src/yang`.

This includes the following files:

```
tailf-internal-rpcs.yang
tailf-internal-rpcs-custom.yang
tailf-ned-juniper-junos_nc-dev-meta.yang
tailf-ned-juniper-junos_nc-meta.yang
tailf-ned-juniper-junos_nc-meta-custom.yang
tailf-ned-juniper-junos_nc-oper.yang
tailf-ned-juniper-junos_nc-stats.yang
```

The recommended way to clean the source directory is to follow the steps described in Chapter **5**.

# 5. Rebuilding the NED Using a Custom NED-ID

A common use case is managing multiple versions of the same device in a network controlled by NSO. Each device may require its own unique set of YANG files, which means the NED must be rebuilt for each version.

To support this scenario, each built variant of the NED must have a unique NED-ID. This allows NSO to support multiple versions of the same NED package simultaneously.

There are two ways to rebuild the NED with a custom NED-ID:

**1. Using the built-in RPC:**

Specify the following additional arguments:

- `suffix`
- `major`
- `minor`

**2. Using gmake in a separate shell:**

Set the following make variables:

- `NED_ID_SUFFIX`
- `NED_ID_MAJOR`
- `NED_ID_MINOR`

The default NED-ID is: juniper-junos_nc-gen-1.1


## 5.1 Rebuild With a Custom NED-ID

Do as follows to build each flavour of the juniper-junos_nc NED. Do it in iterations, one at the time:

1. Follow the instructions in chapter **1.1** to **1.3** in [README.md](README.md) to unpack the NED and install a device instance

   using it. Make sure a unique location is selected and update the environment variable `$NED_ROOT_DIR`

   accordingly and configure a device instance.

2. Follow the instructions in chapter **1.2** to download the YANG models matching the configured device.

3. Follow the instructions in chapter **1.3** to rebuild the NED:



   **Alternative 1: Use the built-in rpc to rebuild with custom NED-ID**

   Use any combination of the additional `ned-id` arguments `major`, `minor` and `suffix`.

   Two examples showing NED-ID adapted for "device version" 21.6:

   ```
   admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package ned-id suffix -21.6
   ```

   This will generate a NED-ID like: `juniper-junos_nc-r21.6-gen-1.'`

   ```
   admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package ned-id major 21 minor 6
   ```

   This will generate a NED-ID like: `juniper-junos_nc-gen-21.6`



   **Alternative 2: Rebuild the NED using gnu make from a shell**

   Add any combination of the additional make variables `NED_ID_SUFFIX`, `NED_ID_MAJOR` and `NED_ID_MINOR` to the command line.

   Two examples showing NED-ID adapted for "device version" 21.6:

   ```
   > make NED_ID_SUFFIX=-r21.6 clean all
   ```

   This will generate a NED-ID like: `juniper-junos_nc-r21.6-gen-1.0`

   ```
   > make NED_ID_MAJOR=21 NED_ID_MINOR=6 clean all
   ```

   This will generate a NED-ID like: `juniper-junos_nc-gen-21.6`



4. Follow the instructions in chapter **1.4** to reload the NED package. The rebuilt NED package will now have the NED-ID: `juniper-junos_nc<NED_ID_SUFFIX>-gen-<NED_ID_MAJOR>.<NED_ID_MINOR>`

   This is detected by NSO and will have the following side effects:

   - The default NED-ID will no longer exist after the packages has been reloaded in NSO. Hence, any devices configured with the default NED-ID can no longer exist either.
   - It is recommended to delete all device instances using the default NED-ID before reloading the packages in NSO.
   - It is necessary to use `packages reload force` when reloading the packages in NSO.

5. Reconfigure the device instance from step #1 in this list. Now use the new NED-ID

6. Verify functionality by executing a `sync-from` on the configured device instance.



## 5.2 Exporting the Rebuilt NED Package

After rebuilding the NED with a new NED-ID, it is often necessary to export it as a separate NED package. This new package will include both the raw and the customized, compiled versions of the third-party YANG models. The exported package can then be loaded into a new NSO instance or used like any other NED package.

The NED provides a built-in tool to simplify the export process. This tool is implemented as an additional RPC that can be invoked through the NSO CLI or any other northbound NSO interface.

The export tool copies all relevant files from the "source" directory of the rebuilt NED into a `.tar.gz` archive. The top-level directory of the archive will be named according to the generated NED-ID, for example: `juniper-junos_nc<NED_ID_SUFFIX>-gen-<NED_ID_MAJOR>.<NED_ID_MINOR>`.

**Usage Example:**

```
admin@ncs# devices device dev-1 rpc rpc-export-package export-package
result ok
exported to: /tmp/ncs-6.2.2-juniper-junos_nc-1.0.2-customized.tar.gz
```

**Additional arguments:**

- **destination**: Destination directory for the exported `.tar.gz` archive. Default is `/tmp`.
- **suffix**: Suffix to append to the archive file name. Default is `-customized`.



# 6. YANG Fixes Applied When Rebuilding the NED

Third-party YANG files often contain errors that can cause issues during compilation or at runtime. In addition to standard YANG bugs, there may be constructs that are incompatible with NSO, or cases where the device does not fully adhere to the models.

The NED build system includes a set of tools that can automatically apply various fixes to third-party YANG files. These fixes, known as YANG recipes, ensure that the YANG files compile correctly when the NED package is rebuilt. Note that these recipes only cover YANG file versions that have been verified by the Cisco NED team. New build-time issues may still occur if the NED is rebuilt with unverified YANG file versions.

**If you encounter any such issues, it is recommended to contact the Cisco NED team by opening a support ticket. See Chapter 8 in the [README.md](README.md) for more information.**

Below is a description of the YANG recipes currently used by the juniper-junos_nc NED.

## 6.1 General

The YANG recipes used by this NED are divided into two groups: one for JunOS EX models and one for JunOS Standard + EVO.
Most of the fixes address YANG constructs where `leaf-list` elements of type `empty` are used.
Such constructs are not allowed according to the YANG specification.

## 6.2 Fixes listed by schema paths

```
Path: /configuration/protocols/rsvp/traceoptions/file
Problem: Node does require a non compliant delete operation
Fix: Annotated with 'edit-full-delete' meta-data to enforce special handling by the NED.
```
```
Path: /configuration
Problem: The configuration xml header contains some junos specific attributes. For example
a timestamp representing the time of last commit. All the junos attributes must be trimmed
before NSO accepts the payload for live-status operations.
Fix: Annotated with 'handle-junos-attributes' meta-data. Extracts the commit timestamp which
can be used for fast transaction id calculation. Finally all the junos attributes are trimmed
from the heder.
```
```
Path: /configuration/system/login/user/uid
Problem: Some NSO versions contain a bug related to YANG type union. The NSO parser maps
the value to wrong type in the union. Relevant only for live-status operations.
Fix: Annotated with same union type but with the elements flipped.
```
```
Path: /configuration/chassis/fpc/pic/number-of-ports
Problem: Some NSO versions contain a bug related to YANG type union. The NSO parser maps
the value to wrong type in the union. Relevant only for live-status operations.
Fix: Annotated with same union type but with the elements flipped.
```
```
Path: /configuration/chassis/fpc/pic/name
Problem: Some NSO versions contain a bug related to YANG type union. The NSO parser maps
the value to wrong type in the union. Relevant only for live-status operations.
Fix: Annotated with same union type but with the elements flipped.
```
```
Path: /configuration/chassis/fpc/name
Problem: Some NSO versions contain a bug related to YANG type union. The NSO parser maps
the value to wrong type in the union. Relevant only for live-status operations.
Fix: Annotated with same union type but with the elements flipped.
```


## 6.3 Fixes listed by YANG file paths

### junos-ex-conf-system.yang
```
Path: /#juniper-system/#auto-configuration/container/uses
Problem: Status deprecated missing on some older YANG revisions
Fix: A status deprecated injected
```

### junos-ex-rpc-ldp.yang
```
Path: /#ldp-path-information-block/list/#ldp-ingress-label
Problem: Illegal YANG construct, leaf-list of type empty
Fix: Changed to leaf instead.
```
```
Path: /#ldp-path-information-block/list/#ldp-egress-label
Problem: Illegal YANG construct, leaf-list of type empty
Fix: Changed to leaf instead.
```

### junos-ex-conf-class-of-service.yang
```
Path: /#cos_interfaces_type/list/leaf#name/type/#string/pattern
Problem: String pattern containing illegal character
Fix: Removed pattern
```

### junos-conf-system.yang
```
Path: /#juniper-system/#auto-configuration/container/uses
Problem: Status deprecated missing on some older YANG revisions
Fix: A status deprecated injected
```

### junos-rpc-ldp.yang
```
Path: /#ldp-path-information-block/list/#ldp-ingress-label
Problem: Illegal YANG construct, leaf-list of type empty
Fix: Changed to leaf instead.
```
```
Path: /#ldp-path-information-block/list/#ldp-egress-label
Problem: Illegal YANG construct, leaf-list of type empty
Fix: Changed to leaf instead.
```
```
Path: /#ldp-path-information-block/list/#ldp-merged-next-hop
Problem: Illegal YANG construct, leaf-list of type empty
Fix: Changed to leaf instead.
```

### junos-conf-class-of-service.yang
```
Path: /#juniper-class-of-service-options/#translation-table/#to-inet-precedence-from-inet-precedence/list/leaf-list/type/type#string/pattern
Problem: String pattern containing illegal character
Fix: Removed pattern
```
```
Path: /#juniper-class-of-service-options/#translation-table/#to-dscp-from-dscp/list/leaf-list/type/type#string/pattern
Problem: String pattern containing illegal character
Fix: Removed pattern
```
```
Path: /#juniper-class-of-service-options/#translation-table/#to-exp-from-exp/list/leaf-list/type/type#string/pattern
Problem: String pattern containing illegal character
Fix: Removed pattern
```
```
Path: /#cos_interfaces_type/#unit/leaf#name/type/#string/pattern
Problem: String pattern containing illegal character
Fix: Removed pattern
```

### junos-conf-dynamic-profiles.yang
```
Path: /#juniper-class-of-service-options/#translation-table/#to-inet-precedence-from-inet-precedence/list/leaf-list/type/type#string/pattern
Problem: String pattern containing illegal character
Fix: Removed pattern
```
```
Path: =/#juniper-class-of-service-options/#translation-table/#to-dscp-from-dscp/list/leaf-list/type/type#string/pattern
Problem: String pattern containing illegal character
Fix: Removed pattern
```
```
Path: /#juniper-class-of-service-options/#translation-table/#to-exp-from-exp/list/leaf-list/type/type#string/pattern
Problem: String pattern containing illegal character
Fix: Removed pattern
```
```
Path: /#cos_interfaces_type/#unit/leaf#name/type/#string/pattern
Problem: String pattern containing illegal character
Fix: Removed pattern
```

## 6.4 Other fixes

Additional modifications of the YANG files are done when rebuilding the NED using the build profile *expand-vlan-range*.
See chapter 11 for further info.




# 7. Advanced: Repairing Third-Party YANG Modules

-------------------------------------

Many third-party YANG models have issues that prevent them from being compiled or used with NSO - they often require repairs.

This NED package has been verified to work with the device models and YANG model revisions listed in the [README.md](README.md). Any issues found in these verified revisions have already been addressed, and the necessary fixes are included in the package.

However, new issues with YANG models may still arise. This can happen if the NED is used with YANG models that have not been verified by the Cisco NED team, or if the NED is used in a new scenario that has not previously been tested.

In such cases, additional YANG repairs may be required.

**It is strongly encouraged to contact the Cisco NED team for assistance with these issues.**

Create a support case with a detailed description of the problem and the use case, following the instructions in the [README.md](README.md).

There is also a do-it-yourself option for advanced users who have a strong understanding of the YANG modeling language. The NED package includes tools to help automate YANG repairs. This chapter provides an overview of how to use these tools.



## 7.1 Types of YANG Related Issues

When preparing YANG modules for use with NSO, issues can generally be classified as either compile-time or run-time.

- **Compile-time issues** are problems that must be resolved before the YANG modules can be successfully compiled and loaded into NSO.

- **Run-time issues** are problems that arise after the YANG has been compiled and loaded, such as invalid constraints that are not met by the actual device.



## 7.2 Compile-time Issues

---------------------------

Before using YANG modules in NSO, the first step is to ensure they can be compiled successfully. For convenience, most standard issues found in YANG files are automatically patched during the build process. The patched files are placed in `src/tmp-yang` (note: the original YANG files in `src/yang` are not modified).

This behavior is controlled by the make variable `AUTOPATCH_YANG_NED`. It is usually enabled by default in the NED makefile `$NED_ROOT_DIR/src/Makefile`, as shown below:

```
AUTOPATCH_YANG_NED ?= yes
```

The auto-patcher feature only fixes the most common, standard issues.



If YANG compilation still fails (for example, as shown below), additional steps are required:

```
> cd $NED_ROOT_DIR/src
> make clean all
augmented/openconfig-network-instance@2022-07-04.yang:2876: error: the node 'protocol' from module 'openconfig-network-instance' (in node 'config' in module 'openconfig-network-instance' from 'openconfig-network-instance') is not found
augmented/openconfig-rib-bgp-attributes.yang:2284: error: the node 'endpoint' from module 'openconfig-network-instance' (in node 'state' in module 'openconfig-network-instance' from 'openconfig-network-instance') is not found
augmented/openconfig-rib-bgp-attributes.yang:2309: error: the node 'instance-id' from module 'openconfig-network-instance' (in node 'state' in module 'openconfig-network-instance' from 'openconfig-network-instance') is not found
```

**Always avoid modifying the original YANG files in src/yang.** Instead, use the provided tools to patch the YANG files at compile time. The patched files will be placed in src/tmp-yang, which is where the make process looks for the active files.

The NED package includes three different YANG pre-processor tools for compile-time patching:

- **schypp**

- **jypp**

- **ypp**



### 7.2.1 The schypp Tool

**schypp** is the schema-aware YANG pre-processor tool. It is automatically invoked at compile time and reads directives from the file `$NED_ROOT_DIR/src/customize-schema.schypp`.

Each line in this file contains a single pragma, starting with one of the keywords: `add`, `remove`, `replace`, or `inline-type`. This keyword is followed by the globally unique schema-path for the node to operate on. No line breaks are allowed.

If a prefix is needed for a non-unique name in the path, it must match the prefix declared in the module. Depending on the operation type, the schema-path is followed by `::` (two colons) and additional arguments as needed. The details for each directive are described below.

**Supported Pragmas**

- **inline-type**
- **add**
- **remove**
- **replace**



The schypp tool operates by first building an in-memory schema tree from all available YANG files. It then applies each defined pragma to the corresponding nodes in this schema. Once all pragmas have been applied, schypp automatically generates patched versions of the YANG files and stores them in `src/tmp-yang`.

By inspecting the patched YANG files in `src/tmp-yang`, you can see exactly what changes have been made. For example:

```
    leaf forwarding-action {
      type identityref {
        base FORWARDING_ACTION;
      }
      /* AUTO-PATCHED: Removed stmt: /oc-acl:acl/acl-sets/acl-set/acl-entries/acl-entry/actions/config/forwarding-action::mandatory
        mandatory false;
      */
      description "Specifies the forwarding action.  One forwarding action
        must be specified for each ACL entry";
    }
```

```
    leaf interface {
      /* AUTO-PATCHED: Inlined leafref target type from (type string, openconfig-interfaces.yang:793)
        type leafref {
          path /oc-if:interfaces/oc-if:interface/oc-if:name;
        }
      */
      type string;
      description "Reference to a base interface.  If a reference to a
        subinterface is required, this leaf must be specified
        to indicate the base interface.";
    }

```

This approach allows you to track and verify all changes made to the YANG files during the patching process.



### inline-type

Applicable for leafs of type `leafref`. The tool looks up the type of the referred leaf and inlines the same type on the referee. This is especially useful for resolving issues related to leafrefs.

**Syntax:**

`inline-type <schema-path>`

**Example:**

`inline-type /oc-netinst:network-instances/network-instance/protocols/protocol/name`



### add

Adds YANG statements to the schema.

**Syntax:**

```
add <schema-path>::<YANG-stmt(s)|@filename>
```

**Example:**

```
add /configuration/protocols/l2circuit/neighbor::uses apply-advanced;
add /configuration/protocols/l2circuit/neighbor/interface::{ min-elements 1; max-elements 10; }
add /configuration/protocols/l2circuit/neighbor::@file-with-YANG-snippet
```



### remove

Removes a YANG statement from the schema.

**Syntax:**

```
remove <schema-path>::<stmt-match>
```

**Example:**

```
remove /configuration/routing-instances/instance/protocols/vpls/mesh-group/neighbor/vpls-id-list::ordered-by
remove /oc-acl:acl/acl-sets/acl-set/acl-entries/acl-entry/actions/config/forwarding-action::mandatory
```



### replace

Replaces a YANG statement in the schema. The matching statement (must be a unique match) is replaced by the provided statement(s). The rules for `stmt-match` and YANG-stmt(s) are the same as for `add` and `remove`.

**Syntax:**

```
replace <schema-path>::<stmt-match>::<YANG-stmt(s)>
```

**Example:**

```
replace /configuration/chassis/fpc/pic/name::type::type string;
```



### 7.2.2 The jypp Tool

**jypp** is a YANG pre-processor tool implemented in Java (hence the name). It provides similar functionality to the `schypp` tool, but operates in a YANG model-aware manner rather than schema-aware.

The jypp tool requires a "path" within the YANG model file to identify the node or area to operate on.

**Finding the YANG Path**

To determine the path to a node:

1. Identify the file containing the declaration of the node you wish to modify.

2. Open the file and locate the node.

3. Run jypp from a shell to print the path:

   ```
   cd $NED_ROOT_DIR/src
   ./tools/jypp --print-path=<line number> tmp-yang/<model file>.yang
   ```



**Example:**

Suppose you need to modify the range for MPLS label values in `openconfig-mpls-types.yang` at line 278:

```
typedef mpls-label {
   type union {
     type uint32 {
       range 13..1048575;
     }
 ..
 ..
```

To find the path:

```
> ./tools/jypp --print-path=280 tmp-yang/openconfig-mpls-types.yang
openconfig-mpls-types.yang:280 /#mpls-label/type/#uint32/range
```

The path is: `/#mpls-label/type/#uint32/range`



**Supported Operations**

- **--add-stmt**:

  Add a statement to the node identified by the YANG path.

  **Syntax**:

  `./tools/jypp --add-stmt=<YANG path>::<statement to add> <file to modify>`

  **Example:**

  `./tools/jypp --add-stmt=/#mpls-label/type/#uint32::description "This is an addition"; tmp-yang/openconfig-mpls-types.yang`

- **--remove-stmt**:

  Remove a statement identified by the YANG path

  **Syntax:**

  `./tools/jypp --remove-stmt=<YANG path> <file to modify>`

  **Example:**

  `./tools/jypp --remove-stmt=/#mpls-label/type/#uint32 tmp-yang/openconfig-mpls-types.yang`

- **--replace-stmt**:

  Replace a statement at the node identified by the YANG path

  **Syntax:**

  `./tools/jypp --replace-stmt=<YANG path>::<statement to replace> <file to modify>`

  **Example:**

  `./tools/jypp --replace-stmt=/#mpls-label/type/#uint32/range::"range 13..1048575;" tmp-yang/openconfig-mpls-types.yang`



**Applying jypp Rules Automatically**

After testing your jypp rules in a shell and confirming that the corresponding files in `tmp-yang` are updated as expected, you can add these rules to the build process so they're applied automatically each time the NED package is rebuilt.

1. Open `$NED_ROOT_DIR/src/ned-custom.mk`.
2. Locate the `do-profile-default` make target.
3. Add your jypp rules to this section.

**Example:**

```
do-profile-default:
   ./tools/jypp --replace-stmt=/#mpls-label/type/#uint32/range::"range 13..1048575;" \
   'tmp-yang/openconfig-mpls-types.yang' &> /dev/null || true
.PHONY: do-profile-default
```



### 7.2.3 The ypp Tool

**ypp** is the oldest of the three YANG pre-processor tools. It is a pattern-matching, text-processing utility that operates using regular expressions - essentially an advanced version of `sed`. While most tasks can be accomplished more easily with `schypp` or `jypp`, there are situations where `ypp` is the only workable option.

**Syntax:**

```
./tools/ypp --from=<regular expression> --to=<replacement containing text and/or matched groups> <file>
```

**Examples:**

```
./tools/ypp --from="(list\s+route\s+[^;]+)(route-type)([^;]+;)" --to="\g<1>\g<3>" 'tmp-yang/srl-ip-route-tables.yang'
./tools/ypp --from="(leaf\s+(dot1p-policy)\s+{[^}]+)(type\s+leafref[^}]+})" --to="\g<1>type string;" 'tmp-yang/srl-qos.yang'
```



After testing your `ypp` rules in a shell and verifying that the files in `tmp-yang` are updated as expected, you should add these rules to the build process so they are applied automatically each time the NED package is rebuilt:

1. Open `$NED_ROOT_DIR/src/ned-custom.mk`.
2. Locate the `do-profile-default` make target.
3. Add your `ypp` rules to this section.

**Example:**

```
do-profile-default:
   ./tools/ypp --from="(list\s+route\s+[^;]+)(route-type)([^;]+;)" --to="\g<1>\g<3>" 'tmp-yang/srl-ip-route-tables.yang'
.PHONY: do-profile-default
```



### 7.2.4 Verify the YANG Repair

There is a dedicated make target for running only the "pre-processing" of the YANG modules, which includes automatic patching and application of local schema customizations. You can run it as follows:

```
> cd $NED_ROOT_DIR/src
> make clean prepare-yang
```

After running this command, you can immediately review the resulting YANG modules in the `src/tmp-yang` directory. These are the files that will be used by the NED at runtime.



## 7.3 Run-time Issues

----------------------

After all YANG modules have been successfully compiled and loaded into NSO, there may still be issues that only appear at run time. These are typically related to constraints defined in the YANG modules but not strictly followed by the device, such as integer value ranges or missing leafref targets. These issues can only be identified using actual device configurations, so a NED instance must be able to connect to the device and perform a full `sync-from`.

**Example:**

If the device returns configuration containing a leaf of type `leafref` whose target is missing, running a full `sync-from` might produce output like:

```
admin@ncs# devices device dev-1 sync-from
result false
info illegal reference devices device dev-1 config components component 0/0 subcomponents subcomponent 0/0-Virtual-Motherboard name
```

This indicates that the device is not fully compliant with the YANG models it uses, and further YANG repair is needed.

You can use the same toolkit described in section 7.2 to fix run-time issues.

For the example above, you could repair the issue with an additional `schypp` statement:

```
inline-type /components/component/subcomponents/subcomponent/name
```




# 8. Advanced: Customizing Third-Party YANG Schemas

YANG models provided by many third-party vendors are often very large. When compiled, these schemas may contain tens of thousands of nodes, and in some cases, even exceed one million. Such large schemas can negatively impact NSO in several ways:

- **Runtime memory footprint:** A single NED package that includes a large third-party YANG schema can easily consume several hundred megabytes to up to a gigabyte of memory. In an NSO environment with many such NED packages installed, the overall memory usage can become significantly high.

- **Persistent footprint:** Large YANG files also result in large compiled schema files being installed in NSO, requiring more disk space on the host.

- **Runtime performance:** Large schemas can degrade NSO's performance, affecting everything from CLI responsiveness to diff calculations during commit operations as well as sync-from operations.

In many cases, it may not be necessary or even beneficial to include the entire third-party YANG schema when building the NED package. Often, the use cases deployed through NSO only require a fraction of the full schema. In such cases, it is recommended to consider schema customization when rebuilding the NED package.

All third-party YANG NED packages include filtering tools that allow you to customize the schema during the package rebuild process. This chapter provides a detailed description of these tools, including how to use them, their benefits, and limitations.

This chapter applies generally to all third-party YANG NEDs and includes examples from various device types and vendors.



## 8.1 Scope Filtering

Scope filtering is typically the first method to try when aiming to reduce the size of the schema during the rebuilding of a NED package. It works by automatically limiting the number of YANG models included to only those required for your specific use cases. This means that only the necessary YANG models are incorporated, which helps in minimizing the overall schema size and improving performance and resource usage during NSO operations.

This approach is straightforward and effective because it excludes unnecessary parts of large third-party YANG schemas that are not relevant to your deployment.

This method is recommended as the initial step in schema customization when building or rebuilding NED packages to optimize NSO resource consumption and responsiveness.



### 8.1.1 How it Works

YANG models that define the schema are typically organized into functional groups. For example, one module might cover interface configuration, another system settings, and a third router settings. Each group is usually defined in a separate YANG module with its own XML namespace, as illustrated below:

```
module openconfig-interfaces {

  yang-version "1";

  // namespace
  namespace "http://openconfig.net/yang/interfaces";

  prefix "oc-if";

  // import some basic types
  import ietf-interfaces { prefix ietf-if; }
  import openconfig-yang-types { prefix oc-yang; }
  import openconfig-types { prefix oc-types; }
  import openconfig-extensions { prefix oc-ext; }
  import openconfig-transport-types { prefix oc-opt-types; }
  ..
  ..
```



These namespaces appear in the device's running configuration and in the configuration snippets sent when deploying new settings. This is evident when displaying the configuration in XML format. The example below shows a simple commit dry-run involving the description leaf on an interface:

```
$ ncs_cli -C -u admin
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# devices device xrv9k-gnmi-1 config oc-if:interfaces interface GigabitEthernet0/0/0/0 config description TEST
admin@ncs(config-interface-GigabitEthernet0/0/0/0)# commit dry-run outformat xml
result-xml {
    local-node {
        data <devices xmlns="http://tail-f.com/ns/ncs">
               <device>
                 <name>xrv9k-gnmi-1</name>
                 <config>
                   <interfaces xmlns="http://openconfig.net/yang/interfaces">
                     <interface>
                       <name>GigabitEthernet0/0/0/0</name>
                       <config>
                         <description>TEST</description>
                       </config>
                     </interface>
                   </interfaces>
                 </config>
               </device>
             </devices>
    }
}
```

To apply the configuration in this example, the NED only needs built-in support for the namespace http://openconfig.net/yang/interfaces. This means that only the YANG module openconfig-interfaces.yang and its dependencies (as indicated by the import statements above) must be compiled into the NED package. Other YANG modules, such as those defining system settings, are not required and can be excluded.

The scope filtering feature is an automatic pre-processing step invoked when rebuilding the NED package. It analyzes the use cases and the XML namespaces they require, then generates a list of YANG modules necessary to support all use cases. This list is provided to the YANG compiler, which compiles only the specified modules instead of all third-party YANG files currently downloaded.



#### What is a Use Case?

Before using scope filtering, you need to gather relevant use cases.

From the NED perspective, a use case is a configuration snippet that will be deployed to the device, typically generated by one or more service packages.

When collecting use cases, you must execute your services so they produce the configuration intended for the device. It is important to exercise all service options thoroughly, as certain service package options may trigger configuration nodes belonging to different XML namespaces, which must be included as separate use cases.

However, it is not necessary to deploy all use cases on the device physically. You can use NSO's *commit dry-run outformat xml* feature to collect use cases without actual deployment.

**Example**:

```
admin@ncs# config
admin@ncs(config)# load merge /tmp/my-first-service-use-case.xml
admin@ncs(config)# commit dry-run outformat xml | save overwrite /tmp/use-cases/use-case-1.xml
admin@ncs(config)# abort
admin@ncs# config
admin@ncs(config)# load merge /tmp/my-second-service-use-case.xml
admin@ncs(config)# commit dry-run outformat xml | save overwrite /tmp/use-cases/use-case-2.xml
admin@ncs(config)# abort
```



Another important use case to consider is the device's day-0 configuration. Your services might depend on existing device configuration, which should also be included as a use case.

All collected use cases need to be saved as XML files in an appropriate directory for use during NED package rebuilding.



### 8.1.2 Usage

To rebuild the NED package using the scope filtering feature with collected use cases stored in the directory /tmp/use-cases, you have two main options:

#### Using the NED Built-in Rebuild Tool (RPC)

This is the recommended method. Invoke the rebuild tool via the NSO CLI with the following command:

```
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { scope { dir /tmp/use-cases } }
```

After the rebuild completes, reload the NED package:

```
admin@ncs# packages reload
```

If the reload fails because NSO detects that some XML namespaces have disappeared (which is expected when scope filtering removes unused modules), retry with the `force` flag:

```
admin@ncs# packages reload force
```



#### Using a Unix Shell

Alternatively, you can rebuild the NED package directly from a Unix shell. Run the following command, specifying the scope filter directory:

```
$ make -C $NED_ROOT_DIR/src clean all YANG_SCOPE_FILTER_DIR=/tmp/use-cases
```



### 8.1.3 Examples

This simple example shows how to use the scope filter to adapt the NED to only include the YANG modules covering the running config on the device together with the configuration that will be deployed through a simple service package named *my-service*.

1. Make the NED fully operational with the full schema by following the initial setup steps (chapters **1.2** - **1.4**).

2. Connect to the device:

   ```
   admin@ncs# devices device dev-1 connect
   ```

3. Optionally, list the modules currently supported by the NED:

   ```
   admin@ncs# show devices device dev-1 module
   ```

   This lists all YANG modules with revisions built into the NED package.

4. Perform a sync-from operation from the device:

   ```
   admin@ncs# devices device dev-1 sync-from
   ```

5. Save the running configuration into an XML file:

   ```
   admin@ncs# show running-config devices device dev-1 config | display xml | save overwrite /tmp/use-cases/day0.xml
   ```

6. Execute a dry-run commit using the installed service package configuration (stored in */tmp/my-service-test-config.xml*):

   ```
   admin@ncs# config
   admin@ncs(config)# load merge /tmp/my-service-test-config.xml
   admin@ncs(config)# commit dry-run outformat xml | save overwrite /tmp/use-cases/day1.xml
   admin@ncs(config)# abort
   ```

7. Now you have two XML files representing the running config and the service package config, each specifying the namespaces needed for their configurations. This information is sufficient to create a scope filter.

   Rebuild the NED package again, using the scope filter pointing to the directory with the XML files:

   ```
   admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { scope { dir /tmp/use-cases } }
   ```

8. Reload the NED package:

   ```
   admin@ncs# packages reload force
   ```

9. Optionally, list the modules supported again:

   ```
   admin@ncs# show devices device dev-1 module
   ```

   The list should now be shorter than before. If not, it may indicate that scope filtering is not effective with the YANG models in use. In that case, refer to chapter **8.1.4** about limitations.



### 8.1.4 Limitations

The scope filtering feature depends on YANG models being properly partitioned into distinct XML namespaces, which is true for most third-party YANG models. However, there are notable limitations:

- **Namespace Partitioning Exception:** Some models, such as the *Nokia SROS* YANG distribution, have the majority of their nodes within a single namespace. In these cases, scope filtering is ineffective.

  It is worth mentioning that all standard NEDs developed by the Cisco NSO NED team also utilize single-namespaced YANG models.

- **Granularity Limitation:** Scope filtering can only remove complete YANG modules representing entire namespaces. It cannot remove individual nodes or subsets within a module.

To address these limitations, the **trim filter** feature shall be used instead. The trim filter allows more granular customization by removing specific nodes within a YANG model rather than entire modules, thus overcoming the constraints of scope filtering.



## 8.2 Trim Filtering

Trim filtering customizes third-party YANG schemas by patching the YANG files during the NED package rebuild process. This is done through a pre-processing step handled by the tool named *schypp*, which reads all installed YANG files into an in-memory schema representation. The *schypp* tool then applies modifications based on pragma directives, as described in the relevant documentation section **7.1**. After applying these modifications, schypp automatically generates new patched versions of the YANG files.

Specifically for trimming, *schypp* can also remove any node from the schema, ranging from a single leaf to an entire subtree. It also intelligently resolves dependencies related to the trimmed nodes. For example, if there are references such as leafrefs, deviations, augments, or refines that point to the node or any of its subnodes being trimmed, *schypp* will automatically handle and resolve these references to maintain schema consistency.

This approach allows for much finer granularity in schema customization compared to scope filtering, which only removes entire modules based on XML namespaces. Trim filtering with *schypp* enables precise removal of unwanted parts of the schema while ensuring that all dependent references are correctly managed during the rebuild process.



### 8.2.1 How it Works

When trimming nodes using the *schypp* based trimmer tool, the process works as follows:

- It removes the specified nodes from the schema, and generates new patched versions of the YANG files.
- The trimmer tool automatically generates additional comments in the patched YANG files indicating which nodes have been trimmed and the reasons for their removal.
- This helps maintain clarity and traceability in the modified YANG files.



#### Trimming Normal Nodes

Normal nodes refer to nodes that are directly modeled in YANG modules or nodes modeled within groupings that are not shared with other parts of the schema. These nodes are generally straightforward to trim.

Below is a simple YANG module that will be used for illustrating how the trimming works.

```
module trim-schema {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf;
  prefix conf;

	grouping ab {
		leaf a {
			type string;
		}
		leaf b {
			type string;
		}
	}
	container top {
		uses ab;
		leaf c {
			type string;
		}
	}
}
```

Assume the nodes identified with the schema paths */conf:top/a* and */conf:top/c* shall be trimmed.

Then the resulting patched YANG file will look like below:

```
module trim-schema {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf;
  prefix conf;

	grouping ab {
	/* AUTO-PATCHED: Trimmed /conf:top/a
	  leaf a { ... }
	*/
	  leaf b {
	    type string;
	  }
	}
	container top {
	  uses ab;
	  /* AUTO-PATCHED: Trimmed /conf:top/c
	    leaf c { ... }
	   */
	}
}
```



#### Trimming Nodes Defined in Shared Groupings

When nodes to be trimmed are defined within groupings shared across multiple parts of the schema, the trimming process becomes more complex than trimming normal nodes. This is because directly trimming nodes from a shared grouping would affect all instances where that grouping is used, which is usually undesirable.

**Trimmer Approach for Shared Groupings**

- The trimmer tool first expands the shared groupings at each location where they are used. This means it replaces the uses statement with the actual content of the grouping in that specific location.
- After expansion, the nodes to be trimmed can be removed locally at each instance without affecting other parts of the schema.
- The tool adds new auto-patch comments in the YANG files to document these changes, showing where groupings were expanded and which nodes were trimmed.



**Example:**

Given the YANG module below:

```
module trim-schema {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf;
  prefix conf;

	grouping ab {
		leaf a {
			type string;
		}
		leaf b {
			type string;
		}
	}
	container top {
		uses ab;
		leaf c {
			type string;
		}
		container subtree1 {
			uses ab;
		}
		container subtree2 {
			uses ab;
		}
	}
}
```



If the nodes */conf:top/a* and */conf:top/subtree1/b* need to be trimmed:

- The grouping *ab* is used in three places (top, subtree1, and subtree2), so it is a shared grouping.
- The trimmer tool will expand the grouping ab at top and subtree1 (where trimming is needed).
- Then it trims the specified nodes locally.

The resulting patched YANG module will look like:

```
module trim-schema {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf;
  prefix conf;

	grouping ab {
		leaf a {
			type string;
		}
		leaf b {
			type string;
		}
	}
	container top {
	/* AUTO-PATCHED: Expanded grouping ab
	  uses ab;
	 */
	/* AUTO-PATCHED: Trimmed /conf:top/a
	  leaf a { ... }
	 */
	  leaf b {
	    type string;
	  }
	  leaf c {
	    type string;
	  }
	  container subtree1 {
	   /* AUTO-PATCHED: Expanded grouping ab
	    uses ab;
	   */
	    leaf a {
	      type string;
	    }
	   /* AUTO-PATCHED: Trimmed /conf:top/subtree1/b
	     leaf b { ... }
	    */
		}
		container subtree2 {
			uses ab;
		}
	}
}
```

**Additional Notes**

- If nodes to be trimmed are defined through multiple nested groupings, the trimmer tool will locate the top-most shared grouping and expand it recursively, including any sub-groupings as long as they represent the same XML namespace.

- This approach ensures that trimming is precise and localized, avoiding unintended removal of nodes in other parts of the schema.



#### Trimming Augmented Nodes in YANG Schemas

Augmented nodes in YANG schemas are nodes added to existing schema trees via the augment statement, often representing a different XML namespace than their siblings. Trimming these nodes requires special handling to maintain the correct namespace and schema integrity.



**Key Points on Trimming Augmented Nodes**

- Trimming must be done in the same YANG module where the augment is defined to preserve the XML namespace.

- The trimming process is similar to trimming normal nodes but localized within the augmenting module.

- The trimmer tool inserts comments indicating which nodes have been trimmed.



**Example 1: Simple Augmented Node Trimming**

Given a YANG module augmenting */conf:top/conf:subtree1* with a container *extra* having leaves *x* and *y*:

```
module trim-schema-aug {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf-aug;
  prefix conf-aug;
  import trim-schema {
    prefix conf;
  }

  augment /conf:top/conf:subtree1 {
    container extra {
    	leaf x {
    		type string;
    	}
     	leaf y {
    	  type string;
    	}
    }
  }
}
```



If the node */conf:top/subtree1/conf-aug:extra/y* is to be trimmed, the patched module will look like:

```
module trim-schema-aug {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf-aug;
  prefix conf-aug;
  import trim-schema {
    prefix conf;
  }

  augment /conf:top/conf:subtree1 {
    container extra {
    	leaf x {
    		type string;
    	}
     	/* AUTO-PATCHED: Trimmed /conf:top/subtree1/extra/y
    	leaf y { ... }
    	*/
    }
  }
}
```



**Example 2: Trimming Augmented Nodes Defined Through Shared Groupings**

When augmented nodes are defined via shared groupings used in multiple augmentations, trimming requires a more complex approach:

​	**•**	The trimmer tool clones the shared grouping for the specific augmentation where trimming is needed.

​	**•**	The cloned grouping is patched with the trimmed nodes.

​	**•**	The augmentation is updated to use the cloned grouping instead of the original.

Given a YANG module below:

```
module trim-schema-aug {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf-aug;
  prefix conf-aug;
  import trim-schema {
    prefix conf;
  }
  grouping extra {
    container extra {
    	leaf x {
    		type string;
    	}
     	leaf y {
    	  type string;
    	}
    }
  }
  augment /conf:top/conf:subtree1 {
    uses extra;
  }
  augment /conf:top/conf:subtree2 {
    uses extra;
  }
}
```



If */conf:top/subtree1/conf-aug:extra/y* is to be trimmed, the patched module will be:

```
module trim-schema-aug {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf-aug;
  prefix conf-aug;
  import trim-schema {
    prefix conf;
  }
  grouping extra {
    container extra {
    	leaf x {
    		type string;
    	}
     	leaf y {
    	  type string;
    	}
    }
  }
  // AUTO-CLONE: Cloned from grouping extra used by node /conf:top/subtree1
  grouping extra-AUTO-CLONED-7ccb8305 {
    container extra {
    	leaf x {
    		type string;
    	}
    	/* AUTO-PATCHED: Trimmed /conf:top/subtree1/extra/y
    	leaf y { ... }
    	*/
    }
  }
  augment /conf:top/conf:subtree1 {
     /* AUTO-PATCHED: AUTO-CLONE: Using cloned grouping extra-AUTO-CLONED-7ccb8305
      uses extra;
    */
    uses extra-AUTO-CLONED-7ccb8305;
  }
  augment /conf:top/conf:subtree2 {
    uses extra;
  }
}
```



**Summary**

- Trimming augmented nodes preserves the XML namespace by modifying the augmenting module.
- For augmented nodes defined via shared groupings, the trimmer clones the grouping, applies trimming to the clone, and updates the augmentation to use the clone.
- This approach ensures precise, localized trimming without affecting other schema parts.



#### Resolving Dependencies

When trimming YANG schemas, resolving dependencies is crucial to maintain schema integrity and ensure successful compilation of the patched modules. The trimmer tool automatically handles these dependencies using the following approaches:

**1. Leafrefs**

- If a node to be trimmed is referenced by other nodes as a leafref, the tool automatically inlines the node type into all such references. This means the leafref is replaced by the actual type of the referenced node, removing the dependency on the trimmed node.

**2. Augments, Deviations, and Refines**

- YANG statements such as augment, deviation, and refine that refer to a trimmed node are themselves automatically trimmed.
- This ensures no dangling references remain in the schema.



##### Example Scenario

Consider three YANG modules:

- Base module (*trim-schema*) defines a grouping ab with leaves a and b, a container top using ab, and a list sublist also using ab. It has a leaf active of type leafref pointing to ../sublist/a.
- Augment module (*trim-schema-test-aug*) augments */conf:top/conf:sublist* with a grouping *extra* containing leaves *x* and *y*.
- Deviation module (*trim-schema-test-dev*) deviates leaf *b* in */conf:top/conf:sublis*t to replace its type.

```
module trim-schema {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf;
  prefix conf;

	grouping ab {
		leaf a {
			type string;
		}
		leaf b {
			type string;
		}
	}
	container top {
		uses ab;
		list sublist {
		  key a;
			uses ab;
		}
		leaf active {
		  type leafref {
		    path "../sublist/a";
		  }
		}
	}
}
```

```
module trim-schema-aug {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf-aug;
  prefix conf-aug;
  import trim-schema-test {
    prefix conf;
  }
  grouping extra {
    container extra {
    	leaf x {
    		type string;
    	}
     	leaf y {
    	  type string;
    	}
    }
  }
  augment /conf:top/conf:sublist {
    uses extra;
  }
}
```

```
module trim-schema-dev {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf-dev;
  prefix conf-dev;
  import trim-schema-test {
    prefix conf;
  }
  deviation /conf:top/conf:sublist/conf:b {
    deviate replace {
        type uint32;
    }
  }
}
```

If the node */conf:top/sublist* is trimmed, the trimmer tool patches the modules as follows:

- In the base module, the sublist list is removed (trimmed), and the leafref type for *active* is replaced by the inlined type (string) from the original leaf it referenced.
- In the augment module, the augment statement for */conf:top/conf:sublist* is removed.
- In the deviation module, the deviation for */conf:top/conf:sublist/conf:b* is removed.

This automatic resolution ensures the patched YANG modules remain consistent and compilable as shown below.

```
module trim-schema {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf;
  prefix conf;

	grouping ab {
		leaf a {
			type string;
		}
		leaf b {
			type string;
		}
	}
	container top {
		uses ab;
		/* AUTO-PATCHED: Trimmed /conf:top/sublist
		list sublist { ... }
		*/
		leaf active {
		/* AUTO-PATCHED: Inlined leafref target type from (type string, trim-schema-test.yang:10)
		  type leafref {
		    path "../subtree1/a";
		  }
    */
      type string;
		}
	}
}
```

```
module trim-schema-aug {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf-aug;
  prefix conf-aug;
  import trim-schema {
    prefix conf;
  }
  grouping extra {
    container extra {
    	leaf x {
    		type string;
    	}
     	leaf y {
    	  type string;
    	}
    }
  }
  /* AUTO-PATCHED: Trimmed /conf:top/conf:sublist
    augment /conf:top/conf:sublist { ... }
   */
}
```

```
module trim-schema-dev {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf-dev;
  prefix conf-dev;
  import trim-schema {
    prefix conf;
  }
  /* AUTO-PATCHED: Trimmed /conf:E/conf:sublist
  deviation /conf:top/conf:sublist/conf:b { ... }
  */
}
```



### 8.2.2 Usage

This is a detailed guide on using the NED built-in rebuild tool with the trim-schema filter for trimming YANG schema nodes:

#### Using the NED Built-in Rebuild Tool (RPC)

This is the recommended method to trim schema nodes. You invoke the rebuild tool via any NSO northbound interface and specify the *trim-schema* filter.

**Basic Command Structure:**

```
devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { trim-schema { ... } }
```

**Options for the trim-schema Filter:**

- *all-unused*: Trim all currently unused nodes in the schema.
- *all-with-status*: Trim all nodes annotated with specific 'status' statements (e.g., deprecated, obsolete).
- *method*: Select the trimming method.
- *nodes*: List specific nodes to trim by their full schema paths.
- *nodes-from-file*: Specify a file containing a list of schema paths to trim.



**Trimming Specific Nodes from the Command Line**

Use the nodes option to specify one or more nodes by their full schema paths.

Example:

```
devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { trim-schema { nodes [ /conf:top/conf:sublist /conf:top/conf:c] } }
```

See chapter **8.2.3** on how to find out the full schema path for a any node in the schema.



**Trimming Nodes from a File**

If you have many nodes to trim, list them in a file (one schema path per line). Lines not starting with / are treated as comments.

Example file content:

```
#This is a comment
/conf:top/conf:sublist
/conf:top/conf:c
```

Invoke the rebuild tool with:

```
devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { trim-schema { nodes-from-file <path to file> } }
```



**Trimming All Deprecated and/or Obsolete Nodes**

Third-party YANG models often contain many deprecated or obsolete nodes. Trimming these is usually safe and is a straightforward way to reduce schema size.

```
devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { trim-schema { all-with-status [ deprecated obsolete ] } }
```



**Trimming All Unused Nodes**

This option trims all nodes not currently used in the NSO CDB database. Use with caution as it can be drastic.

```
devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { trim-schema { all-unused } }
```



**Customized Trimming Using** **show-loaded-schema** **Tool**

To create a customized list of nodes to trim, use the *show-loaded-schema* tool to extract schema paths based on filters.

**Example:**

- To list all currently used nodes (populated in CDB):

  ```
  devices device dev-1 rpc rpc-show-loaded-schema show-loaded-schema scope used output { file /tmp/all-used }
  ```

  An alternative is to use the standard *show running-config* command like below:

  ```
  show running-config devices device dev-1 config | display xpath
  ```

  The output of this command displays instance xpaths, which differ from schema paths. To obtain the schema paths, you must perform the following extractions:

  - Remove the preceding path /ncs:devices/device['dev-1']/config from each xpath of interest.
  - Eliminate all xpath predicates, meaning everything enclosed within and including the square brackets []To list all unused nodes:

  ```
  devices device dev-1 rpc rpc-show-loaded-schema show-loaded-schema scope unused output { file /tmp/all-unused }
  ```

- To list unused nodes under a specific subtree:

  ```
  devices device dev-1 rpc rpc-show-loaded-schema show-loaded-schema scope unused root-paths [ /conf:top/sublist ] output { file /tmp/all-unused-in-sublist }
  ```

- To list all deprecated nodes:

  ```
  devices device dev-1 rpc rpc-show-loaded-schema show-loaded-schema with-status [ deprecated ] output { file /tmp/all-deprecated }
  ```

- To list all RPCs in the schema:

  ```
  devices device dev-1 rpc rpc-show-loaded-schema show-loaded-schema scope rpcs output { file /tmp/all-rpcs }
  ```

You can then concatenate and edit these files to create a final list of nodes to trim.

**Note:**

- Keep in mind, that nodes removed or commented out from the file are the ones that will **not** be trimmed.
- The list includes nodes and their subnodes; including subnodes is optional but harmless.

After preparing the file with nodes to trim, rebuild the NED package:

```
devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { trim-schema { nodes-from-file /tmp/all-nodes-to-trim }
```



#### Using a Unix Shell

Alternatively, rebuild the NED package directly from a Unix shell by specifying the trim filter file:

```
$ make -C $NED_ROOT_DIR/src clean all YANG_TRIM_FILTER_FILE=/tmp/all-nodes-to-trim
```



### 8.2.3 Schema Path Formats

When specifying schema paths for the trimmer tool, it is essential to use the full raw schema path, including prefixes whenever there is a namespace change. This is generally straightforward except for YANG `choice` statements. In the case of `choice` statements, both the `choice` node and the relevant `case` node must be included in the path.

For example, consider the following YANG module snippet:

```
module trim-schema {
  yang-version 1.1;
  namespace urn:cisco.com:trim:test:conf;
  prefix conf;

	grouping ab {
		leaf a {
			type string;
		}
		leaf b {
			type string;
		}
		choice my-choice {
      case first {
        leaf x {
          type string;
        }
        leaf y {
          type string;
        }
      }
      leaf z {
        type string;
      }
	}
	container top {
		uses ab;
		list sublist {
		  key a;
			uses ab;
		}
	}
}
```

In this example, the leaves x and z are defined within a YANG choice construct. To trim these leaves, the following full schema paths must be specified:

- */conf:top/sublist/my-choice/first/x*
- */conf:top/sublist/my-choice/z/z*

Note the extra *z* in the second path. This is because the leaf *z* is defined without an explicit surrounding case statement in the YANG. In such cases, the `schypp` tool adds an implicit case node to the schema when building the in-memory representation, which must be reflected in the path.

Thus, when trimming nodes under `choice` statements, always include both the `choice` and `case` nodes explicitly in the schema path to ensure correct trimming by the tool. For all other nodes, specifying the full raw schema path with appropriate prefixes is sufficient.

Using the `show-loaded-schema` tool is highly recommended to generate accurate and properly formatted schema paths for your schema trimming or filtering tasks.



### 8.2.4 Limitations

Schema trimming is an advanced process designed to handle complex YANG constructs. It has been tested with third-party YANG models from multiple vendors such as *Cisco IOSXR*, *Juniper JunOS*, *Nokia SROS*, *Nokia SRLinux*, *Arista EOS*, and *OpenConfig*.

However, due to the vast number of schema nodes and possible combinations, not all scenarios can be exhaustively tested, and the tool should be considered **experimental**.

Currently, the schema trimming tool does not support trimming of YANG `unique` statements. This limitation means that nodes or constraints defined using the unique statement in YANG models cannot be trimmed by the tool at this time.



## 8.3 Auto-config Filtering

Auto-config filtering in NSO is designed to address device configuration artifacts known as auto-config. These artifacts occur when a device automatically applies additional configuration related to the configuration explicitly deployed by NSO. For example, if NSO applies configuration A, the device will automatically also set configuration B.

NSO maintains its own Configuration Database (CDB) as the source of truth, so any auto-configured nodes not explicitly managed by NSO will immediately cause out-of-sync issues.

Devices exhibiting auto-config behavior are very common. There are basically three main strategies to handle this in NSO:

1. **Ignore the auto-config artifacts:** Accept that out-of-sync states may occur if they are not critical for the use case.
2. **Adapt the services:** Modify service logic to explicitly configure the auto-configured nodes s (e.g., A + B). This keeps NSO in sync but can be complex. It may also cause issues for example during rollback if the device does not handle explicit deletion of auto-config nodes well.
3. **Remove auto-configured nodes from the schema:** This approach removes the auto-configured nodes from NSO's schema so that NSO is unaware of them, preventing out-of-sync issues caused by these nodes.

Auto-config filtering focuses on this third option to improve synchronization by filtering out device-generated configuration artifacts.



### 8.3.1 How it Works

The auto-config filtering in NSO works by identifying nodes that get auto-configured by the device after a service commits configuration. This process relies on two snapshots of the running configuration:

- The **before snapshot** is taken immediately after the intended configuration has been committed on the device. It reflects the configuration that NSO intended to set.
- The **after snapshot** is taken after a subsequent sync-from operation. It reflects both the intended configuration and any additional auto-configured nodes the device has applied.

By comparing these two snapshots, auto-config filter generates a diff that corresponds to the auto-configured configuration. The filter then uses this diff to generate an extra YANG deviation file. In this file, all auto-configured nodes are tagged with a *not-supported* statement, effectively removing them from the schema once loaded into NSO.

For example, the deviation file may look like this:

```
module nedcom-auto-deviations {
  yang-version 1.1;
  namespace urn:tail-f.com:nedcom-auto-deviations;
  prefix nedcom-auto-deviations;
  import Cisco-IOS-XR-um-key-chain-cfg {
    prefix um-key-chain-cfg;
  }
  revision 2025-01-10 {
    description "Automatic deviations generated from exclude filter";
  }
  deviation /um-key-chain-cfg:key/um-key-chain-cfg:chains/um-key-chain-cfg:chain/um-key-chain-cfg:accept-tolerance/um-key-chain-cfg:infinite {
    deviate not-supported;
  }
  deviation /um-key-chain-cfg:key/um-key-chain-cfg:chains/um-key-chain-cfg:chain/um-key-chain-cfg:timezone/um-key-chain-cfg:gmt {
    deviate not-supported;
  }
}
```

This deviation file is created in a pre-processor step and then compiled together with the remaining YANG files, ensuring that the auto-configured nodes are excluded from NSO's schema and thus preventing out-of-sync issues caused by device auto-configuration.



### 8.3.2 Usage

To ensure proper functionality, confirm that the NED is fully operational with its complete schema built-in. This can be achieved by following the initial setup steps outlined in chapters **1.2** - **1.4,** possibly followed by installation of your service packages.

Before you can utilize the auto-config filter, it is essential to create two snapshots. Follow these steps:

1. Perform an initial sync-from operation.
2. Apply the desired configuration to the device (e.g., via a service).
3. Execute show running-config and save the output in XML format to a file named `before.xml`. **This specific file name is mandatory**.
4. Perform a new sync-from operation.
5. Execute show running-config again and save the output in XML format to a file named `after.xml`. **This specific file name is also mandatory**.

Once these steps are completed, you are ready to use the auto-config filter.



#### Using the NED Built-in Rebuild Tool (RPC)

The recommended method for trimming schema nodes is by using the NED built-in rebuild tool. You can invoke this tool via any NSO northbound interface, specifying the auto-config filter.

**Basic Command Structure:**

```
devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { auto-config { ... } }
```

**Options for auto-config Filter:**

- **dir**:  Specifies the directory containing the before.xml and after.xml files used for auto-config filtering.
- **file**:  An optional parameter for the name of the auto-generated deviation file.



#### Using a Unix Shell

Alternatively, you can rebuild the NED package directly from a Unix shell. This method is slightly more complex and does require multiple tests.

1. Generate the deviation file:

   ```
   $NED_INSTALL_DIR/tools/turboy --silent --plugin=cdb-data --compare-config --read=<snabshot directory>/before.xml --read=<snapshot directory>/after.xml $NED_INSTALL_DIR/src/yang/../tmp-yang --yang-path=$NED_INSTALL_DIR/src/yang/.. --outformat=deviations --write=<path to deviation file>.yang
   ```

2. Rebuild the NED package

   ```
   make -C $NED_INSTALL_DIR/src clean all YANG_EXTRA_DEVIATION_FILE="<path to deviation file"
   ```



### 8.3.3 Examples

This simple example demonstrates how to effectively use the auto-config filter to remove automatically configured artifacts from a device. For this example, we assume a basic service named my-service has already been installed.

First, ensure the NED is fully operational with its complete schema by following the initial setup steps outlined in chapters **1.2** through **1.4**.

Next, configure and commit a new instance of the my-service service. The commit is labeled '1' to facilitate restoring the device to its previous state if needed.

```
admin@ncs# config
admin@ncs(config)# load merge /tmp/my-service-test-config.xml
admin@ncs(config)# commit label 1
admin@ncs(config)# abort
```

Now, save the current running configuration to the file: `/tmp/auto-config/before.xml`.

```
admin@ncs# show running-config devices device dev-1 config | display xml | save overwrite /tmp/auto-config/before.xml
```

Optionally, you can perform a compare-config at this stage. This action should generate a diff, indicating that the device indeed has automatically configured certain elements..

```
admin@ncs# devices device dev-1 compare-config
```

Proceed by performing a sync-from operation. This action will populate the CDB with the auto-configured settings from the device.

```
admin@ncs# devices device dev-1 sync-from
```

After the sync-from, save the new running configuration to the file: `/tmp/auto-config/after.xml`.

```
admin@ncs# show running-config devices device dev-1 config | display xml | save overwrite /tmp/auto-config/after.xml
```

Optionally, you may choose to restore the device to its previous state. To do this, first identify the commit ID associated with the label '1' by viewing the rollback files:

```
admin@ncs# show rollback-files
```

Then, you can rollback and commit the configuration:

```
config
rollback-files apply-rollback-file id <the commit id for '1'>
commit
abort
```

Finally, rebuild the NED package by utilizing the auto-config filter.

```
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { auto-config { dir /tmp/auto-config } }
```

After rebuilding the package, reload it to apply the changes.

```
admin@ncs# packages reload
```



### 8.3.4 Limitations

The auto-config filter employs a best-effort approach. It's important to note that if any automatically configured nodes overlap with the configurations being deployed through NSO, these overlapping nodes cannot be removed.

For instance, consider a scenario where you create a new entry in a list on the device, and the device subsequently adds another entry to the *same* list. In such a case, this list node cannot be made to disappear, as doing so would prevent the application of the initial configuration.

Since the auto-config filter leverages YANG deviations, it does not impact the resulting schema size. In other words, using an auto-config filter will not reduce the overall schema size.




# 9. Advanced: Issues Solvable with Schema Customization

This chapter addresses various issues and problems, all of which can be resolved using the schema customization techniques detailed in the preceding chapters. Each of these listed issues stems from real-world support cases, involving a range of different devices and third-party YANG NEDs.

The intention is for the described issues and their solutions to serve as an inspiration or a foundational knowledge base for other challenges that may arise when working with third-party YANG NEDs.



## 9.1 Excessive RPCs Leading to Unresponsive NSO CLI

Third-party YANG models can include a substantial number of Remote Procedure Calls (RPCs). For instance, a recent *JunOS* YANG distribution may contain over 6500 RPCs.

It has been observed that when all these RPCs are incorporated into the NED package, the NSO CLI can become unresponsive, especially affecting tab completion, when a user attempts to invoke them.

Should this unresponsiveness pose a problem for end-users, a simple workaround is to remove all unnecessary RPCs from the schema. In most scenarios, it is highly unlikely that all available RPCs would be needed.



**Step-by-Step Guide:** Trimming RPCs from the schema

First, ensure the NED is fully operational with its complete schema by following the initial setup steps outlined in chapters **1.2** through **1.4**.

1. **Use the** `show-loaded-schema` **tool to list all RPCs currently installed in the NED package:**

   ```
   admin@ncs# devices device dev-1 rpc rpc-show-loaded-schema show-loaded-schema scope rpcs output { file /tmp/rpcs-to-trim }
   ```

   This command will generate a file containing the schema paths for each defined RPC.



2. **Open and edit this generated file**.

   Comment out (by adding a # at the beginning of the line) the RPCs you wish to **keep**, as shown in the example below:

   ```
   #/ethernet-switching:get-ethernet-switching-flood-information
   /ethernet-switching:get-satellite-control-flood-ethernet
   /ethernet-switching:get-satellite-control-composite-next-hop-eth
   #/ethernet-switching:get-ethernet-switching-table-interface-information
   #/ethernet-switching:get-ethernet-switching-table-persistent-learning
   /ethernet-switching:get-persistent-learning-interface
   #/ethernet-switching:get-persistent-learning-mac
   /ethernet-switching:get-satellite-eth-switch-device-db
   ..
   ..
   ```



3. **Rebuild the NED package using the trim-filter feature**:

   ```
   devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { trim-schema { nodes-from-file /tmp/rpcs-to-trim } }
   ```



4. **Finally, after rebuilding the package, reload it to apply the changes**:

   ```
   admin@ncs# packages reload
   ```



## 9.2 Removing Deprecated Nodes from the Schema

The YANG modeling language supports annotating schema nodes with status information. Two status values, in particular, indicate that nodes are scheduled for removal in future model versions:

- `deprecated`: The node is still supported but its use is no longer recommended.
- `obsolete`: The node is no longer supported and should not be used.

If you want to reduce the size of a third-party YANG schema, a logical first step is to consider removing deprecated and/or obsolete nodes, since their use is already discouraged.

Currently, the NSO YANG compiler (`yanger`) does not provide a built-in method to automatically trim such nodes. However, you can achieve this using the schema trimming build filter, which removes specified nodes from the YANG modules before compilation.



**Step-by-Step Guide:** Trimming deprecated and obsolete nodes from the schema

1. **Check for deprecated/obsolete nodes:**

   First, verify whether the schema contains any nodes with these statuses. The following example command counts all nodes with a status of deprecated or obsolete

   ```
   admin@ncs# devices device dev-1 rpc rpc-show-loaded-schema show-loaded-schema with-status [ deprecated obsolete ] count
   ```

   If the tool returns a number greater than zero, the schema contains nodes with the specified statuses.



2. **Rebuild the NED with the trim filter:**

   ```
   devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { trim-schema { all-with-status [ deprecated obsolete ] } }
   ```



## 9.3 Identifying Problematic XPath Expressions Causing Performance Degradation in NSO

Many third-party YANG models are annotated with additional expressions to describe dependencies between different nodes in the schema. Typically, these dependencies are defined using xpath expressions in `must` or `when` statements, or by using the leafref type.

These kinds of dependency rules are always computationally intensive for NSO. Depending on how the xpath expressions are constructed, they can significantly impact overall NSO performance.

It can be very difficult for an end user to understand why a particular operation in NSO suddenly takes an unusually long time to complete. Identifying which specific xpath expression is causing the issue can be even more challenging.



### Real Case Description:

This example is based on a support case involving the third-party YANG NED for *Huawei VRP* NETCONF. The *VRP* YANG models contain numerous dependency rules - about 4,000 `must` statements and 3,000 `when` statements in a recent distribution.

A delete operation of an interface instance led to unresponsiveness in the NSO CLI, as illustrated below:

```
admin@ncs# devtools true
admin@ncs# config
admin@ncs(config-config)# timecmd no devices device dev-1 config ifm interfaces interface Eth-Trunk44.123456 Command executed in 238.26 sec
admin@ncs(config-config)# timecmd commit
Commit complete.
Command executed in 2545.09 sec
```

When this kind of unresponsiveness occurs, it is often due to NSO having to evaluate poorly designed xpath expressions.

In this case, even the "no operation" during an open transaction took an unacceptably long time, suggesting that xpath calculations were involved-likely due to inefficient `when` statements. NSO verifies when expressions every time changes are made in an open transaction.

During the commit phase, NSO performs even more thorough verification of all dependencies, including all `must`, `when`, and `leafref` statements.



**Step-by-Step Guide:** Finding Problematic xpath Expressions

Here is a process to identify problematic xpath expressions when performance issues are suspected:

1. **Enable the NSO xpath tracer**:

   Enabling the xpath tracer is essential for identifying xpath-related issues. Note that the tracer is disabled by default due to its significant impact on NSO performance. Operations like the simple delete above can take up to 10 times longer with the tracer enabled.

   To enable the xpath tracer, edit the `ncs.conf` configuration file located in  `<NSO RUNTIME DIR>/ncs.conf`.  Locate the `<xpath-trace-log>` section and ensure it is enabled:

   ```
   <xpath-trace-log>
       <filename>./logs/xpath.trace</filename>
       <enabled>true</enabled>
   </xpath-trace-log>
   ```



   **Restart NSO** for the changes to take effect:

   ```
   $ (cd <NSO_RUNTIME_DIR>; ncs --stop; ncs)
   ```



2. **Trigger the problematic operation**:

   Reproduce the operation that causes performance issues. In our example, perform the delete operation again (skipping the commit for now to focus on identifying the initial bottleneck)

   ```
   admin@ncs# config
   admin@ncs(config-config)# no devices device dev-1 config ifm interfaces interface Eth-Trunk44.123456
   admin@ncs(config-config)# abort
   admin@ncs#
   ```

   This command will take considerable longer time to finish this time, due to the xpath tracing.



3. **Run the xpath trace analyzer tool**:

   After enabling the xpath tracer and reproducing the problematic operation, an xpath trace file should now be available for analysis. This file is not intended to be read manually, as it is typically very large and in a raw format (for example, this simple case produced a 2 GB trace file).

   To simplify analysis, a new tool is included in the third-party YANG NED toolbox, the `xpath-trace-analyzer`:

   ```
    devices device dev-0 rpc rpc-xpath-trace-analyzer xpath-trace-analyzer
   ```



   **Command Options**

   ​	**•	file**: Path to the NSO xpath trace file to analyze (default: use the one written by the running NSO).

   ​	**•	number-of-entries**: Sets the number of entries to display in the generated top list (default 10).



   Execute it like below:

   ```
   admin@ncs# devices device dev-0 rpc rpc-xpath-trace-analyzer xpath-trace-analyzer number-of-entries 5
   ```



4. **Analyze the output**:

   The tool generates two top lists:

   ​	**•**	The most frequently evaluated xpath expressions.

   ​	**•**	The most time-consuming xpath expressions.



   **Example output**:

   ```
   Top 5 most frequently occurring evaluated expressions:

     Schema path:  /ifm:ifm/interfaces/interface/ethernet:ethernet/l3-sub-interface
     Expression:   ../../ifm:class='sub-interface'
     Occurrences:  1012418
     Total time:   133.039000 s
     Average time: 0.000131 s

     Schema path:  /ifm:ifm/interfaces/interface
     Expression:   ifm:type='Eth-Trunk' or ifm:type='Ip-Trunk'
     Occurrences:  982920
     Total time:   149.002000 s
     Average time: 0.000152 s

     Schema path:  /ifm:ifm/interfaces/interface/vrrp:vrrp/backup-group6s/nd-send-simple
     Expression:   /ifm:ifm/ifm:interfaces/ifm:interface/ethernet:ethernet/ethernet:l3-sub-interface/ethernet:qinq-termination
     Occurrences:  711
     Total time:   192.415000 s
     Average time: 0.270626 s

     Schema path:  /ifm:ifm/interfaces/interface/arp:arp-entry
     Expression:   not(/ifm:ifm/ifm:interfaces/ifm:interface/ifm-trunk:trunk/ifm-trunk:members/ifm-trunk:member[ifm-trunk:name=current()/../ifm:name])
     Occurrences:  711
     Total time:   218.064000 s
     Average time: 0.306700 s

     Schema path:  /ifm:ifm/interfaces/interface/vrrp:vrrp/backup-groups/arpsend-simple
     Expression:   /ifm:ifm/ifm:interfaces/ifm:interface/ethernet:ethernet/ethernet:l3-sub-interface/ethernet:qinq-termination
     Occurrences:  711
     Total time:   191.862000 s
     Average time: 0.269848 s

   Top 5 most time-consuming evaluate operations:

     Schema path:  /ifm:ifm/interfaces/interface/arp:arp-entry
     Expression:   not(/ifm:ifm/ifm:interfaces/ifm:interface/ifm-trunk:trunk/ifm-trunk:members/ifm-trunk:member[ifm-trunk:name=current()/../ifm:name])
     Occurrences:  711
     Total time:   218.064000 s
     Average time: 0.306700 s

     Schema path:  /ifm:ifm/interfaces/interface/ethernet:ethernet/main-interface/fim-ethernet:fim-main
     Expression:   not((../../../ifm:name) = (/ifm:ifm/ifm:interfaces/ifm:interface/ifm-trunk:trunk/ifm-trunk:members/ifm-trunk:member/ifm-trunk:name)) and ../../../ifm:type!='FlexE-200GE' and ../../../ifm:type!='FlexE-50G' and ../../../ifm:type!='FlexE-100G' and ../../../ifm:type!='FlexE-10G' and ../../../ifm:type!='FlexE-400G' and ../../../ifm:type!='FlexE-50|100G' and ../../../ifm:type!='Virtual-Ethernet' and ../../../ifm:type!='Tunnel' and ../../../ifm:type!='NULL' and ../../../ifm:type!='LoopBack' and ../../../ifm:type!='Global-VE' and ../../../ifm:type!='Nve' and ../../../ifm:type!='Vbdif' and ../../../ifm:type!='Vlanif' and ../../../ifm:type!='PW-VE'
     Occurrences:  711
     Total time:   194.174000 s
     Average time: 0.273100 s

     Schema path:  /ifm:ifm/interfaces/interface/vrrp:vrrp/backup-group6s/nd-send-simple
     Expression:   /ifm:ifm/ifm:interfaces/ifm:interface/ethernet:ethernet/ethernet:l3-sub-interface/ethernet:qinq-termination
     Occurrences:  711
     Total time:   192.415000 s
     Average time: 0.270626 s

     Schema path:  /ifm:ifm/interfaces/interface/vrrp:vrrp/backup-groups/arpsend-simple
     Expression:   /ifm:ifm/ifm:interfaces/ifm:interface/ethernet:ethernet/ethernet:l3-sub-interface/ethernet:qinq-termination
     Occurrences:  711
     Total time:   191.862000 s
     Average time: 0.269848 s

     Schema path:  /bd:bd/instances/instance/ims:igmp-snooping/static-router-ports
     Expression:   /mc:multicast/ims:igmp-snooping/ims:global-enable or /ni:network-instance/ni:instances/ni:instance/igmp-mld:igmp/igmp-mld:interfaces/igmp-mld:interface[igmp-mld:enable='true'][igmp-mld:name=/ifm:ifm/ifm:interfaces/ifm:interface[ifm:type='Vbdif'][ifm:number=string(current()/../../bd:id)]/ifm:name]
     Occurrences:  1
     Total time:   0.122000 s
     Average time: 0.122000 s
   ```



   When reviewing the top lists generated by the xpath trace analyzer, the first thing to look for is xpath expressions that use absolute paths. Absolute paths often indicate poorly designed expressions, which can significantly impact performance.

   In the example above, several absolute paths appear in the top lists. Notably, the first four entries in the "most time-consuming" list all use absolute paths, making them prime suspects for performance issues. Two of these entries share the same xpath expression defined at different locations in the schema.

   ```
   not(/ifm:ifm/ifm:interfaces/ifm:interface/ifm-trunk:trunk/ifm-trunk:members/ifm-trunk:member[ifm-trunk:name=current()/../ifm:name])

   not((../../../ifm:name) = (/ifm:ifm/ifm:interfaces/ifm:interface/ifm-trunk:trunk/ifm-trunk:members/ifm-trunk:member/ifm-trunk:name)) and ../../../ifm:type!='FlexE-200GE' and ../../../ifm:type!='FlexE-50G' and ../../../ifm:type!='FlexE-100G' and ../../../ifm:type!='FlexE-10G' and ../../../ifm:type!='FlexE-400G' and ../../../ifm:type!='FlexE-50|100G' and ../../../ifm:type!='Virtual-Ethernet' and ../../../ifm:type!='Tunnel' and ../../../ifm:type!='NULL' and ../../../ifm:type!='LoopBack' and ../../../ifm:type!='Global-VE' and ../../../ifm:type!='Nve' and ../../../ifm:type!='Vbdif' and ../../../ifm:type!='Vlanif' and ../../../ifm:type!='PW-VE'

   /ifm:ifm/ifm:interfaces/ifm:interface/ethernet:ethernet/ethernet:l3-sub-interface/ethernet:qinq-termination
   ```



5. **Identify the YANG statement using a specific xpath expression**:

   The xpath tracer does not indicate exactly which YANG statement (such as `when` or `must`) is using a particular xpath expression. However, the top lists from the trace analyzer do include the schema path for each node associated with an xpath expression.

   To determine which YANG statement is using a specific xpath expression, you can use the `show-loaded-schema` tool.



   By referencing the schema path from the top list, it becomes straightforward to locate the relevant YANG statement:

   ```
   admin@ncs# devices device dev-1 rpc rpc-show-loaded-schema show-loaded-schema root-paths [ /ifm:ifm/interfaces/interface/arp:arp-entry /ifm:ifm/interfaces/interface/ethernet:ethernet/main-interface/fim-ethernet:fim-main /ifm:ifm/interfaces/interface/vrrp:vrrp/backup-group6s/nd-send-simple /ifm:ifm/interfaces/interface/vrrp:vrrp/backup-groups/arpsend-simple ] details
   ```



   This will output the information we are interrested in:

   ```
   /ifm:ifm/interfaces/interface/vrrp:vrrp/backup-groups/arpsend-simple
      when "/ifm:ifm/ifm:interfaces/ifm:interface/ethernet:ethernet/ethernet:l3-sub-interface/ethernet:qinq-termination"
   /ifm:ifm/interfaces/interface/vrrp:vrrp/backup-group6s/nd-send-simple
      when "/ifm:ifm/ifm:interfaces/ifm:interface/ethernet:ethernet/ethernet:l3-sub-interface/ethernet:qinq-termination"
   /ifm:ifm/interfaces/interface/ethernet:ethernet/main-interface/fim-ethernet:fim-main
      when "not((../../../ifm:name) = (/ifm:ifm/ifm:interfaces/ifm:interface/ifm-trunk:trunk/ifm-trunk:members/ifm-trunk:member/ifm-trunk:name)) and ../../../ifm:type!='FlexE-200GE' and ../../../ifm:type!='FlexE-50G' and ../../../ifm:type!='FlexE-100G' and ../../../ifm:type!='FlexE-10G' and ../../../ifm:type!='FlexE-400G' and ../../../ifm:type!='FlexE-50|100G' and ../../../ifm:type!='Virtual-Ethernet' and ../../../ifm:type!='Tunnel' and ../../../ifm:type!='NULL' and ../../../ifm:type!='LoopBack' and ../../../ifm:type!='Global-VE' and ../../../ifm:type!='Nve' and ../../../ifm:type!='Vbdif' and ../../../ifm:type!='Vlanif' and ../../../ifm:type!='PW-VE'"
   /ifm:ifm/interfaces/interface/ethernet:ethernet/main-interface/fim-ethernet:fim-main/outer-vlan-enable
   /ifm:ifm/interfaces/interface/arp:arp-entry
      when "not(/ifm:ifm/ifm:interfaces/ifm:interface/ifm-trunk:trunk/ifm-trunk:members/ifm-trunk:member[ifm-trunk:name=current()/../ifm:name])"
   ..
   ..
   ```

   The output shows that all the problematic xpath expressions are used by `when` expressions.



6. **Create YANG recipes to remove problematic xpath expressions**:

   You can trim the schema of problematic `must` and `when` statements by adding new YANG recipes and then rebuilding the NED.

   In this scenario, you need to add specific pragmas to the `schypp` YANG pre-processor. These pragmas will automatically modify the schema before the YANG files are compiled.

   Open the file `$NED_ROOT_DIR/src/customize-schema.schypp` and add the following lines to the file:

   ```
   remove /ifm:ifm/interfaces/interface/vrrp:vrrp/backup-groups/arpsend-simple::when
   remove /ifm:ifm/interfaces/interface/vrrp:vrrp/backup-group6s/nd-send-simple::when
   remove /ifm:ifm/interfaces/interface/ethernet:ethernet/main-interface/fim-ethernet:fim-main::when
   remove /ifm:ifm/ifm:interfaces/ifm:interface/arp-entry::when
   ```

   The pragmas above should be self-explanatory.

   In some cases it might be preferred to correct the when expressions instead of removing them. Then use the `replace` pragma instead of `remove`. Check chapter **7.2.1** for further information about the `schypp` tool.



7. **Rebuild the NED package and reload it**:

   ```
   admin@ncs# devices device dev-0 rpc rpc-rebuild-package rebuild-package
   admin@ncs# packages reload
   ```



8. **Disable xpath tracing and restart NSO**:

   Finally, verify that the performance issue is solved.



### Why are Absolute Paths Problematic in XPath Expressions?

Absolute paths in xpath expressions can easily expand the scope of verification in unintended ways.

In the examples above, all the absolute paths reference the interfaces section of the schema-specifically, the node `/ifm:ifm/ifm:interfaces/ifm:interface`, which represents a list of interfaces.

Since these expressions do not specify a particular interface (for example, by using xpath predicates), NSO must evaluate the condition against every interface instance in the list. The more interfaces that are configured, the longer the evaluation takes. In this specific case, there were about 750 interfaces configured, resulting in significant performance degradation.

**Important: There is no way for NSO to automatically protect itself against problematic xpath expressions. Such expressions should be regarded as bugs in the YANG model. They must be fixed - ideally by the third-party YANG vendor - or removed from the schema.**






## 9.4 Solving Issues Related to the NSO Brownfield Feature

With the release of NSO 6.5, a new feature was introduced to better manage brownfield network setups. In such environments, agents other than NSO — including manual operators, automation scripts, or other orchestrators — can deploy configurations to network devices. A key challenge for NSO when orchestrating a brownfield network is that it is likely to be perpetually out of sync with the network's actual configuration.

Frequent "sync-from" operations are often ineffective in a brownfield network. To address this, NSO 6.5 introduced the new `confirm-network-state` commit feature, specifically designed for brownfield scenarios. A comprehensive description of this feature can be found in the NSO documentation. In essence, this feature ensures that NSO thoroughly verifies the network's current state as an initial step before committing new configurations. From a 3PY NED perspective, this typically involves one or more additional read operations towards the device, often performed as *partial sync-from* operations.

The `confirm-network-state` feature relies on the schema to determine which schema paths to validate during these read operations. Furthermore, it completely depends on the schema precisely matching the configuration tree on the target device for these read operations.

This dependency can lead to problems with third-party YANG models because there's no guarantee that these models perfectly correspond to the devices advertising them. In fact, it's common for third-party YANG models to be constructed as a superset, covering multiple device types.



### Example:

To illustrate this problem, consider the simple YANG model below. This model acts as a superset, simultaneously supporting both device type A and device type B.

```
module demo-schema {
  yang-version 1.1;
  namespace urn:cisco.com:demo:test:conf;
  prefix conf;

  container common-settings {
  	list master {
  		key name;
  		leaf name {
  		   type string;
  		}
  	}
  }
  // Settings only relevant for device type A
	container device-type-A-settings {
		container used {
			list used {
				key name;
				leaf name {
					type leafref {
						path "../../../common-settings/master/name"
					}
				}
			}
		}
	}
	// Settings only relevant for device type B
	container device-type-B-settings {
		container used {
			list used {
				key name;
				leaf name {
					type leafref {
						path "../../../common-settings/master/name"
					}
				}
			}
		}
	}
}
```



Now, imagine NSO needs to delete an entry from the `/conf:/common-settings/master` list on a device of type A. Since the network is brownfield and NSO is out-of-sync, the `confirm-network-state` feature will be engaged.

When deleting an entry from the `/conf:/common-settings/master` list using this commit feature, NSO must first verify that the entry is not referenced elsewhere. The schema includes two other lists that reference the master list. Consequently, NSO will query the device for all entries in both `/conf:device-type-A-settings/used/used` and `/conf:device-type-B-settings/used/used`.

However, the device itself is of type A and has no knowledge of the path `/conf:device-type-B-settings/used/used`. As a result, it will return an error for any read operations attempting to access that path.



### How Common is This?

The use of superset third-party YANG models is quite common. A prominent example is the *Nokia SROS* models, which encompass all devices utilizing the *SROS* platform. Another instance can be found in vendor-neutral models like *OpenConfig*. Vendors that claim support for such models typically only implement a fraction of the full schema. While some vendors handle this appropriately by using YANG deviation modules to remove unsupported parts, others simply disregard this discrepancy.

It's also worth noting that most of the standard NEDs developed by the Cisco NSO NED team also employ superset YANG models.



### How Severe is This?

The severity of this issue largely depends on the management protocol in use. For certain protocols, such as RESTCONF, it's often possible for the NED to ignore errors returned on specific read paths.

Unfortunately, the NETCONF protocol is particularly susceptible to this problem. This is because NETCONF can consolidate all paths to be read into a single request, which is usually very efficient as it minimizes round trips. However, if an invalid path is included among the valid ones, the device will return an error instead of any useful data.

For NETCONF, the partial-show operation in the previous example would typically appear as follows:

```
<rpc xmlns="urn:ietf:params:xml:ns:netconf:base:1.0" message-id="5">
    <get-config>
        <source>
            <running/>
        </source>
        <filter>
            <configure xmlns="urn:cisco.com:demo:test:conf">
                <device-type-A-settings>
                    <used>
                        <used>
                        </used>>
                    </used>>
                </device-type-A-settings>
                <device-type-B-settings>
                    <used>
                        <used>
                        </used>>
                    </used>>
                </device-type-B-settings>
            </configure>
        </filter>
    </get-config>
</rpc>
```



And a typical NETCONF device would respond with an error similar to this:

```
<rpc-reply message-id="5" xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <rpc-error>
        <error-type>application</error-type>
        <error-tag>unknown-element</error-tag>
        <error-severity>error</error-severity>
        <error-path xmlns:a="urn:cisco.com:demo:test:conf">
            /a:device-type-B-settings/a:used/a:used
        </error-path>
        <error-message>
            MINOR: Unknown element
        </error-message>
        <error-info>
            <bad-element>device-type-B-settings</bad-element>
        </error-info>
    </rpc-error>
</rpc-reply>
```



### How to Solve the Problem?

Fortunately, a solution exists for this type of problem: utilizing the schema trimming feature available in every 3PY NED.

By first customizing the schema to precisely map to the device it will be used with, it will no longer function as a superset. This involves removing parts of the schema that are not relevant to the specific device — a task ideally suited for the schema trimmer feature.

Determining which nodes to trim can be quite challenging — often requiring consultation of device documentation — and can be a tedious process.

The 3PY NED toolbox can offer valuable hints on what should be trimmed, as will be demonstrated with the example below.



### Real Case Description

This example is based on a real support case involving the third-party YANG NED for *Nokia SROS* NETCONF. It demonstrates how an issue encountered when using the `confirm-network-state` commit feature can be resolved by rebuilding the NED with the schema trimming feature.

The problem was triggered by a seemingly straightforward delete operation for a single list entry: `association 123`

```
admin@ncs# config
admin@ncs(config)# no devices device dev-1 config configure eth-cfm domain 12355 association 123
admin@ncs(config)# commit confirm-network-state
Aborted: External error in the NED implementation for device nokia-sros-1: RPC error: error unknown-element: MINOR: MGMT_CORE #2201: Unknown element (error-path: /a:configure/a:service/a:test-oam/a:service-activation-testhead)
```

The commit failed, and the device reported an error related to a seemingly unrelated node: `service-activation-testhead.`



Let's examine the NED trace to understand why. The additional read operation required by the `confirm-network-state` feature appears as follows:

```
<rpc message-id="1" xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
<get-config><source><running/></source><filter>
 <configure xmlns="urn:nokia.com:sros:ns:yang:sr:conf">
  <test-oam>
   <service-activation-testhead>
    <service-test>
    </service-test>
   </service-activation-testhead>
  </test-oam>
  <service>
   <vprn>
   </vprn>
   <vpls>
   </vpls>
   <ies>
   </ies>
   <epipe>
   </epipe>
  </service>
  <router>
  </router>
  <port>
  </port>
  <lag>
  </lag>
  <eth-ring>
  </eth-ring>
  <eth-cfm>
   <domain>
    <md-admin-name>12355</md-admin-name>
    <association>
     <ma-admin-name>123</ma-admin-name>
    </association>
   </domain>
  </eth-cfm>
 </configure></filter></get-config></rpc>
```

Each XML element within the filter above represents a path that NSO attempts to read from the device. In this case, NSO needs to inspect ten different paths to successfully remove the `association 123` list entry.

A relevant question here is, "Why?"

The built-in `show-loaded-schema` tool can help answer this. To inspect the schema corresponding to the association list, the `details` option is necessary.

```
admin@ncs# devices device dev-1 rpc rpc-show-loaded-schema show-loaded-schema root-paths [ /conf:configure/eth-cfm/domain/association ] details
```



The output will appear as follows:

```
/conf:configure/eth-cfm/domain/association
/conf:configure/eth-cfm/domain/association/ma-admin-name
   referred by  : /conf:configure/service/ies/interface/spoke-sdp/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/router/interface/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/vpls/spoke-sdp/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/eth-ring/path/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/vpls/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/port/ethernet/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/ies/interface/sap/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/ies/subscriber-interface/group-interface/sap/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/epipe/sap/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/vprn/interface/spoke-sdp/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/epipe/spoke-sdp/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/lag/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/vpls/sap/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/vprn/interface/sap/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/vprn/subscriber-interface/group-interface/sap/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/vpls/mesh-sdp/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/test-oam/service-activation-testhead/service-test/service-stream/frame-payload/ethernet/eth-cfm/source/ma-admin-name
..
..
```



The output reveals that 17 other nodes within the schema are defined as leafrefs pointing to the *ma-admin-name* key element in the association list. One of these nodes has a schema path beginning with `/conf:configure/test-oam/service-activation-testhead`.

Evidently, the device we are connected to does not support this specific schema node.

Therefore, it is necessary to remove this node from the schema embedded within the NED package. This is achieved by rebuilding the NED with a schema trim filter:

```
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { trim-schema { nodes [ /conf:configure/test-oam/service-activation-testhead ] } }
```



Next, reload the NED package:

```
admin@ncs# packages reload
```



To verify the removal of the `/conf:configure/test-oam/service-activation-testhead` node, execute the following command:

```
admin@ncs# devices device dev-1 rpc rpc-show-loaded-schema show-loaded-schema root-paths [ /conf:configure/eth-cfm/domain/association ] details
```



The output now appears as follows:

```
/conf:configure/eth-cfm/domain/association
/conf:configure/eth-cfm/domain/association/ma-admin-name
   referred by  : /conf:configure/service/vpls/spoke-sdp/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/vprn/subscriber-interface/group-interface/sap/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/vpls/sap/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/eth-ring/path/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/lag/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/epipe/spoke-sdp/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/vprn/interface/spoke-sdp/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/vprn/interface/sap/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/router/interface/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/ies/interface/sap/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/port/ethernet/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/vpls/mesh-sdp/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/epipe/sap/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/ies/interface/spoke-sdp/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/vpls/eth-cfm/mep/ma-admin-name
   referred by  : /conf:configure/service/ies/subscriber-interface/group-interface/sap/eth-cfm/mep/ma-admin-name
```



The `ma-admin-name` is no longer referenced from the path beginning with `/conf:configure/test-oam/service-activation-testhead`.

Finally, confirm that the delete operation is now successful:

```
admin@ncs# config
admin@ncs(config)# no devices device dev-1 config configure eth-cfm domain 12355 association 123
admin@ncs(config)# commit confirm-network-state
Commit complete.
admin@ncs(config)#
```

In some cases, it might be necessary to repeat this procedure until the commit finally succeeds. In this specific example, there are potentially 16 additional nodes that might also require trimming.



# 10. Advanced: How to Determine When a NED Upgrade is Required

For devices that use third-party YANG models, a firmware upgrade often means the corresponding YANG files have also changed. From a 3PY NED perspective, this typically requires rebuilding the NED package with the updated YANG files to ensure compatibility with the device. As a result, migrating from the old NED to the new one becomes necessary.

Both preparing and rebuilding a NED with new YANG models, as well as performing the migration, are usually time-consuming tasks.

However, after a firmware upgrade - even if the YANG models have changed - it may not always be necessary to upgrade the NED. The need for a NED upgrade depends on the following factors:

- Are the modified YANG modules included in the existing NED?

- Are the changed elements within those YANG modules populated in the CDB and/or referenced by services running in NSO?

  

If the answer to both questions is "no", there is a good chance that the current NED will continue to work with the upgraded device without requiring further changes.

Since third-party YANG files are often very large, manually answering these questions is difficult. Comparing YANG files and analyzing the differences can be very challenging.

To address this, all 3PY NEDs include the `compare-loaded-schema` tool, which can perform this kind of schema comparison automatically.

This tool compares the NED device schema currently loaded in NSO with the schema represented by the new YANG models downloaded from the device. It automatically applies the same build filters to the new schema as were used for the currently loaded schema. For example, if a scope filter limiting the included namespaces was applied previously, the same filter will be used on the new YANG files before comparison. The same applies to trim filters and any YANG recipes applied to the loaded schema.

The tool analyzes the differences between the currently loaded schema and the newly downloaded schema, focusing on what is actually populated in the CDB. Finally, it generates a report that indicates compatibility status based on the detected differences and whether the changed elements are present in the CDB.



## 10.1 Example:

This example uses the YANG models for Cisco IOS XR. Initially, the NED package is built with YANG models for IOS XR version *x*. After a device upgrade to version *y*, it is assumed that all schema nodes relevant to the services running in NSO are already populated in the CDB.



#### Step 1: Download the New YANG files

```
admin@ncs# devices device dev-1 rpc rpc-clean-package clean-package
admin@ncs# devices device dev-1 rpc rpc-get-modules get-modules profile native-um  
```

The new YANG files are now stored in the `src/yang` directory of the NED packages in NSO. Importantly, this action does not affect the currently loaded NED schema in NSO.



#### Step 2: Compare the schemas

```
admin@ncs# devices device dev-1 rpc rpc-compare-loaded-schema compare-loaded-schema outformat text
```

The tool will output a report similar to the following:

```
COMPARISON REPORT
=================

This tool compares the currently loaded device schema with the recently downloaded schema,
analyzing their compatibility with the device configuration stored in CDB.

Summary:
 Number of modules in loaded schema:      259
 Number of nodes in loaded schema:        56684

 Number of modules in downloaded schema:  259
 Number of nodes in downloaded schema:    56114

 Number of schema nodes populated in CDB: 84

 Schema changes:
  - New nodes:     321
  - Removed nodes: 622
  - Changed nodes: 1293

Comparison result: INCOMPATIBLE

Description:
The schema changes in the downloaded schema affect nodes that are currently populated in the CDB.
This indicates that the current NED may not be fully compatible with devices using the downloaded schema,
potentially leading to issues when interacting with such devices. It is recommended to review the affected
 nodes in detail and consider rebuilding and upgrading the NED to ensure compatibility with the new schema.
Consult the README-rebuild.md for guidance on how to analyze the affected nodes and rebuild the NED.
The following currently populated nodes are incompatible in the new schema:

 - node: /um-aaa-cfg:aaa/authentication/login/authentication-list/local
   change : must statement changed from "not(../line or ../groups/group-1/tacacs or ../groups/group-1/radius or ../groups/group-1/server-group-name)" to "not(../line or ../groups/group-1/tacacs or ../groups/group-1/radius or ../groups/group-1/server-group-name)"

 - node: /um-aaa-cfg:aaa/authorization/exec/authorization-list
   change : must statement changed from "local or none or groups/group-1/tacacs or groups/group-1/radius or groups/group-1/server-group-name" to "local or none or groups/group-1/tacacs or groups/group-1/radius or groups/group-1/server-group-name"

 - node: /um-aaa-cfg:aaa/authorization/exec/authorization-list/local
   change : must statement changed from "not(../none or ../groups/group-1/tacacs or ../groups/group-1/radius or ../groups/group-1/server-group-name)" to "not(../none or ../groups/group-1/tacacs or ../groups/group-1/radius or ../groups/group-1/server-group-name)"

 - node: /um-grpc-cfg:grpc/port
   change : range changed from "1024..65535" to "10000..57999"

 - node: /um-grpc-cfg:grpc/no-tls
   change : structure changed from leaf to container

 - node: /um-policymap-classmap-cfg:policy-map/type/qos/class
   change : must statement changed from "admit or bandwidth or bandwidth-remaining or fragment or pause or police or priority or queue-limits or random-detect-ecn or service-fragment or service-policy or set or shape or random-detect-default or random-detect or compress or encap-sequence" to "admit or bandwidth or bandwidth-remaining or fragment or pause or police or priority or queue-limits or random-detect-ecn or service-fragment or service-policy or set or shape or random-detect-default or random-detect or compress or encap-sequence"
```

The comparison reveals significant differences between the schemas. Several changed nodes detected are also populated in the CDB, including updates to some `must` expressions and value `ranges`, as well as one structural change in the schema.

Therefore, the initial result is **INCOMPATIBLE**. To reach a definitive conclusion, it is necessary to manually analyze each reported incompatibility in detail.



The tool also supports an additional argument, `details`. When this argument is provided, the output includes a comprehensive list of all detected changes-not only those affecting the CDB data. 

For example:

```
COMPARISON DETAILS:
===================

NEW NODES:
==========
 - node:   /um-location-cfg:locations/location/um-ncs-hw-module-osa-cfg:hw-module

 - node:   /um-location-cfg:locations/location/um-frequency-synchronization-cfg:clock-interface

REMOVED NODES:
==============
 - node:   /um-netconf-yang-cfg:netconf-yang/agent/netconf1.0

 - node:   /um-route-policy-cfg:routing-policy/sets/extended-community-evpn-bandwidth-sets

 - node:   /um-ptp-cfg:ptp/phase-difference-threshold-breach

CHANGED NODES:
==============

BACKWARDS COMPATIBLE CHANGES:
-----------------------------
 - node:   /um-mpls-ldp-cfg:mpls/ldp/mldp/vrfs/vrf/address-families/address-family/af-name
   change: number of enum values changed from 1 to 2

 - node:   /um-ptp-cfg:ptp/profiles/profile/subordinate/ipv4s/ipv4-non-negotiated
   change: must statement deleted

 BACKWARDS INCOMPATIBLE CHANGES:
-------------------------------
  - node:   /um-interface-cfg:interfaces/interface-preconfigure/ipv4/um-if-dhcp-client-options-cfg:address/dhcp-client-options/option/user-class-id-option-77
   change: must statement changed from "not(../vendor-id-option-60 or ../client-id-option-61)" to "not(../vendor-id-option-60 or ../client-id-option-61)"

 - node:   /um-interface-cfg:interfaces/interface-preconfigure/ipv6/um-if-access-group-cfg:access-group/ingress/compress-level
   change: range changed from "0..4" to "0..3"
```

This detailed report helps identify all schema changes, distinguishing between backwards compatible and incompatible modifications. 



## 10.2 Analysing the Incompatibilities

The tool can identify nodes that are potentially incompatible. However, whether these nodes are truly incompatible depends on the specific use case. Each situation should be evaluated individually.

The list below provides general guidance on how to analyze different types of incompatibilities:

- **Structural changes:** The schema structure has changed, for example a node that is a `leaf` in the loaded schema is a `container` the new schema. These changes are typically always backwards incompatible.
  A rebuild of the NED is required.
- **Data type:** The data type of a node has changed. 
  Some type changes are compatible, such as widening integer types or introducing unions. If a node type is replaced with a leafref pointing to the same type, it may also be compatible.Most type changes are however not backwards compatible.
  A rebuild of the NED is recommended.
- **Configurability:** The node´s configuration state has changed from either `config true`to  `config false`or vice versa.
  Nodes changing from config true to config false will no longer be configurable, making the change backwards incompatible.
- **Must, when and pattern expressions:** The tool detects changes in `must`, `when`, and `pattern` expressions, but does not deeply analyze the nature of these changes. Manual review is necessary..
  As a rule of thumb, if the new expression is more relaxed than the old one, it is likely to be backwards compatible
- **Ranges and lengths**: Changes to ranges or lengths are generally backwards compatible if the new range is wider than the old one. If the new range is narrower, it is important to analyze which values services are using during configuration. As long as the values are within the new range or length, compatibility is maintained.
- **Mandatory:** If the `mandatory` attribute changes from `true` to `false`, the change is backwards compatible. Otherwise, it is not.
- **Default values:** Introducing new default values may be backwards compatible. However, removed or changed default values are not. In all cases, default value changes can lead to out-of-sync issues unless the NED is rebuilt with the new schema.  
- **Min-elements and max-elements:** Changes to `min-elements` or `max-elements` are usually backwards compatible if the new range is wider. If the range is narrower, you must analyze the values used by services during configuration. As long as the values comply with the new minimum or maximum requirements, compatibility is preserved.


## 10.3 Suppressing Alarms for YANG Revision Mismatches

After upgrading a device's firmware, it is common for some advertised YANG models to have revision stamps newer than those included in the current NED package.

When using a NED with older revisions on an upgraded device, NSO will likely generate alarms similar to the following:

```
*** ALARM revision-error: The device has YANG module revisions not supported by NCS. Use the /devices/device/check-yang-modules action to check which modules that are not compatible.
```

To prevent these alarms, you can configure the NED to suppress reporting YANG revisions to NSO during device interactions.

Configure the following NED setting to make the NED ignore the YANG revisions reported by the device:

```
# devices device simul-1 ned-settings nokia-sros_nc connection capabilities strict-model-revision-check false 
# commit
```


# 11. Rebuild with Automatic Expansion of JunOS vlan-id Lists

Juniper JunOS schemas include many nodes for configuring vlan-id values, all modeled in YANG as `leaf-list` of type `string`.

JunOS devices often use a compact format for these lists, where consecutive numbers are represented as ranges. For example:

```
vlan-id-list[1 2 3 4 10 11 12 13 14 1000] ->  vlan-id-list [1-4 10-14 1000]
```

This compression occurs automatically when configuring a list of vlan-id values on a JunOS device, and the compact format will always be shown when reading back the configuration.

**Issue:**
When deploying configuration to JunOS devices through NSO, this behavior causes an incompatibility. NSO expects the configuration to be read back in exactly the same format as it was set. The compacted `vlan-id` lists can therefore lead to out-of-sync issues in NSO.

**Solution:**
This NED includes a built-in feature to automatically handle this scenario. It consists of two parts:

1. The type used for the `vlan-id` lists is changed from `string` to `uint16`.
2. An inbound transform is activated to expand vlan-id ranges before the payload is relayed to NSO.

Currently, this feature can automatically expand `vlan-id` lists on the following schema nodes:
```
/configuration/groups/interfaces/interface/unit/vlan-id-list
/configuration/groups/interfaces/interface/unit/vlan-tags/inner-list
/configuration/groups/logical-systems/routing-instances/instance/protocols/evpn/extended-vlan-list
/configuration/groups/logical-systems/routing-instances/instance/protocols/l2vpn/extended-vlan-list
/configuration/groups/logical-systems/routing-instances/instance/protocols/vpls/extended-vlan-list
/configuration/groups/routing-instances/instance/protocols/evpn/extended-vlan-list
/configuration/groups/routing-instances/instance/protocols/l2vpn/extended-vlan-list
/configuration/groups/routing-instances/instance/protocols/vpls/extended-vlan-list
/configuration/interfaces/interface/unit/vlan-id-list
/configuration/interfaces/interface/unit/vlan-tags/inner-list
/configuration/logical-systems/routing-instances/instance/protocols/evpn/extended-vlan-list
/configuration/logical-systems/routing-instances/instance/protocols/l2vpn/extended-vlan-list
/configuration/logical-systems/routing-instances/instance/protocols/vpls/extended-vlan-list
/configuration/routing-instances/instance/protocols/evpn/extended-vlan-list
/configuration/routing-instances/instance/protocols/l2vpn/extended-vlan-list
/configuration/routing-instances/instance/protocols/vpls/extended-vlan-list
```

More nodes can be supported upon request. See chapter **8** in the README.md for instructions on submitting feature requests.

## 11.1 Activation

To enable this feature, rebuild the NED using the build profile `expand-vlan-range`.

### Rebuild Using the Built-in Tool

Execute the `rebuild-package RPC from the NSO CLI (or any other northbound NSO interface) with the profile argument:
```
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package profile expand-vlan-range
```

### Rebuild Using a Separate Shell

Rebuild the NED from the installation root directory (`$NED_ROOT_DIR` as configured in chapter **1.1** of README.md):
```
> cd $NED_ROOT_DIR/src
> make clean all APPLY_YPP_CUSTOM=do-profile-expand-vlan-range
```
