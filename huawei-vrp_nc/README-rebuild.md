# Table of contents
-------------------
```
  1. General
    1.1 Overview
    1.2 Using the built-in tool for YANG download
    1.3 Rebuild the NED with the downloaded YANG models
    1.4 Reload the NED package in NSO
  2. Cleaning and resetting the NED package
    2.1 Removing all downloaded YANG models
    2.2 Resetting NED package to its original initial state
  3. Using the built-in downloader tool for a custom download
    3.1 Creating a custom download
  4. Alternative download methods
    4.1 Copy the files into the NED source directory
  5. Rebuilding the NED using a custom NED-ID
    5.1 Rebuild with a custom NED-ID
    5.2 Exporting the rebuilt NED package
  6. YANG fixes applied when rebuilding the NED
    6.1 General
    6.2 Fixes listed by schema paths
    6.3 Fixes listed by YANG file paths
    6.4 Other fixes
  7. Advanced: repairing YANG modules
    7.1 Different kinds of YANG related issues
    7.2 Compile-time issues
    7.3 Run-time issues
  8. Advanced: build methods using scope filtering
    8.1 Rules of thumb when selecting the scope
    8.2 Doing build-time scope filtering
    8.3 Doing run-time scope filtering
  9. Advanced: build methods using schema trimming
    9.1 Using the NED rebuild tool with schema trimming
  10. Advanced: more YANG schema filtering techniques
    10.1 Filtering schema at run-time or compile-time
    10.2 Handling overlapping yang modules
```


# 1. General
------------

## 1.1 Overview

The huawei-vrp_nc NED is delivered without any YANG models in the package.

The models do need to be downloaded, followed by a rebuild and reload of the package before the NED can be fully operational.

This NED contains an optional built-in tool that makes downloading of the device models easy.

Alternatively, manual download is possible as described in chapter 4.

The NED package (i.e with no device models) must first be properly configured in a running NSO environment prior to usage of the downloader tool. The steps described in chapter 1.1 through 1.3 in the README.md must be done prior to this step.

## 1.2 Using the built-in tool for simple YANG download

The downloader tool is implemented as an NSO RPC which can be invoked for instance from the NSO CLI.

When the tool is executed the NED will automatically connect to the device for which the YANG models shall be downloaded. The device will be requested to return a list of supported models when the NED is probing it for capabilities.

This list of models will be the base used by the tool when downloading the models. During operation the tool will also scan each downloaded YANG file for additional dependencies through import/include found. The tool will try to download all such dependency YANG files as well.

  When using the NETCONF protocol the YANG models can normally be downloaded directly from the device.

### Simple Usage

  The downloader tool is pre-configured with following profiles:

  ```
  all : Download all YANG models available for Huawei VRP.
  native-all: Download the Huawei VRP native YANG models (openconfig modules are skipped)
  openconfig: Download all OpenConfig YANG models for Huawei VRP including the deviation/augment files.

  ```

  Do as follows in the NSO CLI to download the files using the 'all' profile:

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules profile all
  ```

  or just:

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules
  ```

NOTE: If a built-in profile is selected and the user provides additional 'module-include-regex' and/or 'module-exclude-regex' via the command line, the tool will merge the profile's regex patterns with those specified on the command line.

For more advanced options using the downloader tool, see chapter 3.

Chapter 5('rpc get-modules') in README.md describes more details about the downloader tool, including all available command line arguments.

## 1.3 Rebuild the NED with the downloaded YANG models
The NED must be rebuilt when the device models have been downloaded and stored properly.

Very often there are known issues related to building the device YANG models. Such issues
typically cause compiler errors or unwanted runtime errors/behaviours in NSO.

The NED is configured to take care of all currently known build/runtime issues. It will automatically
patch the problematic files such that they do build properly for NSO. This is done using a set of YANG
build recipes bundled with the NED package.

Note that the work with adapting the YANG build recipes is an ongoing process. If new issues are found
the Cisco NSO NED team will update the recipes accordingly and then release a new version of the NED.

It is strongly recommended that end users report new YANG build issues found back to the Cisco NSO NED team
through a support request

The NED provides two alternatives for rebuilding. It can be done either through NSO using a built-in tool, or by invoking gnu make in an external shell.

### Rebuild using the built-in tool

The built-in rpc *rebuild-package* does rebuild the NED package by automatically invoking gnu make in the source directory of the package installation root.

```
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package
```

<u>Note:</u> this rpc can take a long time to finish. This is because compiling YANG models is a very time consuming task.

Additional arguments:

```
verbose : Print the full output returned from gnu make. By default the output is only printed upon errors.
profile : Apply a certain build profile when rebuilding.
ned-id  : Parameters relevant for customizing the NED ID. See chapter 5 for further info.
```

### Rebuild using a separate shell

The NED must be rebuilt from inside the NED package installation root (i.e $NED_ROOT_DIR configured in chapter 1.1 in README.md).

To rebuild the NED do as follows:

```
> cd $NED_ROOT_DIR/src
> make clean all
```


## 1.4 Reload the NED package in NSO
When the NED has been successfully rebuilt with the device models it is necessary to reload the package
into NSO.

### Reloading

Use the following NSO CLI command:

```
admin@ncs# packages reload
```

Note, if the NED packages has been rebuilt with a new NED-ID as described in chapter 5 it will
be necessary to add 'force' to the reload command:

```
admin@ncs# packages reload force
```



# 2. Cleaning and resetting the NED package


## 2.1 Removing all downloaded YANG models

If a new set of YANG models is going to be downloaded for an already installed and reloaded NED it is highly recommended to first remove all old device YANG models from the previous download.

Use the following make target to remove all previously downloaded YANG.

### Clean using the built-in tool

```
admin@ncs# devices device dev-1 rpc rpc-clean-package clean-package
```

### Clean using a separate shell

```
> cd $NED_ROOT_DIR/src
> make distclean
```


## 2.2 Resetting NED package to its original initial state

If you have rebuilt the NED with downloaded YANG files and a custom ned-id, the original default ned-id is no longer available. To reset the NED package to its original initial state, follow the steps below.

### Reset using the built-in tool

```
admin@ncs# devices device dev-1 rpc rpc-clean-package clean-package (removes downloaded YANG files)
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package (without any additional arguments, this resets the ned-id to its original initial state)
```

### Reset using a separate shell

```
> cd $NED_ROOT_DIR/src
> make distclean clean all
```



# 3. Using the built-in downloader tool for a custom download

Using a pre-configured download profile is the easiest way for downloading the device YANG models.

In case this is not a suitable approach, the downloader tool has a number of additional arguments that allows
for doing a custom download. For instance by limiting the scope for downloading the YANG models.

## 3.1 Creating a custom download

Use the 'module-include-regex' and 'module-exclude-regex' to customize the download scope.
Both arguments shall be specified as regular expressions.

The easiest way to get the arguments right is by using the RPC named 'list-modules'

  Example:

  Start with fetching a full list of the YANG models supported by the device:

  ```
  # devices device dev-1 rpc rpc-list-modules list-modules
  ```

  Limit the scope to only include some models, by specifying a simply regular expression for the argument 'module-include-regex':

  ```
  # devices device dev-1 rpc rpc-list-modules list-modules module-include-regex "openconfig-.*"
  ```

  Now use the argument 'module-exclude-regex' to exclude some of the files matching the 'module-include-regex':

  ```
  # devices device dev-1 rpc rpc-list-modules list-modules module-exclude-regex "openconfig-if-.*"
  ```

  When the 'list-modules' rpc returns only the models of interest you can use the same arguments for the 'get-modules' rpc.

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules module-include-regex "openconfig-.*" module-exclude-regex "openconfig-if-.*" <additional arguments>
  ```

See chapter 5 in README.md for more details about the RPC commands get-modules and list-modules.



# 4. Alternative download methods

The device models can of course also be downloaded manually. To use this option the NED package
must first be unpacked. The steps described in README.md chapter 1.1 must be done first. It is preferred to do
the chapter 1.2 and 1.3 steps in README.md as well.


## 4.1 Copy the files into the NED source directory

When the YANG models have been downloaded manually, all the files need to be copied into the source
directory of the NED installation:

```
> cp <path to directory with the YANG files>/*.yang  $NED_ROOT_DIR/src/yang
```

Note, YANG files with names like `<module name>@<date revision>.yang` need to be renamed to <module name>.yang.
This is because of a limitation in the current NED make system.

This manual procedure is equivalent to using the downloader tool with a path to local directory
as remote source. See chapter 5('rpc get-modules') in README.md for more info.

Please do not remove any of the the yang files used internally by the NED in the $NED_ROOT_DIR/src/yang

This applies to the  following files:

```
tailf-internal-rpcs.yang
tailf-internal-rpcs-custom.yang
tailf-ned-huawei-vrp_nc-meta.yang
tailf-ned-huawei-vrp_nc-meta-custom.yang
tailf-ned-huawei-vrp_nc-oper.yang
tailf-ned-huawei-vrp_nc-stats.yang
```

The best way to clean the source directory is to follow the steps in chapter 5.

# 5. Rebuilding the NED using a custom NED-ID

A common use case is to have many different versions of the same device in the network controlled
by NSO. Each device will then have its unique set of YANG files which this NED has to be rebuilt for.

To setup NSO for this kind of scenario, each built flavour of the built NED must have its own unique NED-ID.

This will make NSO allow multiple versions of the same NED package to co-exist.

Rebuilding with a custom NED-ID can be done in the alternative ways:

1. Through the built-in rpc, using the following additional arguments:
   - suffix
   - major
   - minor
2. Through gmake in a separate shell, using the following additional make variables:
   - NED_ID_SUFFIX
   - NED_ID_MAJOR
   - NED_ID_MINOR

The default NED-ID is: huawei-vrp_nc-gen-1.1


## 5.1 Rebuild with a custom NED-ID

Do as follows to build each flavour of the huawei-vrp_nc NED. Do it in iterations, one at the time:

   1. Follow the instructions in chapter 1.1 to 1.3 in README.md to unpack the NED and install a device instance
      using it. Make sure a unique location is selected and update the environment variable $NED_ROOT_DIR
      accordingly and configure a device instance.

   2. Follow the instructions in chapter 1.2 to download the YANG models matching the configured
      device.

   3. Follow the instructions in chapter 1.3 to rebuild the NED.

      #### Alternative 1: Use the built-in rpc to rebuild with custom NED-ID

      Use any combination of the additional *ned-id* arguments *major, minor* and *suffix*

      Two examples showing NED-ID adapted for "device version" 21.6:

      ```
      admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package ned-id suffix -21.6
      ```

      This will generate a NED-ID like: 'huawei-vrp_nc-r21.6-gen-1.0'

      ```
      admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package ned-id major 21 minor 6
      ```

      This will generate a NED-ID like: 'huawei-vrp_nc-gen-21.6'

      #### Alternative 2: Rebuild the NED using gnu make from a shell

      Add any combination of the additional make variables 'NED_ID_SUFFIX','NED_ID_MAJOR' and 'NED_ID_MINOR' to the command line.

      Two examples showing NED-ID adapted for "device version" 21.6:

      ```
      > make NED_ID_SUFFIX=-r21.6 clean all
      ```

      This will generate a NED-ID like: 'huawei-vrp_nc-r21.6-gen-1.0'

      ```
      > make NED_ID_MAJOR=21 NED_ID_MINOR=6 clean all
      ```

      This will generate a NED-ID like: 'huawei-vrp_nc-gen-21.6'

   4. Follow the instructions in chapter 1.4 to reload the NED package. The rebuilt NED package
      will now have the NED-ID: `huawei-vrp_nc<NED_ID_SUFFIX>-gen-<NED_ID_MAJOR>.<NED_ID_MINOR>`

      This is detected by NSO and will have the following side effects:

      - The default NED-ID will no longer exist after the packages has been reloaded
         in NSO. Hence, any devices configured with the default NED-ID can no longer exist either.

      - It is recommended to delete all device instances using the default NED-ID before
         reloading the packages in NSO.

      - It is necessary to use 'packages reload force' when reloading the packages in NSO.

   5. Reconfigure the device instance from step #1 in this list. Now use the new NED-ID

   6. Verify functionality by executing a 'sync-from' on the configured device instance.



## 5.2 Exporting the rebuilt NED package

When the NED has been rebuilt with a new NED-ID, it typically needs to be exported as a separate NED package. This new package will then be a ready to use NED containing the raw as well as the customized and compiled versions of the third party YANG models. This package can then be loaded into a new NSO instance etc just like any other NED.

The NED has a built-in tool to make the export procedure easy.  It is implemented as an additional rpc which can be invoked through the NSO CLI or any other northbound NSO interface.

It copies all relevant elements from the "source" directory of rebuilt NED into a tar.gz archive file. The top dir of the archive will be named in accordance with the generated NED-ID, i.e. huawei-vrp_nc<NED_ID_SUFFIX>-gen-<NED_ID_MAJOR>.<NED_ID_MINOR>.

Usage:

```
admin@ncs# devices device dev-1 rpc rpc-export-package export-package
result ok
exported to: /tmp/ncs-6.2.2-huawei-vrp_nc-1.0.2-customized.tar.gz
```

Additional arguments:

```
destination : Destination directory for the exported tar.gz archive file. Default: /tmp
suffix      : Specify a suffix to be appended to the name of the archive file. Default: -customized
```


# 6. YANG fixes applied when rebuilding the NED

Third party YANG files often have errors that can cause problems during compilation and/or at runtime.

Common examples of such are besides pure YANG bugs, also specific NSO incompatible YANG constructs or that the device does not obey the models properly.

The NED build system is instrumented with a set of tools that is able to automatically apply various kinds of fixes to the third party YANG files. These fixes, referred to as YANG recipes, ensure that the YANG files will compile properly when the NED package is being rebuilt. This of course only refers to the YANG file versions that have so far been verified by the Cisco NED team. New build time issues can still occur if the NED is rebuilt with unverified YANG file versions.

**It is encouraged to contact the Cisco NED team on any such issue by opening a support ticket**. See chapter 8 in the README.md for further information.

Below is a description of the YANG recipes currently in use by the huawei-vrp_nc NED.

## 6.1 General

YANG recipe contains varies yang fixes by schema and YANG file paths.


## 6.2 Fixes listed by schema paths

```
Path: /huawei-ni:network-instance/huawei-ni:instances/huawei-ni:instance/bgp:bgp/bgp:base-process/bgp:afs/bgp:af/bgp-l2vpnad:l2vpnad/common/nexthop-select-depend-type
Fix: type inlined
```
```
Path: /huawei-ni:network-instance/huawei-ni:instances/huawei-ni:instance/bgp:bgp/bgp:base-process/bgp:afs/bgp:af/bgp-l2vpnad:l2vpnad/common/tunnel-selector-name
Fix: type inlined
```
```
Path: yp:selection-filter-ref
Fix: typedef inlined
```
```
Path: cl-oam:routing-instance-ref
Fix: typedef inlined
```
```
Path: /sshc/server-authentications/server-authentication/key-name::must
Fix: Removed
```
```
Path: /huawei-snmp:snmp/usm-users/usm-user/priv-key::mandatory
Fix: Removed
```
```
Path: /syslog:syslog/servers/server/transport-mode::mandatory
Fix: Removed
```


## 6.3 Fixes listed by YANG file paths

### huawei-openconfig-network-instance-deviations-NE8000-F1A.yang

```
Path: /deviation#.oc-netinst:network-instances.oc-netinst:network-instance.oc-netinst:encapsulation.oc-netinst:config.oc-netinst:label-allocation-mode
Fix: Removed
```
```
Path: /deviation#.oc-netinst:network-instances.oc-netinst:network-instance.oc-netinst:table-connections.oc-netinst:table-connection.oc-netinst:config.oc-netinst:dst-protocol/deviate#add
Fix: Removed
```

### huawei-debug.yang

```
Path: /container/#memory-infos/list/must
Problem: device doesn't comply with must expression
Fix: Removed must expression
```

### openconfig-bgp-global.yang

```
Path: /#bgp-global-config/#as/mandatory
Problem: device doesn't comply with mandatory statement
Fix: Removed mandatory statement
```

### huawei-openconfig-bgp-policy-deviations-NE8000-F1A.yang

```
Path: /deviation#.*.oc-bgp-pol:inline.oc-bgp-pol:(state|config).oc-bgp-pol:communities/deviate/min-elements
Fix: Removed min-elements statement
```

### huawei-openconfig-network-instance-deviations-NE8000-F1A.yang

```
Path: /deviation#.*.oc-bgp-pol:inline.oc-bgp-pol:(state|config).oc-bgp-pol:communities/deviate/min-elements
Fix: Removed min-elements statement
```
```
Path: /deviation#.*-protocol/deviate#replace/type
Problem: Invalid leafref in device
Fix: Replaced type with 'type identityref { base oc-pol-types:INSTALL_PROTOCOL_TYPE; }'
```

### huawei-openconfig-routing-policy-deviations-NE8000-F1A.yang

```
Path: /deviation/deviate/min-elements
Fix: Removed min-elements statement
```

### huawei-rpki.yang

```
Path: /augment/container/container/list/#aging-time.*
Fix: Removed min-elements statement
```

### huawei-l2vpn.yang

```
Path: /#vpls-instance-grp/#bgp-signaling/must#...admin-vsi.*
Problem: Values in must not present on device / invalid must
Fix: Removed must expression
```
```
Path: /#vpls-instance-grp/#bgpad-signaling/must#...admin-vsi.*"
Problem: Values in must not present on device / invalid must
Fix: Removed must expression
```
```
Path: /#vpls-instance-grp/#ldp-signaling/#redundancy-protect-groups/list/#pw-members/list/must
Problem: Values in must not present on device / invalid must
Fix: Removed must expression
```
```
Path: /container/#instances/list/#vpls/must#not.*
Fix: Removed must expression
```


## 6.4 Other fixes

### NSO requires globally unique prefixes

Following yang modules prefix are changed.

```
- changed prefix to 'huawei-aaa' in 'huawei-aaa@*.yang'
- changed prefix to 'huawei-aaa' in 'huawei-aaa.yang'
- changed prefix to 'huawei-ip' in 'huawei-ip@*.yang'
- changed prefix to 'huawei-ip' in 'huawei-ip.yang'
- changed prefix to 'huawei-ni' in 'huawei-network-instance@*.yang'
- changed prefix to 'huawei-ni' in 'huawei-network-instance.yang'
- changed prefix to 'huawei-rt' in 'huawei-routing@*.yang'
- changed prefix to 'huawei-rt' in 'huawei-routing.yang'
- changed prefix to 'huawei-snmp' in 'huawei-snmp@*.yang'
- changed prefix to 'huawei-snmp' in 'huawei-snmp.yang'
- changed prefix to 'ietf-ip-devs-NE8000-F1A' in 'huawei-ietf-ip-deviations-NE8000-F1A.yang'
- changed prefix to 'ietf-rt-devs-NE8000-F1A' in 'huawei-ietf-routing-deviations-NE8000-F1A.yang'
- changed prefix to 'ietf-snmp-devs-NE8000-F1A' in 'huawei-ietf-snmp-deviations-NE8000-F1A.yang'
```


# 7. Advanced: repairing YANG modules

-------------------------------------

Many third party YANG models are plagued with issues preventing them from being compiled and/or used with NSO. They simply need to be repaired.

This NED package has been verified to work with device models and YANG model revisions listed in the README.md. Any issues that were discovered
in the listed revisions have been fixed, and the fixes are already included in the package.

However, there is always a risk that new problems related to the YANG models will emerge. For example, if the NED is used together with YANG models that have not been verified by the Cisco NED team. Another example could be if the NED is used in a new use case that has not previously been verified.

If this happens, new YANG repair might be necessary.

**<u>It is encouraged to contact the Cisco NED team for help in any such matter.</u>**

Create a support case with a description of the issue and the use case.  Follow the instructions in the README.md.

There is of course also a do it yourself option. This is mainly for the advanced user though. Good knowledge about the YANG modelling language is required. The NED is bundled with a set of tools to help automating YANG repair. This chapter is intended to give an overview of how to use them.



## 7.1 Different kinds of YANG related issues

When preparing the YANG modules for use with NSO, we can classify the kind issues found in the YANG modules as either to be of compile-time, or run-time character.

With compile-time we mean an issue which needs to be fixed to be able to at all compile and load the YANG into NSO, whereas a run-time issue is anything that needs to be addressed after the YANG is successfully compiled (e.g. invalid constraints which are not met by actual device).



## 7.2 Compile-time issues

---------------------------

The first step before using the YANG modules in NSO is to make sure they can be compiled properly. For convenience, most standard issues found in YANG are by default automatically patched when compiling the package, in which case the resulting files will be found in *src/tmp-yang* (NOTE: the original YANG-files in src/yang are not modified).

This is controlled by the make variable AUTOPATCH_YANG_NED. Usually it is enabled already in the NED make file *$NED_ROOT_DIR/src/Makefile*, like below:

```
AUTOPATCH_YANG_NED ?= yes
```

The auto patcher feature does only fix the most standard issues.

If the YANG compilation still fails, like in the example below, further actions are necessary:

```
> cd $NED_ROOT_DIR/src
> make clean all
augmented/openconfig-network-instance@2022-07-04.yang:2876: error: the node 'protocol' from module 'openconfig-network-instance' (in node 'config' in module 'openconfig-network-instance' from 'openconfig-network-instance') is not found
augmented/openconfig-rib-bgp-attributes.yang:2284: error: the node 'endpoint' from module 'openconfig-network-instance' (in node 'state' in module 'openconfig-network-instance' from 'openconfig-network-instance') is not found
augmented/openconfig-rib-bgp-attributes.yang:2309: error: the node 'instance-id' from module 'openconfig-network-instance' (in node 'state' in module 'openconfig-network-instance' from 'openconfig-network-instance') is not found
```



<u>Always try to avoid modifying the original files in *src/yang*.</u> Instead use the available tools to do the patching at compile-time, with the results ending up in *src/tmp-yang* where the make process always places the actual files currently in use.

The NED is bundled with three different YANG pre-processor tools that can be used to patch the YANG files at compile-time:

- schypp

- jypp

- ypp



### 7.2.1 The schypp tool

This is the schema aware YANG pre-processor tool. It is automatically invoked at compile-time and reads directives from the file *$NED_ROOT_DIR/src/customize-schema.schypp*.

Each line in this file contains one directive, starting with one of the keywords add, remove, replace, or inline-type. This keyword is followed by the globally unique schema-path for the node to 'operate' on. No line breaks allowed.

If prefix is needed for a non-unique name in the path, the prefix must be the same as declared by the module. Depending on the type of operation the schema-path shall be followed by '::' (i.e. two colons) followed by further arguments as needed. The details for each type is described below.

The following directives are supported:

- inline-type
- add
- delete
- replace



#### The inline-type

This is applicable for leafs of type leafref. The tool looks up the type of the referred leaf and inlines the same type on the referee.

Very useful for all kinds of YANG issues related to leafrefs etc.

Syntax:

```
inline-type <schema-path>
```

Example:

```
inline-type /oc-netinst:network-instances/network-instance/protocols/protocol/name
```



#### The add

For adding YANG statements to the schema.

Syntax:

```
add <schema-path>::<YANG-stmt(s)|@filename>
```

Example:

```
add /configuration/protocols/l2circuit/neighbor::uses apply-advanced;
add /configuration/protocols/l2circuit/neighbor/interface::{ min-elements 1; max-elements 10; }
add /configuration/protocols/l2circuit/neighbor::@file-with-YANG-snippet
```



#### The remove

For removing YANG statement from the schema.

Syntax:

```
remove <schema-path>::<stmt-match>
```

Example:

```
remove /configuration/routing-instances/instance/protocols/vpls/mesh-group/neighbor/vpls-id-list::ordered-by
remove /oc-acl:acl/acl-sets/acl-set/acl-entries/acl-entry/actions/config/forwarding-action::mandatory
```



#### The replace

For replacing YANG statements in the schema. In this case the matching statement (must be unique match) is replaced by the
given statement(s), same rules for stmt-match and YANG-stmt(s) as for
add/remove.

```
replace <schema-path>::<stmt-match>::<YANG-stmt(s)>
```



### 7.2.2 The jypp tool

This tool is implemented in Java. Hence its name. Everything you can do with the schypp tool can also be done with this tool. The big difference is that it is YANG model aware instead of schema aware. It needs a "path" in the YANG model file to the node/area to operate on.

To find out the path, do as follows:

1. Find out the name of the file that contains the declaration of the node to operate on.
2. Open the file and search for the node to operate on.
3. Run the jypp tool from a shell like below:

```
> cd $NED_ROOT_DIR/src
> ./tools/jypp --print-path=<file number> tmp-yang/<name of model>.yang
```

Example:

The range for MPLS label values, specified in the file openconfig-mpls-types.yang line 278, needs to be modified.

```
typedef mpls-label {
   type union {
     type uint32 {
       range 13..1048575;
     }
 ..
 ..
```

Run the tool to find out the YANG path to it:

```
> ./tools/jypp --print-path=280 tmp-yang/openconfig-mpls-types.yang
openconfig-mpls-types.yang:280 /#mpls-label/type/#uint32/range
```

The path is: /#mpls-label/type/#uint32/range



With a correct path following operations are supported by the jypp tool:

- --add-stmt
- --remove-stmt
- -- remove-all
- --replace-stmt

#### The --add-stmt

Add extra statement to the node identified by the YANG path

Syntax:

```
> ./tools/jypp --add-stmt=<YANG path>::<statement to add> <file to modify>
```

Example:

```
> ./tools/jypp --add-stmt=/#mpls-label/type/#uint32::description "This is an addition"; tmp-yang/openconfig-mpls-types.yang
```

#### The --remove-stmt

Remove a statement identified by the YANG path.

Syntax:

```
> ./tools/jypp --remove-stmt=<YANG path> <file to modify>
```

Example:

```
> ./tools/jypp --remove-stmt=/#mpls-label/type/#uint32 tmp-yang/openconfig-mpls-types.yang
```

#### The --replace-stmt

Replace a statement on the node identified by the YANG path.

Syntax:

```
> ./tools/jypp --replace-stmt=<YANG path>::<statement to replace> <file to modify>
```

Example:

```
> ./tools/jypp --replace-stmt==/#mpls-label/type/#uint32/range::"range 13..1048575;" tmp-yang/openconfig-mpls-types.yang
```



Test executing the new jypp rules from a shell and verify that the corresponding files in *tmp-yang* have been modified accordingly. When you have a set of jypp rules that works, it is time to install them into the make machinery. This ensures that they are automatically applied every time the NED package is re-built.

Open the file *$NED_ROOT_DIR/src/ned-custom.mk*. Scroll to the make target *do-profile-defaul*t and add the new jypp rules to it.

Example:

```
do-profile-default:
   ./tools/jypp --replace-stmt=/#mpls-label/type/#uint32/range::"range 13..1048575;" \
   'tmp-yang/openconfig-mpls-types.yang' &> /dev/null || true
.PHONY: do-profile-default
```



### 7.2.3 The ypp tool

This is the oldest of the three YANG pre-processor tools. It is a pattern match oriented text processing utility. The patterns are made of regular expressions. The ypp tool is basically like an advanced *sed*. Everything you can do with schypp and jypp can also be done with ypp. In most cases schypp and jypp are superior and more easy to use. However, sometimes the ypp tool is the only possible option.

Syntax:

```
./tools/ypp --from=<regular expression> --to=<replacement containing text and/or matched groups> <file>
```

Example:

```
./tools/ypp --from="(list\s+route\s+[^;]+)(route-type)([^;]+;)" --to="\g<1>\g<3>" 'tmp-yang/srl-ip-route-tables.yang'
./tools/ypp --from="(leaf\s+(dot1p-policy)\s+{[^}]+)(type\s+leafref[^}]+})" --to="\g<1>type string;" 'tmp-yang/srl-qos.yang'
```

Test executing the new ypp rules from a shell and verify that the corresponding files in *tmp-yang* have been modified accordingly. When you have a set of ypp rules that works, it is time to install them into the make machinery. This ensures that they are automatically applied every time the NED package is re-built.

Open the file *$NED_ROOT_DIR/src/ned-custom.mk*. Scroll to the make target *do-profile-defaul*t and add the new jypp rules to it.

Example:

```
do-profile-default:
   ./tools/ypp --from="(list\s+route\s+[^;]+)(route-type)([^;]+;)" --to="\g<1>\g<3>" 'tmp-yang/srl-ip-route-tables.yang'
.PHONY: do-profile-default
```



### 7.2.4 Verify the YANG repair

There is a separate make target to only do the 'pre-processing' of the YANG modules, i.e. automatic patching and application of 'local' schema customizations, it is run like this:

```
> cd $NED_ROOT_DIR/src
> make prepare-yang
```

When run, one can immediately see the resulting YANG modules in the directory *src/tmp-yang*  (i.e. this is what will be used by the NED at run-time).

## 7.3 Run-time issues

----------------------

After all YANG modules can be compiled and loaded into NSO, there might still be issues which are only discovered at run-time. These might be constraints that are present in the YANG module but which are not strictly met by the device, such as integer value ranges or leafref targets. These kind of issues need to be investigated with real config from the device, hence a NED instance needs to be able to connect to device and do a full sync-from.

For example, if the device returns config containing a leaf of type leafref whose target is missing, when doing a full sync-from, NSO might say something like:

```
admin@ncs# devices device dev-1 sync-from
result false
info illegal reference devices device dev-1 config components component 0/0 subcomponents subcomponent 0/0-Virtual-Motherboard name
```

This indicates that the device is not fully compliant with the YANG models it is using. Hence, the YANG needs further repair.

Use the same toolkit as described in 6.2 to fix run-time issues.

The issue described above can for example be repaired with an additional schypp statement:

```
inline-type /components/component/subcomponents/subcomponent/name
```

# 8. Advanced: build methods using scope filtering

This chapter is intended for the advanced user. It describes some additional tools and methods to be used for scope limiting, i.e to reduce the number of YANG models to include. Scope filtering can be done both in run time and at build time.

In most cases it is preferred to do at build time, for the following reasons:

- Build time will be shortened when the number of YANG models is limited
- NSO footprint is reduced

## 8.1 Rules of thumb when selecting the scope

When selecting what third party YANG models to include in the NED package the following recommendations should be considered:

- Avoid mixing model "flavours", for example openconfig models with native models.

  Many devices can be configured through both native models as well as standard models such as openconfig. They are however often overlapping, i.e operating on the same configuration in the device.

  This means that a if node A is configured through the native models, it usually results in the corresponding node B in the openconfig models can be read back with the value set through A.

  The NSO has no awareness for this. It regards node A and B as separate individual nodes.

  If the models for both nodes are included in the NED package and then node A is deployed through NSO the result will be that NSO is immediately out of sync with the device. A compare-config will show a diff telling the node B is also set.

  This problem is referred to as aliasing. It is almost guaranteed to happen if model flavours are mixed.

- Avoid including models that will never be used.

  The more models included the bigger the foot print used by NSO and NED. Furthermore, sync-from performance can decrease with the number of models. In particular this applies to devices not capable of returning all config in one get operation.

  In this case the NED needs to do one separate fetch for each top node in the schema. One top node does typically map to one model.



## 8.2 Doing build-time scope filtering

The process of doing scope filtering will be shown using an example. This device supports about a large number of YANG models of the flavours native and openconfig.

The NED package is assumed to be freshly installed into a NSO installation, i.e no third party YANG models are not yet included.

The snippet below shows the use case in XML format that will be used throughout this example. It is a super simple config, setting up some interface config. It is good enough to illustrate the concept of build time filtering.

It will be referred to as */tmp/use-cases/example.xml* throughout the example.

```
<config xmlns="http://tail-f.com/ns/config/1.0">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>dev-1</name>
      <config>
        <interfaces xmlns="http://openconfig.net/yang/interfaces">
          <interface>
            <name>1/1/1</name>
            <config>
              <name>1/1/1</name>
              <type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">ianaift:ethernetCsmacd</type>
              <description>THIS IS A TEST</description>
            </config>
            <subinterfaces>
              <subinterface>
                <index>100</index>
                <config>
                  <index>100</index>
                </config>
                <ipv4 xmlns="http://openconfig.net/yang/interfaces/ip">
                  <addresses>
                    <address>
                      <ip>172.168.10.2</ip>
                      <config>
                        <ip>172.168.10.2</ip>
                        <prefix-length>30</prefix-length>
                      </config>
                    </address>
                  </addresses>
                  <config>
                    <mtu>1500</mtu>
                  </config>
                </ipv4>
                <ipv6 xmlns="http://openconfig.net/yang/interfaces/ip">
                  <addresses>
                    <address>
                      <ip>2000::10:0:0:2</ip>
                      <config>
                        <ip>2000::10:0:0:2</ip>
                        <prefix-length>127</prefix-length>
                      </config>
                    </address>
                  </addresses>
                  <config>
                    <mtu>1500</mtu>
                  </config>
                </ipv6>
              </subinterface>
            </subinterfaces>
          </interface>
        </interfaces>
      </config>
    </device>
  </devices>
</config>

```

### Download the models

To start with the third party YANG models must be downloaded. Download the models from device using the built-in tool.

```
admin@ncs# devices device dev-1 rpc rpc-get-modules get-modules
...
...
fetched and saved 140 yang module(s) to /path/to/ncs-setup-dir/packages/huawei-vrp_nc/src/yang
```

### Rebuild and reload the NED package using a limited scope

In this example the NED will be rebuilt with only the models relevant for the use case. This will limit the scope from ~140 YANG models to just 22 models.

Rebuild the NED package using the built-in tool:

```
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { scope { dir /tmp/use-cases } }
result ok
admin@ncs# packages reload
reload-result {
    package huawei-vrp_nc-gen-<VERSION>
    result true
}
```

Finish with a sync-from:

```
admin@ncs# devices device dev-1 sync-from
result true
```

Verify the limited scope by listing supported models:

```
admin@ncs# show devices device dev-1 module
NAME                                  REVISION    FEATURE  DEVIATION
----------------------------------------------------------------------
tailf-internal-rpcs                          2024-03-01  -        -
<use-case-model1>                            YYYY-MM-DD  -        -
<use-case-model2>                            YYYY-MM-DD  -        -
<use-case-model3>                            YYYY-MM-DD  -        -
<use-case-model4>                            YYYY-MM-DD  -        -
<use-case-model5>                            YYYY-MM-DD  -        -
<use-case-model..ect..>                      YYYY-MM-DD  -        -
<use-case-model22>                           YYYY-MM-DD  -        -
```

### Apply use case and do compare-config, first try

Now do apply the use case */tmp/use-cases/example.xml*.

It is a good idea to keep track of the commit id. For instance by using a label:

```
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# load merge /tmp/use-cases/example.xml
Loading.
10.01 KiB parsed in 0.03 sec (294.96 KiB/sec)
admin@ncs(config)# commit label MY_USE_CASE
Commit complete.
admin@ncs(config)# abort
```

Do a compare-config:
```
admin@ncs(config)# devices device dev-1 compare-config
diff
 devices {
     device dev-1 {
         config {
             oc-if:interfaces {
                 interface 1/1/1 {
                     ethernet {
                         config {
+                            mac-address 00:11:22:33:44:55;
                         }
                     }
                 }
             }
         }
     }
 }

admin@ncs(config)#
```

There is a small diff showing. Analysing the diff further shows that the device has set some additional nodes. This is very common and is referred to as *auto-config*.

The auto-config diff consists of nodes that are within the configured scope. Hence it is not possible limit the scope further.

In many cases this kind of problem can be solved, simply by adding the additional nodes to the use case. By doing so the nodes will be set in NSO as well and the result will be that NSO is in sync with the device.

When adjusting the use case for this it is important to verify that the extra config can be both deployed and deleted again.

If it is not possible to adjust the use case, there is one more option to try: rebuild the NED package with an *auto-config* filter.

To do this, the use case shall be kept deployed on the device. I.e do not do a rollback of it yet.

### Prepare an auto-config filter

When rebuilding the NED with an auto-config filter, the nodes pointed out by the filter are simply removed from the schema. The NED build tools creates a deviation file containing the nodes of concern. The NED is then rebuilt with the deviation file included.

The NED build tools need two files to be able to analyse the state and generate a proper deviation file if it is possible. The *before.xml* and the *after.xml* files.

The *before.xml* is a snapshot of the running config when the use case has been deployed.

Do as follows to generate the *before.xml* (assuming the use case is deployed already) and store it in the directory */tmp/auto-config*:

```
admin@ncs# show running-config devices device dev-1 config | display xml | save /tmp/auto-config/before.xml
admin@ncs#
```

The *after.xml* is a snapshot of the running config after the first subsequent sync-from. This sync-from makes diffing nodes be synced in to NSO/CDB.

```
admin@ncs# devices device dev-1 sync-from
result true
admin@ncs# show running-config devices device dev-1 config | display xml | save /tmp/auto-config/after.xml
admin@ncs#
```

Now restore the device to a clean state, i.e remove config related to the use case. This is when the commit label can be useful

```
admin@ncs(config)# rollback configuration 100<TAB>
Possible completions:
  10001   2024-01-17 15:10:42 by system via system
  ..
  ..
  10021   2024-01-18 10:10:01 by admin via cli label MY_USE_CASE
  10022   2024-01-18 10:50:49 by admin via cli
  <cr>    latest
admin@ncs(config)# rollback configuration 10021
admin@ncs(config)# commit
Commit complete.
admin@ncs(config)# abort
```

Note: it is not always possible to create a proper auto-config filter. For instance if there is an overlap between the nodes to be removed and the nodes to be deployed by the use case. Hence, auto-config filter should always be seen as a best effort approach.

### Rebuild with both scope filter and auto-config filter

Rebuild the NED with both a scope filter and an auto-config filter:

```
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { scope { dir /tmp/use-cases } auto-config { dir /tmp/auto-config }}
result ok
```

Finally, reload the NED package again:

```
admin@ncs# packages reload

>>> System upgrade is starting.
>>> Sessions in configure mode must exit to operational mode.
>>> No configuration changes can be performed until upgrade has completed.
>>> System upgrade has completed successfully.
reload-result {
    package huawei-vrp_nc-gen-<VERSION>
    result true
}
```

### Apply use case and do compare-config, second try

Apply the use case for the third time:

```
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# load merge /tmp/use-cases/example.xml
Loading.
10.01 KiB parsed in 0.03 sec (294.96 KiB/sec)
admin@ncs(config)# commit label MY_USE_CASE
Commit complete.
admin@ncs(config)# abort
```

Then do a compare-config again:

```
admin@ncs# devices device dev-1 compare-config
admin@ncs#
```

No diff is shown anymore. This indicates that NSO now is fully in sync with the device after deploying the use case.



## 8.3 Doing run-time scope filtering

This alternative scope filtering method works even when the NED package itself has all available models built-in.

The obvious drawback is that not much footprint reduction is achieved. However, the sync-from performance can increase significantly increase.

The method depends on the fact that the NED can be configured to filter the capability reported by the device before it is relayed to NSO. Doing so will make only the reported models available in the device instance in NSO. This can for instance be only models necessary for a certain use case.

The following NED settings are used for controlling what models the NED shall report to NSO:
```
admin@ncs(config)# devices device dev-1 ned-settings huawei-vrp_nc general capabilities regex-include ?
Possible completions:
  <pattern:string>
admin@ncs(config)# devices device dev-1 ned-settings huawei-vrp_nc general capabilities regex-exclude ?
Possible completions:
  <pattern:string>
```

Both settings accept multiple entries. Each entry shall be a regular expression matching one or many module names.

Below shows a couple of examples.

#### Include only models relevant for the use case:
```
!Count number of supported models before scope filtering
admin@ncs# show devices device dev-1 module | count
Count: 177 lines

admin@ncs# config
admin@ncs(config)# devices device dev-1 ned-settings huawei-vrp_nc general capabilities regex-include ".*-interfaces-.*"
admin@ncs(config)# commit
admin@ncs(config)# abort

!Count number of supported models after scope filtering
admin@ncs# devices device dev-1 disconnect
admin@ncs# devices device dev-1 connect
admin@ncs# show devices device dev-1 module | count
Count: 25 lines
```
#### Include only two specific modules:
```
admin@ncs(config)# devices device dev-1 ned-settings huawei-vrp_nc general capabilities regex-include openconfig-network-instance
admin@ncs(config)# devices device dev-1 ned-settings huawei-vrp_nc general capabilities regex-include openconfig-bgp
admin@ncs(config)# commit
admin@ncs(config)# abort

!Verify settings
admin@ncs# show running-config devices device dev-1 ned-settings huawei-vrp_nc general capabilities
devices device dev-1
 ned-settings huawei-vrp_nc general capabilities regex-include openconfig-network-instance
 ned-settings huawei-vrp_nc general capabilities regex-include openconfig-bgp

!Verify scope
admin@ncs# devices device dev-1 disconnect
admin@ncs# devices device dev-1 connect
admin@ncs# show devices device dev-1 module
NAME                                REVISION    FEATURE  DEVIATION
--------------------------------------------------------------------
<models-included-in-regex>         YYY-MM-DD   -        -
tailf-internal-rpcs                2023-12-20  -        -
tailf-ned-huawei-vrp_nc-stats   2024-01-16  -        -

admin@ncs#
```

### Tool for determining the scope

The NED package is bundled with the *turboy* tool which can be used to list the YANG modules to include to match a certain scope. The tool takes one or several xml files as input. It analyses the input and then generates a list of the YANG modules involved.

Below shows a couple of examples on how to use the tool

#### Limit the scope to the running config on the device

In the NSO CLI, save the running config to a file in xml format:

```
admin@ncs# show running-config devices device dev-1 config | display xml | save overwrite /tmp/running-config.xml
```

In a separate unix shell, execute the tool with the xml file as in parameter:

```
# cd $NED_ROOT_DIR/src
# ./tools/turboy --silent --plugin=cdb-data --list-yang-files yang --yang-path=. --read=/tmp/running-

  ietf-yang-types.yang
  iana-if-type.yang
  ietf-interfaces.yang
  ietf-yang-types.yang
  <running-config-model1>.yang
  <running-config-model2>.yang
  <running-config-model3>.yang
  <running-config-model4>.yang
  <running-config-model5>.yang
  <running-config-model..etc..>.yang
```

In the NSO CLI, update the scope filtering NED settings accordingly:

```
admin@ncs# config
admin@ncs(config)# devices device dev-1 ned-settings huawei-vrp_nc general capabilities regex-include "<a suitable pattern>"
```


#### Limit the scope to a specific use case

Save the config that is going to be deployed in the use case as a file in xml format.

In this example the file is stored in : */tmp/use-case/example.xml*

In a separate unix shell, execute the tool with the xml file as a parameter:

```
# cd $NED_ROOT_DIR/src
# ./tools/turboy --silent --plugin=cdb-data --list-yang-files yang --yang-path=. --read=/tmp/use-case/example.xml

  iana-if-type.yang
  ietf-inet-types.yang
  ietf-interfaces.yang
  ietf-yang-types.yang
  <use-case-model1>.yang
  <use-case-model2>.yang
  <use-case-model3>.yang
  <use-case-model4>.yang
  <use-case-model5>.yang
  <use-case-model..etc..>.yang
  ..
  ..
```

In the NSO CLI, update the scope filtering NED settings accordingly:

```
admin@ncs# config
admin@ncs(config)# devices device dev-1 ned-settings huawei-vrp_nc general capabilities regex-include "<a suitable pattern>"
```

# 9. Advanced: build methods using schema trimming

  The scope filtering techniques described in the previous chapter do work by only including the YANG files with XML namespaces required to cover a certain scope. This works well for YANG bundles that are properly partitioned into many different namespaces.

  Scope filtering can however not be used to remove only parts of the schema that reside in a certain namespace.

  To do that you can use an alternative method called *schema trimming*.

  The schema trimming technique works by using the YANG *deviate* statement to remove any part of the schema and resolve any dependencies to the removed parts.  This can be anything from a certain leaf up to a subtree. This method works regardless of any name spaces.

  Schema trimming will just like scope filtering reduce the memory footprint when the models have been loaded into NSO. It usually does not have any impact on the compile time, since all models are being processed before the schema trimming takes place.

  ## 9.1 Using the NED rebuild tool with schema trimming

  The built-in NED rebuild tool has full support for doing schema trimming in an automatic way. The tool analyses the YANG models and creates a temporary YANG file containing *deviate* directives to remove all the nodes that shall be trimmed.

  Furthermore the tool scans through the whole schema to find references to the nodes to be removed.  This typically means nodes of type *leafref* referring to a node to be deleted or to one of its subsides.  Any reference found will result in a new *deviate* directive where the *leafref* type is replaced by instead inlining the referred type.

  ### Example

  This example presumes the NED package has already been rebuilt and reloaded with the full device schema.

  Now assume you want to trim the following schema sub trees, since they will not be used in your use case:

  ```
  /prefix1:top-node1/prefix2:child-node1
  /prefix1:top-node1/prefix3:child-node2
  ```

  Enter the NSO CLI

  ```
  $ ncs_cli -C -u admin
  ```

   Check that the nodes to be trimmed are defined, i.e accessible through the CLI:

  ```
  admin@ncs# show running-config devices device dev-1 config top-node1 child-node1
  <config-output>
  admin@ncs# show running-config devices device dev-1 config top-node1 child-node2
  <config-output>
  ```

  Now rebuild the NED package using a schema trimming filter:

  ```
  $ ncs_cli -C -u admin
  admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { trim-schema { nodes [ /prefix1:top-node1/prefix2:child-node1 /prefix1:top-node1/prefix3:child-node2 ] } }
  result ok
  admin@ncs#
  ```

  Reload the NED package:

  ```
  admin@ncs# packages reload
  reload-result {
      package huawei-vrp_nc-gen-<VERSION>
      result true
  }
  admin@ncs#
  ```

  Finally verify that the nodes have been properly trimmed from the schema. I.e use the same tab completion trick as before:

  ```
  admin@ncs# show running-config devices device dev-1 config top-node1 child-node1 -------------------------------------------------------------------------------^
  syntax error: element does not exist

  admin@ncs# show running-config devices device dev-1 config top-node1 child-node2                                                            -------------------------------------------------------------------------------^
  syntax error: element does not exist
  ```

  Let's take a look under the hood to see how the schema trimming was accomplished

  Exit the NSO CLI and check for a file named *nedcom-trim-deviations.yang* in the build environment of the NED package:

  ```
  admin@ncs# exit
  # cd $NED_ROOT_DIR/src
  # cat tmp-yang/config/nedcom-trim-deviations.yang
  ```

  This will display the file containing the *deviate* directives:

  ```
  module nedcom-trim-deviations {
    yang-version 1.1;
    namespace urn:tail-f.com:nedcom-trim-deviations;
    prefix nedcom-trim-deviations;
    import module-1 {
      prefix prefix1;
    }
    import module-2 {
      prefix prefix2;
    }
    import module-3 {
      prefix prefix3;
    }
    revision YYYY-MM-DD {
      description "Automatic deviations generated from exclude filter";
    }
    deviation /prefix1:top-node1/prefix2:child-node1 {
      deviate not-supported;
    }
    deviation /prefix1:top-node1/prefix3:child-node2 {
      deviate not-supported;
    }
  }
  ```


# 10. Advanced: more YANG schema filtering techniques
------------------------------------------------------------

  This section describes yet another method to reduce the since of the YANG schema. A very good knowledge of the YANG modeling language is required

## 10.1 Filtering schema at run-time or compile-time
---------------------------------------------------

  While static filtering can be achieved through simply doing a module which
  marks certain parts of the schema as 'not-supported' with deviations and
  recompile, this can quickly become unpractical.

  The NED contains a filtering feature which can be used both at run-time, as
  well as generating deviations for applying at compile-time. There are some
  built-in rpcs to handle the filters, these are:

  ```
      list-filter-paths
      clear-filter-paths
      import-filter-paths
      add-filter-path
      remove-filter-path
  ```

  The filtering described here only works on schema level (i.e. no key-paths are
  allowed). To filter on 'key-path level', see the ned-setting
  transaction/inject-meta-data and the section 8, 'Custom XML transforms' for
  details on how this can be achieved.

  Since these filters are handled and applied at run-time in the NED, there is
  no need to re-compile the NED for trying them out, hence it simplifies an
  iterative approach to fine-tuning the filters.

  The filters can be both including and excluding certain schema-paths. Note
  that if one adds include filters, only schema-paths included by these are used
  by the NED. So a combination of include and exclude filters can narrow down
  the available schema quite a lot.

  Once the filters are finalized, they can be exported to a file to be applied
  through the ned-setting 'transaction/filter-paths-file', i.e. to be able to be
  shared among several instances of the NED, on ned-settings global or profile
  level.

  In the rpc 'list-filter-paths' there is a useful option 'deviation-module'
  which can export the exclude filters as a single YANG module containing
  deviations marking the excluded parts of the schema as 'not-supported', hence
  usable for doing static compile-time filtering. Note, only the exclude filters
  are currently taken into account when generating the deviation-module
  (i.e. include filters are ignored, this might be enhanced in a future
  version). See the next section for an example on how to export a
  deviation-module from the exclude filters.

  When the make variable AUTOPATCH_YANG_NED has the value 'yes' (which it has by
  default), the parts marked as 'not-supported' with deviations will
  automatically be pruned from 'when', 'must', and 'leafref path' yang
  expressions in the rest of the modules. This means that applying
  'not-supported' deviations becomes more of a manageable task. This might
  otherwise be quite cumbersome to try to achieve, depending on existing
  references into parts of the schema marked as 'not-supported'.


## 10.2 Handling overlapping YANG modules
----------------------------------------

  Device modules might contain data that partly overlaps, for example when there
  are both some native representation along with some standard modules
  (e.g. openconfig). This results in what we can call 'aliasing', i.e. the same
  data appears in more than one place in the available YANG modules. The NED has
  some features for discovering and handling this kind of "mixed" module
  environment.

  As an example, if one creates a package containing all modules available on a
  Cisco IOSXR router. It has three different YANG schemas, largely overlapping
  each other. The schemas are: UM (unified model), native, and openconfig.

  To help discover the overlaps, there is a ned-setting called "transaction
  abort-on-diff", which when enabled will prevent overlapping edits which would
  cause NSO to be out-of-sync since the device will represent the same data in
  multiple schemas. As an example, we try to edit the hostname using the UM
  schema:

  ```
  admin@ncs(config)# devices device dev-1 ned-settings cisco-iosxr_nc transaction abort-on-diff true
  admin@ncs(config-device-dev-1)# commit
  Commit complete.
  admin@ncs(config-device-dev-1)# config
  admin@ncs(config-config)# hostname system-network-name foobar
  admin@ncs(config-config)# commit
  Aborted: External error in the NED implementation for device dev-1: Prepare error: Detected diff after apply:
  config {
      oc-sys:system {
          config {
  -           hostname xrv9000;
  +           hostname foobar;
          }
      }
      shellutil-cfg:host-names {
  -       host-name xrv9000;
  +       host-name foobar;
      }
  }
  ```

  As can be seen the NED aborts, telling what diff would result if the config was
  applied to device (i.e. since the hostname also appears in the native and
  openconfig schemas). It does this by sending the edit-config to the device as
  normal. But after this, it immediately does a get-config (from the store in use,
  i.e. 'running' or 'candidate'). With this data, it does a NED-internal
  compare-config (i.e. it compare the to-transaction contents in CDB to what the
  device actually now have). If there is a diff, as in the above example, it
  discards the changes on the device, displaying the abort message to the user.

  With this ned-setting enabled, the edits in a particular use-case can be walked
  through to discover the overlaps.

  To simplify the handling of overlaps even more, There is another ned-setting
  "transaction filter-side-effects", which instead of only aborting, creates
  filters for automatically excluding side-effects. It also takes into account
  what is already in CDB.

  With the above example, if you have already synced in data from
  native/openconfig, but try to commit overlapping data to config in the UM
  schema, then filtering out native and/or openconfig would result in diff
  (i.e. CDB data found, but it will be filtered from device):

  ```
  admin@ncs(config-config)# top no devices device dev-1 ned-settings cisco-iosxr_nc transaction abort-on-diff
  admin@ncs(config-config)# top devices device dev-1 ned-settings cisco-iosxr_nc transaction filter-side-effects true
  admin@ncs(config-config)# abort
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device dev-1 config
  admin@ncs(config-config)# hostname system-network-name foobar
  admin@ncs(config-config)# commit
  Aborted: External error in the NED implementation for device dev-1: Prepare error: Detected diff after apply:
  config {
      oc-sys:system {
          config {
  -           hostname xrv9000;
  +           hostname foobar;
          }
      }
      shellutil-cfg:host-names {
  -       host-name xrv9000;
  +       host-name foobar;
      }
  }

  --------------------------------------------------------------------------------

  NOTE: Overlapping edit, the resulting filters would cause the below diff:
  config {
      oc-sys:system {
          config {
  -           hostname xrv9000;
  +           hostname foobar;
          }
      }
      shellutil-cfg:host-names {
  -       host-name xrv9000;
  +       host-name foobar;
      }
  }

  --------------------------------------------------------------------------------

  The following filters are overlapping existing data (i.e. causing out-of-sync):
    /oc-sys:system/config/hostname
    /shellutil-cfg:host-names/host-name

  ```

  So in this case, one can't apply the filter "automatically", the suggested
  filters needs to be applied first, then do a sync-from. Like this:

  ```
  admin@ncs(config)# devices device dev-1 rpc rpc-add-filter-path add-filter-path exclude path /oc-sys:system/config/hostname
  result OK
  admin@ncs(config)# devices device dev-1 rpc rpc-add-filter-path add-filter-path exclude path /shellutil-cfg:host-names/host-name
  result OK
  admin@ncs(config)# top devices device dev-1 sync-from
  result true
  admin@ncs(config)# show full-configuration devices device dev-1 config oc-sys:system config
  devices device dev-1
   config
    system config domain-name lab.local
   !
  !
  ```

  As can be seen, the NED is now filtering out the hostname from the openconfig
  schema.

  So now if we try to edit the hostname through the UM schema, it will succeed.

  ```
  admin@ncs(config-config)# hostname system-network-name foobar
  admin@ncs(config-config)# commit
  Commit complete.
  admin@ncs(config-config)# top devices device dev-1 compare-config
  admin@ncs(config-config)#
  ```

  Lets take another example, where there is no overlapping data stored in CDB,
  then the filters can be generated and applied automatically:

  ```
  admin@ncs(config)# devices device dev-1 config um-interface-cfg:interfaces interface GigabitEthernet0/0/0/0
  admin@ncs(config-interface-GigabitEthernet0/0/0/0)# mtu 4096
  admin@ncs(config-interface-GigabitEthernet0/0/0/0)# commit
  Commit complete.
  admin@ncs(config-interface-GigabitEthernet0/0/0/0)# top devices device dev-1 compare-config
  ```

  There is no overlap, the commit was successful, and the filters that was
  generated from this commit have been added automatically.

  ```
  admin@ncs(config-interface-GigabitEthernet0/0/0/0)# top devices device dev-1 rpc rpc-list-filter-paths list-filter-paths | inc mtu
  result
  exclude /ifmgr-cfg:interface-configurations/interface-configuration/mtus/mtu
  exclude /oc-if:interfaces/interface/config/mtu

  ```

  And now the resulting deviations, from both our manually added filter for the
  hostname and the automatically generated filter from the edit of the mtu:

  ```
  admin@ncs(config-config)# top devices device dev-1 rpc rpc-list-filter-paths list-filter-paths deviation-module
  result
  module nedcom-auto-deviations {
    namespace urn:tail-f.com:nedcom-auto-deviations;
    prefix nedcom-auto-deviations;
    import Cisco-IOS-XR-ifmgr-cfg {
      prefix ifmgr-cfg;
    }
    import Cisco-IOS-XR-shellutil-cfg {
      prefix shellutil-cfg;
    }
    import openconfig-system {
      prefix oc-sys;
    }
    import openconfig-interfaces {
      prefix oc-if;
    }
    revision 2023-03-27 {
      description "Automatic deviations generated from exclude filter";
    }
    deviation /ifmgr-cfg:interface-configurations/ifmgr-cfg:interface-configuration/ifmgr-cfg:mtus/ifmgr-cfg:mtu {
      deviate not-supported;
    }
    deviation /oc-if:interfaces/oc-if:interface/oc-if:config/oc-if:mtu {
      deviate not-supported;
    }
    deviation /oc-sys:system/oc-sys:config/oc-sys:hostname {
      deviate not-supported;
    }
    deviation /shellutil-cfg:host-names/shellutil-cfg:host-name {
      deviate not-supported;
    }
  }
  ```
